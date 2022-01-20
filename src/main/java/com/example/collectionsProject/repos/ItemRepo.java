package com.example.collectionsProject.repos;

import com.example.collectionsProject.models.Collection;
import com.example.collectionsProject.models.Item;
import com.example.collectionsProject.models.Tag;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface ItemRepo extends CrudRepository<Item, Long> {
    Iterable<Item> findAllByCollection(Collection col);
    Iterable<Item> findByTag(String tag);
    Iterable<Item> findAllByTagSetContains(Tag tag);
    Iterable<Item> findAllByTagContainsAndCollection(String tag, Collection collection);
    @Query(value="SELECT * FROM Item ORDER BY id DESC LIMIT 5", nativeQuery = true)
    List<Item> getLastFive();
}
