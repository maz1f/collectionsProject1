package com.example.collectionsProject.repos;

import com.example.collectionsProject.models.Collection;
import com.example.collectionsProject.models.User;
import org.springframework.data.repository.CrudRepository;

public interface CollectionsRepo extends CrudRepository<Collection, Long> {
    Collection findCollectionByName(String name);
    Iterable<Collection> findAllByOwner(User user);

}
