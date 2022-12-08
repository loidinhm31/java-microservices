package com.flo.administrationservice.controller;

import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/v1/auth")
public class AuthenticationController {


    private final UserDetailsService userDetailsService;

    public AuthenticationController(UserDetailsService userDetailsService) {
        this.userDetailsService = userDetailsService;

    }

}
