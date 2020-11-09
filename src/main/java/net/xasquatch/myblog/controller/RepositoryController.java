package net.xasquatch.myblog.controller;

import net.xasquatch.myblog.model.Member;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/repository")
public class RepositoryController {

    @GetMapping("/{memberNo}/list")
    public String viewList(Model model, Member member){

        model.addAttribute("mainContents", "repository-list");
        return "index";
    }

    @GetMapping("/{memberNo}/create")
    public String createList(Model model, Member member){

        model.addAttribute("mainContents", "repository-create");
        return "index";
    }

    @GetMapping("/{memberNo}/view")
    public String viewRepository(Model model, Member member){

        model.addAttribute("mainContents", "repository-view");
        return "index";
    }

    @GetMapping("/{memberNo}/search")
    public String searchRepository(Model model, Member member){



        return "forward:/repository/list";
    }

}