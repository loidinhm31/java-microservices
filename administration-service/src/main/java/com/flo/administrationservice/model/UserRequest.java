package com.flo.administrationservice.model;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.flo.administrationservice.dto.BaseDto;
import jakarta.validation.constraints.Past;
import jakarta.validation.constraints.Size;

import java.time.LocalDate;

public class UserRequest extends BaseDto {
    private Long id;

    @Size(min = 2)
    @JsonProperty("username")
    private String name;


    @Past(message = "birthdate should be in the past")
    @JsonProperty("birth_date")
    private LocalDate birthDate;

   public UserRequest() {

   }

    public UserRequest(Long id, String name, LocalDate birthDate) {
        super();
        this.id = id;
        this.name = name;
        this.birthDate = birthDate;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public LocalDate getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(LocalDate birthDate) {
        this.birthDate = birthDate;
    }
}
