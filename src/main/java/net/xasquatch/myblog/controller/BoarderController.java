package net.xasquatch.myblog.controller;

import lombok.extern.slf4j.Slf4j;
import net.xasquatch.myblog.interceptor.parts.AccessorInfo;
import net.xasquatch.myblog.model.Board;
import net.xasquatch.myblog.model.Member;
import net.xasquatch.myblog.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
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

    //TODO: 글작성 화면으로 이동
    @RequestMapping(value = "/{memberNo}/create", method = {RequestMethod.GET, RequestMethod.POST})
    public String forwardCreate(Model model, @PathVariable String memberNo) {

        long boardNo = (long) boardService.createDefaultBoard(memberNo);

        model.addAttribute("boardNo", boardNo);
        model.addAttribute("mainContents", "board-create");
        return "index";
    }

    //TODO: defaultBoard메서드로 생성하였던 빈 게시판에 업로드 마무리
    @PostMapping("/{memberNo}/upload/{boardNo}/{method}")
    @ResponseBody
    public String upload(MultipartHttpServletRequest request, Board board, @PathVariable String method) {

        boolean result = false;
        board.setCreated_ip(accessorInfo.getIpAddress(request));

        if (method.equals("create")) {
            result = boardService.createFinish(board);

        } else if (method.equals("modify")) {
            result = boardService.modify(board);

        }

        return String.valueOf(result);
    }

    //TODO: 작성글 수정페이지로 이동
    @RequestMapping(value = "/{memberNo}/modify/{boardNo}", method = {RequestMethod.GET, RequestMethod.POST})
    public String modify(Model model, @PathVariable String boardNo) {

        HashMap<String, Object> board = boardService.viewDetail(boardNo);
        model.addAttribute("board", board);
        model.addAttribute("mainContents", "board-modify");

        return "index";
    }

    @RequestMapping(value = "/{memberNo}/view/list", method = {RequestMethod.GET, RequestMethod.POST})
    public String viewList(Model model, Member member, HttpServletRequest request) {

        //TODO:임시
        member.setNo(1L);
        List<HashMap<String, Object>> boardList = boardService.getBoardList(member);

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

        boardService.delete(boardNo);

        return "redirect:/board/" + memberNo + "/view/list";
    }

}
