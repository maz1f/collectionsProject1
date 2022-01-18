package com.example.collectionsProject.controllers;

import com.example.collectionsProject.domain.Collection;
import com.example.collectionsProject.domain.Item;
import com.example.collectionsProject.domain.Tag;
import com.example.collectionsProject.domain.User;
import com.example.collectionsProject.repos.CollectionsRepo;
import com.example.collectionsProject.repos.ItemRepo;
import com.example.collectionsProject.repos.TagRepo;
import com.example.collectionsProject.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;
import java.util.Map;

@Controller
public class ItemController {
    @Autowired
    private CollectionsRepo collectionsRepo;
    @Autowired
    private ItemRepo itemRepo;
    @Autowired
    private TagRepo tagRepo;
    @Autowired
    private TagService tagService;

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
            tagService.setTags(item, item.getTag());
            itemRepo.save(item);
        }
        Iterable<Item> items = itemRepo.findAllByCollection(col);
        model.addAttribute("col", col);
        model.addAttribute("items", items);
        model.addAttribute("item", null);
        return "redirect:/collection/" + col.getId();
    }

    @PreAuthorize("hasAuthority('ADMIN') or #item.collection.owner.username == authentication.name")
    @GetMapping("/deleteItem/{item}")
    public String deleteItem(@AuthenticationPrincipal User user,
                             @PathVariable Item item,
                             Model model
    ) {
        Collection col = item.getCollection();
        itemRepo.delete(item);
        Iterable<Item> items = itemRepo.findAllByCollection(col);
        model.addAttribute("items", items);
        model.addAttribute("col", col);
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
            currentItem.setName(item.getName());
            currentItem.setTag(item.getTag());
            itemRepo.save(currentItem);
            tagService.setTags(currentItem, item.getTag());
            model.addAttribute("col", currentItem.getCollection());
            Iterable<Item> items = itemRepo.findAllByCollection(currentItem.getCollection());
            model.addAttribute("items", items);
            model.addAttribute("item", null);
            return "redirect:/collection/" + currentItem.getCollection().getId();
        }

    }
}
