package net.xasquatch.myblog.controller;

import ch.qos.logback.classic.Logger;
import lombok.extern.slf4j.Slf4j;
import net.xasquatch.myblog.model.Board;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

@Slf4j
@Controller
@RequestMapping("/board")
public class BoarderController {


    @RequestMapping(value = "/create", method = {RequestMethod.GET, RequestMethod.POST})
    public String board(Model model) {
        model.addAttribute("mainContents", "board-create");
        log.debug("Controller {}: {}", "board", "create");
        return "index";
    }

    @PostMapping("/upload")
    public String upload(Model model, Board board) {

        log.debug("tostring : {}",board.toString());

        log.debug("contents: {}",board.getContents());


        log.debug("Controller {}: {}", "board", "upload");
        return "forward:/board/view/list";
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
