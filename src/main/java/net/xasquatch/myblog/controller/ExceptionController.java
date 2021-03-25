package net.xasquatch.myblog.controller;


import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.NoHandlerFoundException;

@Slf4j
@ControllerAdvice(annotations = Controller.class)
public class ExceptionController {

    @ExceptionHandler(value = {Exception.class, NoHandlerFoundException.class})
    public String requestHandlingNoHandlerFound(Model model, Exception e) {
        log.debug("Exception: {}", e.getMessage());

        return "error";
    }

}
