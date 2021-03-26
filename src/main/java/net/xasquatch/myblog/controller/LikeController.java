package net.xasquatch.myblog.controller;

import net.xasquatch.myblog.model.Member;
import net.xasquatch.myblog.service.LikeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@RestController
public class LikeController {

    @Autowired
    private LikeService likeService;

    @Resource(name = "sessionMember")
    private Member sessionMember;

    @Lazy
    @Autowired
    private HomeController checkSessionController;

    public String manipulationLike(String target, String method, String targetNo) {


        String result = "false";
        Long memberNo = sessionMember.getNo();

        if (!checkSessionController.isCheckSessionWithOutGuest() || method == null)
            return result;

        switch (method.toUpperCase()) {
            case "UP":
                result = likeService.increaseLike(target, targetNo, memberNo);
                break;

            case "DOWN":
                result = likeService.decreaseLike(target, targetNo, memberNo);
                break;

            default:
                result = "false";
        }
        return result;

    }

    @PostMapping("/boards/{targetNo}/like/{method}")
    public String manipulationBoardLike(@PathVariable String method,
                                        @PathVariable String targetNo) {
        return manipulationLike("boards", method, targetNo);
    }


    @GetMapping("/boards/{targetNo}/like")
    public String raedBoardLike(@PathVariable String targetNo) {
        return likeService.readLikeCount("boards", targetNo);

    }

    @PostMapping("/comments/{targetNo}/like/{method}")
    public String manipulationCommentLike(@PathVariable String method,
                                          @PathVariable String targetNo) {
        return manipulationLike("comments", method, targetNo);
    }

    @GetMapping("/comments/{targetNo}/like")
    public String raedCommentLike(@PathVariable String targetNo) {
        return likeService.readLikeCount("comments", targetNo);

    }
}
