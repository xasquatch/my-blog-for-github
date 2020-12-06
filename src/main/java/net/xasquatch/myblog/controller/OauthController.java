package net.xasquatch.myblog.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;

@Slf4j
@RestController
@RequestMapping(value = "/oauth", method = {RequestMethod.GET})
public class OauthController {

    @GetMapping("/google")
    public String google() {

        HashMap<String, String> resultMap = new HashMap<>();
        String id = "139558070865-38osb71a702j0m2tas5bv13kv8l1pbpd.apps.googleusercontent.com";
        resultMap.put("id", id);


        ObjectWriter objectWriter = new ObjectMapper().writerWithDefaultPrettyPrinter();
        String result = null;

        try {
            result = objectWriter.writeValueAsString(resultMap);
        } catch (JsonProcessingException e) {
            log.warn("oAuth Error: google");
        }

        return result;

    }


}
