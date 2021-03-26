package net.xasquatch.myblog.controller;

import lombok.extern.slf4j.Slf4j;
import net.xasquatch.myblog.interceptor.parts.AccessorInfo;
import net.xasquatch.myblog.model.Board;
import net.xasquatch.myblog.model.Member;
import net.xasquatch.myblog.service.BoardService;
import net.xasquatch.myblog.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
@RequestMapping(path = "/boards", produces = "text/plain;charset=UTF-8")
public class BoarderController {

    @Autowired
    private AccessorInfo accessorInfo;

    @Autowired
    private BoardService boardService;

    @Resource(name = "sessionMember")
    private Member sessionMember;

    @Lazy
    @Autowired
    private HomeController checkSessionController;

    @Autowired
    private CommentService commentService;

    //TODO: 게시판 리스트 조회 페이지
    @GetMapping
    public String viewList(Model model, @RequestParam String memberNo,
                           @RequestParam(value = "page-limit", required = false, defaultValue = "10") int pageLimit,
                           @RequestParam(value = "current-page-block", required = false, defaultValue = "1") int currentPageBlock,
                           @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
                           @RequestParam(value = "title", required = false, defaultValue = "") String title,
                           @RequestParam(value = "contents", required = false, defaultValue = "") String contents,
                           @RequestParam(value = "title-or-contents", required = false, defaultValue = "") String titleOrContents) {

        String[] searchValue = boardService.parsingSearchValue(keyword, title, contents, titleOrContents);
        Map<String, Object> boardUnit;
        if (memberNo.equals("all") && checkSessionController.isCheckManager()) {
            boardUnit = boardService.getBoardList("all", pageLimit, currentPageBlock, searchValue);
            model.addAttribute("mainContents", "management-boards");

        } else {
            boardUnit = boardService.getBoardList(memberNo, pageLimit, currentPageBlock, searchValue);
            model.addAttribute("mainContents", "board-view-list");

        }
        List<Map<String, Object>> boardList = (List<Map<String, Object>>) boardUnit.get("boardList");
        Object pageBlockList = boardUnit.get("pageBlockList");

        model.addAttribute("boardList", boardList);
        model.addAttribute("pageBlockList", pageBlockList);
        model.addAttribute("pageLimit", pageLimit);

        try {
            model.addAttribute("searchTarget", searchValue[0]);
            model.addAttribute("searchValue", searchValue[1].substring(1, searchValue[1].length() - 1));

        } catch (NullPointerException e) {
            log.debug("viewList {}", e.getMessage());
            model.addAttribute("searchTarget", "keyword");
        }

        return "index";
    }

    //TODO: 글작성 화면으로 이동
    @GetMapping("/new")
    public String forwardCreate(Model model,
                                @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword) {
        String memberNo = String.valueOf(sessionMember.getNo());
        if (checkSessionController.isCheckSessionAndAuth(memberNo)) {
            long boardNo = (long) boardService.createDefaultBoard(memberNo);

            model.addAttribute("boardKeyword", keyword);
            model.addAttribute("boardNo", boardNo);
            model.addAttribute("mainContents", "board-create");
            return "index";

        }
        return checkSessionController.forwardingMembersPageAndErrorMsg(model, "권한이 없습니다.<BR>로그인 후 다시 시도해주세요");

    }

    //TODO: defaultBoard메서드로 생성하였던 빈 게시판에 업로드 마무리
    @PostMapping("/{boardNo}/finish")
    @ResponseBody
    public String upload(MultipartHttpServletRequest request, @Valid Board board,
                         BindingResult bindingResult,
                         @RequestParam String method,
                         @RequestParam String memberNo) {
        if (checkSessionController.isCheckSessionAndAuth(memberNo)) {
            boolean result = false;
            board.setCreated_ip(accessorInfo.getIpAddress(request));
            if (bindingResult.hasErrors()) return "false";

            String checkResult = boardService.checkBoardFormData(board);

            if (checkResult.contains("[script Error]")) return checkResult;

            if (method.equals("create")) {
                result = boardService.createFinish(board);

            } else if (method.equals("modify")) {
                result = boardService.modify(board);

            }
            return String.valueOf(result);

        }
        return "false";

    }

    //TODO: 작성글 수정페이지로 이동
    @GetMapping("/blob/{boardNo}")
    public String modify(Model model,
                         @PathVariable String boardNo,
                         @RequestParam String pwd,
                         @RequestParam String memberNo) {
        if (checkSessionController.isCheckSessionAndAuth(memberNo) ||
                (memberNo.equals("all") && checkSessionController.isCheckManager())) {
            if (sessionMember.getName().equals("GUEST") && !boardService.isConfirmBoardPwd(boardNo, pwd))
                return checkSessionController.forwardingMembersPageAndErrorMsg(model, "패스워드 오류<BR>비밀번호를 다시 확인해주세요.");
            Map<String, Object> board = boardService.viewDetail(boardNo);
            model.addAttribute("board", board);
            model.addAttribute("mainContents", "board-modify");

            return "index";
        }

        return checkSessionController.forwardingMembersPageAndErrorMsg(model, "권한이 없습니다.<BR>로그인 후 다시 시도해주세요");
    }

    // TODO: 게시판 상세조회로 페이지이동
    @GetMapping(path = "/{boardNo}")
    public String viewDetail(Model model,
                             @PathVariable String boardNo) {

        Map<String, Object> board = boardService.viewDetail(boardNo);

        model.addAttribute("board", board);
        model.addAttribute("boardNo", boardNo);
        model.addAttribute("mainContents", "board-view-detail");

        return "index";
    }

    // TODO: 게시판삭제 REST
    @ResponseBody
    @DeleteMapping(path = "/{boardNo}")
    public String deleteBoard(@RequestParam String pwd,
                              @RequestParam String memberNo,
                              @PathVariable String boardNo) {
        if (checkSessionController.isCheckSessionAndAuth(memberNo) ||
                (memberNo.equals("all") && checkSessionController.isCheckManager())) {
            if (sessionMember.getName().equals("GUEST") && !boardService.isConfirmBoardPwd(boardNo, pwd))
                return "false";
            if (boardService.delete(boardNo))
                return "true";

        }
        return "false";
    }

    // TODO: 해당 게시판의 코멘트 초회
    @GetMapping("/{boardNo}/comments")
    @ResponseBody
    public String viewCommentList(@PathVariable long boardNo,
                                  @RequestParam(value = "page-limit", required = false, defaultValue = "5") String pageLimit,
                                  @RequestParam(value = "current-page-block", required = false, defaultValue = "1") String currentPageBlock) {
        return commentService.getCommentList(boardNo, currentPageBlock, pageLimit);
    }

}
