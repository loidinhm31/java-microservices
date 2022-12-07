package com.flo.authenticationservice.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/v1/test")
public class TestController {
    @GetMapping("/t1")
    public String test1() {
        System.out.println("hit test 1");
        return "test1";
    }
}
