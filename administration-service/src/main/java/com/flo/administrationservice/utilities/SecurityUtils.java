package com.flo.administrationservice.utilities;

import com.flo.administrationservice.dto.UserDto;
import org.apache.commons.lang.StringUtils;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.core.DefaultOAuth2AuthenticatedPrincipal;
import org.springframework.security.oauth2.core.OAuth2AccessToken;

import java.time.Instant;

public class SecurityUtils {
    public static String getAccessToken() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return authentication != null ? ((OAuth2AccessToken) authentication.getCredentials())
                .getTokenValue() : StringUtils.EMPTY;
    }

    public static Boolean isTokenExpired() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        if (authentication != null) {
            Instant expInstant = ((OAuth2AccessToken) authentication.getCredentials()).getExpiresAt();

            return expInstant.isBefore(Instant.now());
        }
        return Boolean.TRUE;

    }

    public static String getSso() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        return authentication != null ? ((DefaultOAuth2AuthenticatedPrincipal) authentication.getPrincipal()).getName()
                : StringUtils.EMPTY;
    }
}
