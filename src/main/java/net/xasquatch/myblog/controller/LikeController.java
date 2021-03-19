package net.xasquatch.myblog.controller;

import net.xasquatch.myblog.model.Member;
import net.xasquatch.myblog.service.LikeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;

@RestController
public class LikeController {

    @Autowired
    private LikeService likeService;

    @Resource(name = "sessionMember")
    private Member sessionMember;

    @PostMapping("/like")
    public String increaseLike(@RequestParam(required = false) String method,
                               @RequestParam(required = false) String likeTarget,
                               @RequestParam(required = false) String targetNo) {
        String result = "false";
        if (method == null) return result;
        if (method.toUpperCase().equals("UP")) {
            result = likeService.increaseLike(likeTarget, targetNo, sessionMember.getNo());

        } else if (method.toUpperCase().equals("DOWN")) {
            result = likeService.increaseLike(likeTarget, targetNo, sessionMember.getNo());

        }

        return result;
    }


}
