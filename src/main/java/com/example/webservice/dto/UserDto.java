package com.example.webservice.dto;

import com.fasterxml.jackson.annotation.JsonProperty;
import jakarta.validation.constraints.Past;
import jakarta.validation.constraints.Size;

import java.time.LocalDate;
import java.util.Date;

public class UserDto extends BaseDto {
    private Integer id;

    @Size(min = 2)
    @JsonProperty("username")
    private String name;


    @Past(message = "birthdate should be in the past")
    @JsonProperty("birth_date")
    private LocalDate birthDate;

   public UserDto() {

   }

    public UserDto(Integer id, String name, LocalDate birthDate, Date createdAt, String createdBy, Date updatedAt, String updatedBy) {
        super(createdAt, createdBy, updatedAt, updatedBy);
        this.id = id;
        this.name = name;
        this.birthDate = birthDate;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
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
