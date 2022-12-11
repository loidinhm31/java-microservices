package com.flo.handlerservice.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(HttpStatus.FORBIDDEN)
public class UserSecurityException extends Exception {
    public UserSecurityException(String message) {
        super(message);
    }
}
