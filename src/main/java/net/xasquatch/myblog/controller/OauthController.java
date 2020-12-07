package net.xasquatch.myblog.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import net.xasquatch.myblog.service.GoogleOAuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import java.util.HashMap;
import java.util.Map;

@Slf4j
@Controller
@RequestMapping(value = "/oauth", method = {RequestMethod.GET})
public class OauthController {

    @Autowired
    private GoogleOAuthService googleOAuthService;

    @GetMapping("/google/information")
    @ResponseBody
    public String googleAuthInfo() {

        return googleOAuthService.getGoogleInfo();

    }

    @GetMapping("/google")
    public String googleSignUpAndIn(Model model, @RequestParam(value = "code") String authCode) {

        String result = null;
        try {
            result = googleOAuthService.signUpAndIn(authCode);
        } catch (JsonProcessingException e) {
            log.warn("OAuth JsonProcessingException : GOOGLE [{}]", "googleSignUpAndIn");
        }
        model.addAttribute("result", result);

        return "forward:/";
    }

    @GetMapping("google/token")
    public String revokeGoogleToken(Model model, @RequestParam(value = "token") String token) {

        String result = null;
        try {
            result = googleOAuthService.revokeGoogleToken(token);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        model.addAttribute("result", result);

        return "forward:/";
    }

}
