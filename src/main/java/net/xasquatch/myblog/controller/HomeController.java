package net.xasquatch.myblog.controller;

import lombok.extern.slf4j.Slf4j;
import net.xasquatch.myblog.model.Member;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.annotation.Resource;

@Slf4j
@Controller
public class HomeController {

    @Resource(name = "sessionMember")
    private Member sessionMember;

    protected boolean isCheckSessionAndAuth(String inputSessionNumber) {
        return (sessionMember.getNo() == Long.parseLong(inputSessionNumber) && !sessionMember.getRank().equals("temporary"));

    }

    protected boolean isCheckSession(String inputSessionNumber) {
        return sessionMember.getNo() == Long.parseLong(inputSessionNumber);

    }

    @GetMapping(value = "/")
    public String home(Model model) {
        if (sessionMember.getNo() == null) return "forward:/login";
        model.addAttribute("mainContents", "main");

        return "index";
    }

    @GetMapping(value = "/login")
    public String main(Model model) {
        model.addAttribute("mainContents", "login");

        return "index";
    }

}