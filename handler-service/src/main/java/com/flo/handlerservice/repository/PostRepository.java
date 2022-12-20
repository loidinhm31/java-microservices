package com.flo.handlerservice.repository;

import com.flo.handlerservice.entity.Post;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface PostRepository extends JpaRepository<Post, Long> {
    @Query(value = "SELECT p.id, p.description, p.sso, " +
            "p.created_at, p.created_by, p.updated_at, p.updated_by " +
            "FROM posts p " +
            "WHERE p.sso = :sso", nativeQuery = true)
    List<Post> findAllBySso(@Param("sso") String sso);
}
