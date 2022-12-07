package com.flo.authenticationservice.enums;

import java.io.Serializable;

public enum RoleEnum implements Serializable {

    GLOBAL_ADMIN("Global Admin");

    private final String name;

    RoleEnum(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }
}
