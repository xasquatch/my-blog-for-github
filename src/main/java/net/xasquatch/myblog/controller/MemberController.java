package net.xasquatch.myblog.controller;

import lombok.extern.slf4j.Slf4j;
import net.xasquatch.myblog.model.Member;
import net.xasquatch.myblog.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.validation.Valid;

@Slf4j
@Controller
@RequestMapping("/user")
public class MemberController {

    @Autowired
    private MemberService memberService;

    /*TODO: infomation페이지 이동*/
    @RequestMapping(value = "/{memberNo}/information", method = {RequestMethod.GET, RequestMethod.POST})
    public String info(Model model) {
        log.debug("Controller {}: {}", "Member", "information");
        model.addAttribute("mainContents", "user-info");

        return "index";
    }

    /*TODO: dashBoard페이지 이동*/
    @RequestMapping(value = "/{memberNo}/dashBoard", method = {RequestMethod.GET, RequestMethod.POST})
    public String dashBoard(Model model) {
        log.debug("Controller {}: {}", "Member", "dashBoard");
        model.addAttribute("mainContents", "user-dashboard");

        return "index";
    }


    /*TODO: logOut페이지 이동*/
    @RequestMapping(value = "/{memberNo}/log-out", method = {RequestMethod.GET, RequestMethod.POST})
    public String logOut(Model model) {
        log.debug("Controller {}: {}", "Member", "log-out");
        model.addAttribute("mainContents", "user-log-out");

        return "index";
    }


    /*TODO:로그인*/
    @PostMapping("/login")
    public String login(Model model, Member member) {
        log.debug("Controller {}: {}", "login", "signUp");

        boolean result = false;
        result = memberService.login(member);

        if (result) {
            model.addAttribute("mainContents", "main");
            model.addAttribute("locationPage", "/");
            return "index";

        } else {
            model.addAttribute("systemMsg", "[로그인 실패] 알 수 없는 이유로 로그인에 실패하였습니다. 다시 시도해주시기바랍니다.");
            model.addAttribute("locationPage", "/");
            return "forward:/";

        }
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
    public String signUp(Model model, @Valid Member member, BindingResult bindingResult) {
        boolean result = false;
        if (!bindingResult.hasErrors()) {
            result = memberService.save(member);

        }
        return String.valueOf(result);
    }

    /*TODO:회원 정보수정*/
    @PostMapping("/{memberNo}/update")
    public String update(Model model, Member member) {

        log.debug("Controller {}: {}", "member update", member.toString());

        boolean result = false;
        result = memberService.update(member);


        if (result) {
            model.addAttribute("systemMsg", "[회원정보 수정완료] 수정된 내 정보 페이지로 이동합니다.");
        } else {
            model.addAttribute("systemMsg", "[회원정보 실패] 내 정보 페이지로 이동합니다.");
        }
        model.addAttribute("locationPage", "/user/information");


        return "forward:/user/information";

    }
}
