package net.xasquatch.myblog.controller;

import net.xasquatch.myblog.model.Test;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/user")
public class MemberController {

    @PostMapping("/sign-up")
    public String signUp(Model model, @RequestPart(required=false) MultipartFile[] file){
        model.addAttribute("mainContents", "home");

        return "forward:/user/information";
    }
    @PostMapping("/update")
    public String update(Model model, @ModelAttribute Test user , @RequestPart(required=false) MultipartFile[] file){
        model.addAttribute("mainContents", "home");

        return "forward:/user/information";
    }

    @RequestMapping(value = "/information", method = {RequestMethod.GET,RequestMethod.POST})
    public String info(Model model){
        model.addAttribute("mainContents","user-info");

        return "index";
    }
}
