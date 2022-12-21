package com.flo.administrationservice.service;

import com.flo.administrationservice.model.SSOGenericRead;

public interface UserOIDCService {
    SSOGenericRead getUserInfoOIDC(String sso);
}
