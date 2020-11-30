package net.xasquatch.myblog.controller;

import lombok.extern.slf4j.Slf4j;
import net.xasquatch.myblog.interceptor.parts.AccessorInfo;
import net.xasquatch.myblog.model.Board;
import net.xasquatch.myblog.service.ApiService;
import net.xasquatch.myblog.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
@RequestMapping("/board")
public class BoarderController {

    @Autowired
    private AccessorInfo accessorInfo;

    @Autowired
    private BoardService boardService;

    @Autowired
    private HomeController checkSessionController;


    //TODO: 글작성 화면으로 이동
    @RequestMapping(value = "/{memberNo}/create", method = {RequestMethod.GET, RequestMethod.POST})
    public String forwardCreate(Model model, @PathVariable String memberNo) {
        if (checkSessionController.isCheckSessionAndAuth(memberNo)) {
            long boardNo = (long) boardService.createDefaultBoard(memberNo);
            model.addAttribute("boardNo", boardNo);
            model.addAttribute("mainContents", "board-create");
            return "index";
        }

        return "redirect:/";

    }

    //TODO: defaultBoard메서드로 생성하였던 빈 게시판에 업로드 마무리
    @PostMapping("/{memberNo}/upload/{boardNo}/{method}")
    @ResponseBody
    public String upload(MultipartHttpServletRequest request, Board board, @PathVariable String method, @PathVariable String memberNo) {
        if (checkSessionController.isCheckSessionAndAuth(memberNo)) {
            boolean result = false;
            board.setCreated_ip(accessorInfo.getIpAddress(request));

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
    @RequestMapping(value = "/{memberNo}/modify/{boardNo}", method = {RequestMethod.GET, RequestMethod.POST})
    public String modify(Model model, @PathVariable String boardNo, @PathVariable String memberNo) {
        if (checkSessionController.isCheckSessionAndAuth(memberNo)) {
            Map<String, Object> board = boardService.viewDetail(memberNo, boardNo);
            model.addAttribute("board", board);
            model.addAttribute("mainContents", "board-modify");

            return "index";
        }

        return "redirect:/";
    }

    //TODO: 게시판 리스트 조회 페이지
    @RequestMapping(value = "/{memberNo}/list", method = {RequestMethod.GET, RequestMethod.POST})
    public String viewList(Model model, @PathVariable String memberNo,
                           @RequestParam(value = "page-limit", required = false, defaultValue = "10") int pageLimit,
                           @RequestParam(value = "current-page-block", required = false, defaultValue = "1") int currentPageBlock,
                           @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
                           @RequestParam(value = "title", required = false, defaultValue = "") String title,
                           @RequestParam(value = "contents", required = false, defaultValue = "") String contents,
                           @RequestParam(value = "title-or-contents", required = false, defaultValue = "") String titleOrContents) {

        String[] searchValue = boardService.parsingSearchValue(keyword, title, contents, titleOrContents);
        Map<String, Object> boardUnit;
        if (memberNo.equals("all")) {
            boardUnit = boardService.getBoardList("all", pageLimit, currentPageBlock, searchValue);
            model.addAttribute("mainContents", "board-view-list-all");

        }else{
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

        }catch (NullPointerException e){
            log.debug("viewList {}",e.getMessage());
            model.addAttribute("searchTarget", "keyword");
        }

        return "index";
    }

    @RequestMapping(value = "/{memberNo}/read/{boardNo}", method = {RequestMethod.GET, RequestMethod.POST})
    public String viewDetail(Model model, @PathVariable String boardNo, @PathVariable String memberNo) {

        Map<String, Object> board = boardService.viewDetail(memberNo, boardNo);

        model.addAttribute("board", board);
        model.addAttribute("boardNo", boardNo);
        model.addAttribute("memberNo", memberNo);
        model.addAttribute("mainContents", "board-view-detail");

        return "index";
    }

    @DeleteMapping("/{memberNo}/delete/{boardNo}")
    @ResponseBody
    public String deleteBoard(@PathVariable String memberNo, @PathVariable String boardNo) {
        if (checkSessionController.isCheckSessionAndAuth(memberNo)) {
            if (boardService.delete(boardNo))
            return "true";

        }
        return "false";
    }

}
