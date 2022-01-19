package com.example.collectionsProject.controllers;

import com.example.collectionsProject.Utils.ControllerUtils;
import com.example.collectionsProject.domain.User;
import com.example.collectionsProject.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;
import java.util.Map;

@Controller
public class AuthorizationController {
    @Autowired
    private UserService userService;

    @GetMapping("/registration")
    public String registrPage(Model model ) {
        return "registration";
    }

    @PostMapping("/registration")
    public String registrate(@Valid User user,
                             BindingResult bindingResult,
                             Model model
    ) {
        User userFromDb = userService.getUserFromDb(user);
        if (bindingResult.hasErrors()) {
            Map<String, String> errors = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errors);
            return "registration";
        }
        if (userFromDb != null) {
            model.addAttribute("usernameError", "User exist");
            return "registration";
        }
        userService.saveUser(user);
        model.addAttribute("users", userService.getUsers());
        return "redirect:login";
    }
}
