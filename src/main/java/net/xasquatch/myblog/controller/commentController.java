package net.xasquatch.myblog.controller;

import net.xasquatch.myblog.interceptor.parts.AccessorInfo;
import net.xasquatch.myblog.model.Comment;
import net.xasquatch.myblog.model.Member;
import net.xasquatch.myblog.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@RestController
@RequestMapping(value = "/comments", produces = "text/plain;charset=UTF-8")
public class commentController {

    @Autowired
    private AccessorInfo accessorInfo;

    @Lazy
    @Autowired
    private HomeController checkSessionController;

    @Autowired
    private CommentService commentService;

    @Resource(name = "sessionMember")
    private Member sessionMember;

    @GetMapping("/")
    public String viewCommentList(@RequestParam long boardNo) {
        return commentService.getCommentList(boardNo);
    }

    @PostMapping("/")
    public String createComment(HttpServletRequest request, @Valid Comment comment,
                                @RequestParam long boardNo, BindingResult bindingResult) {
        String result = "false";
        if (bindingResult.hasErrors()) return result;

        if (checkSessionController.isCheckSession(String.valueOf(sessionMember.getNo()))) {
            comment.setMbr_no(sessionMember.getNo());
            comment.setBoard_no(boardNo);
            comment.setCreated_ip(accessorInfo.getIpAddress(request));
            result = String.valueOf(commentService.createComment(comment));

        }

        return result;
    }

    @DeleteMapping("/{commentNo}")
    public String deleteComment(@RequestParam String memberNo,
                                @PathVariable String commentNo,
                                @RequestParam String pwd) {
        String result = "false";

        if (checkSessionController.isCheckSession(memberNo))
            result = commentService.deleteComment(commentNo, pwd);

        return result;

    }


}