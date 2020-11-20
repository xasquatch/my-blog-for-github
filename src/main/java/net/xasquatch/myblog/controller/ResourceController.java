package net.xasquatch.myblog.controller;

import lombok.extern.slf4j.Slf4j;
import net.xasquatch.myblog.model.Member;
import net.xasquatch.myblog.model.Resource;
import net.xasquatch.myblog.service.ResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@Controller
@RequestMapping("/resource")
public class ResourceController {

    @Autowired
    private HomeController checkSessionController;

    @Autowired
    private ResourceService resourceService;

    @GetMapping("/{memberNo}/list")
    public String viewList(Model model, @PathVariable String memberNo) {
        List<Resource> resources;
        if (memberNo.equals("all")) {
            resources = resourceService.viewAllList(0);

        } else if (checkSessionController.isCheckSessionAndAuth(memberNo)) {
            resources = resourceService.viewList(0);

        }else{
            return "redirect:/resource/all/list";
        }
        model.addAttribute("resources", resources);
        model.addAttribute("mainContents", "resource-list");
        return "index";

    }

    @GetMapping(value = "/{memberNo}/AdditionalList", produces = "text/plain;charset=UTF-8")
    @ResponseBody
    public String additionalViewList(Model model, @PathVariable String memberNo,
                                     @RequestParam(name = "lastNumber", required = true, defaultValue = "0") String lastNumber) {
        if (checkSessionController.isCheckSessionAndAuth(memberNo)) {
            if (memberNo.equals("all")) {
                return resourceService.AdditionalViewAllList(lastNumber);
            } else {
                return resourceService.AdditionalViewList(lastNumber);

            }
        }
        return "false";

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

    @PutMapping("/{memberNo}/modify")
    @ResponseBody
    public String modifyData(Resource resource, @PathVariable String memberNo) {
        if (checkSessionController.isCheckSessionAndAuth(memberNo)) {

            return String.valueOf(resourceService.modify(resource));
        }
        return "false";
    }

    @DeleteMapping("/{memberNo}/delete")
    @ResponseBody
    public String deleteData(Resource resource, @PathVariable String memberNo) {
        if (checkSessionController.isCheckSessionAndAuth(memberNo)) {

            return String.valueOf(resourceService.delete(resource));
        }
        return "false";
    }

}