package com.flo.administrationservice.repository;

import com.flo.administrationservice.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface UserRepository extends JpaRepository<User, Long> {

    @Query(value = "SELECT DISTINCT u " +
            "FROM User u " +
            "INNER JOIN UserRole ur ON u.userId = ur.user.userId " +
            "INNER JOIN Role r ON ur.role.roleId = r.roleId " +
            "WHERE u.username = :username " +
            "AND ur.isActive = true")
    User findByUsername(@Param("username") String username);

}
