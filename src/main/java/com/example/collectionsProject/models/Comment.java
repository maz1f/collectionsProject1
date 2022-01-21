package com.example.collectionsProject.models;

import javax.persistence.*;
import java.util.Set;

@Entity
public class Comment {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String comment;
    @ManyToOne(fetch = FetchType.EAGER)
    private User author;
    @ManyToOne(fetch = FetchType.EAGER)
    private Item item;
    public Comment() {}

    public Comment(String comment, User author, Item item) {
        this.comment = comment;
        this.author = author;
        this.item = item;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public User getAuthor() {
        return author;
    }

    public void setAuthor(User author) {
        this.author = author;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }
}
