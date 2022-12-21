package com.flo.handlerservice.record;

public record UserResponse(
        String sso,
        String username,
        String email
) {
}
