package net.xasquatch.myblog.controller;

import net.xasquatch.myblog.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(path = "/community", produces = "text/plain;charset=UTF-8")
public class CommunityController {

    @Autowired
    private BoardService boardService;

    @GetMapping
    public String getList(Model model,
                          @RequestParam(value = "page-limit", required = false, defaultValue = "10") int pageLimit,
                          @RequestParam(value = "current-page-block", required = false, defaultValue = "1") int currentPageBlock,
                          @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword) {

        Map<String, Object> boardUnit = boardService.getCommunityList(pageLimit, currentPageBlock, keyword);

        List<Map<String, Object>> boardList = (List<Map<String, Object>>) boardUnit.get("boardList");
        Object pageBlockList = boardUnit.get("pageBlockList");

        model.addAttribute("boardList", boardList);
        model.addAttribute("pageBlockList", pageBlockList);
        model.addAttribute("pageLimit", pageLimit);
        model.addAttribute("keyword", keyword);
        model.addAttribute("mainContents", "community-list");

        return "index";
    }

}
