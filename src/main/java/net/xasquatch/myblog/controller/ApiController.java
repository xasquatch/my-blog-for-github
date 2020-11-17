package net.xasquatch.myblog.controller;

import lombok.extern.slf4j.Slf4j;
import net.xasquatch.myblog.model.Member;
import net.xasquatch.myblog.service.BoardService;
import net.xasquatch.myblog.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.validation.Valid;
import java.util.HashMap;
import java.util.Map;

@Slf4j
@RestController
@RequestMapping(value = "/my-blog", method = {RequestMethod.GET, RequestMethod.POST})
public class ApiController {

    @Autowired
    private BoardService boardService;

    @Autowired
    private MemberService memberService;

    @Resource(name = "sessionMember")
    private Member sessionMember;

    @GetMapping(value = "/members/{memberNo}/board/list")
    public String viewBoardList(@PathVariable String memberNo, int pageLimit, int currentPageBlock,
                                @RequestParam(value = "keyword", required = false, defaultValue = "empty") String keyword,
                                @RequestParam(value = "title", required = false, defaultValue = "empty") String title,
                                @RequestParam(value = "contents", required = false, defaultValue = "empty") String contents,
                                @RequestParam(value = "titleAndContents", required = false, defaultValue = "empty") String titleAndContents) {
        Map<String,String> searchValueMap = new HashMap<String, String>();
        searchValueMap.put("keyword",keyword);
        searchValueMap.put("title",title);
        searchValueMap.put("contents",contents);
        searchValueMap.put("titleAndContents",titleAndContents);

        String[] searchValue = boardService.parsingSearchValue(searchValueMap);

        return boardService.getBoardList(memberNo, pageLimit, currentPageBlock,searchValue);
    }

    @PatchMapping(value = "/members/{memberNo}")
    public String modifyMember(@PathVariable String memberNo, @Valid Member member, BindingResult bindingResult) {
        member.setCollectionAndUse(true);
        member.setMembersAgreement(true);
        if (!bindingResult.hasErrors()) {

            return memberService.updateMember(member);
        }

        return "false";
    }
}
