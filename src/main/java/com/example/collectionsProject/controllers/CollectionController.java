package com.example.collectionsProject.controllers;

import com.example.collectionsProject.domain.Collection;
import com.example.collectionsProject.domain.Item;
import com.example.collectionsProject.domain.User;
import com.example.collectionsProject.repos.CollectionsRepo;
import com.example.collectionsProject.repos.ItemRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.Map;

@Controller
public class CollectionController {
    @Autowired
    private CollectionsRepo collectionsRepo;
    @Autowired
    private ItemRepo itemRepo;

    @PreAuthorize("hasAuthority('ADMIN') or #col.owner.username == authentication.name")
    @GetMapping("/addItem/{col}")
    public String showItemPage(@PathVariable Collection col){
        return "addItem";
    }

    @PreAuthorize("hasAuthority('ADMIN') or #col.owner.username == authentication.name")
    @PostMapping("/addItem/{col}")
    public String add(@AuthenticationPrincipal User user,
                      @PathVariable Collection col,
                      @RequestParam String name,
                      @RequestParam String tag,
                      Model model
    ) {

        Item item = new Item(name, tag, col);
        itemRepo.save(item);
        return "addItem";
    }

    @GetMapping("/collection/{col}")
    public String showCollection(@PathVariable Collection col, Model model) {
        Iterable<Item> items = itemRepo.findAllByCollection(col);
        model.addAttribute("col", col);
        model.addAttribute("items", items);
        System.out.println(col.getItems().size());
        return "collection";
    }

    @PostMapping("/filter/{col}")
    public String filter(@PathVariable Collection col, @RequestParam String tag, Model model) {
        Iterable<Item> items;
        if (tag != null && !tag.isEmpty()) {
            items = itemRepo.findByTag(tag);
        }
        else
            items = itemRepo.findAllByCollection(col);
        model.addAttribute("col", col);
        model.addAttribute("items", items);
        return "collection";
    }

    @PreAuthorize("hasAuthority('ADMIN') or #col.owner.username == authentication.name")
    @GetMapping("/collectionEdit/{col}")
    public String showCollectionEditor(@PathVariable Collection col, Model model) {
        model.addAttribute("col", col);
        return "collectionEdit";
    }

    @PreAuthorize("hasAuthority('ADMIN') or #col.owner.username == authentication.name")
    @PostMapping("/collectionEdit/{col}")
    public String editCollection(@PathVariable Collection col,
                                 @RequestParam String name,
                                 @RequestParam String description
    ) {
        col.setName(name);
        col.setDescription(description);
        collectionsRepo.save(col);
        return "collectionEdit";

    }

}
