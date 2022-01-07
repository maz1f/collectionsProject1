package com.example.collectionsProject.controllers;

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

    @GetMapping("/")
    public String mainPage(){
        return "";
    }

    @GetMapping("/helloPage")
    public String homePage(@RequestParam(name="name", required=false, defaultValue="unknown") String name, Map<String, Object> model) {
        model.put("user", name);
        return "helloPage";
    }

    @PostMapping("/helloPage")
    public String getName(@RequestParam String name, Map<String,Object> model) {
        model.put("user", name);
        return "helloPage";
    }

    @PostMapping("/test")
    public String delete(@RequestParam("idChecked") List<String> idrates){

        if(idrates != null){
            if (idrates.contains("1"))
                    return "redirect:volov";
            else return "redirect:test?message=Choose Artem Volov";
        }
        return "redirect:test";

    }

    @GetMapping("/test")
    public String test(@RequestParam(name = "message", required = false, defaultValue = "") String message, Model model ) {
        model.addAttribute("message", message);
        return "test";
    }

    @GetMapping("/volov")
    public  String vlv() {
        return "volov";
    }
}
