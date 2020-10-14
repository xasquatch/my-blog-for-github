package net.xasquatch.myblog.controller;

import net.xasquatch.myblog.model.Test;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class HomeController {

    @RequestMapping(value = "/", method = {RequestMethod.GET, RequestMethod.POST})
    public String home(Model model) {
        model.addAttribute("mainContents", "home");

        return "index";
    }
    @RequestMapping(value = "/board", method = {RequestMethod.GET, RequestMethod.POST})
    public String board(Model model) {
        model.addAttribute("mainContents", "board");

        return "index";
    }

    @PostMapping("/board/upload")
    public String upload(Model model ,@RequestPart(required=false)MultipartFile[] file) {

        return "forward:/board";
    }

    @PostMapping("/user/sign-up")
    public String signUp(Model model, @ModelAttribute Test user ,@RequestPart(required=false)MultipartFile[] file){
        model.addAttribute("mainContents", "home");

        System.out.println("/user/sign-up");

        return "forward:/";
    }
}