package com.flo.handlerservice.dto;


import com.flo.handlerservice.enums.RoleEnum;

import java.util.ArrayList;
import java.util.List;

public class RoleDto {

    private Long roleId;
    private RoleEnum roleCode;
    private String roleName;
    private List<FeatureDto> features = new ArrayList<>();

    public RoleDto() {

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

    public List<FeatureDto> getFeatures() {
        return features;
    }

    public void setFeatures(List<FeatureDto> features) {
        this.features = features;
    }
}
