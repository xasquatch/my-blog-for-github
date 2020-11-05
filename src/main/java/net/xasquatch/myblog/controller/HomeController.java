package net.xasquatch.myblog.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Slf4j
@Controller
public class HomeController {

    @RequestMapping(value = "/", method = {RequestMethod.GET, RequestMethod.POST})
    public String home(Model model) {
        log.debug("Controller {}: {}","Home","start");
        model.addAttribute("mainContents", "home");

        return "index";
    }

    @RequestMapping(value = "/main", method = {RequestMethod.GET, RequestMethod.POST})
    public String main(Model model) {
        log.debug("Controller {}: {}","Home","start");
        model.addAttribute("mainContents", "home");

        return "index";
    }

}