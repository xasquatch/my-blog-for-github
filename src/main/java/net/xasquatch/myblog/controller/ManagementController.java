package net.xasquatch.myblog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/management")
public class ManagementController {

    @GetMapping(value = "/notice/list")
    public String noticeList(Model model){


        model.addAttribute("noticeList", "management-notice-list");
        model.addAttribute("mainContents", "management-notice-list");

        return "index";
    }

    @GetMapping(value = "/users")
    public String userList(Model model){


        model.addAttribute("userList", "management-user-list");
        model.addAttribute("mainContents", "management-user-list");

        return "index";
    }

}
