package net.xasquatch.myblog.controller;

import lombok.extern.slf4j.Slf4j;
import net.xasquatch.myblog.interceptor.parts.AccessorInfo;
import net.xasquatch.myblog.model.Member;
import net.xasquatch.myblog.service.ImgService;
import net.xasquatch.myblog.service.MailService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;
import java.util.Enumeration;
import java.util.List;

@Slf4j
@Controller
@RequestMapping(produces = "application/json; charset=utf8")
public class HomeController {

    @Autowired
    private ImgService imgService;

    @Autowired
    private AccessorInfo accessorInfo;

    @Autowired
    private MailService mailService;

    @Resource(name = "sessionMember")
    private Member sessionMember;

    protected boolean isCheckSessionAndAuth(String inputSessionNumber) {
        return sessionMember.getName().equals("GUEST") || (sessionMember.getNo() == Long.parseLong(inputSessionNumber)
                && !sessionMember.getRank().equals("temporary")
        );

    }

    protected boolean isCheckSession(String inputSessionNumber) {
        return sessionMember.getNo() == Long.parseLong(inputSessionNumber);

    }

    @GetMapping(value = "/")
    public String home(Model model) {
        if (sessionMember.getNo() == null || sessionMember.getEmail().equals("")) return "redirect:/login";
        model.addAttribute("mainContents", "main");

        return "index";
    }

    @GetMapping(value = "/login")
    public String main(Model model) {
        model.addAttribute("mainContents", "login");

        return "index";
    }

    @PostMapping(value = "/feedback/{memberNo}")
    @ResponseBody
    public String sendFeedback(HttpServletRequest request, @PathVariable String memberNo) {
        if (!isCheckSession(memberNo)) return "Failed Check Session";

        String ipAddress = accessorInfo.getIpAddress(request);
        String feedbackTitle = request.getParameter("feedbackTitle");
        String feedbackContents = request.getParameter("feedbackContents");

        try {

        mailService.sendFeedBack(sessionMember, feedbackTitle, feedbackContents, ipAddress);
        }catch (Exception e){
            return "Failed feedback";
        }

        return "success feedback";
    }


    @PostMapping("/img/{memberNo}/board/{boardNo}/upload")
    @ResponseBody
    public String boardImgUpload(MultipartHttpServletRequest request, @PathVariable String memberNo, @PathVariable String boardNo) {
        try {
            request.setCharacterEncoding("UTF-8");
        } catch (UnsupportedEncodingException e) {
            log.warn("acquired ImgUpload Exception");
        }
        List<String> resultList = imgService.uploadImage(request, memberNo, boardNo);

        return resultList.toString();
    }

}