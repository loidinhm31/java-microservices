package com.flo.authenticationservice.converter;


import com.flo.authenticationservice.enums.RoleEnum;
import jakarta.persistence.AttributeConverter;
import jakarta.persistence.Converter;

@Converter(autoApply = true)
public class RoleEnumConverter implements AttributeConverter<RoleEnum, String> {

    @Override
    public String convertToDatabaseColumn(RoleEnum attribute) {
        return attribute.toString();
    }

    @Override
    public RoleEnum convertToEntityAttribute(String dbData) {
        try {
            return RoleEnum.valueOf(dbData);
        } catch (IllegalArgumentException e) {
            return null;
        }
    }
}
