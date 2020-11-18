package net.xasquatch.myblog.controller;

import net.xasquatch.myblog.model.Member;
import net.xasquatch.myblog.service.MailService;
import net.xasquatch.myblog.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

@Controller
@RequestMapping("/repository")
public class RepositoryController {

    @Resource(name = "sessionMember")
    private Member sessionMember;

    @Autowired
    private HomeController checkSessionController;


    @GetMapping("/{memberNo}/list")
    public String viewList(Model model, @PathVariable String memberNo) {
        if (checkSessionController.isCheckSessionAndAuth(memberNo)) {
            model.addAttribute("mainContents", "repository-list");
            return "index";
        }
        return "redirect:/";

    }

    @PostMapping("/{memberNo}/create")
    public String createList(Model model, @PathVariable String memberNo) {
        if (checkSessionController.isCheckSessionAndAuth(memberNo)) {
            model.addAttribute("mainContents", "repository-create");
            return "index";
        }
        return "redirect:/";
    }

}
