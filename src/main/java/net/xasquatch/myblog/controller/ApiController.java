package net.xasquatch.myblog.controller;

import lombok.extern.slf4j.Slf4j;
import lombok.extern.slf4j.XSlf4j;
import net.xasquatch.myblog.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;

@Slf4j
@RestController
@RequestMapping(value = "/api", method = {RequestMethod.GET, RequestMethod.POST})
public class ApiController {

    @Autowired
    private BoardService boardService;


    @RequestMapping(value = "/{memberNo}/board/list/read", method = {RequestMethod.GET, RequestMethod.POST})
    public String viewBoardList(Model model, @PathVariable String memberNo) {
        int pageLimit = 10;
        try {
            pageLimit = (int) model.getAttribute("pageLimit");

        } catch (NullPointerException e) {
            log.info("pageLimit: default(10)");
        }

        List<HashMap<String, Object>> boardList = boardService.getBoardList(memberNo, pageLimit);

        String text1;
        for (HashMap<String, Object> map : boardList) {
            map.forEach((key, value) -> {
                System.out.println(key +":\""+ value+"\"");

            });
        }


        return null;
    }

}
