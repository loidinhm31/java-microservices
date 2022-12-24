package com.flo.handlerservice.feign.client;

import com.flo.handlerservice.dto.UserDto;
import com.flo.handlerservice.feign.config.AdministrationClientConfiguration;
import com.flo.handlerservice.record.UserResponse;
import org.springframework.cloud.openfeign.FeignClient;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

@FeignClient(
        value = "administration-service",
        url = "${administration.endpoint}",
        configuration = AdministrationClientConfiguration.class
)
public interface AdministrationClient {
    @GetMapping(path = "/v1/users/{sso}")
    ResponseEntity<UserResponse> getUserInfo(@PathVariable("sso") String userSso);

    @GetMapping(path = "/v1/users/{sso}/roles")
    ResponseEntity<UserDto> retrieveRolesForUser(@PathVariable("sso") String userSso);
}
