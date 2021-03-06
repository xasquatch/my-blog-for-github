package net.xasquatch.myblog.controller;

import lombok.extern.slf4j.Slf4j;
import net.xasquatch.myblog.model.Member;
import net.xasquatch.myblog.service.MailService;
import net.xasquatch.myblog.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Slf4j
@Controller
@RequestMapping(path = "/members", produces = "text/plain;charset=UTF-8")
public class MemberController {

    @Autowired
    private MemberService memberService;

    @Autowired
    private MailService mailService;

    @Resource(name = "sessionMember")
    private Member sessionMember;

    @Autowired
    private HomeController checkSessionController;

    /*TODO: 회원 이메일 찾기 페이지로 이동*/
    @GetMapping("/find/email")
    public String findEmail(Model model) {
        model.addAttribute("mainContents", "user-find-email");
        return "index";
    }

    /*TODO: 회원 비밀번호 찾기 페이지로 이동*/
    @GetMapping("/find/password")
    public String findPwd(Model model) {
        model.addAttribute("mainContents", "user-find-password");
        return "index";
    }

    /*TODO: 회원 api 클립보드 페이지로 이동*/
    @RequestMapping(path = "/{memberNo}/api/clipboard", method = {RequestMethod.GET, RequestMethod.POST})
    public String goApiClipBoard(Model model, @PathVariable String memberNo) {
        if (checkSessionController.isCheckSession(memberNo)) {
            model.addAttribute("mainContents", "user-api-clipboard");
            return "index";

        }

        return checkSessionController.forwardingMembersPageAndErrorMsg(model, "권한이 없습니다.<BR>로그인 후 다시 시도해주세요");
    }

    /*TODO: 회원 api QUICK GUIDE PAGE로 이동*/
    @RequestMapping(path = "/{memberNo}/api/quick-guide", method = {RequestMethod.GET, RequestMethod.POST})
    public String goApiQuickGuide(Model model, @PathVariable String memberNo) {
        if (checkSessionController.isCheckSession(memberNo)) {
            model.addAttribute("mainContents", "user-api-quick-guide");
            return "index";

        }

        return checkSessionController.forwardingMembersPageAndErrorMsg(model, "권한이 없습니다.<BR>로그인 후 다시 시도해주세요");
    }

    /*TODO: information페이지 이동*/
    @RequestMapping(path = "/{memberNo}/information", method = {RequestMethod.GET, RequestMethod.POST})
    public String info(Model model, @PathVariable String memberNo, String checkPassword) {
        if (!checkSessionController.isCheckSession(memberNo))
            return checkSessionController.forwardingMembersPageAndErrorMsg(model, "권한이 없습니다.<BR>로그인 후 다시 시도해주세요");

        if ((sessionMember.isCheckSession() && memberService.checkMember(checkPassword))
                || sessionMember.isLoginOAuth()) {
            model.addAttribute("mainContents", "user-information");
            return "index";

        }
        return "redirect:/members/" + sessionMember.getNo() + "/check-password";

    }

    //TODO: 회원정보 변경
    @PutMapping("/{memberNo}")
    @ResponseBody
    public String update(@Valid Member member, BindingResult bindingResult, @PathVariable String memberNo) {
        String result = "false";
        member.setMembersAgreement(true);
        member.setCollectionAndUse(true);
        if (!bindingResult.hasErrors() && checkSessionController.isCheckSession(memberNo)) {
            result = memberService.updateMember(member);
        }

        return result;

    }

    /*TODO:회원 비밀번호 인증으로 이동*/
    @RequestMapping(path = "/{memberNo}/check-password", method = {RequestMethod.GET, RequestMethod.POST})
    public String checkPassword(Model model, @PathVariable String memberNo) {
        if (checkSessionController.isCheckSession(memberNo)) {
            model.addAttribute("mainContents", "user-check-password");
            sessionMember.setCheckSession(true);
            return "index";
        }

        return checkSessionController.forwardingMembersPageAndErrorMsg(model, "권한이 없습니다.<BR>로그인 후 다시 시도해주세요");
    }

    /*TODO: 회원 이메일 변경페이지로 이동*/
    @RequestMapping(path = "/{memberNo}/change-email", method = {RequestMethod.GET, RequestMethod.POST})
    public String changeEmail(Model model, @PathVariable String memberNo) {
        if (checkSessionController.isCheckSession(memberNo)) {
            model.addAttribute("mainContents", "user-change-email");
            return "index";

        }

        return checkSessionController.forwardingMembersPageAndErrorMsg(model, "권한이 없습니다.<BR>로그인 후 다시 시도해주세요");
    }

    /*TODO: 회원 이메일 인증페이지로 이동*/
    @RequestMapping(path = "/{memberNo}/check-email", method = {RequestMethod.GET, RequestMethod.POST})
    public String checkEmail(Model model, @PathVariable String memberNo, @RequestParam(value = "checkEmail", required = false, defaultValue = "empty") String checkEmail) {
        if (checkSessionController.isCheckSession(memberNo)) {
            if (!checkEmail.equals("empty")) {
                if (!memberService.isExistedEmail(checkEmail)) {
                    mailService.sendAuthMail(checkEmail, "[My Blog By Xasquatch]이메일 인증 요청");
                    sessionMember.setEmail(checkEmail);
                    model.addAttribute("email", checkEmail);
                    model.addAttribute("mainContents", "user-check-email");

                } else {
                    model.addAttribute("msg", "\"" + checkEmail + "\"은(는) 이미 존재하는 이메일 계정입니다.");
                    model.addAttribute("mainContents", "user-change-email");

                }

            } else {
                mailService.sendAuthMail(sessionMember.getEmail(), "[My Blog By Xasquatch]이메일 인증 요청");
                model.addAttribute("email", sessionMember.getEmail());
                model.addAttribute("mainContents", "user-check-email");

            }

            return "index";

        }
        return checkSessionController.forwardingMembersPageAndErrorMsg(model, "권한이 없습니다.<BR>로그인 후 다시 시도해주세요");
    }

    /*TODO: 회원 이메일 찾기*/
    @RequestMapping(path = "/search/email", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public String searchEmail(Member member) {
        return memberService.searchEmail(member.getName());
    }

    /*TODO: 회원 임시 비밀번호 찾기*/
    @RequestMapping(path = "/search/password", method = {RequestMethod.GET, RequestMethod.POST})
    @ResponseBody
    public String searchPwd(Member member) {
        return String.valueOf(memberService.searchPwd(member));
    }

    /*TODO: 회원 이메일 인증*/
    @PatchMapping(path = "/{memberNo}/auth-email", params = {"authorizationToken"})
    @ResponseBody
    public String authorizationEmail(@PathVariable String memberNo, String authorizationToken) {
        String result = "false";
        if (checkSessionController.isCheckSession(memberNo) && authorizationToken.equals(sessionMember.getAuthKey())) {
            result = String.valueOf(memberService.updateRank(sessionMember.getNo(), sessionMember.getEmail()));

        }

        return result;
    }

    /*TODO: 로그아웃 처리 후 루트페이지로 리다이렉트*/
    @RequestMapping(path = "/log-out", method = {RequestMethod.GET, RequestMethod.POST})
    public String logOut(HttpServletRequest request, HttpServletResponse response) {

        request.getSession().removeAttribute("sessionMember");
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("oauth-token")) {
                cookie.setMaxAge(0);
                cookie.setValue("");
                cookie.setPath("/");
                response.addCookie(cookie);

            }
        }
        memberService.reset(sessionMember);
        return "redirect:/members";
    }


    /*TODO:로그인*/
    @PostMapping("/login")
    @ResponseBody
    public String login(HttpSession session, Member member) {
        String result = memberService.login(member);
        if (!result.equals("false")) {
            if (sessionMember.getRank().equals("temporary") && !sessionMember.getName().equals("GUEST")) {
                result = "/members/" + sessionMember.getNo() + "/check-email";

            } else {
                result = String.valueOf(sessionMember.getNo());

            }
            session.setAttribute("sessionMember", sessionMember);
        }

        return result;

    }

    /*TODO:회원가입 이메일 중복체크*/
    @PostMapping("/sign-up/email")
    @ResponseBody
    public String checkEmail(Member member) {
        return String.valueOf(memberService.isExistedEmail(member.getEmail()));
    }

    /*TODO:회원가입 이메일 중복체크*/
    @PostMapping("/sign-up/name")
    @ResponseBody
    public String checkName(Member member) {
        return String.valueOf(memberService.isExistedName(member.getName()));
    }

    /*TODO:회원가입*/
    @PostMapping("/sign-up")
    @ResponseBody
    public String signUp(@Valid Member member, BindingResult bindingResult) {
        String result = "false";
        if (!bindingResult.hasErrors())
            result = memberService.updateMember(member);

        return result;
    }

    /*TODO:회원탈퇴*/
    @DeleteMapping("/{memberNo}")
    @ResponseBody
    public String delete(@PathVariable String memberNo) {
        String result = "false";
        if (checkSessionController.isCheckSession(memberNo)) {
            result = memberService.delete(sessionMember);
            memberService.reset(sessionMember);
        }
        return result;
    }

}
