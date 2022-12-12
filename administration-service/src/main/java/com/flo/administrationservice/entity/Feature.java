package com.flo.administrationservice.entity;

import com.flo.administrationservice.constants.Constant;
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

    public Feature() {

    }

    public UUID getFeatureId() {
        return featureId;
    }

    public void setFeatureId(UUID featureId) {
        this.featureId = featureId;
    }

    public String getFeatureCode() {
        return featureCode;
    }

    public void setFeatureCode(String featureCode) {
        this.featureCode = featureCode;
    }

    public String getFeatureName() {
        return featureName;
    }

    public void setFeatureName(String featureName) {
        this.featureName = featureName;
    }

    public List<RoleFeature> getRoleFeatures() {
        return roleFeatures;
    }

    public void setRoleFeatures(List<RoleFeature> roleFeatures) {
        this.roleFeatures = roleFeatures;
    }
}