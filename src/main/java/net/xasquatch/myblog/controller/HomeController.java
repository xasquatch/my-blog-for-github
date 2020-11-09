package net.xasquatch.myblog.controller;

import lombok.extern.slf4j.Slf4j;
import net.xasquatch.myblog.model.Member;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;

@Slf4j
@Controller
public class HomeController {

    @Resource(name = "sessionMember")
    private Member sessionMember;

    protected boolean isCheckSessionNo(String inputSessionNumber){
        return sessionMember.getNo() == Long.parseLong(inputSessionNumber);

    }


    @RequestMapping(value = "/", method = {RequestMethod.GET, RequestMethod.POST})
    public String home(Model model) {
        model.addAttribute("mainContents", "home");

        return "index";
    }

    @RequestMapping(value = "/main", method = {RequestMethod.GET, RequestMethod.POST})
    public String main(Model model) {

        model.addAttribute("mainContents", "main");

        return "index";
    }

}