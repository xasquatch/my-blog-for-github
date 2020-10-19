package net.xasquatch.myblog.controller;

import lombok.extern.slf4j.Slf4j;
import net.xasquatch.myblog.model.Member;
import net.xasquatch.myblog.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletRequest;

@Slf4j
@Controller
@RequestMapping("/user")
public class MemberController {

    @Autowired
    private MemberService memberService;

    @PostMapping("/sign-up")
    @ResponseBody
    public String signUp(Model model, Member member, ServletRequest request) {
        log.debug("Controller {}: {}", "Member", "signUp");


        boolean signUpResult = memberService.save(member);

        System.out.println("member:"+member.toString());
        System.out.println("request = " + (request.getParameter("img").equals("")));
        model.addAttribute("mainContents", "home");

        if (signUpResult) {
            return "success";

        } else {
            return "fail";

        }

    }

    @PostMapping("/update")
    public String update(Model model, @ModelAttribute Member user, @RequestPart(required = false) MultipartFile[] file) {
        log.debug("Controller {}: {}", "Member", "update");
        model.addAttribute("mainContents", "home");

        return "redirect:/user/information";
    }

    @RequestMapping(value = "/information", method = {RequestMethod.GET, RequestMethod.POST})
    public String info(Model model) {
        log.debug("Controller {}: {}", "Member", "information");
        model.addAttribute("mainContents", "user-info");

        return "index";
    }
}
