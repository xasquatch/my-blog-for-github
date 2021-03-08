package net.xasquatch.myblog.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import lombok.extern.slf4j.Slf4j;
import net.xasquatch.myblog.model.Member;
import net.xasquatch.myblog.service.GoogleOAuthService;
import net.xasquatch.myblog.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.security.GeneralSecurityException;
import java.util.Map;

@Slf4j
@Controller
@RequestMapping(value = "/oauth",
        method = {RequestMethod.GET},
        produces = "text/plain;charset=UTF-8")
public class OauthController {

    @Autowired
    private GoogleOAuthService googleOAuthService;

    @Autowired
    private MemberService memberService;

    @Resource(name = "sessionMember")
    private Member sessionMember;

    @GetMapping("/google/information")
    @ResponseBody
    public String googleAuthInfo() {
        return googleOAuthService.getGoogleInfo();

    }

    @PostMapping("/google/token")
    @ResponseBody
    public String login(@RequestParam(value = "oauth-token") String JWT, HttpSession session) {
        String result = "false";

        try {
            Member member = googleOAuthService.verifyToken(JWT);
            if (member == null) return "false";
            result = memberService.loginForToken(member);
            sessionMember.setLoginOAuth(true);
            session.setAttribute("sessionMember", sessionMember);

        } catch (GeneralSecurityException | IOException e) {
            log.warn("OAuth JsonProcessingException : GOOGLE [{}]", "verify");
        }

        return result;
    }

    @GetMapping("/google")
    public String googleSignUpAndIn(Model model, HttpSession session, HttpServletResponse response, @RequestParam(value = "code") String authCode) {
        String result = null;

        try {
            ResponseEntity<String> responseEntity = googleOAuthService.requestAccessToken(authCode);
            Map<String, Object> accessTokenMap = googleOAuthService.getAccessToken(responseEntity);

            if (googleOAuthService.verifyToken((String) accessTokenMap.get("JWT")) == null) return "redirect:/members";

            Member convertedMember = googleOAuthService.convertModelToMember(accessTokenMap);
            if (!memberService.isExistedEmail(convertedMember.getEmail())) {
                memberService.saveForToken(convertedMember);

            }else{
                long memberNo = memberService.findNumberForEmail(convertedMember.getEmail());
                convertedMember.setNo(memberNo);
            }

            memberService.updateRank(convertedMember.getNo(), convertedMember.getEmail());
            memberService.loginForToken(convertedMember);
            sessionMember.setLoginOAuth(true);
            session.setAttribute("sessionMember", sessionMember);
            Cookie cookie = new Cookie("oauth-token", (String) accessTokenMap.get("JWT"));
            cookie.setPath("/");
            cookie.setSecure(true);
            cookie.setHttpOnly(true);
            cookie.setMaxAge(60*60*60*24);
            response.addCookie(cookie);

        } catch (GeneralSecurityException | IOException e) {
            log.warn("OAuth Exception : GOOGLE [{}]", "googleSignUpAndIn");
        }
        model.addAttribute("result", result);

        return "forward:/";
    }

    @DeleteMapping("/google/token")
    public String revokeGoogleToken(Model model, @RequestParam(value = "token") String token) {

        String result = null;
        try {
            result = googleOAuthService.revokeGoogleToken(token);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        model.addAttribute("result", result);

        return "forward:/";
    }

}
