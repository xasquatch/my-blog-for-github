package net.xasquatch.myblog.controller;

import net.xasquatch.myblog.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CommunityController {

    @Autowired
    private BoardService boardService;

    @GetMapping("/community")
    public String getList(Model model) {

        model.addAttribute("mainContents","community-list");

        return "index";
    }

}
