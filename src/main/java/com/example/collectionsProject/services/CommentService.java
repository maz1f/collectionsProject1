package com.example.collectionsProject.services;

import com.example.collectionsProject.models.Comment;
import com.example.collectionsProject.models.Item;
import com.example.collectionsProject.models.User;
import com.example.collectionsProject.repos.CommentRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CommentService {
    @Autowired
    private CommentRepo commentRepo;

    public Iterable<Comment> getCommentsByItem(Item item) {
        return commentRepo.findAllByItem(item);
    }

    public void addComment(String comment, User author, Item item) {
        Comment comm = new Comment(comment, author, item);
        commentRepo.save(comm);
    }
}
