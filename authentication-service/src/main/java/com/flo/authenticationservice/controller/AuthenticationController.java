package com.flo.authenticationservice.controller;

import com.flo.authenticationservice.security.jwt.AuthenticationRequest;
import com.flo.authenticationservice.security.jwt.JwtConfig;
import com.flo.authenticationservice.security.jwt.JwtUtils;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Objects;

@RestController
@RequestMapping("/v1/auth")
public class AuthenticationController {


    private final AuthenticationManager authenticationManager;
    private final UserDetailsService userDetailsService;
    private final JwtUtils jwtUtils;
    private final JwtConfig jwtConfig;

    public AuthenticationController(AuthenticationManager authenticationManager, UserDetailsService userDetailsService, JwtUtils jwtUtils, JwtConfig jwtConfig) {
        this.authenticationManager = authenticationManager;
        this.userDetailsService = userDetailsService;
        this.jwtUtils = jwtUtils;
        this.jwtConfig = jwtConfig;
    }

    @PostMapping("/authenticate")
    public ResponseEntity<String> authenticate(@RequestBody AuthenticationRequest authenticationRequest) {
        // Create a new object of user to authenticate
        Authentication authentication = new UsernamePasswordAuthenticationToken
                (authenticationRequest.getUsername(), authenticationRequest.getPassword());

        // Authenticate the user
        Authentication authenticate = authenticationManager.authenticate(authentication);

        final UserDetails userDetails = userDetailsService.loadUserByUsername(authenticationRequest.getUsername());
        if (Objects.nonNull(userDetails)) {
            return ResponseEntity.status(HttpStatus.OK.value())
                    .header(jwtConfig.getAuthorizationHeader(),
                            jwtConfig.getTokenPrefix() + jwtUtils.generateToken(userDetails))
                    .build();
        }
        return ResponseEntity
                .status(HttpStatus.FORBIDDEN.value())
                .body("not authenticated");
    }
}
