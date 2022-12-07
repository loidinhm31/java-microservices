package com.flo.authenticationservice.entity;

import com.flo.authenticationservice.constants.Constant;
import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "features", schema = Constant.SCHEMA_NAME)
public class Feature extends BaseEntity<String> {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "feature_id", unique = true, nullable = false)
    private UUID featureId;

    @Column(name = "feature_code", unique = true, nullable = false)
    private String featureCode;

    @Column(name = "feature_name", nullable = false)
    private String featureName;

    @OneToMany(mappedBy = "feature", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<RoleFeature> roleFeatures = new ArrayList<>();

}