package com.flo.handlerservice.repository;

import com.flo.handlerservice.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
}
