package com.example.collectionsProject.controllers;

import com.example.collectionsProject.domain.Collection;
import com.example.collectionsProject.domain.Role;
import com.example.collectionsProject.domain.User;
import com.example.collectionsProject.repos.CollectionsRepo;
import com.example.collectionsProject.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
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
    public String registrate(User user, Model model) {
        User userFromDb = userRepo.findByUsername(user.getUsername());
        if (userFromDb != null) {
            return "redirect:registration?message=This username is already exist";
        }
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.setRoles(Collections.singleton(Role.USER));
        user.setActive(true);
        userRepo.save(user);
        Iterable<User> users = userRepo.findAll();
        model.addAttribute("users", users);
        return "redirect:login";
    }

    @GetMapping("/personalPage/{user}")
    public String personPage(@PathVariable User user,
                             @AuthenticationPrincipal User currentUser,
                             Model model
    ){
        Iterable<Collection> collections = collectionsRepo.findAllByOwner(user);
        model.addAttribute("collections", collections);
        model.addAttribute("owner", user);
        return "personalPage";
    }

    @PreAuthorize("hasAuthority('ADMIN') or #user.username == authentication.name")
    @PostMapping("/personalPage/{user}")
    public String putCollection(@PathVariable User user,
                                @AuthenticationPrincipal User currentUser,
                                @Valid Collection collection,
                                BindingResult bindingResult,
                                Model model
    ){
        collection.setOwner(user);
        if (bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errorsMap);
            model.addAttribute("collection", collection);
        } else {
            collectionsRepo.save(collection);
        }
        Iterable<Collection> collections = collectionsRepo.findAllByOwner(user);
        model.addAttribute("collections", collections);
        model.addAttribute("owner", user);
        model.addAttribute("collection", null);
        return("personalPage");
    }
}
