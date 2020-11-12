package net.xasquatch.myblog.controller;

import lombok.extern.slf4j.Slf4j;
import net.xasquatch.myblog.interceptor.parts.AccessorInfo;
import net.xasquatch.myblog.model.Board;
import net.xasquatch.myblog.model.Member;
import net.xasquatch.myblog.service.BoardService;
import net.xasquatch.myblog.service.Pagination;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.util.HashMap;
import java.util.List;

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

    @Autowired
    private Pagination pagination;


    //TODO: 글작성 화면으로 이동
    @RequestMapping(value = "/{memberNo}/create", method = {RequestMethod.GET, RequestMethod.POST})
    public String forwardCreate(Model model, @PathVariable String memberNo) {
        if (checkSessionController.isCheckSessionNo(memberNo)) {
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
        if (checkSessionController.isCheckSessionNo(memberNo)) {
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
        if (checkSessionController.isCheckSessionNo(memberNo)) {
            HashMap<String, Object> board = boardService.viewDetail(boardNo);
            model.addAttribute("board", board);
            model.addAttribute("mainContents", "board-modify");

            return "index";
        }

        return "redirect:/";
    }

    @RequestMapping(value = "/{memberNo}/view/list", method = {RequestMethod.GET, RequestMethod.POST})
    public String viewList(Model model, @PathVariable String memberNo) {
        int pageLimit = 10;
        int currentPageBlock = 1;
        try{
            pageLimit = (int) model.getAttribute("pageLimit");
            currentPageBlock = (int) model.getAttribute("currentPageBlock");

        }catch (NullPointerException e){
            log.warn("pageLimit: default(10)");
            log.warn("currentPageBlock: default(1)");
        }

        List<HashMap<String, Object>> boardList = boardService.getBoardList(memberNo, pageLimit, currentPageBlock);

        model.addAttribute("boardList", boardList);
        model.addAttribute("mainContents", "board-view-list");

        return "index";
    }

    @RequestMapping(value = "/{memberNo}/view/detail/{boardNo}", method = {RequestMethod.GET, RequestMethod.POST})
    public String viewDetail(Model model, @PathVariable String boardNo) {

        HashMap<String, Object> boardInfo = boardService.viewDetail(boardNo);

        model.addAttribute("boardInfo", boardInfo);
        model.addAttribute("mainContents", "board-view-detail");

        return "index";
    }

    @RequestMapping(value = "/{memberNo}/delete/{boardNo}", method = {RequestMethod.GET, RequestMethod.POST})
    public String deleteBoard(@PathVariable String memberNo, @PathVariable String boardNo) {

        if (checkSessionController.isCheckSessionNo(memberNo)){
            boardService.delete(boardNo);

            return "redirect:/board/" + memberNo + "/view/list";
        }
            return "redirect:/";
    }

}
