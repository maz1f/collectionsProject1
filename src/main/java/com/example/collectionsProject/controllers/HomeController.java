package com.example.collectionsProject.controllers;

import com.example.collectionsProject.domain.Collection;
import com.example.collectionsProject.domain.Item;
import com.example.collectionsProject.domain.Tag;
import com.example.collectionsProject.repos.CollectionsRepo;
import com.example.collectionsProject.repos.ItemRepo;
import com.example.collectionsProject.repos.TagRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
public class HomeController {
    @Autowired
    private CollectionsRepo collectionsRepo;
    @Autowired
    private TagRepo tagRepo;
    @Autowired
    private ItemRepo itemRepo;

    @GetMapping("/")
    public String mainPage(Model model){
        Iterable<Collection> collections = collectionsRepo.findAll();
        Collection maxSize = collections.iterator().next();
        for (Collection col : collections) {
            if (col.getItems().size() > maxSize.getItems().size())
                maxSize = col;
        }
        model.addAttribute("maxSizeCollection", maxSize);
        Iterable<Tag> tags = tagRepo.findAll();
        model.addAttribute("tags", tags);
        Iterable<Item> items = itemRepo.findAll();
        model.addAttribute("items", items);
        return "";
    }
    @GetMapping("/showByTag/{tag}")
    public String showByTag(@PathVariable Tag tag, Model model) {
        Iterable<Item> items = itemRepo.findAllByTagSetContains(tag);
        model.addAttribute("items", items);
        return "showByTag";
    }

    @GetMapping("/allCollections")
    public String personPage(Model model){
        Iterable<Collection> collections = collectionsRepo.findAll();
        model.addAttribute("collections", collections);
        return "allCollections";
    }


}
