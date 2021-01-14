package net.xasquatch.myblog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ManagementController {

    @GetMapping(value = "/notice/list")
    public String noticeList(Model model){


        model.addAttribute("noticeList", "notice-list");
        model.addAttribute("mainContents", "notice-list");

        return "index";
    }

}
