package net.xasquatch.myblog.controller;

import lombok.extern.slf4j.Slf4j;
import net.xasquatch.myblog.interceptor.parts.AccessorInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

@Slf4j
@CrossOrigin
@RestController
public class ConnectionController {

    @Autowired
    private AccessorInfo accessorInfo;

    @GetMapping("/connection")
    public String isConnect(HttpServletRequest request){

        log.warn("isConnected: {}",accessorInfo.getIpAddress(request));

        return "true";
    }
}
