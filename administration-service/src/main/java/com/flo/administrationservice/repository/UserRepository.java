package com.flo.administrationservice.repository;

import com.flo.administrationservice.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
    User findBySsoIgnoreCase(String sso);
}
