package net.xasquatch.myblog.controller;

import net.xasquatch.myblog.model.Member;
import net.xasquatch.myblog.service.ResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@Controller
@RequestMapping("/resource")
public class ResourceController {

    @Autowired
    private HomeController checkSessionController;

    @Autowired
    private ResourceService resourceService;

    @GetMapping("/{memberNo}/list")
    public String viewList(Model model, @PathVariable String memberNo) {
        if (checkSessionController.isCheckSessionAndAuth(memberNo)) {
            model.addAttribute("mainContents", "resource-list");
            return "index";
        }
        return "redirect:/";

    }

    @GetMapping("/{memberNo}/create")
    public String create(Model model, @PathVariable String memberNo) {
        if (checkSessionController.isCheckSessionAndAuth(memberNo)) {
            model.addAttribute("mainContents", "resource-create");
            return "index";
        }
        return "redirect:/";
    }

    @PostMapping("/{memberNo}/upload")
    public String uploadData(@PathVariable String memberNo) {
        if (checkSessionController.isCheckSessionAndAuth(memberNo)) {
//            repositoryService.


        }
        return "redirect:/";
    }

}
