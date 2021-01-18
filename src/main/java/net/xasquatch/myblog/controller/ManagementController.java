package net.xasquatch.myblog.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ManagementController {

    @Lazy
    @Autowired
    private HomeController checkSessionController;

    @GetMapping(value = "/notice/list")
    public String noticeList(Model model) {

        model.addAttribute("noticeList", "management-notice-list");
        model.addAttribute("mainContents", "management-notice-list");

        return "index";
    }

    @RequestMapping(value = "/{memberNo}/management/users", method = RequestMethod.GET)
    public String userList(Model model, @PathVariable String memberNo) {

        if (checkSessionController.isCheckManager(memberNo)) {
            model.addAttribute("userList", "management-user-list");
            model.addAttribute("mainContents", "management-user-list");
            return "index";

        }
        return "redirect:/";

    }

}
