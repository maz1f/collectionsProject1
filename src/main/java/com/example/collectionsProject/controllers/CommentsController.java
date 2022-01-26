package com.example.collectionsProject.controllers;

import com.example.collectionsProject.models.Comment;
import com.example.collectionsProject.models.Item;
import com.example.collectionsProject.models.User;
import com.example.collectionsProject.services.CommentService;
import com.example.collectionsProject.services.ItemService;
import com.example.collectionsProject.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;

import java.util.Map;

@Controller
public class CommentsController {
    @Autowired
    private CommentService commentService;
    @Autowired
    private ItemService itemService;
    @Autowired
    private UserService userService;

    @MessageMapping("/chat.sendMessage")
    @SendTo("/topic/public")
    public Map<String, String> sendComment(@Payload Map<String, String> comment) {
        Item item = itemService.getItemById(Long.parseLong(comment.get("item")));
        User user = userService.getUserByName(comment.get("author"));
        commentService.addComment(comment.get("comment"), user, item);
        return comment;
    }
}
