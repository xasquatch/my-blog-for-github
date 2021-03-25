package net.xasquatch.myblog.controller;

import lombok.extern.slf4j.Slf4j;
import net.xasquatch.myblog.model.Member;
import net.xasquatch.myblog.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
public class ManagementController {

    @Lazy
    @Autowired
    private HomeController checkSessionController;

    @Autowired
    private BoardService boardService;

    @Resource(name = "sessionMember")
    private Member sessionMember;

    @GetMapping("/notice")
    public String noticeList(Model model,
                             @RequestParam(value = "page-limit", required = false, defaultValue = "10") int pageLimit,
                             @RequestParam(value = "current-page-block", required = false, defaultValue = "1") int currentPageBlock,
                             @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
                             @RequestParam(value = "title", required = false, defaultValue = "") String title,
                             @RequestParam(value = "contents", required = false, defaultValue = "") String contents,
                             @RequestParam(value = "title-or-contents", required = false, defaultValue = "") String titleOrContents) {

        String[] searchValue = boardService.parsingSearchValue("", title, contents, titleOrContents);
        Map<String, Object> boardUnit = boardService.getNoticeList("manager", pageLimit,currentPageBlock, searchValue);

        model.addAttribute("noticeList", "management-notice-list");
        model.addAttribute("mainContents", "management-notice-list");

        List<Map<String, Object>> boardList = (List<Map<String, Object>>) boardUnit.get("boardList");
        Object pageBlockList = boardUnit.get("pageBlockList");

        model.addAttribute("boardList", boardList);
        model.addAttribute("pageBlockList", pageBlockList);
        model.addAttribute("pageLimit", pageLimit);

        return "index";
    }

    @GetMapping("/{memberNo}/management/users")
    public String userList(Model model, @PathVariable String memberNo) {

        if (checkSessionController.isCheckManager(memberNo)) {
            model.addAttribute("userList", "management-user-list");
            model.addAttribute("mainContents", "management-user-list");
            return "index";

        }
        return checkSessionController.forwardingMembersPageAndErrorMsg(model, "권한이 없습니다.<BR>로그인 후 다시 시도해주세요");

    }

}
