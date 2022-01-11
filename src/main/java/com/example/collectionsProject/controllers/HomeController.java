package com.example.collectionsProject.controllers;

import com.example.collectionsProject.domain.Collection;
import com.example.collectionsProject.domain.User;
import com.example.collectionsProject.repos.CollectionsRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class HomeController {
    @Autowired
    private CollectionsRepo collectionsRepo;

    @GetMapping("/")
    public String mainPage(){
        return "";
    }

    @GetMapping("/helloPage")
    public String homePage(@RequestParam(name="name", required=false, defaultValue="unknown") String name, Model model) {
        model.addAttribute("user", name);
        return "helloPage";
    }

    @PostMapping("/helloPage")
    public String getName(@RequestParam String name, Model model) {
        model.addAttribute("user", name);
        return "helloPage";
    }

    @PostMapping("/test")
    public String delete(@RequestParam("idChecked") List<String> idrates){

        if(idrates != null){
            if (idrates.contains("1"))
                return "redirect:test?message=It's right choose";
            else return "redirect:test?message=Choose Artem Volov";
        }
        return "redirect:test";

    }

    @GetMapping("/test")
    public String test(@RequestParam(name = "message", required = false, defaultValue = "") String message, Model model ) {
        model.addAttribute("message", message);
        return "test";
    }

    @GetMapping("/allCollections")
    public String personPage(Model model){
        Iterable<Collection> collections = collectionsRepo.findAll();
        model.addAttribute("collections", collections);
        return "allCollections";
    }


}
