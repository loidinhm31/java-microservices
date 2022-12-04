CREATE SEQUENCE users_seq START WITH 1 INCREMENT BY 50;

CREATE TABLE users
(
    id         LONG        NOT NULL,
    birth_date TIMESTAMP,
    name       VARCHAR(255),
    created_at TIMESTAMP   NOT NULL,
    created_by VARCHAR(50) NOT NULL,
    updated_at TIMESTAMP   NOT NULL,
    updated_by VARCHAR(50) NOT NULL,

    PRIMARY KEY (id)
);

CREATE SEQUENCE posts_seq START WITH 1 INCREMENT BY 50;

CREATE TABLE posts
(
    id          LONG        not null,
    description VARCHAR(255),
    user_id     LONG,
    created_at  TIMESTAMP   NOT NULL,
    created_by  VARCHAR(50) NOT NULL,
    updated_at  TIMESTAMP   NOT NULL,
    updated_by  VARCHAR(50) NOT NULL,

    PRIMARY KEY (id)
);

ALTER TABLE posts
    ADD CONSTRAINT post_to_user_foreign_key
        FOREIGN KEY (user_id) REFERENCES users;

insert into users(id, birth_date, name, created_at, created_by, updated_at, updated_by)
values (10001, current_date(), 'a', current_timestamp, 'admin', current_timestamp, 'admin');

insert into users(id, birth_date, name, created_at, created_by, updated_at, updated_by)
values (10002, current_date(), 'b', current_timestamp, 'admin', current_timestamp, 'admin');

insert into users(id, birth_date, name, created_at, created_by, updated_at, updated_by)
values (10003, current_date(), 'c', current_timestamp, 'admin', current_timestamp, 'admin');

insert into posts(id, description, user_id, created_at, created_by, updated_at, updated_by)
values (20001, 'I want to learn AWS', 10001, current_timestamp, 'admin', current_timestamp, 'admin');

insert into posts(id, description, user_id, created_at, created_by, updated_at, updated_by)
values (20002, 'I want to learn DevOps', 10001, current_timestamp, 'admin', current_timestamp, 'admin');

insert into posts(id, description, user_id, created_at, created_by, updated_at, updated_by)
values (20003, 'I want to Get AWS Certified', 10002, current_timestamp, 'admin', current_timestamp, 'admin');

insert into posts(id, description, user_id, created_at, created_by, updated_at, updated_by)
values (20004, 'I want to learn Multi Cloud', 10002, current_timestamp, 'admin', current_timestamp, 'admin');