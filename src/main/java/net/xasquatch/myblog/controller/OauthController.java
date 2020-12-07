package net.xasquatch.myblog.controller;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.PropertyNamingStrategy;
import lombok.extern.slf4j.Slf4j;
import net.xasquatch.myblog.oauth.GoogleOAuthRequest;
import net.xasquatch.myblog.oauth.GoogleOAuthResponse;
import net.xasquatch.myblog.service.GoogleOAuthService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
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
    public String googleSignUpAndIn(Model model, @RequestParam(value = "code") String authCode){

        String result = null;
        try {
            result = googleOAuthService.signUpAndIn(authCode);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }
        model.addAttribute("result", result);

        return "forward:/";
    }

    @GetMapping("google/token")
    public Map<String, String> revokeToken(@RequestParam(value = "token") String token) throws JsonProcessingException {

        Map<String, String> result = new HashMap<>();
        RestTemplate restTemplate = new RestTemplate();
        final String requestUrl = UriComponentsBuilder.fromHttpUrl("https://oauth2.googleapis.com/revoke")
                .queryParam("token", token).encode().toUriString();

        System.out.println("TOKEN ? " + token);

        String resultJson = restTemplate.postForObject(requestUrl, null, String.class);
        result.put("result", "success");
        result.put("resultJson", resultJson);

        return result;

    }



}
