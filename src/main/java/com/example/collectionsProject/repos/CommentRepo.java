package com.example.collectionsProject.repos;

import com.example.collectionsProject.models.Comment;
import com.example.collectionsProject.models.Item;
import com.example.collectionsProject.models.User;
import org.springframework.data.repository.CrudRepository;

public interface CommentRepo extends CrudRepository<Comment, Long> {

    Iterable<Comment> findAllByAuthor(User author);
    Iterable<Comment> findAllByItem(Item item);
}
