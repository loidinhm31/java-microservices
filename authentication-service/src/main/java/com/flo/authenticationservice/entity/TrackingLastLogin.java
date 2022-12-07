package com.flo.authenticationservice.entity;

import com.flo.authenticationservice.constants.Constant;
import jakarta.persistence.*;

import java.util.Date;

@Entity
@Table(name = "tracking_last_login", schema = Constant.SCHEMA_NAME)
public class TrackingLastLogin extends BaseEntity<String> {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "tracking_last_login_id", unique = true, nullable = false)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "user_id", nullable = false)
    private User user;

    @Column(name = "last_login_time")
    @Temporal(TemporalType.TIMESTAMP)
    private Date lastLoginTime;
}

