package net.xasquatch.myblog.controller;

import net.xasquatch.myblog.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartHttpServletRequest;

@RestController
@RequestMapping("/img")
public class ImgController {

    @Autowired
    private BoardService boardService;

    @PostMapping("/{memberNo}/board/{boardNo}/upload")
    public String boardImgUpload(MultipartHttpServletRequest request, @PathVariable String memberNo, @PathVariable String boardNo) {

        boolean result = boardService.uploadImage(request, memberNo, boardNo);

        return String.valueOf(result);
    }


}
