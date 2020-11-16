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

    @GetMapping(value = "/members/{memberNo}/board/list",params = {"pageLimit","currentPageBlock"})
    public String viewBoardList(int pageLimit, int currentPageBlock, @PathVariable String memberNo) {

        return boardService.getBoardList(memberNo, pageLimit, currentPageBlock);
    }
    @PatchMapping(value = "/members/{memberNo}")
    public String modifyMember(@PathVariable String memberNo, @Valid Member member, BindingResult bindingResult) {
        member.setCollectionAndUse(true);
        member.setMembersAgreement(true);
        if (!bindingResult.hasErrors()){

            return memberService.updateMember(member);
        }

        return "false";
    }
}
