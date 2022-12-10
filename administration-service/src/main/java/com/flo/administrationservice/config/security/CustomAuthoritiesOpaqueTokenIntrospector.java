package com.flo.administrationservice.config.security;

import com.flo.administrationservice.service.UserInfoService;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.oauth2.core.DefaultOAuth2AuthenticatedPrincipal;
import org.springframework.security.oauth2.core.OAuth2AuthenticatedPrincipal;
import org.springframework.security.oauth2.core.OAuth2TokenIntrospectionClaimNames;
import org.springframework.security.oauth2.server.resource.introspection.NimbusOpaqueTokenIntrospector;
import org.springframework.security.oauth2.server.resource.introspection.OpaqueTokenIntrospector;
import org.springframework.stereotype.Component;
import org.springframework.util.CollectionUtils;

import java.util.Collection;
import java.util.List;
import java.util.stream.Collectors;

@Component
public class CustomAuthoritiesOpaqueTokenIntrospector implements OpaqueTokenIntrospector {

    private final UserInfoService userInfoService;

    private OpaqueTokenIntrospector delegate;

    public CustomAuthoritiesOpaqueTokenIntrospector(UserInfoService userInfoService) {
        this.userInfoService = userInfoService;
    }

    public void setDelegate(String introspectionUri, String clientId, String clientSecret) {
        System.out.println(introspectionUri);
        this.delegate = new NimbusOpaqueTokenIntrospector(introspectionUri, clientId, clientSecret);
    }

    public OAuth2AuthenticatedPrincipal introspect(String token) {
        OAuth2AuthenticatedPrincipal principal = this.delegate.introspect(token);

        String username;
        if (principal.getAttributes().containsKey("preferred_username")) {
            username = principal.getAttributes().get("preferred_username").toString();
        } else {
            username = principal.getName();
        }
        return new DefaultOAuth2AuthenticatedPrincipal(
               username , principal.getAttributes(), extractAuthorities(principal));
    }

    private Collection<GrantedAuthority> extractAuthorities(OAuth2AuthenticatedPrincipal principal) {
        List<String> scopes = principal.getAttribute(OAuth2TokenIntrospectionClaimNames.SCOPE);

        Collection<? extends GrantedAuthority> grantedAuthorities = null;
        if (principal.getAttributes().containsKey("preferred_username")) {
            String userSso = principal.getAttributes().get("preferred_username").toString();

            // TODO Double-check
            UserDetails user = userInfoService.loadUserBySso(userSso);

            // TODO comment
            if (CollectionUtils.isEmpty(user.getAuthorities())) {
                grantedAuthorities = scopes.stream()
                        .map(SimpleGrantedAuthority::new)
                        .collect(Collectors.toList());
            } else {
                grantedAuthorities = user.getAuthorities();
            }

            System.out.printf("sso: %s\n", user.getUsername());
            System.out.printf("authorities: %s\n", grantedAuthorities);

        }
        return (Collection<GrantedAuthority>) grantedAuthorities;
    }
}
