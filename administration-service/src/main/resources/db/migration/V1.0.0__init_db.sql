CREATE SCHEMA IF NOT EXISTS fsa;

SET
search_path TO fsa;

CREATE TABLE users
(
    user_id    SERIAL    NOT NULL PRIMARY KEY NOT NULL,
    username   TEXT      NOT NULL,
    password   TEXT,
    created_at TIMESTAMP NOT NULL,
    created_by TEXT      NOT NULL,
    updated_at TIMESTAMP NOT NULL,
    updated_by TEXT      NOT NULL
);

CREATE TABLE roles
(
    role_id    SERIAL PRIMARY KEY NOT NULL,
    role_name  TEXT               NOT NULL,
    role_code  TEXT               NOT NULL,
    created_at TIMESTAMP          NOT NULL,
    created_by TEXT               NOT NULL,
    updated_at TIMESTAMP          NOT NULL,
    updated_by TEXT               NOT NULL
);

CREATE TABLE user_role
(
    id         SERIAL PRIMARY KEY NOT NULL,
    user_id    SERIAL             NOT NULL,
    role_id    SERIAL             NOT NULL,
    is_active  BOOLEAN            NOT NULL,
    created_at TIMESTAMP          NOT NULL,
    created_by TEXT               NOT NULL,
    updated_at TIMESTAMP          NOT NULL,
    updated_by TEXT               NOT NULL
);

CREATE TABLE features
(
    feature_id   SERIAL PRIMARY KEY NOT NULL,
    feature_name TEXT               NOT NULL,
    feature_code TEXT               NOT NULL,
    created_at   TIMESTAMP          NOT NULL,
    created_by   TEXT               NOT NULL,
    updated_at   TIMESTAMP          NOT NULL,
    updated_by   TEXT               NOT NULL
);

CREATE TABLE role_feature
(
    id         SERIAL PRIMARY KEY NOT NULL,
    role_id    SERIAL             NOT NULL,
    feature_id SERIAL             NOT NULL,
    created_at TIMESTAMP          NOT NULL,
    created_by TEXT               NOT NULL,
    updated_at TIMESTAMP          NOT NULL,
    updated_by TEXT               NOT NULL
);



CREATE TABLE tracking_last_login
(
    tracking_last_login_id SERIAL PRIMARY KEY                NOT NULL,
    user_id                SERIAL references users (user_id) NOT NULL,
    service_code           TEXT,
    last_login_time        TEXT                              NOT NULL,
    created_at             TIMESTAMP                         NOT NULL,
    created_by             TEXT                              NOT NULL,
    updated_at             TIMESTAMP                         NOT NULL,
    updated_by             TEXT                              NOT NULL
);
create index if not exists tracking_last_login_user_id_index on TRACKING_LAST_LOGIN (user_id);


ALTER TABLE user_role
    ADD FOREIGN KEY (user_id) REFERENCES users (user_id);

ALTER TABLE user_role
    ADD FOREIGN KEY (role_id) REFERENCES roles (role_id);

ALTER TABLE role_feature
    ADD FOREIGN KEY (role_id) REFERENCES roles (role_id);

ALTER TABLE role_feature
    ADD FOREIGN KEY (feature_id) REFERENCES features (feature_id);

INSERT INTO users(username, password, created_at, created_by, updated_at, updated_by)
VALUES ('admin', '$2a$12$hSMyasJ7qheNIrFsTi1EpuOgY4hfz9vQvtd45TN1uMbY4HlpD3Zf.', CURRENT_TIMESTAMP, 'admin',
        CURRENT_TIMESTAMP, 'admin');

INSERT INTO roles(role_name, role_code, created_at, created_by, updated_at, updated_by)
VALUES ('Global Admin', 'GLOBAL_ADMIN', CURRENT_TIMESTAMP, 'admin', CURRENT_TIMESTAMP, 'admin');

INSERT INTO user_role (user_id, role_id, is_active, created_at, created_by, updated_at, updated_by)
VALUES (1, 1, true, CURRENT_TIMESTAMP, 'admin', CURRENT_TIMESTAMP, 'admin')