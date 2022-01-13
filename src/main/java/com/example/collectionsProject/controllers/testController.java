package com.example.collectionsProject.controllers;

import com.example.collectionsProject.domain.Collection;
import com.example.collectionsProject.repos.CollectionsRepo;
import org.commonmark.parser.Parser;
import org.commonmark.renderer.html.HtmlRenderer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.commonmark.node.Node;
import org.apache.commons.text.StringEscapeUtils;


@Controller
public class testController {
    @Autowired
    private CollectionsRepo collectionsRepo;

    @GetMapping("/res/{col}")
    public String getRes(@PathVariable Collection col, Model model) {
        col.setDescription(markdownToHTML(col.getDescription()));
        model.addAttribute("col", col);
        return "res";
    }

    private String markdownToHTML(String markdown) {
        Parser parser = Parser.builder().build();
        HtmlRenderer renderer = HtmlRenderer.builder().build();
        Node document = parser.parse(markdown);
        return new String(renderer.render(document));
    }
}
