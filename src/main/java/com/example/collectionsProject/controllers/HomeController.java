package com.example.collectionsProject.controllers;

import com.example.collectionsProject.domain.Collection;
import com.example.collectionsProject.repos.CollectionsRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class HomeController {
    @Autowired
    private CollectionsRepo collectionsRepo;

    @GetMapping("/")
    public String mainPage(Model model){
        Iterable<Collection> collections = collectionsRepo.findAll();
        Collection maxSize = collections.iterator().next();
        for (Collection col : collections) {
            if (col.getItems().size() > maxSize.getItems().size())
                maxSize = col;
        }
        model.addAttribute("maxSizeCollection", maxSize);
        return "";
    }

    @GetMapping("/allCollections")
    public String personPage(Model model){
        Iterable<Collection> collections = collectionsRepo.findAll();
        model.addAttribute("collections", collections);
        return "allCollections";
    }


}
