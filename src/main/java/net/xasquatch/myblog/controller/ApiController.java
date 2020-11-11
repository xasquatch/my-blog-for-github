package net.xasquatch.myblog.controller;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/api",method = {RequestMethod.GET,RequestMethod.POST})
public class ApiController {

    @RequestMapping(value = "/{memberNo}/board/list/read",method = {RequestMethod.GET,RequestMethod.POST})
    public String viewBoardList(@PathVariable String memberNo){

        return null;
    }

}
