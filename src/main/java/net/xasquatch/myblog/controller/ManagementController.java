package net.xasquatch.myblog.controller;

import net.xasquatch.myblog.model.Member;
import net.xasquatch.myblog.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@Controller
public class ManagementController {

    @Lazy
    @Autowired
    private HomeController checkSessionController;

    @Autowired
    private BoardService boardService;

    @Resource(name = "sessionMember")
    private Member sessionMember;


    @GetMapping(value = "/notice/list")
    public String noticeList(Model model,
                             @RequestParam(value = "page-limit", required = false, defaultValue = "10") int pageLimit,
                             @RequestParam(value = "current-page-block", required = false, defaultValue = "1") int currentPageBlock,
                             @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword) {

        boardService.getBoardList(1, pageLimit,currentPageBlock, new String[]{"keyword", keyword});

        model.addAttribute("noticeList", "management-notice-list");
        model.addAttribute("mainContents", "management-notice-list");

        return "index";

    }

    @RequestMapping(value = "/{memberNo}/management/users", method = RequestMethod.GET)
    public String userList(Model model, @PathVariable String memberNo) {

        if (checkSessionController.isCheckManager(memberNo)) {
            model.addAttribute("userList", "management-user-list");
            model.addAttribute("mainContents", "management-user-list");
            return "index";

        }
        return "redirect:/";

    }

}
