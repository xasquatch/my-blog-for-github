package net.xasquatch.myblog.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
//@RequestMapping("/board")
public class BoardController {


    @GetMapping("/board")
    public String board(Model model){
        model.addAttribute("mainContents","board");

        return "index";
    }

    @PostMapping("/board/upload")
    public String upload(Model model){
        model.addAttribute("mainContents","board");

        return "redirect:/board";
    }
}
