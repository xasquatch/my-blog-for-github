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
        model.addAttribute("mainContents", "board");

        return "index";
    }

    @PostMapping("/upload")
    public String upload(Model model ,@RequestPart(required=false) MultipartFile[] file) {

        return "forward:/board/view";
    }

    @RequestMapping(value = "/view", method = {RequestMethod.GET, RequestMethod.POST})
    public String view(Model model) {

        model.addAttribute("mainContents", "board-view");

        return "index";
    }
}
