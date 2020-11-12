package net.xasquatch.myblog.controller;

import lombok.extern.slf4j.Slf4j;
import net.xasquatch.myblog.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;

@Slf4j
@RestController
@RequestMapping(value = "/api", method = {RequestMethod.GET, RequestMethod.POST})
public class ApiController {

    @Autowired
    private BoardService boardService;

    @GetMapping(value = "/members/{memberNo}/board/list",params = {"pageLimit","currentBlock"})
    public @ResponseBody List<HashMap<String, Object>> viewBoardList(int pageLimit, int currentBlock, @PathVariable String memberNo) {

        return boardService.getBoardList(memberNo, pageLimit, currentBlock);
    }


}
