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

}