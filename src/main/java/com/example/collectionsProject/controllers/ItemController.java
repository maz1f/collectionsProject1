package com.example.collectionsProject.controllers;

import com.example.collectionsProject.Utils.ControllerUtils;
import com.example.collectionsProject.models.Collection;
import com.example.collectionsProject.models.Item;
import com.example.collectionsProject.models.Tag;
import com.example.collectionsProject.models.User;
import com.example.collectionsProject.services.ItemService;
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
public class ItemController {
    @Autowired
    private ItemService itemService;

    @PreAuthorize("hasAuthority('ADMIN') or #col.owner.username == authentication.name")
    @PostMapping("/addItem/{col}")
    public String add(@AuthenticationPrincipal User user,
                      @PathVariable Collection col,
                      @Valid Item item,
                      BindingResult bindingResult,
                      Model model
    ) {

        item.setCollection(col);
        if (bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errorsMap);
            model.addAttribute("item", item);
        } else {
            itemService.setTags(item, item.getTag());
        }
        model.addAttribute("col", col);
        model.addAttribute("items", itemService.getItems(col));
        model.addAttribute("item", null);
        return "redirect:/collection/" + col.getId();
    }

    @PreAuthorize("hasAuthority('ADMIN') or #item.collection.owner.username == authentication.name")
    @GetMapping("/deleteItem/{item}")
    public String deleteItem(@AuthenticationPrincipal User user,
                             @PathVariable Item item,
                             Model model
    ) {
        itemService.deleteItem(item);
        model.addAttribute("items", itemService.getItems(item.getCollection()));
        model.addAttribute("col", item.getCollection());
        model.addAttribute("item", null);
        return "redirect:/collection/" + item.getCollection().getId();
    }

    @PreAuthorize("hasAuthority('ADMIN') or #item.collection.owner.username == authentication.name")
    @GetMapping("/editItem/{item}")
    public String showItemEditor(@PathVariable Item item, Model model) {
        model.addAttribute("currentItem", item);
        return "itemEditor";
    }

    @PreAuthorize("hasAuthority('ADMIN') or #currentItem.collection.owner.username == authentication.name")
    @PostMapping("/editItem/{currentItem}")
    public String editCollection(@PathVariable Item currentItem,
                                 @Valid Item item,
                                 BindingResult bindingResult,
                                 Model model
    ) {
        if (bindingResult.hasErrors()) {
            Map<String, String> errorsMap = ControllerUtils.getErrors(bindingResult);
            model.mergeAttributes(errorsMap);
            model.addAttribute("item", item);
            return "itemEditor";
        } else {
            itemService.editItem(currentItem, item);
            model.addAttribute("col", currentItem.getCollection());
            model.addAttribute("items", itemService.getItems(currentItem.getCollection()));
            model.addAttribute("item", null);
            return "redirect:/collection/" + currentItem.getCollection().getId();
        }

    }

    @PostMapping("/filter/{col}")
    public String filter(@PathVariable Collection col, @RequestParam String tag, Model model) {
        Iterable<Item> items;
        if (tag != null && !tag.isEmpty()) {
            items = itemService.getItemsByTag(new Tag(tag)); // не работает!!!!
        }
        else
            items = itemService.getItems(col);
        model.addAttribute("col", col);
        model.addAttribute("items", items);
        return "redirect:/collection/" + col.getId();
    }

    @GetMapping("/showByTag/{tag}")
    public String showByTag(@PathVariable Tag tag, Model model) {
        model.addAttribute("items", itemService.getItemsByTag(tag));
        return "showByTag";
    }

    @GetMapping("/likeItem/{item}")
    public String likeItem(@PathVariable Item item,
                           @AuthenticationPrincipal User currentUser,
                           Model model) {
        itemService.like(item, currentUser);
        model.addAttribute("col", item.getCollection());
        model.addAttribute("items", item.getCollection().getItems());
        return "redirect:/collection/" + item.getCollection().getId();
    }

}
