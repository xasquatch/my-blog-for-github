package net.xasquatch.myblog.controller;

import net.xasquatch.myblog.model.Member;
import net.xasquatch.myblog.model.Resource;
import net.xasquatch.myblog.service.ResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

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
            List<Resource> resources = resourceService.viewList(0);

            model.addAttribute("resources", resources);
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
    @ResponseBody
    public String uploadData(Resource resource, @PathVariable String memberNo) {
        if (checkSessionController.isCheckSessionAndAuth(memberNo)) {

            return String.valueOf(resourceService.upload(resource));
        }
        return "false";
    }

}