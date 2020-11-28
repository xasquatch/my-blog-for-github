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
            HashMap<String, Object> board = boardService.viewDetail(memberNo, boardNo);
            model.addAttribute("board", board);
            model.addAttribute("mainContents", "board-modify");

            return "index";
        }

        return "redirect:/";
    }

    //TODO: 전체 게시판 리스트 조회 페이지
    @RequestMapping(value = "/all/list", method = {RequestMethod.GET, RequestMethod.POST})
    public String viewAllList(Model model) {

        

        model.addAttribute("mainContents", "board-view-list-all");
        return "index";
    }

    //TODO: 게시판 리스트 조회 페이지
    @RequestMapping(value = "/{memberNo}/list", method = {RequestMethod.GET, RequestMethod.POST})
    public String viewList(Model model, @PathVariable String memberNo) {
        model.addAttribute("mainContents", "board-view-list");


        return "index";
    }

    @RequestMapping(value = "/{memberNo}/detail/{boardNo}", method = {RequestMethod.GET, RequestMethod.POST})
    public String viewDetail(Model model, @PathVariable String boardNo, @PathVariable String memberNo) {

        model.addAttribute("boardNo", boardNo);
        model.addAttribute("memberNo", memberNo);
        model.addAttribute("mainContents", "board-view-detail");

        return "index";
    }

    @RequestMapping(value = "/{memberNo}/delete/{boardNo}", method = {RequestMethod.GET, RequestMethod.POST})
    public String deleteBoard(@PathVariable String memberNo, @PathVariable String boardNo) {

        if (checkSessionController.isCheckSessionAndAuth(memberNo)) {
            boardService.delete(boardNo);

            return "redirect:/board/" + memberNo + "/list";
        }
        return "redirect:/";
    }

}
