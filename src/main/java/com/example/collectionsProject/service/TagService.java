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

    public void setTags(Item item, String tag) {
        String[] tags = tag.split(" ");
        if (item.getTagSet() != null) {
            item.getTagSet().clear();
        } else {
            item.setTagSet(new HashSet<>());
        }
        for (String t : tags) {
            Tag newTag;
            if (tagRepo.findAllByTagName(t).isEmpty()) {
                newTag = new Tag(t);
                tagRepo.save(newTag);
            } else {
                newTag = tagRepo.findByTagName(t);
            }
            item.getTagSet().add(newTag);
            newTag.getItems().add(item);
        }
        itemRepo.save(item);

    }
}
