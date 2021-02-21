package net.xasquatch.myblog.controller;

import lombok.extern.slf4j.Slf4j;
import net.xasquatch.myblog.model.Comment;
import net.xasquatch.myblog.service.ApiService;
import net.xasquatch.myblog.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

@Slf4j
@RestController
@CrossOrigin
@RequestMapping(value = "/api",
        method = {RequestMethod.GET, RequestMethod.POST, RequestMethod.PUT, RequestMethod.PATCH, RequestMethod.DELETE},
        produces = "text/plain;charset=UTF-8")
public class ApiController {

    @Autowired
    private ApiService apiService;

    @Autowired
    private BoardService boardService;

    @GetMapping(value = "/members/{memberNo}/boards")
    public String viewBoardList(@PathVariable String memberNo,
                                @RequestParam(value = "page-limit", required = false, defaultValue = "10") int pageLimit,
                                @RequestParam(value = "current-page-block", required = false, defaultValue = "1") int currentPageBlock,
                                @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword,
                                @RequestParam(value = "title", required = false, defaultValue = "") String title,
                                @RequestParam(value = "contents", required = false, defaultValue = "") String contents,
                                @RequestParam(value = "title-or-contents", required = false, defaultValue = "") String titleOrContents) {

        String[] searchValue = apiService.parsingSearchValue(keyword, title, contents, titleOrContents);

        return apiService.getBoardList(memberNo, pageLimit, currentPageBlock, searchValue);

    }

    @GetMapping(value = "/members/{memberNo}/boards/{boardNo}")
    public String viewBoardDetail(@PathVariable String memberNo, @PathVariable String boardNo) {
        return apiService.getBoardDetail(memberNo, boardNo);

    }

    @GetMapping(value = "/members/{memberNo}/resources/{resourceNo}")
    public String viewResourceList(@PathVariable String memberNo, @PathVariable String resourceNo) {
        return apiService.getResource(memberNo, resourceNo);
    }


    @GetMapping("/members/{memberNo}/boards/{boardNo}/comments")
    public String viewCommentList(@PathVariable long boardNo) {

        return boardService.getCommentList(boardNo);
    }
}
