package com.example.collectionsProject.domain;

import javax.persistence.*;
import java.util.List;
import java.util.Set;

@Entity
public class Collection {
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    private String name;
    private String description;
    private String theme;
    @ManyToOne(fetch = FetchType.EAGER)
    private User owner;
    @OneToMany(mappedBy = "collection", cascade = CascadeType.ALL, fetch = FetchType.LAZY)
    private Set<Item> items;

    public Collection(String name, String description, String theme, User user) {
        this.owner = user;
        this.name = name;
        this.description = description;
        this.theme = theme;
    }

    public Collection() {

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getTheme() {
        return theme;
    }

    public void setTheme(String theme) {
        this.theme = theme;
    }

    public User getOwner() {
        return owner;
    }

    public void setOwner(User owner) {
        this.owner = owner;
    }

    public Set<Item> getItems() {
        return items;
    }

    public void setItems(Set<Item> items) {
        this.items = items;
    }
}
