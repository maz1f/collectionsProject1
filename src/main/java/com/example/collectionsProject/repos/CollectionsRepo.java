package com.example.collectionsProject.repos;

import com.example.collectionsProject.domain.Collection;
import org.springframework.data.repository.CrudRepository;

public interface CollectionsRepo extends CrudRepository<Collection, Long> {

}
