package net.xasquatch.myblog.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Slf4j
@Controller
@RequestMapping("/document")
public class DocumentController {

    @GetMapping("/members/{memberNo}/boards")
    public String goViewBoardList(Model model){
        model.addAttribute("mainContents","document-api-board-list");
        return "index";
    }

    @GetMapping("/members/{memberNo}/boards/{boardNo}")
    public String viewBoardDetail(Model model){
        model.addAttribute("mainContents","document-api-board-detail");
        return "index";
    }

    @GetMapping("/members/{memberNo}/resource/{resourceNo}")
    public String viewResourceDetail(Model model){
        model.addAttribute("mainContents","document-api-resource-detail");
        return "index";
    }

}