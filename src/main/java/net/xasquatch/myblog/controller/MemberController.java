package net.xasquatch.myblog.controller;

import lombok.extern.slf4j.Slf4j;
import net.xasquatch.myblog.model.Member;
import net.xasquatch.myblog.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Slf4j
@Controller
@RequestMapping("/user")
public class MemberController {

    @Autowired
    private MemberService memberService;

    @Resource(name = "sessionMember")
    private Member sessionMember;

    @Autowired
    private HomeController checkSessionController;

    /*TODO: infomation페이지 이동*/
    @RequestMapping(value = "/{memberNo}/information", method = {RequestMethod.GET, RequestMethod.POST})
    public String info(Model model, @PathVariable String memberNo) {
        if (checkSessionController.isCheckSessionNo(memberNo)) {
            model.addAttribute("mainContents", "user-info");
            return "index";
        }

        return "redirect:/";
    }

    /*TODO: dashBoard페이지 이동*/
    @RequestMapping(value = "/{memberNo}/clipboard", method = {RequestMethod.GET, RequestMethod.POST})
    public String dashBoard(Model model, @PathVariable String memberNo) {
        if (checkSessionController.isCheckSessionNo(memberNo)) {
            model.addAttribute("mainContents", "user-dashboard");
            return "index";
        }

        return "redirect:/";
    }


    /*TODO: 로그아웃 처리 필요*/
    @RequestMapping(value = "/{memberNo}/log-out", method = {RequestMethod.GET, RequestMethod.POST})
    public String logOut(Model model) {

        model.addAttribute("mainContents", "home");
        return "index";
    }


    /*TODO:로그인*/
    @PostMapping("/login")
    @ResponseBody
    public String login(HttpSession session, Member member, BindingResult bindingResult) {
        String result = "false";
        member = Member.builder()
                .email(member.getEmail())
                .pwd(member.getPwd())
                .name("empty")
                .membersAgreement(false)
                .collectionAndUse(false)
                .build();

        if (!bindingResult.hasErrors()) {
            result = String.valueOf(memberService.login(member));
            session.setAttribute("sessionMember", sessionMember);
        }

        return result;

    }

    /*TODO:회원가입 이메일 중복체크*/
    @PostMapping("/sign-up/email")
    @ResponseBody
    public String user(Member member) {
        return String.valueOf(memberService.isExistedEmail(member.getEmail()));
    }

    /*TODO:회원가입*/
    @PostMapping("/sign-up")
    @ResponseBody
    public String signUp(@Valid Member member, BindingResult bindingResult) {
        boolean result = false;
        if (!bindingResult.hasErrors()) {
            result = memberService.save(member);

        }
        return String.valueOf(result);
    }

    /*TODO:회원 정보수정*/
    @PostMapping("/{memberNo}/update")
    @ResponseBody
    public String update(Member member, @PathVariable String memberNo) {
        if (checkSessionController.isCheckSessionNo(memberNo)) {
            boolean result = false;
            result = memberService.update(member);

            return String.valueOf(result);
        }

        return "false";
    }
}
