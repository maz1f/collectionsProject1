package com.example.collectionsProject.repos;

import com.example.collectionsProject.models.Collection;
import com.example.collectionsProject.models.Item;
import com.example.collectionsProject.models.Tag;
import org.springframework.data.repository.CrudRepository;

public interface ItemRepo extends CrudRepository<Item, Long> {
    Iterable<Item> findAllByCollection(Collection col);
    Iterable<Item> findByTag(String tag);
    Iterable<Item> findAllByTagSetContains(Tag tag);
}
