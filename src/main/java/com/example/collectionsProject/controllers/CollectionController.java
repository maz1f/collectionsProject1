package com.example.collectionsProject.controllers;

import com.example.collectionsProject.Utils.ControllerUtils;
import com.example.collectionsProject.domain.Collection;
import com.example.collectionsProject.service.CollectionService;
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
public class CollectionController {
    @Autowired
    private CollectionService collectionService;

    @GetMapping("/collection/{col}")
    public String showCollection(@PathVariable Collection col, Model model) {
        model.addAttribute("col", col);
        model.addAttribute("items", collectionService.getItems(col));
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
            collectionService.editCollection(col, collection);
            model.addAttribute("collection", null);
            model.addAttribute("owner", col.getOwner());
            model.addAttribute("collections", collectionService.getCollections(col.getOwner()));
            return "redirect:/personalPage/" + col.getOwner().getId();
        }

    }

    @PreAuthorize("hasAuthority('ADMIN') or #col.owner.username == authentication.name")
    @GetMapping("/deleteCollection/{col}")
    public String deleteCollection(@PathVariable Collection col, Model model) {
        collectionService.deleteCollection(col);
        model.addAttribute("collections", collectionService.getCollections(col.getOwner()));
        model.addAttribute("owner", col.getOwner());
        return "redirect:/personalPage/" + col.getOwner().getId();
    }

    @GetMapping("/allCollections")
    public String showAllCollection(Model model){
        model.addAttribute("collections", collectionService.getAllColection());
        return "allCollections";
    }
}
