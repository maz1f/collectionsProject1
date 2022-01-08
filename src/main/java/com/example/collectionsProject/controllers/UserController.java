package com.example.collectionsProject.controllers;

import com.example.collectionsProject.domain.Collection;
import com.example.collectionsProject.domain.Role;
import com.example.collectionsProject.domain.User;
import com.example.collectionsProject.repos.CollectionsRepo;
import com.example.collectionsProject.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Collections;
import java.util.Map;

@Controller
public class UserController {
    @Autowired
    private UserRepo userRepo;
    @Autowired
    private CollectionsRepo collectionsRepo;
    @Autowired
    private PasswordEncoder passwordEncoder;

    @GetMapping("/registration")
    public String registrPage(@RequestParam(name = "message", required = false, defaultValue = "") String message, Model model ) {

        model.addAttribute("message", message);
        return "registration";
    }

    @PostMapping("/registration")
    public String registrate(User user, Map<String, Object> model) {
        User userFromDb = userRepo.findByUsername(user.getUsername());
        if (userFromDb != null) {
            return "redirect:registration?message=This username is already exist";
        }
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setRoles(Collections.singleton(Role.USER));
        user.setActive(true);
        userRepo.save(user);
        Iterable<User> users = userRepo.findAll();
        model.put("users", users);
        return "redirect:login";
    }

    @GetMapping("/personalPage")
    public String personPage(Map<String, Object> model){
        Iterable<Collection> collections = collectionsRepo.findAll();
        model.put("collections", collections);
        return "personalPage";
    }

    @PostMapping("/personalPage")
    public String putCollection(@AuthenticationPrincipal User user, @RequestParam String name, @RequestParam String description, Map<String, Object> model){
        Collection col = new Collection(name, description, user);
        collectionsRepo.save(col);
        Iterable<Collection> collections = collectionsRepo.findAll();
        model.put("collections", collections);
        return("personalPage");
    }
}
