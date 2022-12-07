package com.flo.authenticationservice.entity;

import com.flo.authenticationservice.constants.Constant;
import com.flo.authenticationservice.converter.RoleEnumConverter;
import com.flo.authenticationservice.enums.RoleEnum;
import jakarta.persistence.*;

import java.util.ArrayList;
import java.util.List;

@Entity
@Table(name = "roles", schema = Constant.SCHEMA_NAME)
public class Role extends BaseEntity<String> {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "role_id")
    private Long roleId;

    @Column(name = "role_code", unique = true, nullable = false)
    @Convert(converter = RoleEnumConverter.class)
    private RoleEnum roleCode;

    @Column(name = "role_name", nullable = false)
    private String roleName;

    @OneToMany(mappedBy = "role", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<RoleFeature> roleFeatures = new ArrayList<>();

    @OneToMany(mappedBy = "role", fetch = FetchType.LAZY, cascade = CascadeType.ALL)
    private List<UserRole> userRoles = new ArrayList<>();

    public Role() {
    }

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
    }

    public RoleEnum getRoleCode() {
        return roleCode;
    }

    public void setRoleCode(RoleEnum roleCode) {
        this.roleCode = roleCode;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public List<RoleFeature> getRoleFeatures() {
        return roleFeatures;
    }

    public void setRoleFeatures(List<RoleFeature> roleFeatures) {
        this.roleFeatures = roleFeatures;
    }

    public List<UserRole> getUserRoles() {
        return userRoles;
    }

    public void setUserRoles(List<UserRole> userRoles) {
        this.userRoles = userRoles;
    }
}
