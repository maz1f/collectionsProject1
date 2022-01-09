package com.example.collectionsProject.controllers;

import com.example.collectionsProject.domain.Role;
import com.example.collectionsProject.domain.User;
import com.example.collectionsProject.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;
import java.util.Set;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/user")
@PreAuthorize("hasAuthority('ADMIN')")
public class UserEditController {
    @Autowired
    private UserRepo userRepo;

    @GetMapping()
    public String getUsers(Map<String,Object> model) {
        model.put("users", userRepo.findAll());
        return "usersList";
    }

    @GetMapping("{user}")
    public String editUser(@PathVariable User user, Model model) {
        model.addAttribute("user", user);
        model.addAttribute("roles", Role.values());
        return "editUser";
    }

    @PostMapping
    public String saveChanges(@RequestParam String username,
                              @RequestParam Map<String, String> form,
                              @RequestParam("userId") User user
    ) {
        user.setUsername(username);
        Set<String> roles = Arrays.stream(Role.values())
                            .map(Role::name)
                            .collect(Collectors.toSet());
        user.getRoles().clear();
        for (String key : form.keySet()) {
            if (roles.contains(key))
                user.getRoles().add(Role.valueOf(key));
        }
        userRepo.save(user);
        return "redirect:/user";
    }
}
