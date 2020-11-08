package net.xasquatch.myblog.controller;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import java.util.Iterator;
import java.util.List;

@RestController
@RequestMapping("/img")
public class ImgController {

    @PostMapping("/{memberNo}/board/{boardNo}/upload")
    public String boardImgUpload(MultipartHttpServletRequest multipartHttpServletRequest) {

        List<MultipartFile> multipartFiles = multipartHttpServletRequest.getFiles("imgPackage");
        for (MultipartFile multipartFile : multipartFiles) {
            if (multipartFile != null) {
                System.out.println("multipartFile.getSize() = " + multipartFile.getSize());
                System.out.println("multipartFile.getOriginalFilename() = " + multipartFile.getOriginalFilename());
            } else {
                System.out.println("null이다");
            }
        }

        return "hi";
    }


}
