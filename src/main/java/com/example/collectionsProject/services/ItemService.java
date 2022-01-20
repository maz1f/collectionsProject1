package com.example.collectionsProject.services;

import com.example.collectionsProject.models.Collection;
import com.example.collectionsProject.models.Item;
import com.example.collectionsProject.models.Tag;
import com.example.collectionsProject.models.User;
import com.example.collectionsProject.repos.CollectionsRepo;
import com.example.collectionsProject.repos.ItemRepo;
import com.example.collectionsProject.repos.TagRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashSet;

@Service
public class ItemService {
    @Autowired
    private ItemRepo itemRepo;
    @Autowired
    private CollectionsRepo collectionsRepo;
    @Autowired
    private TagRepo tagRepo;

    public Iterable<Item> getItemsByTagAndCollection(String tag, Collection collection) {
        return itemRepo.findAllByTagContainsAndCollection(tag, collection);
    }

    public Iterable<Item> getItemsByTag(Tag tag) {
        return itemRepo.findAllByTagSetContains(tag);
    }

    public Iterable<Item> getItems(Collection collection) {
        return itemRepo.findAllByCollection(collection);
    }

    public void deleteItem(Item item) {
        itemRepo.delete(item);
    }

    public void setTags(Item item, String tag) {
        String[] tags = tag.split(" ");
        String tagResult = "";
        if (item.getTagSet() != null) {
            item.getTagSet().clear();
        } else {
            item.setTagSet(new HashSet<>());
        }
        for (String t : tags) {
            Tag newTag;
            if (t.charAt(0) != '#'){
                t = "#" + t;
            }
            if (tagRepo.findAllByTagName(t).isEmpty()) {
                newTag = new Tag(t);
                tagRepo.save(newTag);
            } else {
                newTag = tagRepo.findByTagName(t);
            }
            item.getTagSet().add(newTag);
            newTag.getItems().add(item);
            tagResult += t + " ";
        }
        item.setTag(tagResult.substring(0, tagResult.length() - 1));
        itemRepo.save(item);
    }

    public void editItem(Item item, Item newItem) {
        item.setName(newItem.getName());
        setTags(item, newItem.getTag());
        itemRepo.save(item);
    }

    public void like(Item item, User user) {
        if (item.getLikes().contains(user)) {
            item.getLikes().remove(user);
        } else {
            item.getLikes().add(user);
        }
        itemRepo.save(item);
    }

}
