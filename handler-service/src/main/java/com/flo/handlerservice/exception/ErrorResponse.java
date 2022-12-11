package com.flo.handlerservice.exception;

import java.time.LocalDateTime;

public record ErrorResponse(LocalDateTime timestamp, String message, String details) {
}
