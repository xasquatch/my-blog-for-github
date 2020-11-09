package net.xasquatch.myblog.controller;

import net.xasquatch.myblog.service.ImgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.nio.file.Paths;
import java.util.List;

@RestController
@RequestMapping("/img")
public class ImgController {

    @Autowired
    private ImgService imgService;

    @PostMapping("/{memberNo}/board/{boardNo}/upload")
    public String boardImgUpload(MultipartHttpServletRequest request, @PathVariable String memberNo, @PathVariable String boardNo) {

        List<String> resultList = imgService.uploadImage(request, memberNo, boardNo);

        return resultList.toString();
    }

}
