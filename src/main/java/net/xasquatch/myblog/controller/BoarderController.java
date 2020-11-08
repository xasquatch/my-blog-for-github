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

    //TODO: 작성글 데이터베이스 업로드
    @PostMapping("/{memberNo}/upload/{boardNo}")
    @ResponseBody
    public String upload(MultipartHttpServletRequest request, Board board) {

        board.setCreated_ip(accessorInfo.getIpAddress(request));

        log.debug("----------------------{}-------------", board.getContents());

        return String.valueOf(boardService.create(board));
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
