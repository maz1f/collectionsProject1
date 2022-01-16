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

@Controller
public class ItemController {
    @Autowired
    private CollectionsRepo collectionsRepo;
    @Autowired
    private ItemRepo itemRepo;

    @PreAuthorize("hasAuthority('ADMIN') or #item.collection.owner.username == authentication.name")
    @GetMapping("/deleteItem/{item}")
    public String deleteItem(@AuthenticationPrincipal User user, @PathVariable Item item, Model model) {
        Collection col = item.getCollection();
        itemRepo.delete(item);
        Iterable<Item> items = itemRepo.findAllByCollection(col);
        model.addAttribute("items", items);
        model.addAttribute("col", col);
        model.addAttribute("item", null);
        return "redirect:/collection/" + item.getCollection().getId();
    }
}
