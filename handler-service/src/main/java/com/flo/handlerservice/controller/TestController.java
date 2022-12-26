package com.flo.handlerservice.controller;

import com.flo.handlerservice.feign.client.AdministrationClient;
import com.flo.handlerservice.record.UserResponse;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("v1/test")
public class TestController {
    private final AdministrationClient administrationClient;

    public TestController(AdministrationClient administrationClient) {
        this.administrationClient = administrationClient;
    }

    @GetMapping("/{sso}")
    public ResponseEntity<UserResponse> retrieveUser(@PathVariable("sso") String userSso) {
        return administrationClient.getUserInfo(userSso);
    }
}
