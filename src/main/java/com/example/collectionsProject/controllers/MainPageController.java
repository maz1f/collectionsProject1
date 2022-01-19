package com.example.collectionsProject.controllers;

import com.example.collectionsProject.service.CollectionService;
import com.example.collectionsProject.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainPageController {
    @Autowired
    private CollectionService collectionService;
    @Autowired
    private TagService tagService;

    @GetMapping("/")
    public String mainPage(Model model){
        model.addAttribute("maxSizeCollection", collectionService.getMaxSizeCollction());
        model.addAttribute("tags", tagService.getAllTags());
        return "";
    }

}
