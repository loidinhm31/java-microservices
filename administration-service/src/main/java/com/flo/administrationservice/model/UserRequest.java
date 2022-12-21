package com.flo.administrationservice.model;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.flo.administrationservice.dto.BaseDto;
import jakarta.validation.constraints.Past;
import jakarta.validation.constraints.Size;

import java.time.LocalDate;

public class UserRequest extends BaseDto {
    @Size(min = 9, max = 9)
    @JsonProperty("sso")
    private String sso;

   public UserRequest() {

   }

    public String getSso() {
        return sso;
    }

    public void setSso(String sso) {
        this.sso = sso;
    }

}
