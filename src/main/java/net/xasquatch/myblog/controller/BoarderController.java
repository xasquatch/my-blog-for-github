package net.xasquatch.myblog.controller;

import lombok.extern.slf4j.Slf4j;
import net.xasquatch.myblog.interceptor.parts.AccessorInfo;
import net.xasquatch.myblog.model.Board;
import net.xasquatch.myblog.model.Member;
import net.xasquatch.myblog.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpServletRequest;

@Slf4j
@Controller
@RequestMapping("/board")
public class BoarderController {

    @Autowired
    private AccessorInfo accessorInfo;

    @Autowired
    private BoardService boardService;


//TODO: 글작성 화면으로 이동
    @RequestMapping(value = "/create", method = {RequestMethod.GET, RequestMethod.POST})
    public String board(Model model) {
        model.addAttribute("mainContents", "board-create");
        log.debug("Controller {}: {}", "board", "create");
        return "index";
    }

//TODO: 작성글 데이터베이스 업로드
    @PostMapping("/upload")
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

    @RequestMapping(value = "/view/list", method = {RequestMethod.GET, RequestMethod.POST})
    public String viewList(Model model) {

        log.debug("Controller {}: {}", "board", "view list");
        model.addAttribute("mainContents", "board-view-list");

        return "index";
    }

    // 임시
    @RequestMapping(value = "/view/detail/{boardNo}", method = {RequestMethod.GET, RequestMethod.POST})
    public String viewDetail(Model model, @PathVariable String boardNo) {

        log.debug("Controller {}: {} -> {}", "board", "view detail", boardNo);
        if (boardNo.equals("1"))
            model.addAttribute("mainContents", "board-view-detail");

        return "index";
    }
}
