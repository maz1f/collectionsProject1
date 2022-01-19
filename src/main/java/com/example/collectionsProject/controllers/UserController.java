package com.example.collectionsProject.controllers;

import com.example.collectionsProject.Utils.ControllerUtils;
import com.example.collectionsProject.models.Collection;
import com.example.collectionsProject.models.User;
import com.example.collectionsProject.services.CollectionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;
import java.util.Map;

@Controller
public class UserController {
    @Autowired
    private CollectionService collectionService;

    @GetMapping("/personalPage/{user}")
    public String personPage(@PathVariable User user, Model model) {
        model.addAttribute("collections", collectionService.getCollections(user));
        model.addAttribute("owner", user);
        return "personalPage";
    }

    @PreAuthorize("hasAuthority('ADMIN') or #user.username == authentication.name")
    @PostMapping("/personalPage/{user}")
    public String putCollection(@PathVariable User user,
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
            collectionService.saveCollection(collection);
        }
        model.addAttribute("collections", collectionService.getCollections(user));
        model.addAttribute("owner", user);
        model.addAttribute("collection", null);
        return("personalPage");
    }
}
