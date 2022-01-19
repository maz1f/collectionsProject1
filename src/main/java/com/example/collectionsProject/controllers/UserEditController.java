package com.example.collectionsProject.controllers;

import com.example.collectionsProject.domain.Role;
import com.example.collectionsProject.domain.User;
import com.example.collectionsProject.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@Controller
@RequestMapping("/user")
@PreAuthorize("hasAuthority('ADMIN')")
public class UserEditController {
    @Autowired
    private UserService userService;

    @GetMapping()
    public String getUsers(Model model) {
        model.addAttribute("users", userService.getUsers());
        return "usersList";
    }

    @PostMapping("{user}")
    public String editUser(@PathVariable User user, Model model) {
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());
        return "editUser";
    }

    @PostMapping("delete/{user}")
    public String deleteUser(@PathVariable User user, Model model) {
        userService.deleteUser(user);
        model.addAttribute("users", userService.getUsers());
        return "redirect:/user";
    }

    @PostMapping
    public String saveChanges(@RequestParam String username,
                              @RequestParam Map<String, String> form,
                              @RequestParam("userId") User user
    ) {
        userService.editUser(user, username, form);
        return "redirect:/user";
    }
}
