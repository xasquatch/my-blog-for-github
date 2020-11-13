package net.xasquatch.myblog.controller;

import lombok.extern.slf4j.Slf4j;
import net.xasquatch.myblog.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@Slf4j
@RestController
@RequestMapping(value = "/api", method = {RequestMethod.GET, RequestMethod.POST})
public class ApiController {

    @Autowired
    private BoardService boardService;

    @GetMapping(value = "/members/{memberNo}/board/list",params = {"pageLimit","currentPageBlock"})
    public String viewBoardList(int pageLimit, int currentPageBlock, @PathVariable String memberNo) {

        return boardService.getBoardList(memberNo, pageLimit, currentPageBlock);
    }
}
