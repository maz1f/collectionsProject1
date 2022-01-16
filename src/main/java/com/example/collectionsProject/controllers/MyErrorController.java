package com.example.collectionsProject.controllers;

import org.springframework.boot.web.servlet.error.ErrorController;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

@Controller
public class MyErrorController implements ErrorController {
    @RequestMapping("/error")
    public String handleError(HttpServletRequest request, Model model) {
        Object status = request.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
        if (status != null) {
            Integer statusCode = Integer.valueOf(status.toString());
            if (statusCode == HttpStatus.NOT_FOUND.value()) {
                model.addAttribute("message", "PAGE NOT FOUND (ERROR CODE:404)");
            }
            else if (statusCode == HttpStatus.INTERNAL_SERVER_ERROR.value()) {
                model.addAttribute("message", "INTERNAL SERVER ERROR (ERROR CODE: 500)");
            }
            else if(statusCode == HttpStatus.FORBIDDEN.value()) {
                model.addAttribute("message", "ACCESS ERROR (ERROR CODE:403)");
            }
            else {
                model.addAttribute("message", "ERROR CODE: " + statusCode);
            }
        }
        return "error";
    }
}
