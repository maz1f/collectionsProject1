package com.example.collectionsProject.controllers;

import com.example.collectionsProject.domain.Collection;
import com.example.collectionsProject.domain.Item;
import com.example.collectionsProject.domain.User;
import com.example.collectionsProject.repos.CollectionsRepo;
import com.example.collectionsProject.repos.ItemRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
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

    @GetMapping("/addItem/{colName}")
    public String showItemPage(@PathVariable String colName, Map<String, Object> model){
        return "addItem";
    }

    @PostMapping("/addItem/{colName}")
    public String add(@PathVariable String colName, @RequestParam String name, @RequestParam String tag, Map<String, Object> model ) {

        Collection col = collectionsRepo.findCollectionByName(colName);
        Item item = new Item(name, tag, col);
        col.setSize(col.getSize() + 1);
        itemRepo.save(item);
        return "addItem";
    }

    @GetMapping("/showItems/{name}/{col}")
    public String showItems(@PathVariable String col, @PathVariable String name, Map<String, Object> model) {
        Collection currentCollection = collectionsRepo.findCollectionByName(col);
        Iterable<Item> items = itemRepo.findAllByCollection(currentCollection);
        model.put("items", items);
        return "showItem";
    }
}
