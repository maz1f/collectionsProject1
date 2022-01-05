package com.example.collectionsProject.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;
import java.util.Map;

@Controller
public class HomeController {

    @GetMapping("/")
    public String mainPage(){
        return "/";
    }

    @GetMapping("/helloPage")
    public String homePage(@RequestParam(name="name", required=false, defaultValue="World") String name, Map<String, Object> model) {
        model.put("user", name);
        return "/helloPage";
    }

    @PostMapping("/helloPage")
    public String getName(@RequestParam String name, Map<String,Object> model) {
        model.put("user", name);
        return "/helloPage";
    }

    @PostMapping("/test")
    public String delete(@RequestParam("idChecked") List<String> idrates){

        if(idrates != null){
            for(String idrateStr : idrates){
                int idrate = Integer.parseInt(idrateStr);
                
            }
        }
        return "redirect:/test";
    }

    @GetMapping("/test")
    public String test(Map<String, Object> model) {
        return "/test";
    }
}
