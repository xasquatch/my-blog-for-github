package net.xasquatch.myblog.controller;

import lombok.extern.slf4j.Slf4j;
import net.xasquatch.myblog.model.Member;
import net.xasquatch.myblog.service.BoardService;
import net.xasquatch.myblog.service.MemberService;
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
@RequestMapping(path = "/management", produces = "text/plain; charset=utf8")
public class ManagementController {

    @Lazy
    @Autowired
    private HomeController checkSessionController;

    @Autowired
    private BoardService boardService;

    @Autowired
    private MemberService memberService;

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

        String[] parsingSearchValue = boardService.parsingSearchValue(keyword, title, contents, titleOrContents);

        Map<String, Object> boardUnit =
                boardService.getNoticeList("manager", pageLimit, currentPageBlock, parsingSearchValue);


        List<Map<String, Object>> boardList = (List<Map<String, Object>>) boardUnit.get("boardList");
        Object pageBlockList = boardUnit.get("pageBlockList");

        model.addAttribute("boardList", boardList);
        model.addAttribute("pageBlockList", pageBlockList);
        model.addAttribute("pageLimit", pageLimit);
        model.addAttribute("noticeList", "management-notice-list");
        model.addAttribute("mainContents", "management-notice-list");

        return "index";
    }

    @GetMapping("/boards")
    public String boardList(Model model,
                            @RequestParam(value = "page-limit", required = false, defaultValue = "10") int pageLimit,
                            @RequestParam(value = "current-page-block", required = false, defaultValue = "1") int currentPageBlock,
                            @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
                            @RequestParam(value = "title", required = false, defaultValue = "") String title,
                            @RequestParam(value = "contents", required = false, defaultValue = "") String contents,
                            @RequestParam(value = "title-or-contents", required = false, defaultValue = "") String titleOrContents) {

        if (!checkSessionController.isCheckManager())
            return checkSessionController.forwardingMembersPageAndErrorMsg(model, "권한이 없습니다.");

        String[] parsingSearchValue = boardService.parsingSearchValue(keyword, title, contents, titleOrContents);

        Map<String, Object> boardUnit =
                boardService.getBoardList("all-management", pageLimit, currentPageBlock, parsingSearchValue);

        List<Map<String, Object>> boardList = (List<Map<String, Object>>) boardUnit.get("boardList");
        Object pageBlockList = boardUnit.get("pageBlockList");

        model.addAttribute("boardList", boardList);
        model.addAttribute("pageBlockList", pageBlockList);
        model.addAttribute("pageLimit", pageLimit);
        model.addAttribute("noticeList", "management-board-list");
        model.addAttribute("mainContents", "management-board-list");

        try {
            model.addAttribute("searchTarget", parsingSearchValue[0]);
            model.addAttribute("searchValue", parsingSearchValue[1].substring(1, parsingSearchValue[1].length() - 1));

        } catch (NullPointerException e) {
            log.debug("viewList {}", e.getMessage());
            model.addAttribute("searchTarget", "keyword");
        }


        return "index";
    }

    @GetMapping("/users")
    public String userList(Model model) {

        if (!checkSessionController.isCheckManager())
            return checkSessionController.forwardingMembersPageAndErrorMsg(model, "권한이 없습니다.");

        List<Map<String, Object>> memberList
                = memberService.manageAllMember("manager", "", "");

        model.addAttribute("memberList", memberList);
        model.addAttribute("mainContents", "management-user-list");

        return "index";

    }

}
