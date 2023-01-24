CREATE SCHEMA IF NOT EXISTS webservice;

SET
search_path TO webservice;

CREATE TABLE posts
(
    post_id     SERIAL                   NOT NULL,
    description VARCHAR(255),
    sso         VARCHAR(10),
    created_at  TIMESTAMP WITH TIME ZONE NOT NULL,
    created_by  VARCHAR(50)              NOT NULL,
    updated_at  TIMESTAMP WITH TIME ZONE NOT NULL,
    updated_by  VARCHAR(50)              NOT NULL,

    PRIMARY KEY (post_id)
);

insert into posts(post_id, description, sso, created_at, created_by, updated_at, updated_by)
values (20001, 'I want to learn AWS', 100000001, current_timestamp, 'admin', current_timestamp, 'admin');

insert into posts(post_id, description, sso, created_at, created_by, updated_at, updated_by)
values (20002, 'I want to learn DevOps', 100000001, current_timestamp, 'admin', current_timestamp, 'admin');

insert into posts(post_id, description, sso, created_at, created_by, updated_at, updated_by)
values (20003, 'I want to Get AWS Certified', 100000002, current_timestamp, 'admin', current_timestamp, 'admin');

insert into posts(post_id, description, sso, created_at, created_by, updated_at, updated_by)
values (20004, 'I want to learn Multi Cloud', 100000002, current_timestamp, 'admin', current_timestamp, 'admin');