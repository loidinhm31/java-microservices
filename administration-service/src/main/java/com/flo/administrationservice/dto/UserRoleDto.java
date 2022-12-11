package com.flo.administrationservice.dto;

import java.io.Serializable;

public class UserRoleDto implements Serializable {

    private Long id;
    private Long userId;
    private RoleDto role;
    private Boolean isActive;

    public UserRoleDto() {

    }

  public Long getId() {
    return id;
  }

  public void setId(Long id) {
    this.id = id;
  }

  public Long getUserId() {
    return userId;
  }

  public void setUserId(Long userId) {
    this.userId = userId;
  }

  public RoleDto getRole() {
    return role;
  }

  public void setRole(RoleDto role) {
    this.role = role;
  }

  public Boolean getActive() {
    return isActive;
  }

  public void setActive(Boolean active) {
    isActive = active;
  }
}
