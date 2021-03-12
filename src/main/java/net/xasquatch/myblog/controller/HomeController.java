package net.xasquatch.myblog.controller;

import lombok.extern.slf4j.Slf4j;
import net.xasquatch.myblog.interceptor.parts.AccessorInfo;
import net.xasquatch.myblog.model.Member;
import net.xasquatch.myblog.service.BoardService;
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
import java.util.List;
import java.util.Map;

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

    @Autowired
    private BoardService boardService;


    protected boolean isCheckManager(String memberNo) {
        boolean managerResult = false;
        boolean sessionResult = false;
        try {
            managerResult = sessionMember.getRank().equals("manager");
            sessionResult = String.valueOf(sessionMember.getNo()).equals(memberNo);
        }catch (Exception e){
            log.debug(e.getMessage());
        }


        return managerResult && sessionResult;
    }

    protected boolean isCheckSessionAndAuth(String inputSessionNumber) {
        boolean guestResult = false;
        boolean sessionResult = false;

        try {
            guestResult = sessionMember.getName().equals("GUEST");
            sessionResult = sessionMember.getNo() == Long.parseLong(inputSessionNumber)
                    && !sessionMember.getRank().equals("temporary");

        } catch (Exception e) {
            log.debug(e.getMessage());

        }

        return guestResult || sessionResult;
    }

    protected boolean isCheckSession(String inputSessionNumber) {
        boolean sessionResult = false;
        try {
            sessionResult = sessionMember.getNo() == Long.parseLong(inputSessionNumber);

        } catch (Exception e) {
            log.debug(e.getMessage());

        }

        return sessionResult;
    }

    @GetMapping("/")
    public String home(Model model) {
        Map<String, Object> noticeMap =
                boardService.getNoticeList("manager", 5, 1, new String[]{"keyword", "my-blog-notice"});
        List<Map<String, Object>> noticeList = (List<Map<String, Object>>) noticeMap.get("boardList");
        model.addAttribute("noticeList", noticeList);
        model.addAttribute("mainContents", "home");

        return "index";
    }

    @GetMapping("/members")
    public String signInAndUp(Model model) {
        if (sessionMember.getNo() != null && !isCheckSession(String.valueOf(sessionMember.getNo())))
            return "redirect:/members/" + sessionMember.getNo();
        model.addAttribute("mainContents", "members");

        return "index";
    }

    @GetMapping("/members/{sessionNo}")
    public String members(Model model, @PathVariable String sessionNo) {
        if (!isCheckSession(sessionNo)) return "redirect:/members";
        model.addAttribute("mainContents", "main");

        return "index";
    }

    @PostMapping("/feedback/{memberNo}")
    @ResponseBody
    public String sendFeedback(HttpServletRequest request, @PathVariable String memberNo) {
        if (!isCheckSession(memberNo)) return "Failed Check Session";

        String ipAddress = accessorInfo.getIpAddress(request);
        String feedbackTitle = request.getParameter("feedbackTitle");
        String feedbackContents = request.getParameter("feedbackContents");

        try {

            mailService.sendFeedBack(sessionMember, feedbackTitle, feedbackContents, ipAddress);
        } catch (Exception e) {
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