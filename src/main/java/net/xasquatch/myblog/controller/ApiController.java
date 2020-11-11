package net.xasquatch.myblog.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import net.xasquatch.myblog.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;

@Slf4j
@RestController
@RequestMapping(value = "/api", method = {RequestMethod.GET, RequestMethod.POST})
public class ApiController {

    @Autowired
    private BoardService boardService;

    @GetMapping(value = "/{memberNo}/board/list/read",params = {"pageLimit"})
    public @ResponseBody List<HashMap<String, Object>> viewBoardList(int pageLimit, @PathVariable String memberNo) {
        System.out.println("pageLimit = " + pageLimit);

        return boardService.getBoardList(memberNo, pageLimit);
    }

}
