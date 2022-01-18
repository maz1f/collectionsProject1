package com.example.collectionsProject.repos;

import com.example.collectionsProject.domain.Item;
import com.example.collectionsProject.domain.Tag;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface TagRepo extends CrudRepository<Tag, Long> {
    List<Tag> findAllByTagName(String tagName);
    Tag findByTagName(String tagName);
    List<Tag> findAllByItemsContains(Item item);
}
