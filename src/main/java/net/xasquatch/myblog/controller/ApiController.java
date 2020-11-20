package net.xasquatch.myblog.controller;

import lombok.extern.slf4j.Slf4j;
import net.xasquatch.myblog.model.Member;
import net.xasquatch.myblog.model.Resource;
import net.xasquatch.myblog.service.ApiService;
import net.xasquatch.myblog.service.BoardService;
import net.xasquatch.myblog.service.MemberService;
import net.xasquatch.myblog.service.ResourceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.HashMap;
import java.util.Map;

@Slf4j
@RestController
@RequestMapping(value = "/api",
        method = {RequestMethod.GET, RequestMethod.POST, RequestMethod.PUT, RequestMethod.PATCH, RequestMethod.DELETE},
        produces = "text/plain;charset=UTF-8")
public class ApiController {

    @Autowired
    private ApiService apiService;

    @GetMapping(value = "/members/{memberNo}/boards")
    public String viewBoardList(@PathVariable String memberNo,
                                @RequestParam(value = "page-limit", required = false, defaultValue = "10") int pageLimit,
                                @RequestParam(value = "current-page-block", required = false, defaultValue = "1") int currentPageBlock,
                                @RequestParam(value = "keyword", required = false, defaultValue = "empty") String keyword,
                                @RequestParam(value = "title", required = false, defaultValue = "empty") String title,
                                @RequestParam(value = "contents", required = false, defaultValue = "empty") String contents,
                                @RequestParam(value = "title-and-contents", required = false, defaultValue = "empty") String titleAndContents) {

        String[] searchValue = apiService.parsingSearchValue(keyword, title, contents, titleAndContents);

        return apiService.getBoardList(memberNo, pageLimit, currentPageBlock, searchValue);

    }

    @GetMapping(value = "/members/{memberNo}/boards/{boardNo}")
    public String viewBoardDetail(@PathVariable String memberNo, @PathVariable String boardNo) {

        return apiService.getBoardDetail(memberNo, boardNo);

    }


}
