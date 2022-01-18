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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.util.Map;

@Controller
public class CollectionController {
    @Autowired
    private CollectionsRepo collectionsRepo;
    @Autowired
    private ItemRepo itemRepo;



    @GetMapping("/collection/{col}")
    public String showCollection(@PathVariable Collection col, Model model) {
        Iterable<Item> items = itemRepo.findAllByCollection(col);
        model.addAttribute("col", col);
        model.addAttribute("items", items);
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
        return "redirect:/collection/" + col.getId();
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
                                 @Valid Collection collection,
                                 BindingResult bindingResult,
                                 Model model
    ) {
        if (bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errorsMap);
            model.addAttribute("collection", collection);
            return "collectionEdit";
        } else {
            col.setName(collection.getName());
            col.setDescription(collection.getDescription());
            collectionsRepo.save(col);
            model.addAttribute("collection", null);
            model.addAttribute("owner", col.getOwner());
            Iterable<Collection> collections = collectionsRepo.findAllByOwner(col.getOwner());
            model.addAttribute("collections", collections);
            return "redirect:/personalPage/" + col.getOwner().getId();
        }

    }

    @PreAuthorize("hasAuthority('ADMIN') or #col.owner.username == authentication.name")
    @GetMapping("/deleteCollection/{col}")
    public String deleteCollection(@PathVariable Collection col, Model model) {
        collectionsRepo.delete(col);
        Iterable<Collection> collections = collectionsRepo.findAllByOwner(col.getOwner());
        model.addAttribute("collections", collections);
        model.addAttribute("owner", col.getOwner());
        return "redirect:/personalPage/" + col.getOwner().getId();
    }
}
