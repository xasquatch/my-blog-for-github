package net.xasquatch.myblog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/board")
public class BoarderController {

    @RequestMapping(value = "/create", method = {RequestMethod.GET, RequestMethod.POST})
    public String board(Model model) {
        model.addAttribute("mainContents", "board-create");

        return "index";
    }

    @PostMapping("/upload")
    public String upload(Model model ,@RequestPart(required=false) MultipartFile[] file) {

        return "forward:/board/view/list";
    }

    @RequestMapping(value = "/view/list", method = {RequestMethod.GET, RequestMethod.POST})
    public String viewList(Model model) {

        model.addAttribute("mainContents", "board-view-list");

        return "index";
    }
    // 임시
    @RequestMapping(value = "/view/detail", method = {RequestMethod.GET, RequestMethod.POST})
    public String viewDetail(Model model) {

        model.addAttribute("mainContents", "board-view-detail");

        return "index";
    }
}
