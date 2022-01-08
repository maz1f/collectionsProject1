package com.example.collectionsProject.repos;

import com.example.collectionsProject.domain.Item;
import org.springframework.data.repository.CrudRepository;

public interface ItemRepo extends CrudRepository<Item, Long> {
}
