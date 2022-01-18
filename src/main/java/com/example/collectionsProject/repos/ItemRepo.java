package com.example.collectionsProject.repos;

import com.example.collectionsProject.domain.Collection;
import com.example.collectionsProject.domain.Item;
import com.example.collectionsProject.domain.Tag;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ItemRepo extends CrudRepository<Item, Long> {
    Iterable<Item> findAllByCollection(Collection col);
    Iterable<Item> findByTag(String tag);
    Iterable<Item> findAllByTagSetContains(Tag tag);
}
