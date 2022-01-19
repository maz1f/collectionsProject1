package com.example.collectionsProject.services;

import com.example.collectionsProject.models.Collection;
import com.example.collectionsProject.models.Item;
import com.example.collectionsProject.models.User;
import com.example.collectionsProject.repos.CollectionsRepo;
import com.example.collectionsProject.repos.ItemRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CollectionService {
    @Autowired
    private CollectionsRepo collectionsRepo;
    @Autowired
    private ItemRepo itemRepo;

    public Iterable<Item> getItems(Collection col) {
        return itemRepo.findAllByCollection(col);
    }

    public void editCollection(Collection collection, Collection newCollection) {
        collection.setName(newCollection.getName());
        collection.setDescription(newCollection.getDescription());
        collectionsRepo.save(collection);
    }

    public Iterable<Collection> getCollections(User user) {
        return collectionsRepo.findAllByOwner(user);
    }

    public void deleteCollection(Collection collection) {
        collectionsRepo.delete(collection);
    }

    public Iterable<Collection> getAllColection() {
        return collectionsRepo.findAll();
    }

    public Collection getMaxSizeCollction() {
        Iterable<Collection> collections = getAllColection();
        Collection maxSize = collections.iterator().next();
        for (Collection col : collections) {
            if (col.getItems().size() > maxSize.getItems().size())
                maxSize = col;
        }
        return maxSize;
    }

    public void saveCollection(Collection collection) {
        collectionsRepo.save(collection);
    }
}
