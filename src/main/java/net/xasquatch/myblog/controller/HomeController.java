package net.xasquatch.myblog.controller;

import lombok.extern.slf4j.Slf4j;
import net.xasquatch.myblog.model.Member;
import net.xasquatch.myblog.service.ImgService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.annotation.Resource;
import java.util.List;

@Slf4j
@Controller
public class HomeController {

    @Autowired
    private ImgService imgService;

    @Resource(name = "sessionMember")
    private Member sessionMember;

    protected boolean isCheckSessionAndAuth(String inputSessionNumber) {
        return (sessionMember.getNo() == Long.parseLong(inputSessionNumber) && !sessionMember.getRank().equals("temporary"));

    }

    protected boolean isCheckSession(String inputSessionNumber) {
        return sessionMember.getNo() == Long.parseLong(inputSessionNumber);

    }

    @GetMapping(value = "/")
    public String home(Model model) {
        if (sessionMember.getNo() == null) return "forward:/login";
        model.addAttribute("mainContents", "main");

        return "index";
    }

    @GetMapping(value = "/login")
    public String main(Model model){
        model.addAttribute("mainContents", "login");

        return "index";
    }


    @PostMapping("/img/{memberNo}/board/{boardNo}/upload")
    @ResponseBody
    public String boardImgUpload(MultipartHttpServletRequest request, @PathVariable String memberNo, @PathVariable String boardNo) {

        List<String> resultList = imgService.uploadImage(request, memberNo, boardNo);

        return resultList.toString();
    }


}