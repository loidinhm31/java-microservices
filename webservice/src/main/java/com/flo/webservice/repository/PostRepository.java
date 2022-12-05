package com.flo.webservice.repository;

import com.flo.webservice.entity.Post;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface PostRepository extends JpaRepository<Post, Long> {
    @Query(value = "SELECT p.id, p.description, p.user_id, " +
            "p.created_at, p.created_by, p.updated_at, p.updated_by " +
            "FROM posts p " +
            "WHERE p.user_id = :userId", nativeQuery = true)
    List<Post> findAllByUserId(long userId);
}
