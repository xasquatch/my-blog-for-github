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
@RequestMapping(path = "/resources", produces = "text/plain;charset=UTF-8")
public class ResourceController {

    @Lazy
    @Autowired
    private HomeController checkSessionController;

    @Autowired
    private ResourceService resourceService;

    @GetMapping
    public String viewList(Model model, @RequestParam(name = "search", required = false, defaultValue = "") String searchValue) {
        List<Resource> resources;
        if (checkSessionController.isCheckSessionAndAuth()) {
            resources = resourceService.viewList(0, searchValue);
            model.addAttribute("mainContents", "resource-list");
            model.addAttribute("resources", resources);
            return "index";

        }
        return checkSessionController.forwardingMembersPageAndErrorMsg(model, "권한이 없습니다.<BR>로그인 후 다시 시도해주세요");

    }

    @GetMapping("/more")
    @ResponseBody
    public String additionalViewList(@RequestParam(name = "last-number", required = true, defaultValue = "100000000000") String lastNumber,
                                     @RequestParam(name = "search", required = false, defaultValue = "") String searchValue) {
        if (checkSessionController.isCheckSessionAndAuth())
            return resourceService.AdditionalViewList(lastNumber, searchValue);

        return "false";

    }

    @GetMapping("/new")
    public String create(Model model) {
        if (checkSessionController.isCheckSessionAndAuth()) {
            model.addAttribute("mainContents", "resource-create");
            return "index";
        }
        return checkSessionController.forwardingMembersPageAndErrorMsg(model, "권한이 없습니다.<BR>로그인 후 다시 시도해주세요");
    }

    @PostMapping("/upload")
    @ResponseBody
    public String uploadData(Resource resource) {
        if (checkSessionController.isCheckSessionAndAuth()) {

            return String.valueOf(resourceService.upload(resource));
        }
        return "false";
    }

    @PutMapping("/{ressourceNo}")
    @ResponseBody
    public String modifyData(Resource resource) {
        if (checkSessionController.isCheckSessionAndAuth()) {

            return String.valueOf(resourceService.modify(resource));
        }
        return "false";
    }

    @DeleteMapping("/{ressourceNo}")
    @ResponseBody
    public String deleteData(Resource resource) {
        if (checkSessionController.isCheckSessionAndAuth()) {

            return String.valueOf(resourceService.delete(resource));
        }
        return "false";
    }

}