package com.example.collectionsProject.services;

import com.example.collectionsProject.models.Tag;
import com.example.collectionsProject.repos.ItemRepo;
import com.example.collectionsProject.repos.TagRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
