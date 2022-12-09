package com.flo.administrationservice.entity;

import com.flo.administrationservice.constants.Constant;
import jakarta.persistence.*;

@Entity
@Table(name = "role_feature", schema = Constant.SCHEMA_NAME)
public class RoleFeature extends BaseEntity<String> {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE)
    @Column(name = "id", unique = true, nullable = false)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "role_id", nullable = false)
    private Role role;

    @ManyToOne
    @JoinColumn(name = "feature_id", nullable = false)
    private Feature feature;

}
