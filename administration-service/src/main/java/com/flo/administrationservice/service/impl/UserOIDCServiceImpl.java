package com.flo.administrationservice.service.impl;

import com.flo.administrationservice.model.SSOGenericRead;
import com.flo.administrationservice.service.UserOIDCService;
import com.flo.administrationservice.utilities.SecurityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;


@Service
public class UserOIDCServiceImpl implements UserOIDCService {
    private final Logger log = LoggerFactory.getLogger(this.getClass());

    @Value("${security.host}")
    private String userUrl;

    @Override
    public SSOGenericRead getUserInfoOIDC(String sso) {
        if (!SecurityUtils.isTokenExpired()) {
            String accessToken = SecurityUtils.getAccessToken();

            RestTemplate restTemplate = new RestTemplate();
            HttpHeaders httpHeaders = new HttpHeaders();
            httpHeaders.setContentType(MediaType.APPLICATION_JSON);
            httpHeaders.add(HttpHeaders.AUTHORIZATION, "Bearer " + accessToken);

            HttpEntity<?> request = new HttpEntity<>(httpHeaders);

            String url = userUrl + "/users?username=" + sso;
            try {
                ResponseEntity<SSOGenericRead[]> responseEntity = restTemplate.exchange(
                        url,
                        HttpMethod.GET,
                        request,
                        SSOGenericRead[].class
                );

                return responseEntity.getBody()[0];
            } catch (RuntimeException e) {
                try {
                    ResponseEntity<SSOGenericRead[]> responseEntity = restTemplate.exchange(
                            url,
                            HttpMethod.GET,
                            request,
                            SSOGenericRead[].class
                    );
                    return responseEntity.getBody()[0];
                } catch (RuntimeException e2) {
                    log.error("unexpected error: ", e2);
                }
            }
        }
        return null;
    }
}
