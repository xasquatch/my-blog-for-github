package net.xasquatch.myblog.controller;

import lombok.extern.slf4j.Slf4j;
import net.xasquatch.myblog.model.Member;
import net.xasquatch.myblog.service.implement.MemberServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Slf4j
@Controller
@RequestMapping("/user")
public class MemberController {

    @Autowired
    private MemberServiceImpl memberService;

    /*TODO: infomation페이지 이동*/
    @RequestMapping(value = "/information", method = {RequestMethod.GET, RequestMethod.POST})
    public String info(Model model) {
        log.debug("Controller {}: {}", "Member", "information");
        model.addAttribute("mainContents", "user-info");

        return "index";
    }

    /*TODO: dashBoard페이지 이동*/
    @RequestMapping(value = "/dashBoard", method = {RequestMethod.GET, RequestMethod.POST})
    public String dashBoard(Model model) {
        log.debug("Controller {}: {}", "Member", "dashBoard");
        model.addAttribute("mainContents", "user-dashboard");

        return "index";
    }


    /*TODO: logOut페이지 이동*/
    @RequestMapping(value = "/log-out", method = {RequestMethod.GET, RequestMethod.POST})
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
    @GetMapping("/sign-up/email/{email}")
    @ResponseBody
    public String user(@PathVariable String email){
        return String.valueOf(memberService.isExistedEmail(email));
    }

    /*TODO:회원가입*/
    @PostMapping("/sign-up")
    public String signUp(Model model, Member member){

        boolean result = memberService.save(member);

        if (result) {
            model.addAttribute("systemMsg", "[회원가입 완료] 로그인 후 서비스 이용바랍니다.");
            model.addAttribute("locationPage", "/");
        } else {
            model.addAttribute("systemMsg", "[회원가입 실패] 알 수 없는 이유로 회원가입에 실패하였습니다. 다시 시도해주시기바랍니다.");
            model.addAttribute("locationPage", "/");
        }
        return "forward:/";
    }

    /*TODO:회원 정보수정*/
    @PostMapping("/update")
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
