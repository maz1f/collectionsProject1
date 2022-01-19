package com.example.collectionsProject.service;

import com.example.collectionsProject.domain.Item;
import com.example.collectionsProject.domain.Tag;
import com.example.collectionsProject.repos.ItemRepo;
import com.example.collectionsProject.repos.TagRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashSet;

@Service
public class TagService {
    @Autowired
    ItemRepo itemRepo;
    @Autowired
    TagRepo tagRepo;

    public Iterable<Tag> getAllTags() {
        return tagRepo.findAll();
    }
}
