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
    public String login(@RequestParam(value = "google-token") String JWT) {
        String result = null;

        try {
            Member member = googleOAuthService.verifyToken(JWT);
            if (member == null) return "false";
            result = memberService.loginForToken(member);

        } catch (GeneralSecurityException | IOException e) {
            log.warn("OAuth JsonProcessingException : GOOGLE [{}]", "verify");
        }

        return result;
    }

    @GetMapping("/google")
    public String googleSignUpAndIn(Model model, HttpSession session, @RequestParam(value = "code") String authCode) {
        String result = null;

        try {
            ResponseEntity<String> responseEntity = googleOAuthService.requestAccessToken(authCode);
            Map<String, Object> accessTokenMap = googleOAuthService.getAccessToken(responseEntity);

            Member convertedMember = googleOAuthService.convertModelToMember(accessTokenMap);
            if (memberService.isExistedEmail(convertedMember.getEmail())) {
                memberService.updateRank(sessionMember.getEmail());
                memberService.loginForToken(convertedMember);
                session.setAttribute("sessionMember", sessionMember);
                result = "이메일이 이미 있습니다.";

            }else{
                memberService.saveForToken(convertedMember);
                memberService.updateRank(sessionMember.getEmail());
                memberService.loginForToken(convertedMember);
                session.setAttribute("sessionMember", sessionMember);
            }

        } catch (JsonProcessingException e) {
            log.warn("OAuth JsonProcessingException : GOOGLE [{}]", "googleSignUpAndIn");
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
