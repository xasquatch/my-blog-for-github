package net.xasquatch.myblog.controller;

import lombok.extern.slf4j.Slf4j;
import net.xasquatch.myblog.model.Resource;
import net.xasquatch.myblog.service.ResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Slf4j
@Controller
@RequestMapping(value = "/resource", produces = "text/plain;charset=UTF-8")
public class ResourceController {

    @Lazy
    @Autowired
    private HomeController checkSessionController;

    @Autowired
    private ResourceService resourceService;

    @GetMapping("/{memberNo}/list")
    public String viewList(Model model, @PathVariable String memberNo,
                           @RequestParam(name = "search", required = false, defaultValue = "") String searchValue) {
        List<Resource> resources;
        if (checkSessionController.isCheckSessionAndAuth(memberNo)) {
            resources = resourceService.viewList(0, searchValue);
            model.addAttribute("mainContents", "resource-list");
            model.addAttribute("resources", resources);

        }
        return "redirect:/";

    }

    @GetMapping("/{memberNo}/AdditionalList")
    @ResponseBody
    public String additionalViewList(@PathVariable String memberNo,
                                     @RequestParam(name = "last-number", required = true, defaultValue = "100000000000") String lastNumber,
                                     @RequestParam(name = "search", required = false, defaultValue = "") String searchValue) {
        if (checkSessionController.isCheckSessionAndAuth(memberNo))
            return resourceService.AdditionalViewList(lastNumber, searchValue);


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