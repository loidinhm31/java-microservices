package com.flo.handlerservice.config.security;

import com.flo.handlerservice.dto.UserDto;
import com.flo.handlerservice.exception.UserSecurityException;
import com.flo.handlerservice.service.CustomUserDetailsService;
import org.apache.commons.lang3.tuple.Pair;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.oauth2.core.DefaultOAuth2AuthenticatedPrincipal;
import org.springframework.security.oauth2.core.OAuth2AuthenticatedPrincipal;
import org.springframework.security.oauth2.server.resource.introspection.NimbusOpaqueTokenIntrospector;
import org.springframework.security.oauth2.server.resource.introspection.OpaqueTokenIntrospector;
import org.springframework.stereotype.Component;

import java.util.Collection;

@Component
public class CustomAuthoritiesOpaqueTokenIntrospector implements OpaqueTokenIntrospector {

    private final CustomUserDetailsService customUserDetailsService;

    private OpaqueTokenIntrospector delegate;

    public CustomAuthoritiesOpaqueTokenIntrospector(CustomUserDetailsService customUserDetailsService) {
        this.customUserDetailsService = customUserDetailsService;
    }

    public void setDelegate(String introspectionUri, String clientId, String clientSecret) {
        System.out.println(introspectionUri);
        this.delegate = new NimbusOpaqueTokenIntrospector(introspectionUri, clientId, clientSecret);
    }

    public OAuth2AuthenticatedPrincipal introspect(String token) {
        OAuth2AuthenticatedPrincipal principal = this.delegate.introspect(token);

        Pair<UserDto, Collection<? extends GrantedAuthority>> userPair = null;
        try {
            userPair = extractAuthentication(principal);
        } catch (UserSecurityException e) {
            throw new RuntimeException(e);
        }

        return new DefaultOAuth2AuthenticatedPrincipal(
               userPair.getLeft().getSso() , principal.getAttributes(), (Collection<GrantedAuthority>) userPair.getRight());
    }

    private Pair<UserDto, Collection<? extends GrantedAuthority>> extractAuthentication(OAuth2AuthenticatedPrincipal principal) throws UserSecurityException {
        if (principal.getAttributes().containsKey("preferred_username")) {
            String userSso = principal.getAttributes().get("preferred_username").toString();

            // TODO Double-check
            Pair<UserDto, Collection<? extends GrantedAuthority>> userPair = customUserDetailsService.loadUserBySso(userSso);
            return userPair;
        }
        return null;
    }
}
