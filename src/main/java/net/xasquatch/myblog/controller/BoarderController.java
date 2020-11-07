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
    public String forwardCreate(Model model) {

        model.addAttribute("mainContents", "board-create");
        return "index";
    }

    @PostMapping("/{memberNo}/create/default")
    public String createDefault(Model model, @PathVariable String memberNo) {

        return (String) boardService.createDefaultBoard(memberNo);
    }

    //TODO: 작성글 데이터베이스 업로드
    @PostMapping("/{memberNo}/upload")
    public String upload(HttpServletRequest request, Model model, Board board, Member member) {

        //TODO:임시
        member.setNo(1L);
        board.setCreated_ip(accessorInfo.getIpAddress(request));

        boolean result = false;
        result = boardService.create(board, member);

        if (result) {
            model.addAttribute("systemMsg", "[업로드 완료]작성글 업로드가 완료되었습니다.");
            model.addAttribute("locationPage", "/board/view/list");
        } else {
            model.addAttribute("systemMsg", "[업로드 실패]알 수 없는 원인으로 인해 업로드에 실패하였습니다. 잠시후 다시시도해주세요");
            model.addAttribute("locationPage", "/board/create");
        }

        return "forward:/";
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
    public String deleteBoard(@PathVariable String boardNo) {

        boardService.delete(boardNo);

        return "redirect:/board/view/list";
    }

}
