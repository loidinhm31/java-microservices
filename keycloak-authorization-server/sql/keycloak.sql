--
-- PostgreSQL database dump
--

-- Dumped from database version 15.0 (Debian 15.0-1.pgdg110+1)
-- Dumped by pg_dump version 15.1 (Ubuntu 15.1-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: admin_event_entity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admin_event_entity (
    id character varying(36) NOT NULL,
    admin_event_time bigint,
    realm_id character varying(255),
    operation_type character varying(255),
    auth_realm_id character varying(255),
    auth_client_id character varying(255),
    auth_user_id character varying(255),
    ip_address character varying(255),
    resource_path character varying(2550),
    representation text,
    error character varying(255),
    resource_type character varying(64)
);


ALTER TABLE public.admin_event_entity OWNER TO postgres;

--
-- Name: associated_policy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.associated_policy (
    policy_id character varying(36) NOT NULL,
    associated_policy_id character varying(36) NOT NULL
);


ALTER TABLE public.associated_policy OWNER TO postgres;

--
-- Name: authentication_execution; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authentication_execution (
    id character varying(36) NOT NULL,
    alias character varying(255),
    authenticator character varying(36),
    realm_id character varying(36),
    flow_id character varying(36),
    requirement integer,
    priority integer,
    authenticator_flow boolean DEFAULT false NOT NULL,
    auth_flow_id character varying(36),
    auth_config character varying(36)
);


ALTER TABLE public.authentication_execution OWNER TO postgres;

--
-- Name: authentication_flow; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authentication_flow (
    id character varying(36) NOT NULL,
    alias character varying(255),
    description character varying(255),
    realm_id character varying(36),
    provider_id character varying(36) DEFAULT 'basic-flow'::character varying NOT NULL,
    top_level boolean DEFAULT false NOT NULL,
    built_in boolean DEFAULT false NOT NULL
);


ALTER TABLE public.authentication_flow OWNER TO postgres;

--
-- Name: authenticator_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authenticator_config (
    id character varying(36) NOT NULL,
    alias character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.authenticator_config OWNER TO postgres;

--
-- Name: authenticator_config_entry; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.authenticator_config_entry (
    authenticator_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.authenticator_config_entry OWNER TO postgres;

--
-- Name: broker_link; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.broker_link (
    identity_provider character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL,
    broker_user_id character varying(255),
    broker_username character varying(255),
    token text,
    user_id character varying(255) NOT NULL
);


ALTER TABLE public.broker_link OWNER TO postgres;

--
-- Name: client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client (
    id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    full_scope_allowed boolean DEFAULT false NOT NULL,
    client_id character varying(255),
    not_before integer,
    public_client boolean DEFAULT false NOT NULL,
    secret character varying(255),
    base_url character varying(255),
    bearer_only boolean DEFAULT false NOT NULL,
    management_url character varying(255),
    surrogate_auth_required boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    protocol character varying(255),
    node_rereg_timeout integer DEFAULT 0,
    frontchannel_logout boolean DEFAULT false NOT NULL,
    consent_required boolean DEFAULT false NOT NULL,
    name character varying(255),
    service_accounts_enabled boolean DEFAULT false NOT NULL,
    client_authenticator_type character varying(255),
    root_url character varying(255),
    description character varying(255),
    registration_token character varying(255),
    standard_flow_enabled boolean DEFAULT true NOT NULL,
    implicit_flow_enabled boolean DEFAULT false NOT NULL,
    direct_access_grants_enabled boolean DEFAULT false NOT NULL,
    always_display_in_console boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client OWNER TO postgres;

--
-- Name: client_attributes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_attributes (
    client_id character varying(36) NOT NULL,
    value character varying(4000),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_attributes OWNER TO postgres;

--
-- Name: client_auth_flow_bindings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_auth_flow_bindings (
    client_id character varying(36) NOT NULL,
    flow_id character varying(36),
    binding_name character varying(255) NOT NULL
);


ALTER TABLE public.client_auth_flow_bindings OWNER TO postgres;

--
-- Name: client_initial_access; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_initial_access (
    id character varying(36) NOT NULL,
    realm_id character varying(36) NOT NULL,
    "timestamp" integer,
    expiration integer,
    count integer,
    remaining_count integer
);


ALTER TABLE public.client_initial_access OWNER TO postgres;

--
-- Name: client_node_registrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_node_registrations (
    client_id character varying(36) NOT NULL,
    value integer,
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_node_registrations OWNER TO postgres;

--
-- Name: client_scope; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_scope (
    id character varying(36) NOT NULL,
    name character varying(255),
    realm_id character varying(36),
    description character varying(255),
    protocol character varying(255)
);


ALTER TABLE public.client_scope OWNER TO postgres;

--
-- Name: client_scope_attributes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_scope_attributes (
    scope_id character varying(36) NOT NULL,
    value character varying(2048),
    name character varying(255) NOT NULL
);


ALTER TABLE public.client_scope_attributes OWNER TO postgres;

--
-- Name: client_scope_client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_scope_client (
    client_id character varying(255) NOT NULL,
    scope_id character varying(255) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.client_scope_client OWNER TO postgres;

--
-- Name: client_scope_role_mapping; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_scope_role_mapping (
    scope_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.client_scope_role_mapping OWNER TO postgres;

--
-- Name: client_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_session (
    id character varying(36) NOT NULL,
    client_id character varying(36),
    redirect_uri character varying(255),
    state character varying(255),
    "timestamp" integer,
    session_id character varying(36),
    auth_method character varying(255),
    realm_id character varying(255),
    auth_user_id character varying(36),
    current_action character varying(36)
);


ALTER TABLE public.client_session OWNER TO postgres;

--
-- Name: client_session_auth_status; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_session_auth_status (
    authenticator character varying(36) NOT NULL,
    status integer,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_auth_status OWNER TO postgres;

--
-- Name: client_session_note; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_session_note (
    name character varying(255) NOT NULL,
    value character varying(255),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_note OWNER TO postgres;

--
-- Name: client_session_prot_mapper; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_session_prot_mapper (
    protocol_mapper_id character varying(36) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_prot_mapper OWNER TO postgres;

--
-- Name: client_session_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_session_role (
    role_id character varying(255) NOT NULL,
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_session_role OWNER TO postgres;

--
-- Name: client_user_session_note; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client_user_session_note (
    name character varying(255) NOT NULL,
    value character varying(2048),
    client_session character varying(36) NOT NULL
);


ALTER TABLE public.client_user_session_note OWNER TO postgres;

--
-- Name: component; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.component (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_id character varying(36),
    provider_id character varying(36),
    provider_type character varying(255),
    realm_id character varying(36),
    sub_type character varying(255)
);


ALTER TABLE public.component OWNER TO postgres;

--
-- Name: component_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.component_config (
    id character varying(36) NOT NULL,
    component_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(4000)
);


ALTER TABLE public.component_config OWNER TO postgres;

--
-- Name: composite_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.composite_role (
    composite character varying(36) NOT NULL,
    child_role character varying(36) NOT NULL
);


ALTER TABLE public.composite_role OWNER TO postgres;

--
-- Name: credential; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    user_id character varying(36),
    created_date bigint,
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.credential OWNER TO postgres;

--
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO postgres;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO postgres;

--
-- Name: default_client_scope; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.default_client_scope (
    realm_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL,
    default_scope boolean DEFAULT false NOT NULL
);


ALTER TABLE public.default_client_scope OWNER TO postgres;

--
-- Name: event_entity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.event_entity (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    details_json character varying(2550),
    error character varying(255),
    ip_address character varying(255),
    realm_id character varying(255),
    session_id character varying(255),
    event_time bigint,
    type character varying(255),
    user_id character varying(255)
);


ALTER TABLE public.event_entity OWNER TO postgres;

--
-- Name: fed_user_attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fed_user_attribute (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    value character varying(2024)
);


ALTER TABLE public.fed_user_attribute OWNER TO postgres;

--
-- Name: fed_user_consent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fed_user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.fed_user_consent OWNER TO postgres;

--
-- Name: fed_user_consent_cl_scope; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fed_user_consent_cl_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.fed_user_consent_cl_scope OWNER TO postgres;

--
-- Name: fed_user_credential; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fed_user_credential (
    id character varying(36) NOT NULL,
    salt bytea,
    type character varying(255),
    created_date bigint,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36),
    user_label character varying(255),
    secret_data text,
    credential_data text,
    priority integer
);


ALTER TABLE public.fed_user_credential OWNER TO postgres;

--
-- Name: fed_user_group_membership; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fed_user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_group_membership OWNER TO postgres;

--
-- Name: fed_user_required_action; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fed_user_required_action (
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_required_action OWNER TO postgres;

--
-- Name: fed_user_role_mapping; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.fed_user_role_mapping (
    role_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    storage_provider_id character varying(36)
);


ALTER TABLE public.fed_user_role_mapping OWNER TO postgres;

--
-- Name: federated_identity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.federated_identity (
    identity_provider character varying(255) NOT NULL,
    realm_id character varying(36),
    federated_user_id character varying(255),
    federated_username character varying(255),
    token text,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_identity OWNER TO postgres;

--
-- Name: federated_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.federated_user (
    id character varying(255) NOT NULL,
    storage_provider_id character varying(255),
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.federated_user OWNER TO postgres;

--
-- Name: group_attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_attribute OWNER TO postgres;

--
-- Name: group_role_mapping; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.group_role_mapping (
    role_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.group_role_mapping OWNER TO postgres;

--
-- Name: identity_provider; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.identity_provider (
    internal_id character varying(36) NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    provider_alias character varying(255),
    provider_id character varying(255),
    store_token boolean DEFAULT false NOT NULL,
    authenticate_by_default boolean DEFAULT false NOT NULL,
    realm_id character varying(36),
    add_token_role boolean DEFAULT true NOT NULL,
    trust_email boolean DEFAULT false NOT NULL,
    first_broker_login_flow_id character varying(36),
    post_broker_login_flow_id character varying(36),
    provider_display_name character varying(255),
    link_only boolean DEFAULT false NOT NULL
);


ALTER TABLE public.identity_provider OWNER TO postgres;

--
-- Name: identity_provider_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.identity_provider_config (
    identity_provider_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.identity_provider_config OWNER TO postgres;

--
-- Name: identity_provider_mapper; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.identity_provider_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    idp_alias character varying(255) NOT NULL,
    idp_mapper_name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.identity_provider_mapper OWNER TO postgres;

--
-- Name: idp_mapper_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.idp_mapper_config (
    idp_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.idp_mapper_config OWNER TO postgres;

--
-- Name: keycloak_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.keycloak_group (
    id character varying(36) NOT NULL,
    name character varying(255),
    parent_group character varying(36) NOT NULL,
    realm_id character varying(36)
);


ALTER TABLE public.keycloak_group OWNER TO postgres;

--
-- Name: keycloak_role; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.keycloak_role (
    id character varying(36) NOT NULL,
    client_realm_constraint character varying(255),
    client_role boolean DEFAULT false NOT NULL,
    description character varying(255),
    name character varying(255),
    realm_id character varying(255),
    client character varying(36),
    realm character varying(36)
);


ALTER TABLE public.keycloak_role OWNER TO postgres;

--
-- Name: migration_model; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migration_model (
    id character varying(36) NOT NULL,
    version character varying(36),
    update_time bigint DEFAULT 0 NOT NULL
);


ALTER TABLE public.migration_model OWNER TO postgres;

--
-- Name: offline_client_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.offline_client_session (
    user_session_id character varying(36) NOT NULL,
    client_id character varying(255) NOT NULL,
    offline_flag character varying(4) NOT NULL,
    "timestamp" integer,
    data text,
    client_storage_provider character varying(36) DEFAULT 'local'::character varying NOT NULL,
    external_client_id character varying(255) DEFAULT 'local'::character varying NOT NULL
);


ALTER TABLE public.offline_client_session OWNER TO postgres;

--
-- Name: offline_user_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.offline_user_session (
    user_session_id character varying(36) NOT NULL,
    user_id character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    created_on integer NOT NULL,
    offline_flag character varying(4) NOT NULL,
    data text,
    last_session_refresh integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.offline_user_session OWNER TO postgres;

--
-- Name: policy_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.policy_config (
    policy_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value text
);


ALTER TABLE public.policy_config OWNER TO postgres;

--
-- Name: protocol_mapper; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.protocol_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    protocol character varying(255) NOT NULL,
    protocol_mapper_name character varying(255) NOT NULL,
    client_id character varying(36),
    client_scope_id character varying(36)
);


ALTER TABLE public.protocol_mapper OWNER TO postgres;

--
-- Name: protocol_mapper_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.protocol_mapper_config (
    protocol_mapper_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.protocol_mapper_config OWNER TO postgres;

--
-- Name: realm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realm (
    id character varying(36) NOT NULL,
    access_code_lifespan integer,
    user_action_lifespan integer,
    access_token_lifespan integer,
    account_theme character varying(255),
    admin_theme character varying(255),
    email_theme character varying(255),
    enabled boolean DEFAULT false NOT NULL,
    events_enabled boolean DEFAULT false NOT NULL,
    events_expiration bigint,
    login_theme character varying(255),
    name character varying(255),
    not_before integer,
    password_policy character varying(2550),
    registration_allowed boolean DEFAULT false NOT NULL,
    remember_me boolean DEFAULT false NOT NULL,
    reset_password_allowed boolean DEFAULT false NOT NULL,
    social boolean DEFAULT false NOT NULL,
    ssl_required character varying(255),
    sso_idle_timeout integer,
    sso_max_lifespan integer,
    update_profile_on_soc_login boolean DEFAULT false NOT NULL,
    verify_email boolean DEFAULT false NOT NULL,
    master_admin_client character varying(36),
    login_lifespan integer,
    internationalization_enabled boolean DEFAULT false NOT NULL,
    default_locale character varying(255),
    reg_email_as_username boolean DEFAULT false NOT NULL,
    admin_events_enabled boolean DEFAULT false NOT NULL,
    admin_events_details_enabled boolean DEFAULT false NOT NULL,
    edit_username_allowed boolean DEFAULT false NOT NULL,
    otp_policy_counter integer DEFAULT 0,
    otp_policy_window integer DEFAULT 1,
    otp_policy_period integer DEFAULT 30,
    otp_policy_digits integer DEFAULT 6,
    otp_policy_alg character varying(36) DEFAULT 'HmacSHA1'::character varying,
    otp_policy_type character varying(36) DEFAULT 'totp'::character varying,
    browser_flow character varying(36),
    registration_flow character varying(36),
    direct_grant_flow character varying(36),
    reset_credentials_flow character varying(36),
    client_auth_flow character varying(36),
    offline_session_idle_timeout integer DEFAULT 0,
    revoke_refresh_token boolean DEFAULT false NOT NULL,
    access_token_life_implicit integer DEFAULT 0,
    login_with_email_allowed boolean DEFAULT true NOT NULL,
    duplicate_emails_allowed boolean DEFAULT false NOT NULL,
    docker_auth_flow character varying(36),
    refresh_token_max_reuse integer DEFAULT 0,
    allow_user_managed_access boolean DEFAULT false NOT NULL,
    sso_max_lifespan_remember_me integer DEFAULT 0 NOT NULL,
    sso_idle_timeout_remember_me integer DEFAULT 0 NOT NULL,
    default_role character varying(255)
);


ALTER TABLE public.realm OWNER TO postgres;

--
-- Name: realm_attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realm_attribute (
    name character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL,
    value text
);


ALTER TABLE public.realm_attribute OWNER TO postgres;

--
-- Name: realm_default_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realm_default_groups (
    realm_id character varying(36) NOT NULL,
    group_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_default_groups OWNER TO postgres;

--
-- Name: realm_enabled_event_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realm_enabled_event_types (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_enabled_event_types OWNER TO postgres;

--
-- Name: realm_events_listeners; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realm_events_listeners (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_events_listeners OWNER TO postgres;

--
-- Name: realm_localizations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realm_localizations (
    realm_id character varying(255) NOT NULL,
    locale character varying(255) NOT NULL,
    texts text NOT NULL
);


ALTER TABLE public.realm_localizations OWNER TO postgres;

--
-- Name: realm_required_credential; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realm_required_credential (
    type character varying(255) NOT NULL,
    form_label character varying(255),
    input boolean DEFAULT false NOT NULL,
    secret boolean DEFAULT false NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.realm_required_credential OWNER TO postgres;

--
-- Name: realm_smtp_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realm_smtp_config (
    realm_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.realm_smtp_config OWNER TO postgres;

--
-- Name: realm_supported_locales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.realm_supported_locales (
    realm_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.realm_supported_locales OWNER TO postgres;

--
-- Name: redirect_uris; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.redirect_uris (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.redirect_uris OWNER TO postgres;

--
-- Name: required_action_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.required_action_config (
    required_action_id character varying(36) NOT NULL,
    value text,
    name character varying(255) NOT NULL
);


ALTER TABLE public.required_action_config OWNER TO postgres;

--
-- Name: required_action_provider; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.required_action_provider (
    id character varying(36) NOT NULL,
    alias character varying(255),
    name character varying(255),
    realm_id character varying(36),
    enabled boolean DEFAULT false NOT NULL,
    default_action boolean DEFAULT false NOT NULL,
    provider_id character varying(255),
    priority integer
);


ALTER TABLE public.required_action_provider OWNER TO postgres;

--
-- Name: resource_attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource_attribute (
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255),
    resource_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_attribute OWNER TO postgres;

--
-- Name: resource_policy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource_policy (
    resource_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_policy OWNER TO postgres;

--
-- Name: resource_scope; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource_scope (
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.resource_scope OWNER TO postgres;

--
-- Name: resource_server; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource_server (
    id character varying(36) NOT NULL,
    allow_rs_remote_mgmt boolean DEFAULT false NOT NULL,
    policy_enforce_mode character varying(15) NOT NULL,
    decision_strategy smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public.resource_server OWNER TO postgres;

--
-- Name: resource_server_perm_ticket; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource_server_perm_ticket (
    id character varying(36) NOT NULL,
    owner character varying(255) NOT NULL,
    requester character varying(255) NOT NULL,
    created_timestamp bigint NOT NULL,
    granted_timestamp bigint,
    resource_id character varying(36) NOT NULL,
    scope_id character varying(36),
    resource_server_id character varying(36) NOT NULL,
    policy_id character varying(36)
);


ALTER TABLE public.resource_server_perm_ticket OWNER TO postgres;

--
-- Name: resource_server_policy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource_server_policy (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    description character varying(255),
    type character varying(255) NOT NULL,
    decision_strategy character varying(20),
    logic character varying(20),
    resource_server_id character varying(36) NOT NULL,
    owner character varying(255)
);


ALTER TABLE public.resource_server_policy OWNER TO postgres;

--
-- Name: resource_server_resource; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource_server_resource (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    type character varying(255),
    icon_uri character varying(255),
    owner character varying(255) NOT NULL,
    resource_server_id character varying(36) NOT NULL,
    owner_managed_access boolean DEFAULT false NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_resource OWNER TO postgres;

--
-- Name: resource_server_scope; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource_server_scope (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    icon_uri character varying(255),
    resource_server_id character varying(36) NOT NULL,
    display_name character varying(255)
);


ALTER TABLE public.resource_server_scope OWNER TO postgres;

--
-- Name: resource_uris; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.resource_uris (
    resource_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.resource_uris OWNER TO postgres;

--
-- Name: role_attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.role_attribute (
    id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255)
);


ALTER TABLE public.role_attribute OWNER TO postgres;

--
-- Name: scope_mapping; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scope_mapping (
    client_id character varying(36) NOT NULL,
    role_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_mapping OWNER TO postgres;

--
-- Name: scope_policy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.scope_policy (
    scope_id character varying(36) NOT NULL,
    policy_id character varying(36) NOT NULL
);


ALTER TABLE public.scope_policy OWNER TO postgres;

--
-- Name: user_attribute; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_attribute (
    name character varying(255) NOT NULL,
    value character varying(255),
    user_id character varying(36) NOT NULL,
    id character varying(36) DEFAULT 'sybase-needs-something-here'::character varying NOT NULL
);


ALTER TABLE public.user_attribute OWNER TO postgres;

--
-- Name: user_consent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_consent (
    id character varying(36) NOT NULL,
    client_id character varying(255),
    user_id character varying(36) NOT NULL,
    created_date bigint,
    last_updated_date bigint,
    client_storage_provider character varying(36),
    external_client_id character varying(255)
);


ALTER TABLE public.user_consent OWNER TO postgres;

--
-- Name: user_consent_client_scope; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_consent_client_scope (
    user_consent_id character varying(36) NOT NULL,
    scope_id character varying(36) NOT NULL
);


ALTER TABLE public.user_consent_client_scope OWNER TO postgres;

--
-- Name: user_entity; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_entity (
    id character varying(36) NOT NULL,
    email character varying(255),
    email_constraint character varying(255),
    email_verified boolean DEFAULT false NOT NULL,
    enabled boolean DEFAULT false NOT NULL,
    federation_link character varying(255),
    first_name character varying(255),
    last_name character varying(255),
    realm_id character varying(255),
    username character varying(255),
    created_timestamp bigint,
    service_account_client_link character varying(255),
    not_before integer DEFAULT 0 NOT NULL
);


ALTER TABLE public.user_entity OWNER TO postgres;

--
-- Name: user_federation_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_federation_config (
    user_federation_provider_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_config OWNER TO postgres;

--
-- Name: user_federation_mapper; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_federation_mapper (
    id character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    federation_provider_id character varying(36) NOT NULL,
    federation_mapper_type character varying(255) NOT NULL,
    realm_id character varying(36) NOT NULL
);


ALTER TABLE public.user_federation_mapper OWNER TO postgres;

--
-- Name: user_federation_mapper_config; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_federation_mapper_config (
    user_federation_mapper_id character varying(36) NOT NULL,
    value character varying(255),
    name character varying(255) NOT NULL
);


ALTER TABLE public.user_federation_mapper_config OWNER TO postgres;

--
-- Name: user_federation_provider; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_federation_provider (
    id character varying(36) NOT NULL,
    changed_sync_period integer,
    display_name character varying(255),
    full_sync_period integer,
    last_sync integer,
    priority integer,
    provider_name character varying(255),
    realm_id character varying(36)
);


ALTER TABLE public.user_federation_provider OWNER TO postgres;

--
-- Name: user_group_membership; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_group_membership (
    group_id character varying(36) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_group_membership OWNER TO postgres;

--
-- Name: user_required_action; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_required_action (
    user_id character varying(36) NOT NULL,
    required_action character varying(255) DEFAULT ' '::character varying NOT NULL
);


ALTER TABLE public.user_required_action OWNER TO postgres;

--
-- Name: user_role_mapping; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_role_mapping (
    role_id character varying(255) NOT NULL,
    user_id character varying(36) NOT NULL
);


ALTER TABLE public.user_role_mapping OWNER TO postgres;

--
-- Name: user_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_session (
    id character varying(36) NOT NULL,
    auth_method character varying(255),
    ip_address character varying(255),
    last_session_refresh integer,
    login_username character varying(255),
    realm_id character varying(255),
    remember_me boolean DEFAULT false NOT NULL,
    started integer,
    user_id character varying(255),
    user_session_state integer,
    broker_session_id character varying(255),
    broker_user_id character varying(255)
);


ALTER TABLE public.user_session OWNER TO postgres;

--
-- Name: user_session_note; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_session_note (
    user_session character varying(36) NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(2048)
);


ALTER TABLE public.user_session_note OWNER TO postgres;

--
-- Name: username_login_failure; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.username_login_failure (
    realm_id character varying(36) NOT NULL,
    username character varying(255) NOT NULL,
    failed_login_not_before integer,
    last_failure bigint,
    last_ip_failure character varying(255),
    num_failures integer
);


ALTER TABLE public.username_login_failure OWNER TO postgres;

--
-- Name: web_origins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.web_origins (
    client_id character varying(36) NOT NULL,
    value character varying(255) NOT NULL
);


ALTER TABLE public.web_origins OWNER TO postgres;

--
-- Data for Name: admin_event_entity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admin_event_entity (id, admin_event_time, realm_id, operation_type, auth_realm_id, auth_client_id, auth_user_id, ip_address, resource_path, representation, error, resource_type) FROM stdin;
\.


--
-- Data for Name: associated_policy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.associated_policy (policy_id, associated_policy_id) FROM stdin;
91a2bab6-7aa2-44ec-83c7-c62fd3c9640c	796091fa-db96-4066-b6f8-de4ad475235c
\.


--
-- Data for Name: authentication_execution; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authentication_execution (id, alias, authenticator, realm_id, flow_id, requirement, priority, authenticator_flow, auth_flow_id, auth_config) FROM stdin;
6e863547-a104-4afa-ac2b-4494c5db5f7e	\N	auth-cookie	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	8638d3d4-ec18-46fc-a598-601ef65083b3	2	10	f	\N	\N
40d0f3d5-a3c6-4f8e-a486-b32ac778e7d4	\N	auth-spnego	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	8638d3d4-ec18-46fc-a598-601ef65083b3	3	20	f	\N	\N
5c41e6d3-7a85-43ff-8d73-4231bc31218d	\N	identity-provider-redirector	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	8638d3d4-ec18-46fc-a598-601ef65083b3	2	25	f	\N	\N
b215a5bf-5868-44f9-a66a-25e3fb653c18	\N	\N	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	8638d3d4-ec18-46fc-a598-601ef65083b3	2	30	t	6fc172e1-becb-497d-848d-5f700189db4c	\N
26a6114a-034b-4c1a-aa4f-dc4bd9224f3d	\N	auth-username-password-form	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	6fc172e1-becb-497d-848d-5f700189db4c	0	10	f	\N	\N
972e9522-eeb4-4ac4-881e-371cffb1361c	\N	\N	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	6fc172e1-becb-497d-848d-5f700189db4c	1	20	t	fbb58af3-7e27-4192-9b7e-c9603dc23d26	\N
34b68163-ae1e-46db-9d2a-6d31c26094f8	\N	conditional-user-configured	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	fbb58af3-7e27-4192-9b7e-c9603dc23d26	0	10	f	\N	\N
854c6317-db57-4dbd-a700-1d6448cf4b1b	\N	auth-otp-form	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	fbb58af3-7e27-4192-9b7e-c9603dc23d26	0	20	f	\N	\N
c35f279f-c257-4dad-bc65-b6d7633510ff	\N	direct-grant-validate-username	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	640709f3-8fe4-4f62-8461-9aa90c57c6f1	0	10	f	\N	\N
b90959b2-b088-4585-8495-ef40b2918a89	\N	direct-grant-validate-password	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	640709f3-8fe4-4f62-8461-9aa90c57c6f1	0	20	f	\N	\N
e7a9217f-276e-472f-94ee-0232103aac9d	\N	\N	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	640709f3-8fe4-4f62-8461-9aa90c57c6f1	1	30	t	f0acead5-a444-4d59-9641-44f834950895	\N
109cdc31-6e0e-4af4-b3e8-13697518b306	\N	conditional-user-configured	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	f0acead5-a444-4d59-9641-44f834950895	0	10	f	\N	\N
4b9284b6-88f7-4a0d-a7ea-f4634031d3f6	\N	direct-grant-validate-otp	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	f0acead5-a444-4d59-9641-44f834950895	0	20	f	\N	\N
7536e2c3-432b-4c8f-95ad-3da768aa94a2	\N	registration-page-form	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	31811049-db68-4215-aa35-064432b3666d	0	10	t	9c8ca9d8-3c42-4401-ba8e-42f6678de92d	\N
6d34d200-a351-47e3-8791-55933f8ec8d9	\N	registration-user-creation	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	9c8ca9d8-3c42-4401-ba8e-42f6678de92d	0	20	f	\N	\N
bd3279e5-399a-43df-b504-047eb19fc22b	\N	registration-profile-action	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	9c8ca9d8-3c42-4401-ba8e-42f6678de92d	0	40	f	\N	\N
7030db95-e5e3-48f9-a126-ad9bda1b4b18	\N	registration-password-action	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	9c8ca9d8-3c42-4401-ba8e-42f6678de92d	0	50	f	\N	\N
59069d43-e2fb-41cf-b6bf-4c8edeae9e18	\N	registration-recaptcha-action	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	9c8ca9d8-3c42-4401-ba8e-42f6678de92d	3	60	f	\N	\N
3359bbde-b7a6-460b-8dd4-65ec8bfdcbcb	\N	reset-credentials-choose-user	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	aded9432-5ac3-4fdb-8d8b-c7fd761deae9	0	10	f	\N	\N
d9ed3624-bc61-42c5-a2dd-e0f47372787d	\N	reset-credential-email	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	aded9432-5ac3-4fdb-8d8b-c7fd761deae9	0	20	f	\N	\N
473f99ea-68cc-4066-8c89-f276ed71beb2	\N	reset-password	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	aded9432-5ac3-4fdb-8d8b-c7fd761deae9	0	30	f	\N	\N
823b9f72-3c41-41f3-8cf5-140ea2dd0e19	\N	\N	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	aded9432-5ac3-4fdb-8d8b-c7fd761deae9	1	40	t	d0104b1c-5771-464f-a9e7-d87a264f7b8a	\N
a41ac455-10b4-4946-9c4d-4b0e61a21083	\N	conditional-user-configured	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	d0104b1c-5771-464f-a9e7-d87a264f7b8a	0	10	f	\N	\N
daf257a9-fde3-4362-94eb-d19954b5f5fc	\N	reset-otp	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	d0104b1c-5771-464f-a9e7-d87a264f7b8a	0	20	f	\N	\N
cd87d449-d169-47f3-babf-a730a9add6b5	\N	client-secret	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	3086f71c-ad54-42ec-9cfd-956375236c1b	2	10	f	\N	\N
d49ffc2e-4237-4db7-a394-b2d5994ad6e4	\N	client-jwt	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	3086f71c-ad54-42ec-9cfd-956375236c1b	2	20	f	\N	\N
5b904cac-8d31-493f-aa9c-1ee327498e3b	\N	client-secret-jwt	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	3086f71c-ad54-42ec-9cfd-956375236c1b	2	30	f	\N	\N
74731455-df17-433f-a637-f050105b0d3a	\N	client-x509	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	3086f71c-ad54-42ec-9cfd-956375236c1b	2	40	f	\N	\N
1764cba5-d9b0-4f5c-bef7-fcb653cda1ba	\N	idp-review-profile	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	7f039b59-4026-40b0-ac48-c713cf43654a	0	10	f	\N	a5d652a5-5b29-466f-921f-36e840f71527
eca0d2bc-d54c-4ef9-bb30-0e2558b96e58	\N	\N	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	7f039b59-4026-40b0-ac48-c713cf43654a	0	20	t	cefc8be6-a5cb-4b95-b049-feff15224305	\N
3ec75a21-6c03-4dbe-9757-e5e2fbda1803	\N	idp-create-user-if-unique	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	cefc8be6-a5cb-4b95-b049-feff15224305	2	10	f	\N	4c8ff0ff-3739-4d2b-a0f2-d3496be0fcb6
4fdc6e10-64d7-48d8-8a63-18b889cedab3	\N	\N	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	cefc8be6-a5cb-4b95-b049-feff15224305	2	20	t	5ad0efe7-7282-447b-a93b-77250aec40f4	\N
0c79e4ed-5042-4909-807b-cc0aa4d4665a	\N	idp-confirm-link	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	5ad0efe7-7282-447b-a93b-77250aec40f4	0	10	f	\N	\N
8769d718-5fbd-4e1c-8e08-b485f808410c	\N	\N	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	5ad0efe7-7282-447b-a93b-77250aec40f4	0	20	t	febd43c1-5c74-4a88-853b-ed08ddca6c4b	\N
872822ab-d6c4-4f9b-b531-420deac3302c	\N	idp-email-verification	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	febd43c1-5c74-4a88-853b-ed08ddca6c4b	2	10	f	\N	\N
7811ba42-6e17-4390-8c7f-84d5d6f94e6e	\N	\N	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	febd43c1-5c74-4a88-853b-ed08ddca6c4b	2	20	t	0d7f42a1-8d45-46e0-8408-2f50ad381da1	\N
3c8454ad-b1f5-4642-9f99-76bd5142b5a3	\N	idp-username-password-form	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	0d7f42a1-8d45-46e0-8408-2f50ad381da1	0	10	f	\N	\N
77a1dcf9-534a-4a8e-bdd4-24cd29be09b1	\N	\N	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	0d7f42a1-8d45-46e0-8408-2f50ad381da1	1	20	t	e1cb4592-7915-4d3c-ba36-801198fd30ce	\N
596389fe-8f88-4784-9708-fdb95e87fc79	\N	conditional-user-configured	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	e1cb4592-7915-4d3c-ba36-801198fd30ce	0	10	f	\N	\N
fa2ebac8-512c-43d3-a544-df7d2d49e12c	\N	auth-otp-form	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	e1cb4592-7915-4d3c-ba36-801198fd30ce	0	20	f	\N	\N
b44d2b0c-b377-41d2-891b-63fe82f7bc3e	\N	http-basic-authenticator	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	e11f21ce-ca20-4b71-8ec0-88f77fd42f3a	0	10	f	\N	\N
74d038cc-c621-4e44-8f0b-50aece9814ad	\N	docker-http-basic-authenticator	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	bd2bfea3-4945-40b4-8dc9-4829f870630b	0	10	f	\N	\N
26b38fa0-7699-45f3-82b0-232a9fdb1a42	\N	no-cookie-redirect	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	e7786956-5536-47f7-b65d-e965b5b51c56	0	10	f	\N	\N
132b7244-db43-4acd-b52c-5e33214433ea	\N	\N	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	e7786956-5536-47f7-b65d-e965b5b51c56	0	20	t	8a39dc03-39ad-4296-8b7c-352d9cde2603	\N
57f074c0-db3e-406c-b5ec-d935a01fb563	\N	basic-auth	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	8a39dc03-39ad-4296-8b7c-352d9cde2603	0	10	f	\N	\N
fce46156-70d9-438d-a15e-248e80c4fd69	\N	basic-auth-otp	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	8a39dc03-39ad-4296-8b7c-352d9cde2603	3	20	f	\N	\N
f72bf570-b1e6-4ec6-a1c4-8be10cc804f5	\N	auth-spnego	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	8a39dc03-39ad-4296-8b7c-352d9cde2603	3	30	f	\N	\N
4fde9bca-374e-45e9-a1e5-1891716da413	\N	auth-cookie	flo-dev	fbb7f577-e709-41ad-9969-e22ae6cc4360	2	10	f	\N	\N
c852d375-adea-4e1b-a8e0-22a8b5727013	\N	auth-spnego	flo-dev	fbb7f577-e709-41ad-9969-e22ae6cc4360	3	20	f	\N	\N
414f8bba-8221-49cb-a039-48a2eb2f419b	\N	identity-provider-redirector	flo-dev	fbb7f577-e709-41ad-9969-e22ae6cc4360	2	25	f	\N	\N
4ed8329b-f721-4d6c-ab33-cdf2c016292f	\N	\N	flo-dev	fbb7f577-e709-41ad-9969-e22ae6cc4360	2	30	t	f75e31e7-ad04-4f75-84a4-a4b8f61cf98c	\N
2ea195b7-0eb4-454e-89d4-9b1c270e64cf	\N	auth-username-password-form	flo-dev	f75e31e7-ad04-4f75-84a4-a4b8f61cf98c	0	10	f	\N	\N
3493f7ca-24f3-4cb9-90c3-62b7892054e7	\N	\N	flo-dev	f75e31e7-ad04-4f75-84a4-a4b8f61cf98c	1	20	t	8551e0f7-83df-4c9f-a6b0-c1f746deda9a	\N
a382cc5d-431f-49b0-a5fb-2c303c686c43	\N	conditional-user-configured	flo-dev	8551e0f7-83df-4c9f-a6b0-c1f746deda9a	0	10	f	\N	\N
807b1bb7-61e5-42a4-bb1f-3716198c4aa8	\N	auth-otp-form	flo-dev	8551e0f7-83df-4c9f-a6b0-c1f746deda9a	0	20	f	\N	\N
ac45b84c-311f-4179-9f74-011f09a213f0	\N	direct-grant-validate-username	flo-dev	9e52d2d1-3f65-4bc6-abf7-01d9c3415df2	0	10	f	\N	\N
2f3a1d4d-f8ea-4471-ae0e-8a153a54863e	\N	direct-grant-validate-password	flo-dev	9e52d2d1-3f65-4bc6-abf7-01d9c3415df2	0	20	f	\N	\N
c126e027-e29f-4a36-b7c0-a30712d0ac26	\N	\N	flo-dev	9e52d2d1-3f65-4bc6-abf7-01d9c3415df2	1	30	t	cc74767e-101c-4440-8219-18a9b1f66f8f	\N
f0690a2c-9880-44c6-8188-7d2c5add7033	\N	conditional-user-configured	flo-dev	cc74767e-101c-4440-8219-18a9b1f66f8f	0	10	f	\N	\N
93fcdd06-2149-426f-965d-8bb7d912a8f0	\N	direct-grant-validate-otp	flo-dev	cc74767e-101c-4440-8219-18a9b1f66f8f	0	20	f	\N	\N
2d7859f6-8d05-49f5-9157-c0f2035ab7e5	\N	registration-page-form	flo-dev	f1ee496e-849d-49de-8868-5f70834e6c4f	0	10	t	aa2ac69a-4436-49e7-946c-79b822b0b57d	\N
f1d75fc7-07ce-4613-8480-7784ea1fe62a	\N	registration-user-creation	flo-dev	aa2ac69a-4436-49e7-946c-79b822b0b57d	0	20	f	\N	\N
655ee62c-ff69-4a1c-bcd8-d2fca7341ae4	\N	registration-profile-action	flo-dev	aa2ac69a-4436-49e7-946c-79b822b0b57d	0	40	f	\N	\N
1235c167-9ed9-47fb-a06d-0badff305a0e	\N	registration-password-action	flo-dev	aa2ac69a-4436-49e7-946c-79b822b0b57d	0	50	f	\N	\N
9064e87d-d8b7-42ea-942a-5090f9f4defa	\N	registration-recaptcha-action	flo-dev	aa2ac69a-4436-49e7-946c-79b822b0b57d	3	60	f	\N	\N
8fc6bfbc-275b-4856-9d54-1c2939a817e9	\N	reset-credentials-choose-user	flo-dev	f2aacbb8-e413-44c1-8edf-b7b13ef287bb	0	10	f	\N	\N
7c3313ee-c1fb-46e6-97cb-529bbdf5aa68	\N	reset-credential-email	flo-dev	f2aacbb8-e413-44c1-8edf-b7b13ef287bb	0	20	f	\N	\N
642dd9e1-fbe1-4345-9f51-7a8729115e03	\N	reset-password	flo-dev	f2aacbb8-e413-44c1-8edf-b7b13ef287bb	0	30	f	\N	\N
10a071eb-6b51-40e1-a45b-9c61c0e06e60	\N	\N	flo-dev	f2aacbb8-e413-44c1-8edf-b7b13ef287bb	1	40	t	cb474fde-ac24-4b6e-a9f1-676831f8fb30	\N
09f0094b-b832-4fc7-9936-81dfba8ec478	\N	conditional-user-configured	flo-dev	cb474fde-ac24-4b6e-a9f1-676831f8fb30	0	10	f	\N	\N
fbef4bdf-53bc-410b-9a4f-672ab4b5a3f5	\N	reset-otp	flo-dev	cb474fde-ac24-4b6e-a9f1-676831f8fb30	0	20	f	\N	\N
5d9eb071-9c99-420e-8575-fa622badb624	\N	client-secret	flo-dev	c450f8a3-4a93-4273-a3b6-cf8fc11f8f4e	2	10	f	\N	\N
d1adb611-43c3-47cf-993a-9426f1e9ed14	\N	client-jwt	flo-dev	c450f8a3-4a93-4273-a3b6-cf8fc11f8f4e	2	20	f	\N	\N
bc5d589c-936e-4dd6-95dd-411738ee7e38	\N	client-secret-jwt	flo-dev	c450f8a3-4a93-4273-a3b6-cf8fc11f8f4e	2	30	f	\N	\N
3e247d48-396a-4319-a39b-d84d25a03ac4	\N	client-x509	flo-dev	c450f8a3-4a93-4273-a3b6-cf8fc11f8f4e	2	40	f	\N	\N
4b157811-1ff5-4498-9a10-5798c1d8cf8a	\N	idp-review-profile	flo-dev	575400bd-43e2-469c-aa94-304cdaed7290	0	10	f	\N	863c1e32-7c2c-45d7-90b0-90c303bf88ac
2d9d5a5c-c7c2-400d-bc5a-953497aa35aa	\N	\N	flo-dev	575400bd-43e2-469c-aa94-304cdaed7290	0	20	t	79511969-5a55-4d5c-8187-40b2752d7097	\N
e44756ba-af0a-4f33-ac32-e2b9d5af2b70	\N	idp-create-user-if-unique	flo-dev	79511969-5a55-4d5c-8187-40b2752d7097	2	10	f	\N	f48f3514-d6d3-4878-9b78-41297505ad39
82996bb0-556b-453d-9158-2fd9ce9ffb11	\N	\N	flo-dev	79511969-5a55-4d5c-8187-40b2752d7097	2	20	t	b75248b1-f496-4ed6-ab59-9156ce3e6a9c	\N
32d2f4d3-b846-428b-b6e2-418a745fc8a0	\N	idp-confirm-link	flo-dev	b75248b1-f496-4ed6-ab59-9156ce3e6a9c	0	10	f	\N	\N
dea920a4-250b-4f75-9064-946ee8c219d2	\N	\N	flo-dev	b75248b1-f496-4ed6-ab59-9156ce3e6a9c	0	20	t	a802a9c4-4106-402a-8968-e6520663824d	\N
fc20b72f-23e8-46b0-9217-9a17c20e504c	\N	idp-email-verification	flo-dev	a802a9c4-4106-402a-8968-e6520663824d	2	10	f	\N	\N
fa2c79e0-8c3c-45fb-baa2-80f16fb86f76	\N	\N	flo-dev	a802a9c4-4106-402a-8968-e6520663824d	2	20	t	f3ed021e-bdfd-4bca-b464-58106349cf27	\N
c754cef2-d21c-4c7e-a1fc-94a61b8e4eb6	\N	idp-username-password-form	flo-dev	f3ed021e-bdfd-4bca-b464-58106349cf27	0	10	f	\N	\N
c0c417dc-b3fa-4e28-94cb-a5c80e0e3277	\N	\N	flo-dev	f3ed021e-bdfd-4bca-b464-58106349cf27	1	20	t	1b3a22df-3bc5-476c-acf3-1aaae3db45e7	\N
5f534d62-c1ef-4ffc-8661-1967019fe166	\N	conditional-user-configured	flo-dev	1b3a22df-3bc5-476c-acf3-1aaae3db45e7	0	10	f	\N	\N
de919e07-6eee-43c6-ab65-670770613c9b	\N	auth-otp-form	flo-dev	1b3a22df-3bc5-476c-acf3-1aaae3db45e7	0	20	f	\N	\N
5361514e-ac56-46af-bbbf-55f962ffd804	\N	http-basic-authenticator	flo-dev	53915293-8de4-4aba-9776-3806a7ce3368	0	10	f	\N	\N
c5d53920-d91f-441d-826c-e8d96abd875a	\N	docker-http-basic-authenticator	flo-dev	7bd6cbec-f4e2-4fc8-9dc9-cd8ec1c34392	0	10	f	\N	\N
377fe440-23cd-4e25-950d-7399d9fe0930	\N	no-cookie-redirect	flo-dev	c33ee5e1-4a8a-4f5c-82c9-5f3276b76025	0	10	f	\N	\N
1d4e015f-72b0-4545-8dbb-999e21d0465a	\N	\N	flo-dev	c33ee5e1-4a8a-4f5c-82c9-5f3276b76025	0	20	t	3ad4c037-4e9e-45e3-962f-8750b2433bcb	\N
431cf7f6-4948-4b72-8160-5d2d38f27140	\N	basic-auth	flo-dev	3ad4c037-4e9e-45e3-962f-8750b2433bcb	0	10	f	\N	\N
84cb69e5-210c-4523-9e1c-2576ca3f299e	\N	basic-auth-otp	flo-dev	3ad4c037-4e9e-45e3-962f-8750b2433bcb	3	20	f	\N	\N
4a558a78-825c-4ea4-83e2-d4e232f62da3	\N	auth-spnego	flo-dev	3ad4c037-4e9e-45e3-962f-8750b2433bcb	3	30	f	\N	\N
\.


--
-- Data for Name: authentication_flow; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authentication_flow (id, alias, description, realm_id, provider_id, top_level, built_in) FROM stdin;
8638d3d4-ec18-46fc-a598-601ef65083b3	browser	browser based authentication	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	basic-flow	t	t
6fc172e1-becb-497d-848d-5f700189db4c	forms	Username, password, otp and other auth forms.	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	basic-flow	f	t
fbb58af3-7e27-4192-9b7e-c9603dc23d26	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	basic-flow	f	t
640709f3-8fe4-4f62-8461-9aa90c57c6f1	direct grant	OpenID Connect Resource Owner Grant	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	basic-flow	t	t
f0acead5-a444-4d59-9641-44f834950895	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	basic-flow	f	t
31811049-db68-4215-aa35-064432b3666d	registration	registration flow	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	basic-flow	t	t
9c8ca9d8-3c42-4401-ba8e-42f6678de92d	registration form	registration form	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	form-flow	f	t
aded9432-5ac3-4fdb-8d8b-c7fd761deae9	reset credentials	Reset credentials for a user if they forgot their password or something	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	basic-flow	t	t
d0104b1c-5771-464f-a9e7-d87a264f7b8a	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	basic-flow	f	t
3086f71c-ad54-42ec-9cfd-956375236c1b	clients	Base authentication for clients	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	client-flow	t	t
7f039b59-4026-40b0-ac48-c713cf43654a	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	basic-flow	t	t
cefc8be6-a5cb-4b95-b049-feff15224305	User creation or linking	Flow for the existing/non-existing user alternatives	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	basic-flow	f	t
5ad0efe7-7282-447b-a93b-77250aec40f4	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	basic-flow	f	t
febd43c1-5c74-4a88-853b-ed08ddca6c4b	Account verification options	Method with which to verity the existing account	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	basic-flow	f	t
0d7f42a1-8d45-46e0-8408-2f50ad381da1	Verify Existing Account by Re-authentication	Reauthentication of existing account	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	basic-flow	f	t
e1cb4592-7915-4d3c-ba36-801198fd30ce	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	basic-flow	f	t
e11f21ce-ca20-4b71-8ec0-88f77fd42f3a	saml ecp	SAML ECP Profile Authentication Flow	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	basic-flow	t	t
bd2bfea3-4945-40b4-8dc9-4829f870630b	docker auth	Used by Docker clients to authenticate against the IDP	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	basic-flow	t	t
e7786956-5536-47f7-b65d-e965b5b51c56	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	basic-flow	t	t
8a39dc03-39ad-4296-8b7c-352d9cde2603	Authentication Options	Authentication options.	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	basic-flow	f	t
fbb7f577-e709-41ad-9969-e22ae6cc4360	browser	browser based authentication	flo-dev	basic-flow	t	t
f75e31e7-ad04-4f75-84a4-a4b8f61cf98c	forms	Username, password, otp and other auth forms.	flo-dev	basic-flow	f	t
8551e0f7-83df-4c9f-a6b0-c1f746deda9a	Browser - Conditional OTP	Flow to determine if the OTP is required for the authentication	flo-dev	basic-flow	f	t
9e52d2d1-3f65-4bc6-abf7-01d9c3415df2	direct grant	OpenID Connect Resource Owner Grant	flo-dev	basic-flow	t	t
cc74767e-101c-4440-8219-18a9b1f66f8f	Direct Grant - Conditional OTP	Flow to determine if the OTP is required for the authentication	flo-dev	basic-flow	f	t
f1ee496e-849d-49de-8868-5f70834e6c4f	registration	registration flow	flo-dev	basic-flow	t	t
aa2ac69a-4436-49e7-946c-79b822b0b57d	registration form	registration form	flo-dev	form-flow	f	t
f2aacbb8-e413-44c1-8edf-b7b13ef287bb	reset credentials	Reset credentials for a user if they forgot their password or something	flo-dev	basic-flow	t	t
cb474fde-ac24-4b6e-a9f1-676831f8fb30	Reset - Conditional OTP	Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.	flo-dev	basic-flow	f	t
c450f8a3-4a93-4273-a3b6-cf8fc11f8f4e	clients	Base authentication for clients	flo-dev	client-flow	t	t
575400bd-43e2-469c-aa94-304cdaed7290	first broker login	Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account	flo-dev	basic-flow	t	t
79511969-5a55-4d5c-8187-40b2752d7097	User creation or linking	Flow for the existing/non-existing user alternatives	flo-dev	basic-flow	f	t
b75248b1-f496-4ed6-ab59-9156ce3e6a9c	Handle Existing Account	Handle what to do if there is existing account with same email/username like authenticated identity provider	flo-dev	basic-flow	f	t
a802a9c4-4106-402a-8968-e6520663824d	Account verification options	Method with which to verity the existing account	flo-dev	basic-flow	f	t
f3ed021e-bdfd-4bca-b464-58106349cf27	Verify Existing Account by Re-authentication	Reauthentication of existing account	flo-dev	basic-flow	f	t
1b3a22df-3bc5-476c-acf3-1aaae3db45e7	First broker login - Conditional OTP	Flow to determine if the OTP is required for the authentication	flo-dev	basic-flow	f	t
53915293-8de4-4aba-9776-3806a7ce3368	saml ecp	SAML ECP Profile Authentication Flow	flo-dev	basic-flow	t	t
7bd6cbec-f4e2-4fc8-9dc9-cd8ec1c34392	docker auth	Used by Docker clients to authenticate against the IDP	flo-dev	basic-flow	t	t
c33ee5e1-4a8a-4f5c-82c9-5f3276b76025	http challenge	An authentication flow based on challenge-response HTTP Authentication Schemes	flo-dev	basic-flow	t	t
3ad4c037-4e9e-45e3-962f-8750b2433bcb	Authentication Options	Authentication options.	flo-dev	basic-flow	f	t
\.


--
-- Data for Name: authenticator_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authenticator_config (id, alias, realm_id) FROM stdin;
a5d652a5-5b29-466f-921f-36e840f71527	review profile config	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8
4c8ff0ff-3739-4d2b-a0f2-d3496be0fcb6	create unique user config	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8
863c1e32-7c2c-45d7-90b0-90c303bf88ac	review profile config	flo-dev
f48f3514-d6d3-4878-9b78-41297505ad39	create unique user config	flo-dev
\.


--
-- Data for Name: authenticator_config_entry; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.authenticator_config_entry (authenticator_id, value, name) FROM stdin;
a5d652a5-5b29-466f-921f-36e840f71527	missing	update.profile.on.first.login
4c8ff0ff-3739-4d2b-a0f2-d3496be0fcb6	false	require.password.update.after.registration
863c1e32-7c2c-45d7-90b0-90c303bf88ac	missing	update.profile.on.first.login
f48f3514-d6d3-4878-9b78-41297505ad39	false	require.password.update.after.registration
\.


--
-- Data for Name: broker_link; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.broker_link (identity_provider, storage_provider_id, realm_id, broker_user_id, broker_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client (id, enabled, full_scope_allowed, client_id, not_before, public_client, secret, base_url, bearer_only, management_url, surrogate_auth_required, realm_id, protocol, node_rereg_timeout, frontchannel_logout, consent_required, name, service_accounts_enabled, client_authenticator_type, root_url, description, registration_token, standard_flow_enabled, implicit_flow_enabled, direct_access_grants_enabled, always_display_in_console) FROM stdin;
b21c75eb-cadf-4f68-929e-e4a352b75419	t	f	master-realm	0	f	\N	\N	t	\N	f	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	\N	0	f	f	master Realm	f	client-secret	\N	\N	\N	t	f	f	f
7417cca9-3f7c-44e0-b3d5-cba1caf21620	t	f	account	0	t	\N	/realms/master/account/	f	\N	f	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
efc9e679-02e5-47ae-8fb9-f5220a093ac0	t	f	account-console	0	t	\N	/realms/master/account/	f	\N	f	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
372e9c2e-9165-403e-823e-0f4701719bd3	t	f	broker	0	f	\N	\N	t	\N	f	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
eec06cf2-4948-4503-989b-a035474e93c3	t	f	security-admin-console	0	t	\N	/admin/master/console/	f	\N	f	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
9b7b402c-c766-40cd-a66b-9e4c014b7de5	t	f	admin-cli	0	t	\N	\N	f	\N	f	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
67cface5-a2c1-4604-bbda-60aaa4487e03	t	f	flo-dev-realm	0	f	\N	\N	t	\N	f	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	\N	0	f	f	flo-dev Realm	f	client-secret	\N	\N	\N	t	f	f	f
6c632f23-8c66-4693-b449-624437e7c1bf	t	f	realm-management	0	f	\N	\N	t	\N	f	flo-dev	openid-connect	0	f	f	${client_realm-management}	f	client-secret	\N	\N	\N	t	f	f	f
789b6c13-d278-42b9-89c3-d49416835d9d	t	f	account	0	t	\N	/realms/flo-dev/account/	f	\N	f	flo-dev	openid-connect	0	f	f	${client_account}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
a7e1d6c4-7d32-4062-aa46-0a726265e6be	t	f	account-console	0	t	\N	/realms/flo-dev/account/	f	\N	f	flo-dev	openid-connect	0	f	f	${client_account-console}	f	client-secret	${authBaseUrl}	\N	\N	t	f	f	f
aae5a78c-7957-49f3-acba-140069deac83	t	f	broker	0	f	\N	\N	t	\N	f	flo-dev	openid-connect	0	f	f	${client_broker}	f	client-secret	\N	\N	\N	t	f	f	f
58f6bf53-3f9f-4b00-9787-222d92d2e1a2	t	f	security-admin-console	0	t	\N	/admin/flo-dev/console/	f	\N	f	flo-dev	openid-connect	0	f	f	${client_security-admin-console}	f	client-secret	${authAdminUrl}	\N	\N	t	f	f	f
abebdad0-eb6f-458c-af1e-d291a0ec061b	t	f	admin-cli	0	t	\N	\N	f	\N	f	flo-dev	openid-connect	0	f	f	${client_admin-cli}	f	client-secret	\N	\N	\N	f	f	t	f
98374355-2b89-45c6-a6f6-31fe65a3f8b2	t	f	FLO_API_SECRET	0	f	ofBYMfWcT48VYenq8kh0jzdYegxxSPAZ	\N	f	\N	f	flo-dev	openid-connect	-1	f	f	\N	t	client-secret	\N	\N	\N	t	f	f	f
\.


--
-- Data for Name: client_attributes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_attributes (client_id, value, name) FROM stdin;
efc9e679-02e5-47ae-8fb9-f5220a093ac0	S256	pkce.code.challenge.method
eec06cf2-4948-4503-989b-a035474e93c3	S256	pkce.code.challenge.method
a7e1d6c4-7d32-4062-aa46-0a726265e6be	S256	pkce.code.challenge.method
58f6bf53-3f9f-4b00-9787-222d92d2e1a2	S256	pkce.code.challenge.method
98374355-2b89-45c6-a6f6-31fe65a3f8b2	true	backchannel.logout.session.required
98374355-2b89-45c6-a6f6-31fe65a3f8b2	false	backchannel.logout.revoke.offline.tokens
98374355-2b89-45c6-a6f6-31fe65a3f8b2	false	saml.artifact.binding
98374355-2b89-45c6-a6f6-31fe65a3f8b2	false	saml.server.signature
98374355-2b89-45c6-a6f6-31fe65a3f8b2	false	saml.server.signature.keyinfo.ext
98374355-2b89-45c6-a6f6-31fe65a3f8b2	false	saml.assertion.signature
98374355-2b89-45c6-a6f6-31fe65a3f8b2	false	saml.client.signature
98374355-2b89-45c6-a6f6-31fe65a3f8b2	false	saml.encrypt
98374355-2b89-45c6-a6f6-31fe65a3f8b2	false	saml.authnstatement
98374355-2b89-45c6-a6f6-31fe65a3f8b2	false	saml.onetimeuse.condition
98374355-2b89-45c6-a6f6-31fe65a3f8b2	false	saml_force_name_id_format
98374355-2b89-45c6-a6f6-31fe65a3f8b2	false	saml.allow.ecp.flow
98374355-2b89-45c6-a6f6-31fe65a3f8b2	false	saml.multivalued.roles
98374355-2b89-45c6-a6f6-31fe65a3f8b2	false	saml.force.post.binding
98374355-2b89-45c6-a6f6-31fe65a3f8b2	false	exclude.session.state.from.auth.response
98374355-2b89-45c6-a6f6-31fe65a3f8b2	false	oauth2.device.authorization.grant.enabled
98374355-2b89-45c6-a6f6-31fe65a3f8b2	false	oidc.ciba.grant.enabled
98374355-2b89-45c6-a6f6-31fe65a3f8b2	true	use.refresh.tokens
98374355-2b89-45c6-a6f6-31fe65a3f8b2	false	id.token.as.detached.signature
98374355-2b89-45c6-a6f6-31fe65a3f8b2	false	tls.client.certificate.bound.access.tokens
98374355-2b89-45c6-a6f6-31fe65a3f8b2	false	require.pushed.authorization.requests
98374355-2b89-45c6-a6f6-31fe65a3f8b2	false	client_credentials.use_refresh_token
98374355-2b89-45c6-a6f6-31fe65a3f8b2	false	token.response.type.bearer.lower-case
98374355-2b89-45c6-a6f6-31fe65a3f8b2	false	display.on.consent.screen
98374355-2b89-45c6-a6f6-31fe65a3f8b2	false	frontchannel.logout.session.required
98374355-2b89-45c6-a6f6-31fe65a3f8b2	{}	acr.loa.map
98374355-2b89-45c6-a6f6-31fe65a3f8b2	1670825153	client.secret.creation.time
\.


--
-- Data for Name: client_auth_flow_bindings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_auth_flow_bindings (client_id, flow_id, binding_name) FROM stdin;
\.


--
-- Data for Name: client_initial_access; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_initial_access (id, realm_id, "timestamp", expiration, count, remaining_count) FROM stdin;
\.


--
-- Data for Name: client_node_registrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_node_registrations (client_id, value, name) FROM stdin;
\.


--
-- Data for Name: client_scope; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_scope (id, name, realm_id, description, protocol) FROM stdin;
58dba37d-9afc-4d7c-8452-3845188ddd13	offline_access	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	OpenID Connect built-in scope: offline_access	openid-connect
ef681ffb-512f-4ffa-b5b0-f58b09331f73	role_list	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	SAML role list	saml
02c60c90-42a0-47fe-82ad-2f00d2565081	profile	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	OpenID Connect built-in scope: profile	openid-connect
9a781c4c-97ec-43be-8c19-afb75b52fa93	email	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	OpenID Connect built-in scope: email	openid-connect
e2f7910d-7196-4fd2-b42c-a8ce1a0187fb	address	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	OpenID Connect built-in scope: address	openid-connect
63bd6d13-95c1-43be-9ad7-f4a532f85ca1	phone	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	OpenID Connect built-in scope: phone	openid-connect
c74e1567-89b2-405c-ab3a-b6fe179214e2	roles	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	OpenID Connect scope for add user roles to the access token	openid-connect
160f9b39-a84f-4ae3-9635-92d6e44b5f85	web-origins	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	OpenID Connect scope for add allowed web origins to the access token	openid-connect
ffdc7bb0-7513-4893-85d6-0ed1bcd7bf46	microprofile-jwt	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	Microprofile - JWT built-in scope	openid-connect
26250cfe-8c33-4c58-b9f7-6e197d4b41a5	acr	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
d6c8cea3-c301-4230-82eb-9a9d21518836	offline_access	flo-dev	OpenID Connect built-in scope: offline_access	openid-connect
bb71a697-5575-400a-8d88-5353ca4ce58b	role_list	flo-dev	SAML role list	saml
05852017-81b6-4a14-b47d-775c2af82441	profile	flo-dev	OpenID Connect built-in scope: profile	openid-connect
5956f2d7-6e0c-4c3e-8fb2-73ceeeb8259a	email	flo-dev	OpenID Connect built-in scope: email	openid-connect
145ac4ba-deed-4e6d-8733-6a0b1661c050	address	flo-dev	OpenID Connect built-in scope: address	openid-connect
a9d62954-df3b-4257-bbfb-108e619cc19e	phone	flo-dev	OpenID Connect built-in scope: phone	openid-connect
287af0c7-72c0-43b6-bfcf-f86344615357	roles	flo-dev	OpenID Connect scope for add user roles to the access token	openid-connect
b871a7b1-0931-45f8-a490-1c3b2fcc4380	web-origins	flo-dev	OpenID Connect scope for add allowed web origins to the access token	openid-connect
b27c9329-5473-4e31-8eea-68f11c0856b7	microprofile-jwt	flo-dev	Microprofile - JWT built-in scope	openid-connect
2ff3aa09-c4c1-4464-b610-0e4437600829	acr	flo-dev	OpenID Connect scope for add acr (authentication context class reference) to the token	openid-connect
\.


--
-- Data for Name: client_scope_attributes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_scope_attributes (scope_id, value, name) FROM stdin;
58dba37d-9afc-4d7c-8452-3845188ddd13	true	display.on.consent.screen
58dba37d-9afc-4d7c-8452-3845188ddd13	${offlineAccessScopeConsentText}	consent.screen.text
ef681ffb-512f-4ffa-b5b0-f58b09331f73	true	display.on.consent.screen
ef681ffb-512f-4ffa-b5b0-f58b09331f73	${samlRoleListScopeConsentText}	consent.screen.text
02c60c90-42a0-47fe-82ad-2f00d2565081	true	display.on.consent.screen
02c60c90-42a0-47fe-82ad-2f00d2565081	${profileScopeConsentText}	consent.screen.text
02c60c90-42a0-47fe-82ad-2f00d2565081	true	include.in.token.scope
9a781c4c-97ec-43be-8c19-afb75b52fa93	true	display.on.consent.screen
9a781c4c-97ec-43be-8c19-afb75b52fa93	${emailScopeConsentText}	consent.screen.text
9a781c4c-97ec-43be-8c19-afb75b52fa93	true	include.in.token.scope
e2f7910d-7196-4fd2-b42c-a8ce1a0187fb	true	display.on.consent.screen
e2f7910d-7196-4fd2-b42c-a8ce1a0187fb	${addressScopeConsentText}	consent.screen.text
e2f7910d-7196-4fd2-b42c-a8ce1a0187fb	true	include.in.token.scope
63bd6d13-95c1-43be-9ad7-f4a532f85ca1	true	display.on.consent.screen
63bd6d13-95c1-43be-9ad7-f4a532f85ca1	${phoneScopeConsentText}	consent.screen.text
63bd6d13-95c1-43be-9ad7-f4a532f85ca1	true	include.in.token.scope
c74e1567-89b2-405c-ab3a-b6fe179214e2	true	display.on.consent.screen
c74e1567-89b2-405c-ab3a-b6fe179214e2	${rolesScopeConsentText}	consent.screen.text
c74e1567-89b2-405c-ab3a-b6fe179214e2	false	include.in.token.scope
160f9b39-a84f-4ae3-9635-92d6e44b5f85	false	display.on.consent.screen
160f9b39-a84f-4ae3-9635-92d6e44b5f85		consent.screen.text
160f9b39-a84f-4ae3-9635-92d6e44b5f85	false	include.in.token.scope
ffdc7bb0-7513-4893-85d6-0ed1bcd7bf46	false	display.on.consent.screen
ffdc7bb0-7513-4893-85d6-0ed1bcd7bf46	true	include.in.token.scope
26250cfe-8c33-4c58-b9f7-6e197d4b41a5	false	display.on.consent.screen
26250cfe-8c33-4c58-b9f7-6e197d4b41a5	false	include.in.token.scope
d6c8cea3-c301-4230-82eb-9a9d21518836	true	display.on.consent.screen
d6c8cea3-c301-4230-82eb-9a9d21518836	${offlineAccessScopeConsentText}	consent.screen.text
bb71a697-5575-400a-8d88-5353ca4ce58b	true	display.on.consent.screen
bb71a697-5575-400a-8d88-5353ca4ce58b	${samlRoleListScopeConsentText}	consent.screen.text
05852017-81b6-4a14-b47d-775c2af82441	true	display.on.consent.screen
05852017-81b6-4a14-b47d-775c2af82441	${profileScopeConsentText}	consent.screen.text
05852017-81b6-4a14-b47d-775c2af82441	true	include.in.token.scope
5956f2d7-6e0c-4c3e-8fb2-73ceeeb8259a	true	display.on.consent.screen
5956f2d7-6e0c-4c3e-8fb2-73ceeeb8259a	${emailScopeConsentText}	consent.screen.text
5956f2d7-6e0c-4c3e-8fb2-73ceeeb8259a	true	include.in.token.scope
145ac4ba-deed-4e6d-8733-6a0b1661c050	true	display.on.consent.screen
145ac4ba-deed-4e6d-8733-6a0b1661c050	${addressScopeConsentText}	consent.screen.text
145ac4ba-deed-4e6d-8733-6a0b1661c050	true	include.in.token.scope
a9d62954-df3b-4257-bbfb-108e619cc19e	true	display.on.consent.screen
a9d62954-df3b-4257-bbfb-108e619cc19e	${phoneScopeConsentText}	consent.screen.text
a9d62954-df3b-4257-bbfb-108e619cc19e	true	include.in.token.scope
287af0c7-72c0-43b6-bfcf-f86344615357	true	display.on.consent.screen
287af0c7-72c0-43b6-bfcf-f86344615357	${rolesScopeConsentText}	consent.screen.text
287af0c7-72c0-43b6-bfcf-f86344615357	false	include.in.token.scope
b871a7b1-0931-45f8-a490-1c3b2fcc4380	false	display.on.consent.screen
b871a7b1-0931-45f8-a490-1c3b2fcc4380		consent.screen.text
b871a7b1-0931-45f8-a490-1c3b2fcc4380	false	include.in.token.scope
b27c9329-5473-4e31-8eea-68f11c0856b7	false	display.on.consent.screen
b27c9329-5473-4e31-8eea-68f11c0856b7	true	include.in.token.scope
2ff3aa09-c4c1-4464-b610-0e4437600829	false	display.on.consent.screen
2ff3aa09-c4c1-4464-b610-0e4437600829	false	include.in.token.scope
\.


--
-- Data for Name: client_scope_client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_scope_client (client_id, scope_id, default_scope) FROM stdin;
7417cca9-3f7c-44e0-b3d5-cba1caf21620	02c60c90-42a0-47fe-82ad-2f00d2565081	t
7417cca9-3f7c-44e0-b3d5-cba1caf21620	c74e1567-89b2-405c-ab3a-b6fe179214e2	t
7417cca9-3f7c-44e0-b3d5-cba1caf21620	26250cfe-8c33-4c58-b9f7-6e197d4b41a5	t
7417cca9-3f7c-44e0-b3d5-cba1caf21620	9a781c4c-97ec-43be-8c19-afb75b52fa93	t
7417cca9-3f7c-44e0-b3d5-cba1caf21620	160f9b39-a84f-4ae3-9635-92d6e44b5f85	t
7417cca9-3f7c-44e0-b3d5-cba1caf21620	58dba37d-9afc-4d7c-8452-3845188ddd13	f
7417cca9-3f7c-44e0-b3d5-cba1caf21620	63bd6d13-95c1-43be-9ad7-f4a532f85ca1	f
7417cca9-3f7c-44e0-b3d5-cba1caf21620	e2f7910d-7196-4fd2-b42c-a8ce1a0187fb	f
7417cca9-3f7c-44e0-b3d5-cba1caf21620	ffdc7bb0-7513-4893-85d6-0ed1bcd7bf46	f
efc9e679-02e5-47ae-8fb9-f5220a093ac0	02c60c90-42a0-47fe-82ad-2f00d2565081	t
efc9e679-02e5-47ae-8fb9-f5220a093ac0	c74e1567-89b2-405c-ab3a-b6fe179214e2	t
efc9e679-02e5-47ae-8fb9-f5220a093ac0	26250cfe-8c33-4c58-b9f7-6e197d4b41a5	t
efc9e679-02e5-47ae-8fb9-f5220a093ac0	9a781c4c-97ec-43be-8c19-afb75b52fa93	t
efc9e679-02e5-47ae-8fb9-f5220a093ac0	160f9b39-a84f-4ae3-9635-92d6e44b5f85	t
efc9e679-02e5-47ae-8fb9-f5220a093ac0	58dba37d-9afc-4d7c-8452-3845188ddd13	f
efc9e679-02e5-47ae-8fb9-f5220a093ac0	63bd6d13-95c1-43be-9ad7-f4a532f85ca1	f
efc9e679-02e5-47ae-8fb9-f5220a093ac0	e2f7910d-7196-4fd2-b42c-a8ce1a0187fb	f
efc9e679-02e5-47ae-8fb9-f5220a093ac0	ffdc7bb0-7513-4893-85d6-0ed1bcd7bf46	f
9b7b402c-c766-40cd-a66b-9e4c014b7de5	02c60c90-42a0-47fe-82ad-2f00d2565081	t
9b7b402c-c766-40cd-a66b-9e4c014b7de5	c74e1567-89b2-405c-ab3a-b6fe179214e2	t
9b7b402c-c766-40cd-a66b-9e4c014b7de5	26250cfe-8c33-4c58-b9f7-6e197d4b41a5	t
9b7b402c-c766-40cd-a66b-9e4c014b7de5	9a781c4c-97ec-43be-8c19-afb75b52fa93	t
9b7b402c-c766-40cd-a66b-9e4c014b7de5	160f9b39-a84f-4ae3-9635-92d6e44b5f85	t
9b7b402c-c766-40cd-a66b-9e4c014b7de5	58dba37d-9afc-4d7c-8452-3845188ddd13	f
9b7b402c-c766-40cd-a66b-9e4c014b7de5	63bd6d13-95c1-43be-9ad7-f4a532f85ca1	f
9b7b402c-c766-40cd-a66b-9e4c014b7de5	e2f7910d-7196-4fd2-b42c-a8ce1a0187fb	f
9b7b402c-c766-40cd-a66b-9e4c014b7de5	ffdc7bb0-7513-4893-85d6-0ed1bcd7bf46	f
372e9c2e-9165-403e-823e-0f4701719bd3	02c60c90-42a0-47fe-82ad-2f00d2565081	t
372e9c2e-9165-403e-823e-0f4701719bd3	c74e1567-89b2-405c-ab3a-b6fe179214e2	t
372e9c2e-9165-403e-823e-0f4701719bd3	26250cfe-8c33-4c58-b9f7-6e197d4b41a5	t
372e9c2e-9165-403e-823e-0f4701719bd3	9a781c4c-97ec-43be-8c19-afb75b52fa93	t
372e9c2e-9165-403e-823e-0f4701719bd3	160f9b39-a84f-4ae3-9635-92d6e44b5f85	t
372e9c2e-9165-403e-823e-0f4701719bd3	58dba37d-9afc-4d7c-8452-3845188ddd13	f
372e9c2e-9165-403e-823e-0f4701719bd3	63bd6d13-95c1-43be-9ad7-f4a532f85ca1	f
372e9c2e-9165-403e-823e-0f4701719bd3	e2f7910d-7196-4fd2-b42c-a8ce1a0187fb	f
372e9c2e-9165-403e-823e-0f4701719bd3	ffdc7bb0-7513-4893-85d6-0ed1bcd7bf46	f
b21c75eb-cadf-4f68-929e-e4a352b75419	02c60c90-42a0-47fe-82ad-2f00d2565081	t
b21c75eb-cadf-4f68-929e-e4a352b75419	c74e1567-89b2-405c-ab3a-b6fe179214e2	t
b21c75eb-cadf-4f68-929e-e4a352b75419	26250cfe-8c33-4c58-b9f7-6e197d4b41a5	t
b21c75eb-cadf-4f68-929e-e4a352b75419	9a781c4c-97ec-43be-8c19-afb75b52fa93	t
b21c75eb-cadf-4f68-929e-e4a352b75419	160f9b39-a84f-4ae3-9635-92d6e44b5f85	t
b21c75eb-cadf-4f68-929e-e4a352b75419	58dba37d-9afc-4d7c-8452-3845188ddd13	f
b21c75eb-cadf-4f68-929e-e4a352b75419	63bd6d13-95c1-43be-9ad7-f4a532f85ca1	f
b21c75eb-cadf-4f68-929e-e4a352b75419	e2f7910d-7196-4fd2-b42c-a8ce1a0187fb	f
b21c75eb-cadf-4f68-929e-e4a352b75419	ffdc7bb0-7513-4893-85d6-0ed1bcd7bf46	f
eec06cf2-4948-4503-989b-a035474e93c3	02c60c90-42a0-47fe-82ad-2f00d2565081	t
eec06cf2-4948-4503-989b-a035474e93c3	c74e1567-89b2-405c-ab3a-b6fe179214e2	t
eec06cf2-4948-4503-989b-a035474e93c3	26250cfe-8c33-4c58-b9f7-6e197d4b41a5	t
eec06cf2-4948-4503-989b-a035474e93c3	9a781c4c-97ec-43be-8c19-afb75b52fa93	t
eec06cf2-4948-4503-989b-a035474e93c3	160f9b39-a84f-4ae3-9635-92d6e44b5f85	t
eec06cf2-4948-4503-989b-a035474e93c3	58dba37d-9afc-4d7c-8452-3845188ddd13	f
eec06cf2-4948-4503-989b-a035474e93c3	63bd6d13-95c1-43be-9ad7-f4a532f85ca1	f
eec06cf2-4948-4503-989b-a035474e93c3	e2f7910d-7196-4fd2-b42c-a8ce1a0187fb	f
eec06cf2-4948-4503-989b-a035474e93c3	ffdc7bb0-7513-4893-85d6-0ed1bcd7bf46	f
789b6c13-d278-42b9-89c3-d49416835d9d	5956f2d7-6e0c-4c3e-8fb2-73ceeeb8259a	t
789b6c13-d278-42b9-89c3-d49416835d9d	2ff3aa09-c4c1-4464-b610-0e4437600829	t
789b6c13-d278-42b9-89c3-d49416835d9d	287af0c7-72c0-43b6-bfcf-f86344615357	t
789b6c13-d278-42b9-89c3-d49416835d9d	05852017-81b6-4a14-b47d-775c2af82441	t
789b6c13-d278-42b9-89c3-d49416835d9d	b871a7b1-0931-45f8-a490-1c3b2fcc4380	t
789b6c13-d278-42b9-89c3-d49416835d9d	d6c8cea3-c301-4230-82eb-9a9d21518836	f
789b6c13-d278-42b9-89c3-d49416835d9d	a9d62954-df3b-4257-bbfb-108e619cc19e	f
789b6c13-d278-42b9-89c3-d49416835d9d	b27c9329-5473-4e31-8eea-68f11c0856b7	f
789b6c13-d278-42b9-89c3-d49416835d9d	145ac4ba-deed-4e6d-8733-6a0b1661c050	f
a7e1d6c4-7d32-4062-aa46-0a726265e6be	5956f2d7-6e0c-4c3e-8fb2-73ceeeb8259a	t
a7e1d6c4-7d32-4062-aa46-0a726265e6be	2ff3aa09-c4c1-4464-b610-0e4437600829	t
a7e1d6c4-7d32-4062-aa46-0a726265e6be	287af0c7-72c0-43b6-bfcf-f86344615357	t
a7e1d6c4-7d32-4062-aa46-0a726265e6be	05852017-81b6-4a14-b47d-775c2af82441	t
a7e1d6c4-7d32-4062-aa46-0a726265e6be	b871a7b1-0931-45f8-a490-1c3b2fcc4380	t
a7e1d6c4-7d32-4062-aa46-0a726265e6be	d6c8cea3-c301-4230-82eb-9a9d21518836	f
a7e1d6c4-7d32-4062-aa46-0a726265e6be	a9d62954-df3b-4257-bbfb-108e619cc19e	f
a7e1d6c4-7d32-4062-aa46-0a726265e6be	b27c9329-5473-4e31-8eea-68f11c0856b7	f
a7e1d6c4-7d32-4062-aa46-0a726265e6be	145ac4ba-deed-4e6d-8733-6a0b1661c050	f
abebdad0-eb6f-458c-af1e-d291a0ec061b	5956f2d7-6e0c-4c3e-8fb2-73ceeeb8259a	t
abebdad0-eb6f-458c-af1e-d291a0ec061b	2ff3aa09-c4c1-4464-b610-0e4437600829	t
abebdad0-eb6f-458c-af1e-d291a0ec061b	287af0c7-72c0-43b6-bfcf-f86344615357	t
abebdad0-eb6f-458c-af1e-d291a0ec061b	05852017-81b6-4a14-b47d-775c2af82441	t
abebdad0-eb6f-458c-af1e-d291a0ec061b	b871a7b1-0931-45f8-a490-1c3b2fcc4380	t
abebdad0-eb6f-458c-af1e-d291a0ec061b	d6c8cea3-c301-4230-82eb-9a9d21518836	f
abebdad0-eb6f-458c-af1e-d291a0ec061b	a9d62954-df3b-4257-bbfb-108e619cc19e	f
abebdad0-eb6f-458c-af1e-d291a0ec061b	b27c9329-5473-4e31-8eea-68f11c0856b7	f
abebdad0-eb6f-458c-af1e-d291a0ec061b	145ac4ba-deed-4e6d-8733-6a0b1661c050	f
aae5a78c-7957-49f3-acba-140069deac83	5956f2d7-6e0c-4c3e-8fb2-73ceeeb8259a	t
aae5a78c-7957-49f3-acba-140069deac83	2ff3aa09-c4c1-4464-b610-0e4437600829	t
aae5a78c-7957-49f3-acba-140069deac83	287af0c7-72c0-43b6-bfcf-f86344615357	t
aae5a78c-7957-49f3-acba-140069deac83	05852017-81b6-4a14-b47d-775c2af82441	t
aae5a78c-7957-49f3-acba-140069deac83	b871a7b1-0931-45f8-a490-1c3b2fcc4380	t
aae5a78c-7957-49f3-acba-140069deac83	d6c8cea3-c301-4230-82eb-9a9d21518836	f
aae5a78c-7957-49f3-acba-140069deac83	a9d62954-df3b-4257-bbfb-108e619cc19e	f
aae5a78c-7957-49f3-acba-140069deac83	b27c9329-5473-4e31-8eea-68f11c0856b7	f
aae5a78c-7957-49f3-acba-140069deac83	145ac4ba-deed-4e6d-8733-6a0b1661c050	f
6c632f23-8c66-4693-b449-624437e7c1bf	5956f2d7-6e0c-4c3e-8fb2-73ceeeb8259a	t
6c632f23-8c66-4693-b449-624437e7c1bf	2ff3aa09-c4c1-4464-b610-0e4437600829	t
6c632f23-8c66-4693-b449-624437e7c1bf	287af0c7-72c0-43b6-bfcf-f86344615357	t
6c632f23-8c66-4693-b449-624437e7c1bf	05852017-81b6-4a14-b47d-775c2af82441	t
6c632f23-8c66-4693-b449-624437e7c1bf	b871a7b1-0931-45f8-a490-1c3b2fcc4380	t
6c632f23-8c66-4693-b449-624437e7c1bf	d6c8cea3-c301-4230-82eb-9a9d21518836	f
6c632f23-8c66-4693-b449-624437e7c1bf	a9d62954-df3b-4257-bbfb-108e619cc19e	f
6c632f23-8c66-4693-b449-624437e7c1bf	b27c9329-5473-4e31-8eea-68f11c0856b7	f
6c632f23-8c66-4693-b449-624437e7c1bf	145ac4ba-deed-4e6d-8733-6a0b1661c050	f
58f6bf53-3f9f-4b00-9787-222d92d2e1a2	5956f2d7-6e0c-4c3e-8fb2-73ceeeb8259a	t
58f6bf53-3f9f-4b00-9787-222d92d2e1a2	2ff3aa09-c4c1-4464-b610-0e4437600829	t
58f6bf53-3f9f-4b00-9787-222d92d2e1a2	287af0c7-72c0-43b6-bfcf-f86344615357	t
58f6bf53-3f9f-4b00-9787-222d92d2e1a2	05852017-81b6-4a14-b47d-775c2af82441	t
58f6bf53-3f9f-4b00-9787-222d92d2e1a2	b871a7b1-0931-45f8-a490-1c3b2fcc4380	t
58f6bf53-3f9f-4b00-9787-222d92d2e1a2	d6c8cea3-c301-4230-82eb-9a9d21518836	f
58f6bf53-3f9f-4b00-9787-222d92d2e1a2	a9d62954-df3b-4257-bbfb-108e619cc19e	f
58f6bf53-3f9f-4b00-9787-222d92d2e1a2	b27c9329-5473-4e31-8eea-68f11c0856b7	f
58f6bf53-3f9f-4b00-9787-222d92d2e1a2	145ac4ba-deed-4e6d-8733-6a0b1661c050	f
98374355-2b89-45c6-a6f6-31fe65a3f8b2	5956f2d7-6e0c-4c3e-8fb2-73ceeeb8259a	t
98374355-2b89-45c6-a6f6-31fe65a3f8b2	2ff3aa09-c4c1-4464-b610-0e4437600829	t
98374355-2b89-45c6-a6f6-31fe65a3f8b2	287af0c7-72c0-43b6-bfcf-f86344615357	t
98374355-2b89-45c6-a6f6-31fe65a3f8b2	05852017-81b6-4a14-b47d-775c2af82441	t
98374355-2b89-45c6-a6f6-31fe65a3f8b2	b871a7b1-0931-45f8-a490-1c3b2fcc4380	t
98374355-2b89-45c6-a6f6-31fe65a3f8b2	d6c8cea3-c301-4230-82eb-9a9d21518836	f
98374355-2b89-45c6-a6f6-31fe65a3f8b2	a9d62954-df3b-4257-bbfb-108e619cc19e	f
98374355-2b89-45c6-a6f6-31fe65a3f8b2	b27c9329-5473-4e31-8eea-68f11c0856b7	f
98374355-2b89-45c6-a6f6-31fe65a3f8b2	145ac4ba-deed-4e6d-8733-6a0b1661c050	f
\.


--
-- Data for Name: client_scope_role_mapping; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_scope_role_mapping (scope_id, role_id) FROM stdin;
58dba37d-9afc-4d7c-8452-3845188ddd13	466a0bcd-f1b7-4f65-949c-4db8ccae974a
d6c8cea3-c301-4230-82eb-9a9d21518836	962e3b5a-b8b5-4eea-90c1-5bea920dba44
\.


--
-- Data for Name: client_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_session (id, client_id, redirect_uri, state, "timestamp", session_id, auth_method, realm_id, auth_user_id, current_action) FROM stdin;
\.


--
-- Data for Name: client_session_auth_status; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_session_auth_status (authenticator, status, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_note; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_prot_mapper; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_session_prot_mapper (protocol_mapper_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_session_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_session_role (role_id, client_session) FROM stdin;
\.


--
-- Data for Name: client_user_session_note; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client_user_session_note (name, value, client_session) FROM stdin;
\.


--
-- Data for Name: component; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.component (id, name, parent_id, provider_id, provider_type, realm_id, sub_type) FROM stdin;
8ca8c7f1-43ff-43df-91dc-04cf5af0ab56	Trusted Hosts	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	anonymous
db6dedae-b0b6-40da-b082-43ab982aedc3	Consent Required	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	anonymous
c335f481-42e9-4d5c-9e3f-cc52b6135bf2	Full Scope Disabled	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	anonymous
df67013a-22d0-46b1-ac84-550d756db9ea	Max Clients Limit	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	anonymous
234d4879-ce66-4638-b045-5baf20599453	Allowed Protocol Mapper Types	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	anonymous
3d11f565-1fa6-461d-a3c3-103071e2954d	Allowed Client Scopes	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	anonymous
9c852b5c-4dce-40c2-8296-5c40fc5772ba	Allowed Protocol Mapper Types	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	authenticated
d2c655b1-e3fb-4afa-8f79-5d02802d3801	Allowed Client Scopes	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	authenticated
7ada8c28-fcaf-4960-8ea5-5889b0fdcb32	rsa-generated	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	rsa-generated	org.keycloak.keys.KeyProvider	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	\N
99939143-64d5-41ad-8741-0c5249b835f2	rsa-enc-generated	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	rsa-enc-generated	org.keycloak.keys.KeyProvider	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	\N
7e38d8e8-aae5-4fa7-89ad-422c84d371a5	hmac-generated	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	hmac-generated	org.keycloak.keys.KeyProvider	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	\N
6af9d662-7157-48a1-8a14-6bed0e7d8243	aes-generated	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	aes-generated	org.keycloak.keys.KeyProvider	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	\N
93570308-0f47-46c6-92d3-2bf9fbe5c0ff	rsa-generated	flo-dev	rsa-generated	org.keycloak.keys.KeyProvider	flo-dev	\N
d43c3b94-6344-4743-9c2b-fb64d7927eb1	rsa-enc-generated	flo-dev	rsa-enc-generated	org.keycloak.keys.KeyProvider	flo-dev	\N
beb7dade-d7b3-42a8-9bbe-a975f0213705	hmac-generated	flo-dev	hmac-generated	org.keycloak.keys.KeyProvider	flo-dev	\N
27306c6d-cb0a-40f9-bfe8-ca842e2b8774	aes-generated	flo-dev	aes-generated	org.keycloak.keys.KeyProvider	flo-dev	\N
847bd3f8-bcd6-4eeb-a646-72612cd6d4f1	Trusted Hosts	flo-dev	trusted-hosts	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	flo-dev	anonymous
e2e51800-4161-4ae1-86d5-4ee90666da93	Consent Required	flo-dev	consent-required	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	flo-dev	anonymous
e1c1f05d-f8d8-4eae-bb34-ed82ff774dd4	Full Scope Disabled	flo-dev	scope	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	flo-dev	anonymous
c2faf1f1-705d-4a7c-8f2f-03fba16f9f7b	Max Clients Limit	flo-dev	max-clients	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	flo-dev	anonymous
3f4fdf59-c86f-4f1b-93dd-1746cd6c6dce	Allowed Protocol Mapper Types	flo-dev	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	flo-dev	anonymous
841cc9f5-8dc5-493f-af79-8a1d25f0d966	Allowed Client Scopes	flo-dev	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	flo-dev	anonymous
4004e0f9-ec31-4650-bb32-0466677294ac	Allowed Protocol Mapper Types	flo-dev	allowed-protocol-mappers	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	flo-dev	authenticated
d14fcb96-89bd-4598-a299-04e47f538004	Allowed Client Scopes	flo-dev	allowed-client-templates	org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy	flo-dev	authenticated
f3ede06d-5d41-41b7-b3b7-ee2168d24b6c	\N	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	declarative-user-profile	org.keycloak.userprofile.UserProfileProvider	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	\N
\.


--
-- Data for Name: component_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.component_config (id, component_id, name, value) FROM stdin;
c4e25706-7796-46de-869d-d7ea98c27c91	234d4879-ce66-4638-b045-5baf20599453	allowed-protocol-mapper-types	saml-user-property-mapper
bfdbbae4-85e4-42d8-a859-6a8fa9df29a1	234d4879-ce66-4638-b045-5baf20599453	allowed-protocol-mapper-types	saml-user-attribute-mapper
ebc13cdc-eae3-4ac2-b363-6c5ebdf8e411	234d4879-ce66-4638-b045-5baf20599453	allowed-protocol-mapper-types	oidc-address-mapper
2ab608da-e2fa-4187-8ef6-125eec0fe391	234d4879-ce66-4638-b045-5baf20599453	allowed-protocol-mapper-types	oidc-full-name-mapper
52178ace-4f89-4b9b-b3da-1232c8419bf8	234d4879-ce66-4638-b045-5baf20599453	allowed-protocol-mapper-types	saml-role-list-mapper
d822edf2-6991-4575-8bc3-5a6357eae101	234d4879-ce66-4638-b045-5baf20599453	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
919a02ca-ef4f-44f1-a7d8-8efaaab8b8a1	234d4879-ce66-4638-b045-5baf20599453	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
0ad99e1e-c1ae-4995-8e41-5e180fac33b7	234d4879-ce66-4638-b045-5baf20599453	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
8c6ab6fe-4ca8-4a86-b215-1361eb0575ff	df67013a-22d0-46b1-ac84-550d756db9ea	max-clients	200
a80f23e1-39b6-40fe-8a0c-78318fe79763	3d11f565-1fa6-461d-a3c3-103071e2954d	allow-default-scopes	true
d9f982e7-8ecd-4ca4-a4e8-4479dddde323	9c852b5c-4dce-40c2-8296-5c40fc5772ba	allowed-protocol-mapper-types	saml-user-attribute-mapper
8d8af993-fd20-4f8a-975c-8f7db6f5e819	9c852b5c-4dce-40c2-8296-5c40fc5772ba	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
c92adc0d-a21f-43aa-8dba-9c3eb940080d	9c852b5c-4dce-40c2-8296-5c40fc5772ba	allowed-protocol-mapper-types	saml-user-property-mapper
3b223220-d650-49e4-b76a-53a1b2200aed	9c852b5c-4dce-40c2-8296-5c40fc5772ba	allowed-protocol-mapper-types	oidc-address-mapper
5556a27c-4352-4cb8-bcc7-5568ae0fd2ce	9c852b5c-4dce-40c2-8296-5c40fc5772ba	allowed-protocol-mapper-types	oidc-full-name-mapper
5c793d0f-e5e8-49f2-bc5e-af933369ea10	9c852b5c-4dce-40c2-8296-5c40fc5772ba	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
b220cf43-5c99-4c4b-9467-1578136b089c	9c852b5c-4dce-40c2-8296-5c40fc5772ba	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
a5a0171b-169c-4940-bb1b-3dd8e31b087f	9c852b5c-4dce-40c2-8296-5c40fc5772ba	allowed-protocol-mapper-types	saml-role-list-mapper
745219ab-abf5-4aec-8745-b97bde4c46cd	d2c655b1-e3fb-4afa-8f79-5d02802d3801	allow-default-scopes	true
72939682-d53e-4a99-9d35-7bca90fd403d	8ca8c7f1-43ff-43df-91dc-04cf5af0ab56	host-sending-registration-request-must-match	true
10f386aa-f263-4910-8906-b50691648f4f	8ca8c7f1-43ff-43df-91dc-04cf5af0ab56	client-uris-must-match	true
107a1bb8-896b-4000-ae51-5c63406a24c8	99939143-64d5-41ad-8741-0c5249b835f2	priority	100
904bb0a4-84a9-4c0b-8d86-1061324a09f3	99939143-64d5-41ad-8741-0c5249b835f2	privateKey	MIIEowIBAAKCAQEAzUBQzt6R1O+LqyP1auzD5n/ImjtYRmHvx7wJTk7KjGqJNiz0yFdbFWT9kT9m4wHeumMWL4lm5dhQpHNSfFNJ+3bE494eKFiFMKaQL0fNpcgZgPb5kTO0P1QiTYGUqDr/2nSkCNzfYN7s67mNGvyMEcQLKYWF5eYtuT4VMF0xcBYPggmuyqwql0wYUG74tcRZiNi3jO3WETSMgMceySgDeNoNbybSmB57aG7raN3WkrfJtWL75D1VYXDhmP8u+8WsuQp+azIMqBTlqntntXDxD31zWOm7/P6q0U5Spi76uLCEwMcRtDPksU3MRCIX14GdZQNNuqnPHWHzOKgDoqMKMQIDAQABAoIBAGLYC1JkmyRJrCBh88lndjwl46xq0esrNPciVfTxOtf+Yk/FvKhScVnPRdHSD7FY8DMgjsmbyQL9dnCL3Phkf+dq3gzCphFV9+ZjAGLUmHOy9p1F0xAbLz2kPdTHh5iwuRAyReDCxYx4Lu6icBLD9oyDtcBsPfxmKjTgcgHVj35jNIwRrzed+/9rHhxvUD8G4pJJf8gRhMztpqyTAJucAChLGV6VSt74sFeQ1wuewCzyZnnP+dybGuZWiDWaMjWHCmYBJfJow0XPGL0ggORyc5Z0PmhbAg2MkU7pFZYSvlJK2hIfiJumdRGNx5RwNHNb81ZOcP6CPZ81InUfLwOmQUECgYEA6LWuIYfmwtOyrrYn5n3bPk19TLdnUv+jLDrOLjz3xRukPHX2G+tvf9MpuJyfTZB/XQ4aFENDX2x9uyiGLUNkAdpvD2xF3x7JaeGDWANkQQB3fvRn2iaRk1YUp8I4PMAYr+yJsfTAEiQcPuw0J4XfpY+WKvErYDjN6pVrzaOGBQkCgYEA4csdXlGECiga68SXOKWZKjZFUEPaQxEonTH/OXJhrPV/UswFdedjboi2azVBKCNd1Iho25ZC/ZgUjloQ6Hrtr1aoYStudrpTFFDWyegPTJ19uAHlK0O0T1TrroPTiTLlQjfK6wAyNFtyxhintlOoQb3XLBMswGZDaQ3mwezvDekCgYEAjHS7+TkRqx4jhxgi1Re5sM0Mh7VbA9mQHy4PLBFYavvYETYRqaBc2AYX9Hl0HVjNxtiwHPLMQ1g0OzamZcN7JTM2PVTYh2cJooKeyAykAifJ+DKETENjMk6OgQLU9rXrMKPQKDzVgR2SftgKUqCW8FLODHUr/RPMFX7CZogAaCECgYAecGZmJ7EYOW3fqOIGBfUPBr/zYSJUdkS2ZF4W3X+jdHkUrWJzEZ2K8i09aLF++r2UgEs6hxhC3bSvuB6daK0QPSt35gX/RYEbtQYvs/QUDQs8uiyt13PAWh9nqGflEBJuCd12LtGV01o2sG4zmzWMn04ZqAAZc+/UgsZAEHPtuQKBgA15beIoer5f5VePhLjk5fAQC7vNDgaRtqlt2BZ0RC5lnadI8w/WKGdKLKAzIXr4/IL6+oFleIiep2CUV4hnR/sVBeXlEsRFf2qbMREzBUDEyo4HhT+hDSgjT91GMT3jOc9YzsJjofBhLcBS+B9cB/npRp/tkTF0K9io8LH83+OK
b0e58897-ed48-49a6-9b94-62536010ddf1	99939143-64d5-41ad-8741-0c5249b835f2	keyUse	ENC
d62e712b-a3fa-44bb-9151-2f66dc246230	99939143-64d5-41ad-8741-0c5249b835f2	algorithm	RSA-OAEP
1e97d316-b403-4499-a4e8-a4da99863343	99939143-64d5-41ad-8741-0c5249b835f2	certificate	MIICmzCCAYMCBgGFBO/nADANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjIxMjEyMDYwMzI5WhcNMzIxMjEyMDYwNTA5WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDNQFDO3pHU74urI/Vq7MPmf8iaO1hGYe/HvAlOTsqMaok2LPTIV1sVZP2RP2bjAd66YxYviWbl2FCkc1J8U0n7dsTj3h4oWIUwppAvR82lyBmA9vmRM7Q/VCJNgZSoOv/adKQI3N9g3uzruY0a/IwRxAsphYXl5i25PhUwXTFwFg+CCa7KrCqXTBhQbvi1xFmI2LeM7dYRNIyAxx7JKAN42g1vJtKYHntobuto3daSt8m1YvvkPVVhcOGY/y77xay5Cn5rMgyoFOWqe2e1cPEPfXNY6bv8/qrRTlKmLvq4sITAxxG0M+SxTcxEIhfXgZ1lA026qc8dYfM4qAOiowoxAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAHqb4V7U0p1AGSyvUOQwED9UiT6rk1fx21e/n0U+5/Tf3BaiH2nPyRKko1zgIjWk3MaYUORxBVz7fRpv5Q7QLfdIy6yJMIywK/9O/ipWBy3a2mSMTY4o6to+8084j4MYEO71+6CEof/Pr2oJdawxOwCIwzn2F4dm7NZZfC/3ULnzAP0uwPOo2F0fvf8ud1GkciGDCU6Ta70oyky+Jwc/BHQl7J2Auk2o/7tr0DwFxBBD4Yr2h14z0+xwErde0YfJbQ0NMKiZRUoNyAGWIZGlb9MpkL3/HsHhaSjFU2ToSqdGL/KHObZUBuO48tNwjjPqbfsPx9/E43Gm6yCxCmYnhZQ=
4bdb2842-dfc1-4d58-9b2b-30b3bf3bcbae	7ada8c28-fcaf-4960-8ea5-5889b0fdcb32	priority	100
945f22d8-e19c-471d-8200-f3e6ed9ef1a1	7ada8c28-fcaf-4960-8ea5-5889b0fdcb32	certificate	MIICmzCCAYMCBgGFBO/maTANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjIxMjEyMDYwMzI5WhcNMzIxMjEyMDYwNTA5WjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCw530svN4kZJZaZF87N21x0XFEP/egSy84SAmee3ymMQ+fFfbp7sa9Bf29WdNTJ0ld+shkKN4JPNysvtWa/dq/fTH9V1GCtLIs9wPAxojpneGewDfrEsI9QZUOZbdGCaDf4P6efBv655EY7eAX4c+NBNv7PgS5PwwjtWMxwJ2ZcDw55uDWNLdSuHin99YJQ2NSO2x06OGeHU6pQ2/eGRBGOObVsrunF7Fo6haEWL+q8vgINh/EeS6ef4ssetynacqMmOxceTnhClhDr6FkT6//e42rPkMdbMCzopqZsJdACnSs87SuFiEY3rlv27A8udDiuH+f5SuzRlBdTMGRqn5pAgMBAAEwDQYJKoZIhvcNAQELBQADggEBADPF+CANTwm72+4qEg7YCwjzQCVA4aAmpPCgsiNm7GiDxxojZ8VmI8roBKudFfy1Pi42hFUCdLLi3MwsMG8CUQQcGWbMM7Vbmh0C3OvoQmLG/n5GyVlqqjDFkeOgR+rg2/3E0H7omEmdSEPlh/4xWUUKavPGx3aBucHL0Eo7rJseje4EtQkRv0CqyWk6kS+YIpr4MCi+YyNbjg5zH7n7ESpimCQQiHr46ytcCwzwkfZW3H2VEjctQq/H74M+uH0OMhozZMYmXz+S9QiYiuPEokKa99Z+luAqgZvO5BjMkqitNUsA0LjCgFaYyAW5fRwYNCm+LIcijrZSShoik32JvKc=
7c731f01-a6c0-412a-bbcd-30a739e19f5d	7ada8c28-fcaf-4960-8ea5-5889b0fdcb32	privateKey	MIIEpgIBAAKCAQEAsOd9LLzeJGSWWmRfOzdtcdFxRD/3oEsvOEgJnnt8pjEPnxX26e7GvQX9vVnTUydJXfrIZCjeCTzcrL7Vmv3av30x/VdRgrSyLPcDwMaI6Z3hnsA36xLCPUGVDmW3Rgmg3+D+nnwb+ueRGO3gF+HPjQTb+z4EuT8MI7VjMcCdmXA8Oebg1jS3Urh4p/fWCUNjUjtsdOjhnh1OqUNv3hkQRjjm1bK7pxexaOoWhFi/qvL4CDYfxHkunn+LLHrcp2nKjJjsXHk54QpYQ6+hZE+v/3uNqz5DHWzAs6KambCXQAp0rPO0rhYhGN65b9uwPLnQ4rh/n+Urs0ZQXUzBkap+aQIDAQABAoIBAQCw0K9sZ9ogxekBsBD/PwdFG/H6JXV74anwtw/mN8b+1Uqn12xTpTU++R4EhCOUmU/bfy2L7sz+rrZicttNby2U961fakcuPS1ZhAtcQxPVbNh1s+owKy+5yjMRkNj+R+Fj456bCbFttsZwBFJXjHvGl3TISdSu0zVu+32J3Nuo37ikZdYH9WCNgWft15669ClTIt47FgTAL1dUiGbytTsD6lFeojImEA8FwVyynTgOhcaI/waGMJd4sRI2nONttrjGYL6tbwIYQPfoo+E6Rn3idNkg4cJ0bXsNRBxwx1POJ/y8VsgDVj0gWyfJk5NlhQ7UmwjCQgUmP86eDyNML+4BAoGBAPDjI8CcQVEgosMRfPEQsQVK/ElIq/A9U5s7DbenqVpqEkSQFMHAY3xVpN0tl0mLJ7Iev68KjHib/w1A95tgJHi40G0XOMoYERXI6f+RfrrymfdKHy+/jcMi0pFyDQt4dJ6jwW7Y7YPmtNakYygV5rmgcizmNAzI0eiljKFxUThdAoGBALwAueSktVXtKyLU4yVuDik5WTUQhTqTu/ozLpvXx7Miqh1sDzdGHe00eP1bSBxI0pHELDftnA5EQCr5deWRNGk5m7Sdvc/tusqCKsSZAgMFrfRXIvCDU7yt9IQCGxYjZYUawPNQuc7hx45cL0IE9mdSnoBiG2TK64G9IwsiZk19AoGBAKJWEJQPOZ14xvd64555xzJv9FFW3jiKu7tTMs1f+itqbGE0UCi6hNEXzoEX5mqzks7hFgDatQva5SmDbNqTEkEhG6VJDwZy7aCmw7tty+Ak+knC8/1ztA+behh2qf/e74ixhvwyyO4pHhnAsuoiyFi0nf1QLiendn64gmuSOFApAoGBALubYeXHc2luxcf5dz5nx9vdbableH3O5Ru1LYK43oBlTCsWJUz8PGr0HPR+vcPz66UohRO+micmdn4r+DmBIDMNGNMxQjQXQHpLUNBk+7v2U/PrbGNkOhCj6sg8rbj205zy6K8l1HWdmxz14vbXqufKa38j58A6Oq96BVlcF4ilAoGBANyGnuTbkALEaUO90IfCLSa6XUD/B0VOWhr+FflVeUCewyLnIG/1PFyo+EEaHz9p2cG2UNF1otsUBapScnIw0N6cPE3hz+9aYR+GXFTPJUpGSLhp4q3SYZUm1uGOmFI0fp3xNFETUDwZBDXSQSQip/zVeLDZeQY5lwB175dF3KHz
16f6973a-734d-4d46-a4ca-4bb30c62b87a	7ada8c28-fcaf-4960-8ea5-5889b0fdcb32	keyUse	SIG
e91d1227-48fb-4638-bdd1-5a8f4ac0b4a1	7e38d8e8-aae5-4fa7-89ad-422c84d371a5	secret	61k1gd2RIaTV-DiVUdWaoCQZx0qrBSgldzhZueHQ81fL-E4K1QaGb-MI5IBY0jkGntgcl5M9Tra0PRA_rJ4e-g
d294ccc1-88bd-444e-935a-8abdcee380aa	7e38d8e8-aae5-4fa7-89ad-422c84d371a5	algorithm	HS256
cfa40912-dddb-4b24-bb5c-e8c95b0ad412	7e38d8e8-aae5-4fa7-89ad-422c84d371a5	priority	100
8f96f3a9-74c7-4a7b-adfe-1a12eb257297	7e38d8e8-aae5-4fa7-89ad-422c84d371a5	kid	66b92e8c-f536-4c8f-890a-2d0d1f716859
c13735e5-d00a-4dfe-af46-abd2f6f90c9f	6af9d662-7157-48a1-8a14-6bed0e7d8243	priority	100
74c79a18-7d74-447f-836f-a44fc0f44a1b	6af9d662-7157-48a1-8a14-6bed0e7d8243	kid	4f136821-c2eb-438e-866e-83af500dd544
c0ac92fd-1509-4afc-b2d8-ec03f9aeb3a0	6af9d662-7157-48a1-8a14-6bed0e7d8243	secret	HCzdPsgPHUIvGZe92D-U_A
ce850838-ef84-4e9e-8cb7-d9ba29f8023a	beb7dade-d7b3-42a8-9bbe-a975f0213705	kid	e44e0292-22a3-4d2e-aeb4-acbdd11d6263
c0596ecd-c9fb-417e-8d94-bbf3f3ce55eb	beb7dade-d7b3-42a8-9bbe-a975f0213705	priority	100
ace57160-dcf1-4d8c-87ea-1335f956b64b	beb7dade-d7b3-42a8-9bbe-a975f0213705	algorithm	HS256
c7d168a3-77be-4c25-85ed-63b593086097	beb7dade-d7b3-42a8-9bbe-a975f0213705	secret	kVARCycbEUcik1orwLd2thq39X60Fj5YUSoerqxXcTJlK5CU43KhLrhguVJ9IUxGxSZXUHjnSzkEDfjwwJ_ntQ
b4c12816-6727-4040-a679-8a8ea3ec5640	27306c6d-cb0a-40f9-bfe8-ca842e2b8774	secret	yN9qVGwOHpwjEo7nGtSn6g
5843a4ef-cbc0-4b28-8d4d-a21d16b9eca3	27306c6d-cb0a-40f9-bfe8-ca842e2b8774	kid	e3e0ffb7-2933-4400-866a-ec05c72d9ae5
a826c857-60c8-4d56-9e8a-2dc2f07f7cb2	27306c6d-cb0a-40f9-bfe8-ca842e2b8774	priority	100
6cf4d751-c5f4-4653-84e9-c081f2c14e3a	d43c3b94-6344-4743-9c2b-fb64d7927eb1	certificate	MIICnTCCAYUCBgGFBPA2eTANBgkqhkiG9w0BAQsFADASMRAwDgYDVQQDDAdmbG8tZGV2MB4XDTIyMTIxMjA2MDM0OVoXDTMyMTIxMjA2MDUyOVowEjEQMA4GA1UEAwwHZmxvLWRldjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBAJdF/JwX4AZzflxaIRa+F1hhBJ92SA2r9M/A+5SUjlq/FwZEXPPHDOaKVZjDIp4LTGOrqEJ1+kSfKfXJ0qVXPtAYU2XRUsFepJHd3kbqiBbd3S/1Gl4knbi9XZhdJsidH6w7rwcyWm4FmuagEHORKN+9niDDUaBUsu6452WNPDY6X981IZBM9hzu3UTUcNj2JQDmrK3yeGZ0tyc9MHcCvwP2xa4KERqEj7emlUzii+SzQh3Of+6PAHgRy8on/OlUa2KnbP7q7sUNSfogcbY1b59249RCtnQLBekkRnLrEkUU0c4NdS83IhgXJIiDC9SL953E+L0aqcQmdP0LHMkhmjECAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAStnhPhAYDlsRxmdXlt2sG3aIZ3SnExam7M7cHj/fowQDhka8bJzT8tNkpQFL5kcEt2KpzhfgE5BzpXSiJp9fFkHuLlGKDWhutEGcETJ6cNFrYw9YrUFPMTQHyEXSWjRUvjFPe3o3NPxdDAwc688MdiuLQuYTjtryqOK5nYAYQp3wUCkMfmGgW4j1FgD5FB5OS7zGt5YQuHgw2J93oDycPp9fAtgq+Dzfvi5A20Wu0yY1HGcEWS9qkcGSkt5mpgviwr5m670cow8hEwRezO1a4Dxc4x73ExCgnVbq1NHJhk0sqqBOYTlVMnVL0yAh2nZULo2NpG4Ujwvzi/3m7lhYrg==
0d7e448b-ba6e-4d32-a96d-c245806fca84	d43c3b94-6344-4743-9c2b-fb64d7927eb1	priority	100
9e0b73b9-d5b8-4162-97b5-62caffe3d5b7	d43c3b94-6344-4743-9c2b-fb64d7927eb1	keyUse	ENC
145bf124-882d-46b1-a111-d43eb383c2a6	d43c3b94-6344-4743-9c2b-fb64d7927eb1	privateKey	MIIEogIBAAKCAQEAl0X8nBfgBnN+XFohFr4XWGEEn3ZIDav0z8D7lJSOWr8XBkRc88cM5opVmMMingtMY6uoQnX6RJ8p9cnSpVc+0BhTZdFSwV6kkd3eRuqIFt3dL/UaXiSduL1dmF0myJ0frDuvBzJabgWa5qAQc5Eo372eIMNRoFSy7rjnZY08Njpf3zUhkEz2HO7dRNRw2PYlAOasrfJ4ZnS3Jz0wdwK/A/bFrgoRGoSPt6aVTOKL5LNCHc5/7o8AeBHLyif86VRrYqds/uruxQ1J+iBxtjVvn3bj1EK2dAsF6SRGcusSRRTRzg11LzciGBckiIML1Iv3ncT4vRqpxCZ0/QscySGaMQIDAQABAoIBAGRglVmCYi4FrwBa8f/kTRtg7S9ezjr8Mms08/tIhBllGUMYU9GS8FV9z4SZXzwd5Sdx/Sl0nYexUad9r1/1P4HX0mcKee5D/dGotli6QWli+OVcr41uoJW4WgXDMfwGfsDLrb2JxQWihIGqDqCQ3t1wNiApWt2Xtk+/tBPnnt+f38tuOTER33pdV4nEP8YShC8DM02QjWG5tdDWbbG1xPp/QJc3ukzfR3s/2BLQbqNwK7AFQsAhVLCCUT5IYOsMDnBoADvkrelDTJN5C5XAE3Ec7XP40GEaReDGxCdgS4HFvRYMk29YPwBmcBsdj2VggV2JTQBhkLMoz1wx8t5Jxl0CgYEA236Dppt/yICpmoTZ2LhIEdyQR96xRV/ehiUhFfWekDlxcoKe6Q39kbc1/wYeaqEvQds2XBlZIbGUjrj7mGcYuDWmv24YSNFdoGksvH3Vb//RqEo0w6K+pjR36rLyQ9SjV2eLA0ahy7ReDRxEbDpLhjRmXfVYWswrxepm9Q1LxPcCgYEAsG7PTJuNEsnn/ZdI2bR0fQlqMHWid66aDk7g2X8awiL1A9MGseKdm3WM2oY5GSuNMIlrPJcrNdMcSj5/jHE/+IsWzABNUCDav7m88skmxwzZf4/hgD+zpXncNPR2RddU5H/xTXm5hY0IuzPc1yUg0g+lCASYjwZVjLqmL4/SWBcCgYBL1ctAngspSCLRK0NlGE52NWF4I13WHUhxypRC1QkCxYYHzU+AMABC/yzdvsx1hNkiBM4kRfHArW0pXoo23q/wvUCudShYyFVz3cLCISvENXvHjFPsn+cE363q3gbMHsSMp06lRBsUmW3BU9nkFsQPSz1vCxyKym35RIJr+jsKgwKBgCfB0JTCuJdzSAOtA42LTHSgmn0xBNtTTQPMYn6gVbdJiUzDUM7k8f8GDidv943kcnxteuy8Y9BNMiLI0pUjL/ch4JE3wDQ+MwzhHeLX0RUpoBlOotHziNfRDf4g2EYEr+yNqCJ9O4EMttr4ZNtWUn8DZ3zXDEmuc7iylqBBGHUhAoGAaffeAUqSXyfW137vsdXb/8FrSAuarEv+o/Ude0+QRqt5/Bn7A5iIyaW8wx4fVHWQTD15SQF3JWl7u6H/31DkWNy87DDgYu2YIUSz18G9UjDo0bCLkOxK8GpFGoHTKICfCbQFRNw6wQAuX/i2J+iodNl0qDu9006tVCkAjPNs6Wo=
9c0846ef-bedf-45ef-9069-f36fd2e3872c	d43c3b94-6344-4743-9c2b-fb64d7927eb1	algorithm	RSA-OAEP
10e1dfd8-b3c9-40da-a167-7fb178b66959	93570308-0f47-46c6-92d3-2bf9fbe5c0ff	privateKey	MIIEpAIBAAKCAQEAubWV99vs+bxOLxtle87hQNvW0+Z/SgBPtgqP+7t6HZfD02ZOQV9q2QN8PBu7CaL1k72uy3RIZdYl7XHLfiBWkJaaYrlUwCqb2RSfU/0AYpmcG6p8TkKlOTubbmXyXk9oMpQTYDkRNZMg85SrMKCLSlpjripsjeAyOwMa/yl4oqeOy4EfnWTYhD+9NfM5CYoLC/TJe2I2AWWzR/96hgFouiz7qxM6e/enuMHTKTBgDstMU7MesLndfSU2Cl81bDrbwsUo7cKJh977O2ll1pfKpJlV+13eI49iHd1ZazoQyD4DK/i50ZMR6GEk78HIzgIBiqDXdxJGteqja+pi8PL/DwIDAQABAoIBAEpqJgbk3IeR2i5sJvU+h+pqbSIKCdWIXGiQwPNZQ2yaRMDwDMmLR5BgIicf4YnR/9/MsT8bgGs2LYqA/86xfJ6Biqmmo/xA1qRc7B9GkSHxdalsXlUpxXUymmzZcw4xeYpS5ZS4KVozc4/HcfWRT19i6vB+VXNgdCBLdUTrxEhAdhvXzraBMI6rfDqgdcCpf1O6/gnFNJqm+Ejz0Rz6fwZ7iw0Ud5M391bAGeUVnDPz3yhm7AOMaj4WLsg0dU1hB7BELMC3bf4prxIUlO5QJo4ZYRNAKS/ikGQhEY3ETc3xsCkIb4KkOuJa6t8uK46qZoyo2Z2+j7xYrYaJudnwbVECgYEA9n2JKEINhuukvdgyn51YoK6n7Whhmm90eY6ONth7kccbOs/7kRAbZ+4sBu+aAUksZhoyQlJ/DLYZNEUPD4ubhr3Bfc05quviIDe4aZIVdV4z3SEJV6vSB/HX2nptL+6fdYsfSiI3S/UdMKRPVV9L9tOV9reAuKFx3sSRo0H9DCcCgYEAwN++1fdBm9ItsNyym1eDs3H5Jz7jBxhdng36igsDRVvgot+tx3f44l3PMv1bhFYedGaeIYIW7KIdwAZDfV62nsC4Fvk6TRc6lFdxPb95K8YofqqcJscr07T7BQA0OWQ0wQOpeqas37qSQBi079UCl9crQlKtqhZ01MP5l4OT/tkCgYB3q5cNjpQWrw06hl59k9zVljY9UvIgEoCQC6AMDKphqjMUKKnQUeucV8vUSjuQ6D/ACnPgM0EvoLE36VdYisUlc7cfJqYaz47naWYFC0GTy/qOH13zzJ2Z8daEYe/k14tfe/3i9h22qPhVB1Dk9/FfknY6Y/kAqpEoQHMcugrq/QKBgQClDdSuHo5S3qajN/rQ3S+jnOFvKG34YG2dGLFS+OGvtVSjjW+Vx6GBdm4eYJq0wU4GptqkKkOb9ZAoCDQxUaBOcvYXEulFl59V2w7ZnMYBI+77lt1SgheLcNFwEiCfDJXop02d3I0MWQlXOM1+gHdboZMvirl7WQRaH+u0MbGw4QKBgQDbtVXwpvNQIN/ud7I8jDENITVqcQlc/mdxJZ8hd71xfnHOuWqYY3lL1frSFlfuYfGDcQ5uzxN5v7I+XlaHlCngrvA6nAKiyo80LXK+0s9r0ygqoj+BD3X1nVeP7CxcaldO7PDD67/t4dX/qJgtbKnRCbxOXxRYaYHMfX4b22st3Q==
68ff1168-ac71-4741-9e19-cf412e983037	93570308-0f47-46c6-92d3-2bf9fbe5c0ff	certificate	MIICnTCCAYUCBgGFBPA2DzANBgkqhkiG9w0BAQsFADASMRAwDgYDVQQDDAdmbG8tZGV2MB4XDTIyMTIxMjA2MDM0OVoXDTMyMTIxMjA2MDUyOVowEjEQMA4GA1UEAwwHZmxvLWRldjCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALm1lffb7Pm8Ti8bZXvO4UDb1tPmf0oAT7YKj/u7eh2Xw9NmTkFfatkDfDwbuwmi9ZO9rst0SGXWJe1xy34gVpCWmmK5VMAqm9kUn1P9AGKZnBuqfE5CpTk7m25l8l5PaDKUE2A5ETWTIPOUqzCgi0paY64qbI3gMjsDGv8peKKnjsuBH51k2IQ/vTXzOQmKCwv0yXtiNgFls0f/eoYBaLos+6sTOnv3p7jB0ykwYA7LTFOzHrC53X0lNgpfNWw628LFKO3CiYfe+ztpZdaXyqSZVftd3iOPYh3dWWs6EMg+Ayv4udGTEehhJO/ByM4CAYqg13cSRrXqo2vqYvDy/w8CAwEAATANBgkqhkiG9w0BAQsFAAOCAQEADdK49rqIJhB1zDZ7bfOP5sD4H1AwhzdFWNT6TlmQt8oCMI2Obfe++Mpb9/qwkz+76bx/KANaZ3gNVAprcCxbZezmvYZmqoQlBgrTVVcGZkEDHV5BpwyA34AvDe/8kYxOyP8h0XvwI9yMP8oMkyxjE4K07BVbPcC1HmFNspDWzXGtvLOXwRtoJoXNqrQ1Aq7Rn83c3h5WpqqpLJuEKZfT6kESI2Kec0x4Dt6pVrD+DiP2/228YRr2SjhDPUBFR34C6wO2kgtbf3BXxjVkzxk+rok/YnzHo0jQpoPfB9gfROAGgcsBrZ8nQh3osIcmtpweLYAA3bQSrIjCvc9PBE8dvQ==
4197d135-91de-44c0-a53b-1cadb4e8d570	93570308-0f47-46c6-92d3-2bf9fbe5c0ff	priority	100
54c158c4-6a2d-4185-8c6c-c2329e69447d	93570308-0f47-46c6-92d3-2bf9fbe5c0ff	keyUse	SIG
d5a25043-4fe3-4889-9f1c-a78aae3eccee	c2faf1f1-705d-4a7c-8f2f-03fba16f9f7b	max-clients	200
3845e794-4208-433f-8022-df45f86e367a	3f4fdf59-c86f-4f1b-93dd-1746cd6c6dce	allowed-protocol-mapper-types	saml-user-property-mapper
d99d70af-568a-445e-85cc-35c2cbb36f0d	3f4fdf59-c86f-4f1b-93dd-1746cd6c6dce	allowed-protocol-mapper-types	oidc-address-mapper
b5c5094c-17bf-45a5-8740-0ed224230d9b	3f4fdf59-c86f-4f1b-93dd-1746cd6c6dce	allowed-protocol-mapper-types	saml-role-list-mapper
ec134d44-74ea-4422-92dd-df8d032d1639	3f4fdf59-c86f-4f1b-93dd-1746cd6c6dce	allowed-protocol-mapper-types	saml-user-attribute-mapper
d194df17-5269-4799-b9b4-880bf3bf7a8a	3f4fdf59-c86f-4f1b-93dd-1746cd6c6dce	allowed-protocol-mapper-types	oidc-full-name-mapper
5398bb8b-57ae-497b-99cc-3b1f5dc8be77	3f4fdf59-c86f-4f1b-93dd-1746cd6c6dce	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
21da3488-de1e-4a62-b6f5-56e1d8dbfc8b	3f4fdf59-c86f-4f1b-93dd-1746cd6c6dce	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
04acea3a-81ae-4e56-9eec-716c3a6ceedd	3f4fdf59-c86f-4f1b-93dd-1746cd6c6dce	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
8815e749-35b3-4c8f-93f1-f4558a134743	841cc9f5-8dc5-493f-af79-8a1d25f0d966	allow-default-scopes	true
541fbb32-09e2-4496-885e-89c179bbab8a	847bd3f8-bcd6-4eeb-a646-72612cd6d4f1	host-sending-registration-request-must-match	true
e7092401-45ec-4c6f-9e68-d0e44533af01	847bd3f8-bcd6-4eeb-a646-72612cd6d4f1	client-uris-must-match	true
71116bae-c40c-40dd-8439-4acdecaa98c5	d14fcb96-89bd-4598-a299-04e47f538004	allow-default-scopes	true
4f638e3e-ef5f-4f65-b303-13e69dc73377	4004e0f9-ec31-4650-bb32-0466677294ac	allowed-protocol-mapper-types	oidc-usermodel-property-mapper
7d889b74-57a1-44b2-8d14-853dc1ef4ff6	4004e0f9-ec31-4650-bb32-0466677294ac	allowed-protocol-mapper-types	saml-user-property-mapper
1589ab8d-80e1-4895-ab29-d8aadf915af1	4004e0f9-ec31-4650-bb32-0466677294ac	allowed-protocol-mapper-types	saml-role-list-mapper
9ee8e6e3-c543-450b-880c-b7f0234efe02	4004e0f9-ec31-4650-bb32-0466677294ac	allowed-protocol-mapper-types	saml-user-attribute-mapper
7406f715-3401-4521-bd14-8aa6cd1a4552	4004e0f9-ec31-4650-bb32-0466677294ac	allowed-protocol-mapper-types	oidc-sha256-pairwise-sub-mapper
92137f5e-5360-45f1-bb2d-5e64ff1b29b5	4004e0f9-ec31-4650-bb32-0466677294ac	allowed-protocol-mapper-types	oidc-address-mapper
2e599778-5075-4c6c-b43f-d619e043a34c	4004e0f9-ec31-4650-bb32-0466677294ac	allowed-protocol-mapper-types	oidc-usermodel-attribute-mapper
8f089532-350e-491c-9a65-45d03f133161	4004e0f9-ec31-4650-bb32-0466677294ac	allowed-protocol-mapper-types	oidc-full-name-mapper
\.


--
-- Data for Name: composite_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.composite_role (composite, child_role) FROM stdin;
d624f594-05f5-4694-9a4f-059236a2a54e	46022c92-2e53-40d0-9120-0d93f097a98c
d624f594-05f5-4694-9a4f-059236a2a54e	ccb054d7-e5b4-4a02-82df-5e46794f63b3
d624f594-05f5-4694-9a4f-059236a2a54e	f8f8b5a2-cebc-46fc-be6d-2615b6bf5089
d624f594-05f5-4694-9a4f-059236a2a54e	a126f9c3-f386-4039-8f5d-142dd457f4ee
d624f594-05f5-4694-9a4f-059236a2a54e	10032a52-39cd-4b04-a522-be8da7f6d008
d624f594-05f5-4694-9a4f-059236a2a54e	35499e33-fde3-4de6-83ce-efb9041aa8fc
d624f594-05f5-4694-9a4f-059236a2a54e	048e104f-2c35-43ed-af2d-d3a9890ece4c
d624f594-05f5-4694-9a4f-059236a2a54e	e32a212a-56b3-4b23-80ae-0404f07746a9
d624f594-05f5-4694-9a4f-059236a2a54e	f2c380da-19e7-47ac-a214-d6a14a23442f
d624f594-05f5-4694-9a4f-059236a2a54e	075a5393-9888-4dc6-b9ce-459c9e6e78e9
d624f594-05f5-4694-9a4f-059236a2a54e	99bc35c2-b6c8-461b-93d9-152f81d6ed8d
d624f594-05f5-4694-9a4f-059236a2a54e	2c936fbc-55bb-4e56-8268-af95d1570511
d624f594-05f5-4694-9a4f-059236a2a54e	c82ef698-bd66-432c-80fc-d7ada47d3f3d
d624f594-05f5-4694-9a4f-059236a2a54e	4d91b5fb-59c3-4c03-89c7-3ed17682f360
d624f594-05f5-4694-9a4f-059236a2a54e	43c7ac67-0f42-4b86-8ac6-e058dec5b604
d624f594-05f5-4694-9a4f-059236a2a54e	fe23679b-f8f2-4fe4-8635-c81199512c7e
d624f594-05f5-4694-9a4f-059236a2a54e	933db00d-f4f7-4a5c-a4cf-d2d5db5723bb
d624f594-05f5-4694-9a4f-059236a2a54e	5954059c-80aa-4d19-a598-696e0cc28b2c
10032a52-39cd-4b04-a522-be8da7f6d008	fe23679b-f8f2-4fe4-8635-c81199512c7e
a126f9c3-f386-4039-8f5d-142dd457f4ee	43c7ac67-0f42-4b86-8ac6-e058dec5b604
a126f9c3-f386-4039-8f5d-142dd457f4ee	5954059c-80aa-4d19-a598-696e0cc28b2c
8491f39e-df63-4f49-8aa5-5391ba83b094	22a000c6-4b0f-49fd-a920-34b7aa306cde
8491f39e-df63-4f49-8aa5-5391ba83b094	b9c0319f-faa2-4e13-a2fb-8c0f079ddb57
b9c0319f-faa2-4e13-a2fb-8c0f079ddb57	b494b73d-9404-45dc-a5ba-bc2a25856688
464f2227-23f2-484e-a5d7-8e4a0e2f2d41	fa7144a9-8960-4f25-ad98-48b8e67fbbf1
d624f594-05f5-4694-9a4f-059236a2a54e	9487013a-ba2e-4827-836e-b820ec10d36d
8491f39e-df63-4f49-8aa5-5391ba83b094	466a0bcd-f1b7-4f65-949c-4db8ccae974a
8491f39e-df63-4f49-8aa5-5391ba83b094	67f8fe38-5f14-4914-89db-b22e4a8bd406
d624f594-05f5-4694-9a4f-059236a2a54e	6bc76bf4-b651-4e70-9f65-71d184c6e04e
d624f594-05f5-4694-9a4f-059236a2a54e	d1d9258e-04d6-4cd2-8a0a-97d05c7cf31e
d624f594-05f5-4694-9a4f-059236a2a54e	b68b67cb-d144-4b52-81ce-b4922d225e11
d624f594-05f5-4694-9a4f-059236a2a54e	9abd3b61-14e6-4784-a47b-1409ba0daa5a
d624f594-05f5-4694-9a4f-059236a2a54e	c3ed070e-9649-48cd-b4d3-44a4372465dc
d624f594-05f5-4694-9a4f-059236a2a54e	a337e2e7-a7ad-4073-b8ae-2bb12ad54a9d
d624f594-05f5-4694-9a4f-059236a2a54e	888ea168-5b19-4d17-96a7-af2056be5c78
d624f594-05f5-4694-9a4f-059236a2a54e	8f699b3b-2408-42d3-933d-766120b75d14
d624f594-05f5-4694-9a4f-059236a2a54e	24794320-6b64-471b-971c-36f113e67791
d624f594-05f5-4694-9a4f-059236a2a54e	071e6741-5b2b-4288-9477-7e354da3d754
d624f594-05f5-4694-9a4f-059236a2a54e	10fd68ac-50b6-45ff-b97e-3e7da10695ab
d624f594-05f5-4694-9a4f-059236a2a54e	6fecd258-e97a-41e2-94fc-5cf6c6ae3fa7
d624f594-05f5-4694-9a4f-059236a2a54e	dc724212-5f27-467c-8a2a-9e67fa5d0c90
d624f594-05f5-4694-9a4f-059236a2a54e	a0b5fe34-c9a5-4692-b727-1bdf73c7b333
d624f594-05f5-4694-9a4f-059236a2a54e	1537592d-a56e-41e3-8a6d-009509d055fd
d624f594-05f5-4694-9a4f-059236a2a54e	06f6c477-49d0-431d-8a98-2c8b6cc07203
d624f594-05f5-4694-9a4f-059236a2a54e	105885ce-e517-4ceb-a7ae-e3608fd023ff
9abd3b61-14e6-4784-a47b-1409ba0daa5a	1537592d-a56e-41e3-8a6d-009509d055fd
b68b67cb-d144-4b52-81ce-b4922d225e11	105885ce-e517-4ceb-a7ae-e3608fd023ff
b68b67cb-d144-4b52-81ce-b4922d225e11	a0b5fe34-c9a5-4692-b727-1bdf73c7b333
257295e5-9e8b-4133-9d57-638146c07490	881f4654-a3cd-40cd-bee7-df6f46ba008a
257295e5-9e8b-4133-9d57-638146c07490	3ee45935-27c2-4f2d-9f26-08f4552adef5
257295e5-9e8b-4133-9d57-638146c07490	f41971e9-41d3-40f4-888e-2b65e180ad22
257295e5-9e8b-4133-9d57-638146c07490	fdaf627c-6643-4b02-9940-821ebb72f950
257295e5-9e8b-4133-9d57-638146c07490	5c341e89-70eb-42a4-86c4-24221dcbbf85
257295e5-9e8b-4133-9d57-638146c07490	e159be61-ae1b-4818-92d7-70783b885929
257295e5-9e8b-4133-9d57-638146c07490	89f5649b-9573-4a25-9efb-1abd73d0fa9b
257295e5-9e8b-4133-9d57-638146c07490	76462a27-89a4-4c0c-9696-253b668911d4
257295e5-9e8b-4133-9d57-638146c07490	a42007b7-fa10-4d6a-a9db-d68f42ae8d41
257295e5-9e8b-4133-9d57-638146c07490	ba105205-63a3-47fb-bfb6-4f84380e6d61
257295e5-9e8b-4133-9d57-638146c07490	e7643da6-dde7-4eca-a515-a2bad6a4416a
257295e5-9e8b-4133-9d57-638146c07490	f8a68d05-849d-4b9f-836a-786d9f303ae1
257295e5-9e8b-4133-9d57-638146c07490	ccbe1d64-bd5f-4249-b339-a9ab63c1e8c2
257295e5-9e8b-4133-9d57-638146c07490	e0aeff47-1b24-47b6-95fd-78bf11fb9eee
257295e5-9e8b-4133-9d57-638146c07490	ab0d2474-9c96-4d3e-bf11-2e25673ee3cd
257295e5-9e8b-4133-9d57-638146c07490	cf7a7238-cb46-4c5f-b0ab-8a9dcb34e386
257295e5-9e8b-4133-9d57-638146c07490	a2ff971d-d413-40b6-ba1f-8282e5dcfcac
fdaf627c-6643-4b02-9940-821ebb72f950	ab0d2474-9c96-4d3e-bf11-2e25673ee3cd
f41971e9-41d3-40f4-888e-2b65e180ad22	a2ff971d-d413-40b6-ba1f-8282e5dcfcac
f41971e9-41d3-40f4-888e-2b65e180ad22	e0aeff47-1b24-47b6-95fd-78bf11fb9eee
961fad03-edb6-4123-813a-fd9f10e08572	b846b1a6-7141-419b-bec6-f119a11c6038
961fad03-edb6-4123-813a-fd9f10e08572	a386b561-0ac1-4c8b-be1f-03e3f16bfc50
a386b561-0ac1-4c8b-be1f-03e3f16bfc50	8b846807-32fa-45f1-aa37-1e4ef1fac592
cf20ba4b-438b-49da-a2b2-c4f00e7470b0	8126f9b6-0e27-40b4-ab2e-fb81d3c8ea6b
d624f594-05f5-4694-9a4f-059236a2a54e	9467aeb3-27a1-4cf7-bf74-8bff76646695
257295e5-9e8b-4133-9d57-638146c07490	dab42d62-ab6d-4c04-84f8-51dec6d9a1b4
961fad03-edb6-4123-813a-fd9f10e08572	962e3b5a-b8b5-4eea-90c1-5bea920dba44
961fad03-edb6-4123-813a-fd9f10e08572	ec169112-abe8-48a5-9fc2-34bebfbb9e79
c3d48d06-09f6-4a25-8ab3-bd9f57dea7ab	961fad03-edb6-4123-813a-fd9f10e08572
c3d48d06-09f6-4a25-8ab3-bd9f57dea7ab	37a543c1-6fed-4eda-a1dc-b72fec5f14a8
c3d48d06-09f6-4a25-8ab3-bd9f57dea7ab	f41971e9-41d3-40f4-888e-2b65e180ad22
\.


--
-- Data for Name: credential; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.credential (id, salt, type, user_id, created_date, user_label, secret_data, credential_data, priority) FROM stdin;
bde6bc01-0e4e-49b5-a7a8-389a05a7061d	\N	password	250fc379-c29d-42b9-a812-46ffa32f4a8b	1670825109557	\N	{"value":"fC5OL5lJJr9OpNOEj55KYcuTh6XNtQ2dPQEnaR0p0ZTu2hrlWoLf2Ak9PJF04w8+kAUZOqHvwWiTzcHn3VwtYQ==","salt":"QXCUvVbQ+uJullTBYycyag==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
ec57cc81-735b-4a0f-898e-0f8f898d8e67	\N	password	1d4697f0-dfe0-4c7f-b781-55c6974f358e	1670849173473	\N	{"value":"RZzZMmS9ZFeAWOMzbA6wKMbSA+QpwkBPxS5IKIE7AoXjOrccwkO/uCm1rKu+bnS0aFR3pzDMIeOQ+q6Heitmqw==","salt":"/P17nc3rmUjKwQpZCsoUSA==","additionalParameters":{}}	{"hashIterations":27500,"algorithm":"pbkdf2-sha256","additionalParameters":{}}	10
\.


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/jpa-changelog-1.0.0.Final.xml	2022-12-12 06:05:01.357345	1	EXECUTED	8:bda77d94bf90182a1e30c24f1c155ec7	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.8.0	\N	\N	0825100956
1.0.0.Final-KEYCLOAK-5461	sthorger@redhat.com	META-INF/db2-jpa-changelog-1.0.0.Final.xml	2022-12-12 06:05:01.365419	2	MARK_RAN	8:1ecb330f30986693d1cba9ab579fa219	createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...		\N	4.8.0	\N	\N	0825100956
1.1.0.Beta1	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Beta1.xml	2022-12-12 06:05:01.425117	3	EXECUTED	8:cb7ace19bc6d959f305605d255d4c843	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...		\N	4.8.0	\N	\N	0825100956
1.1.0.Final	sthorger@redhat.com	META-INF/jpa-changelog-1.1.0.Final.xml	2022-12-12 06:05:01.432227	4	EXECUTED	8:80230013e961310e6872e871be424a63	renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY		\N	4.8.0	\N	\N	0825100956
1.2.0.Beta1	psilva@redhat.com	META-INF/jpa-changelog-1.2.0.Beta1.xml	2022-12-12 06:05:01.559062	5	EXECUTED	8:67f4c20929126adc0c8e9bf48279d244	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.8.0	\N	\N	0825100956
1.2.0.Beta1	psilva@redhat.com	META-INF/db2-jpa-changelog-1.2.0.Beta1.xml	2022-12-12 06:05:01.562458	6	MARK_RAN	8:7311018b0b8179ce14628ab412bb6783	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...		\N	4.8.0	\N	\N	0825100956
1.2.0.RC1	bburke@redhat.com	META-INF/jpa-changelog-1.2.0.CR1.xml	2022-12-12 06:05:01.659707	7	EXECUTED	8:037ba1216c3640f8785ee6b8e7c8e3c1	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.8.0	\N	\N	0825100956
1.2.0.RC1	bburke@redhat.com	META-INF/db2-jpa-changelog-1.2.0.CR1.xml	2022-12-12 06:05:01.66357	8	MARK_RAN	8:7fe6ffe4af4df289b3157de32c624263	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...		\N	4.8.0	\N	\N	0825100956
1.2.0.Final	keycloak	META-INF/jpa-changelog-1.2.0.Final.xml	2022-12-12 06:05:01.668929	9	EXECUTED	8:9c136bc3187083a98745c7d03bc8a303	update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT		\N	4.8.0	\N	\N	0825100956
1.3.0	bburke@redhat.com	META-INF/jpa-changelog-1.3.0.xml	2022-12-12 06:05:01.791243	10	EXECUTED	8:b5f09474dca81fb56a97cf5b6553d331	delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...		\N	4.8.0	\N	\N	0825100956
1.4.0	bburke@redhat.com	META-INF/jpa-changelog-1.4.0.xml	2022-12-12 06:05:01.855017	11	EXECUTED	8:ca924f31bd2a3b219fdcfe78c82dacf4	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.8.0	\N	\N	0825100956
1.4.0	bburke@redhat.com	META-INF/db2-jpa-changelog-1.4.0.xml	2022-12-12 06:05:01.858129	12	MARK_RAN	8:8acad7483e106416bcfa6f3b824a16cd	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.8.0	\N	\N	0825100956
1.5.0	bburke@redhat.com	META-INF/jpa-changelog-1.5.0.xml	2022-12-12 06:05:01.872944	13	EXECUTED	8:9b1266d17f4f87c78226f5055408fd5e	delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...		\N	4.8.0	\N	\N	0825100956
1.6.1_from15	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2022-12-12 06:05:01.901723	14	EXECUTED	8:d80ec4ab6dbfe573550ff72396c7e910	addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...		\N	4.8.0	\N	\N	0825100956
1.6.1_from16-pre	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2022-12-12 06:05:01.905126	15	MARK_RAN	8:d86eb172171e7c20b9c849b584d147b2	delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION		\N	4.8.0	\N	\N	0825100956
1.6.1_from16	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2022-12-12 06:05:01.908513	16	MARK_RAN	8:5735f46f0fa60689deb0ecdc2a0dea22	dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...		\N	4.8.0	\N	\N	0825100956
1.6.1	mposolda@redhat.com	META-INF/jpa-changelog-1.6.1.xml	2022-12-12 06:05:01.911708	17	EXECUTED	8:d41d8cd98f00b204e9800998ecf8427e	empty		\N	4.8.0	\N	\N	0825100956
1.7.0	bburke@redhat.com	META-INF/jpa-changelog-1.7.0.xml	2022-12-12 06:05:01.96861	18	EXECUTED	8:5c1a8fd2014ac7fc43b90a700f117b23	createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...		\N	4.8.0	\N	\N	0825100956
1.8.0	mposolda@redhat.com	META-INF/jpa-changelog-1.8.0.xml	2022-12-12 06:05:02.020072	19	EXECUTED	8:1f6c2c2dfc362aff4ed75b3f0ef6b331	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.8.0	\N	\N	0825100956
1.8.0-2	keycloak	META-INF/jpa-changelog-1.8.0.xml	2022-12-12 06:05:02.025697	20	EXECUTED	8:dee9246280915712591f83a127665107	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.8.0	\N	\N	0825100956
authz-3.4.0.CR1-resource-server-pk-change-part1	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2022-12-12 06:05:03.448018	45	EXECUTED	8:a164ae073c56ffdbc98a615493609a52	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE		\N	4.8.0	\N	\N	0825100956
1.8.0	mposolda@redhat.com	META-INF/db2-jpa-changelog-1.8.0.xml	2022-12-12 06:05:02.028318	21	MARK_RAN	8:9eb2ee1fa8ad1c5e426421a6f8fdfa6a	addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...		\N	4.8.0	\N	\N	0825100956
1.8.0-2	keycloak	META-INF/db2-jpa-changelog-1.8.0.xml	2022-12-12 06:05:02.031123	22	MARK_RAN	8:dee9246280915712591f83a127665107	dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL		\N	4.8.0	\N	\N	0825100956
1.9.0	mposolda@redhat.com	META-INF/jpa-changelog-1.9.0.xml	2022-12-12 06:05:02.074261	23	EXECUTED	8:d9fa18ffa355320395b86270680dd4fe	update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...		\N	4.8.0	\N	\N	0825100956
1.9.1	keycloak	META-INF/jpa-changelog-1.9.1.xml	2022-12-12 06:05:02.081679	24	EXECUTED	8:90cff506fedb06141ffc1c71c4a1214c	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.8.0	\N	\N	0825100956
1.9.1	keycloak	META-INF/db2-jpa-changelog-1.9.1.xml	2022-12-12 06:05:02.084498	25	MARK_RAN	8:11a788aed4961d6d29c427c063af828c	modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM		\N	4.8.0	\N	\N	0825100956
1.9.2	keycloak	META-INF/jpa-changelog-1.9.2.xml	2022-12-12 06:05:02.248951	26	EXECUTED	8:a4218e51e1faf380518cce2af5d39b43	createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...		\N	4.8.0	\N	\N	0825100956
authz-2.0.0	psilva@redhat.com	META-INF/jpa-changelog-authz-2.0.0.xml	2022-12-12 06:05:02.346897	27	EXECUTED	8:d9e9a1bfaa644da9952456050f07bbdc	createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...		\N	4.8.0	\N	\N	0825100956
authz-2.5.1	psilva@redhat.com	META-INF/jpa-changelog-authz-2.5.1.xml	2022-12-12 06:05:02.351327	28	EXECUTED	8:d1bf991a6163c0acbfe664b615314505	update tableName=RESOURCE_SERVER_POLICY		\N	4.8.0	\N	\N	0825100956
2.1.0-KEYCLOAK-5461	bburke@redhat.com	META-INF/jpa-changelog-2.1.0.xml	2022-12-12 06:05:02.443039	29	EXECUTED	8:88a743a1e87ec5e30bf603da68058a8c	createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...		\N	4.8.0	\N	\N	0825100956
2.2.0	bburke@redhat.com	META-INF/jpa-changelog-2.2.0.xml	2022-12-12 06:05:02.459418	30	EXECUTED	8:c5517863c875d325dea463d00ec26d7a	addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...		\N	4.8.0	\N	\N	0825100956
2.3.0	bburke@redhat.com	META-INF/jpa-changelog-2.3.0.xml	2022-12-12 06:05:02.478671	31	EXECUTED	8:ada8b4833b74a498f376d7136bc7d327	createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...		\N	4.8.0	\N	\N	0825100956
2.4.0	bburke@redhat.com	META-INF/jpa-changelog-2.4.0.xml	2022-12-12 06:05:02.483297	32	EXECUTED	8:b9b73c8ea7299457f99fcbb825c263ba	customChange		\N	4.8.0	\N	\N	0825100956
2.5.0	bburke@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2022-12-12 06:05:02.490046	33	EXECUTED	8:07724333e625ccfcfc5adc63d57314f3	customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION		\N	4.8.0	\N	\N	0825100956
2.5.0-unicode-oracle	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2022-12-12 06:05:02.493176	34	MARK_RAN	8:8b6fd445958882efe55deb26fc541a7b	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.8.0	\N	\N	0825100956
2.5.0-unicode-other-dbs	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2022-12-12 06:05:02.530119	35	EXECUTED	8:29b29cfebfd12600897680147277a9d7	modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...		\N	4.8.0	\N	\N	0825100956
2.5.0-duplicate-email-support	slawomir@dabek.name	META-INF/jpa-changelog-2.5.0.xml	2022-12-12 06:05:02.535614	36	EXECUTED	8:73ad77ca8fd0410c7f9f15a471fa52bc	addColumn tableName=REALM		\N	4.8.0	\N	\N	0825100956
2.5.0-unique-group-names	hmlnarik@redhat.com	META-INF/jpa-changelog-2.5.0.xml	2022-12-12 06:05:02.545093	37	EXECUTED	8:64f27a6fdcad57f6f9153210f2ec1bdb	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.8.0	\N	\N	0825100956
2.5.1	bburke@redhat.com	META-INF/jpa-changelog-2.5.1.xml	2022-12-12 06:05:02.5507	38	EXECUTED	8:27180251182e6c31846c2ddab4bc5781	addColumn tableName=FED_USER_CONSENT		\N	4.8.0	\N	\N	0825100956
3.0.0	bburke@redhat.com	META-INF/jpa-changelog-3.0.0.xml	2022-12-12 06:05:02.556615	39	EXECUTED	8:d56f201bfcfa7a1413eb3e9bc02978f9	addColumn tableName=IDENTITY_PROVIDER		\N	4.8.0	\N	\N	0825100956
3.2.0-fix	keycloak	META-INF/jpa-changelog-3.2.0.xml	2022-12-12 06:05:02.559337	40	MARK_RAN	8:91f5522bf6afdc2077dfab57fbd3455c	addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS		\N	4.8.0	\N	\N	0825100956
3.2.0-fix-with-keycloak-5416	keycloak	META-INF/jpa-changelog-3.2.0.xml	2022-12-12 06:05:02.561931	41	MARK_RAN	8:0f01b554f256c22caeb7d8aee3a1cdc8	dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS		\N	4.8.0	\N	\N	0825100956
3.2.0-fix-offline-sessions	hmlnarik	META-INF/jpa-changelog-3.2.0.xml	2022-12-12 06:05:02.566089	42	EXECUTED	8:ab91cf9cee415867ade0e2df9651a947	customChange		\N	4.8.0	\N	\N	0825100956
3.2.0-fixed	keycloak	META-INF/jpa-changelog-3.2.0.xml	2022-12-12 06:05:03.417553	43	EXECUTED	8:ceac9b1889e97d602caf373eadb0d4b7	addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...		\N	4.8.0	\N	\N	0825100956
3.3.0	keycloak	META-INF/jpa-changelog-3.3.0.xml	2022-12-12 06:05:03.430005	44	EXECUTED	8:84b986e628fe8f7fd8fd3c275c5259f2	addColumn tableName=USER_ENTITY		\N	4.8.0	\N	\N	0825100956
authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2022-12-12 06:05:03.462519	46	EXECUTED	8:70a2b4f1f4bd4dbf487114bdb1810e64	customChange		\N	4.8.0	\N	\N	0825100956
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2022-12-12 06:05:03.467424	47	MARK_RAN	8:7be68b71d2f5b94b8df2e824f2860fa2	dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE		\N	4.8.0	\N	\N	0825100956
authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2022-12-12 06:05:03.568731	48	EXECUTED	8:bab7c631093c3861d6cf6144cd944982	addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...		\N	4.8.0	\N	\N	0825100956
authn-3.4.0.CR1-refresh-token-max-reuse	glavoie@gmail.com	META-INF/jpa-changelog-authz-3.4.0.CR1.xml	2022-12-12 06:05:03.585159	49	EXECUTED	8:fa809ac11877d74d76fe40869916daad	addColumn tableName=REALM		\N	4.8.0	\N	\N	0825100956
3.4.0	keycloak	META-INF/jpa-changelog-3.4.0.xml	2022-12-12 06:05:03.680401	50	EXECUTED	8:fac23540a40208f5f5e326f6ceb4d291	addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...		\N	4.8.0	\N	\N	0825100956
3.4.0-KEYCLOAK-5230	hmlnarik@redhat.com	META-INF/jpa-changelog-3.4.0.xml	2022-12-12 06:05:03.844996	51	EXECUTED	8:2612d1b8a97e2b5588c346e817307593	createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...		\N	4.8.0	\N	\N	0825100956
3.4.1	psilva@redhat.com	META-INF/jpa-changelog-3.4.1.xml	2022-12-12 06:05:03.850757	52	EXECUTED	8:9842f155c5db2206c88bcb5d1046e941	modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	0825100956
3.4.2	keycloak	META-INF/jpa-changelog-3.4.2.xml	2022-12-12 06:05:03.854784	53	EXECUTED	8:2e12e06e45498406db72d5b3da5bbc76	update tableName=REALM		\N	4.8.0	\N	\N	0825100956
3.4.2-KEYCLOAK-5172	mkanis@redhat.com	META-INF/jpa-changelog-3.4.2.xml	2022-12-12 06:05:03.858631	54	EXECUTED	8:33560e7c7989250c40da3abdabdc75a4	update tableName=CLIENT		\N	4.8.0	\N	\N	0825100956
4.0.0-KEYCLOAK-6335	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2022-12-12 06:05:03.869706	55	EXECUTED	8:87a8d8542046817a9107c7eb9cbad1cd	createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS		\N	4.8.0	\N	\N	0825100956
4.0.0-CLEANUP-UNUSED-TABLE	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2022-12-12 06:05:03.876859	56	EXECUTED	8:3ea08490a70215ed0088c273d776311e	dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING		\N	4.8.0	\N	\N	0825100956
4.0.0-KEYCLOAK-6228	bburke@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2022-12-12 06:05:03.918159	57	EXECUTED	8:2d56697c8723d4592ab608ce14b6ed68	dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...		\N	4.8.0	\N	\N	0825100956
4.0.0-KEYCLOAK-5579-fixed	mposolda@redhat.com	META-INF/jpa-changelog-4.0.0.xml	2022-12-12 06:05:04.145003	58	EXECUTED	8:3e423e249f6068ea2bbe48bf907f9d86	dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...		\N	4.8.0	\N	\N	0825100956
authz-4.0.0.CR1	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.CR1.xml	2022-12-12 06:05:04.176375	59	EXECUTED	8:15cabee5e5df0ff099510a0fc03e4103	createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...		\N	4.8.0	\N	\N	0825100956
authz-4.0.0.Beta3	psilva@redhat.com	META-INF/jpa-changelog-authz-4.0.0.Beta3.xml	2022-12-12 06:05:04.183799	60	EXECUTED	8:4b80200af916ac54d2ffbfc47918ab0e	addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY		\N	4.8.0	\N	\N	0825100956
authz-4.2.0.Final	mhajas@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2022-12-12 06:05:04.191902	61	EXECUTED	8:66564cd5e168045d52252c5027485bbb	createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...		\N	4.8.0	\N	\N	0825100956
authz-4.2.0.Final-KEYCLOAK-9944	hmlnarik@redhat.com	META-INF/jpa-changelog-authz-4.2.0.Final.xml	2022-12-12 06:05:04.200954	62	EXECUTED	8:1c7064fafb030222be2bd16ccf690f6f	addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS		\N	4.8.0	\N	\N	0825100956
4.2.0-KEYCLOAK-6313	wadahiro@gmail.com	META-INF/jpa-changelog-4.2.0.xml	2022-12-12 06:05:04.206894	63	EXECUTED	8:2de18a0dce10cdda5c7e65c9b719b6e5	addColumn tableName=REQUIRED_ACTION_PROVIDER		\N	4.8.0	\N	\N	0825100956
4.3.0-KEYCLOAK-7984	wadahiro@gmail.com	META-INF/jpa-changelog-4.3.0.xml	2022-12-12 06:05:04.212297	64	EXECUTED	8:03e413dd182dcbd5c57e41c34d0ef682	update tableName=REQUIRED_ACTION_PROVIDER		\N	4.8.0	\N	\N	0825100956
4.6.0-KEYCLOAK-7950	psilva@redhat.com	META-INF/jpa-changelog-4.6.0.xml	2022-12-12 06:05:04.216531	65	EXECUTED	8:d27b42bb2571c18fbe3fe4e4fb7582a7	update tableName=RESOURCE_SERVER_RESOURCE		\N	4.8.0	\N	\N	0825100956
4.6.0-KEYCLOAK-8377	keycloak	META-INF/jpa-changelog-4.6.0.xml	2022-12-12 06:05:04.245681	66	EXECUTED	8:698baf84d9fd0027e9192717c2154fb8	createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...		\N	4.8.0	\N	\N	0825100956
4.6.0-KEYCLOAK-8555	gideonray@gmail.com	META-INF/jpa-changelog-4.6.0.xml	2022-12-12 06:05:04.262081	67	EXECUTED	8:ced8822edf0f75ef26eb51582f9a821a	createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT		\N	4.8.0	\N	\N	0825100956
4.7.0-KEYCLOAK-1267	sguilhen@redhat.com	META-INF/jpa-changelog-4.7.0.xml	2022-12-12 06:05:04.268562	68	EXECUTED	8:f0abba004cf429e8afc43056df06487d	addColumn tableName=REALM		\N	4.8.0	\N	\N	0825100956
4.7.0-KEYCLOAK-7275	keycloak	META-INF/jpa-changelog-4.7.0.xml	2022-12-12 06:05:04.287254	69	EXECUTED	8:6662f8b0b611caa359fcf13bf63b4e24	renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...		\N	4.8.0	\N	\N	0825100956
4.8.0-KEYCLOAK-8835	sguilhen@redhat.com	META-INF/jpa-changelog-4.8.0.xml	2022-12-12 06:05:04.295147	70	EXECUTED	8:9e6b8009560f684250bdbdf97670d39e	addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM		\N	4.8.0	\N	\N	0825100956
authz-7.0.0-KEYCLOAK-10443	psilva@redhat.com	META-INF/jpa-changelog-authz-7.0.0.xml	2022-12-12 06:05:04.300971	71	EXECUTED	8:4223f561f3b8dc655846562b57bb502e	addColumn tableName=RESOURCE_SERVER		\N	4.8.0	\N	\N	0825100956
8.0.0-adding-credential-columns	keycloak	META-INF/jpa-changelog-8.0.0.xml	2022-12-12 06:05:04.309545	72	EXECUTED	8:215a31c398b363ce383a2b301202f29e	addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL		\N	4.8.0	\N	\N	0825100956
8.0.0-updating-credential-data-not-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2022-12-12 06:05:04.31616	73	EXECUTED	8:83f7a671792ca98b3cbd3a1a34862d3d	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.8.0	\N	\N	0825100956
8.0.0-updating-credential-data-oracle-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2022-12-12 06:05:04.319637	74	MARK_RAN	8:f58ad148698cf30707a6efbdf8061aa7	update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL		\N	4.8.0	\N	\N	0825100956
8.0.0-credential-cleanup-fixed	keycloak	META-INF/jpa-changelog-8.0.0.xml	2022-12-12 06:05:04.335877	75	EXECUTED	8:79e4fd6c6442980e58d52ffc3ee7b19c	dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...		\N	4.8.0	\N	\N	0825100956
8.0.0-resource-tag-support	keycloak	META-INF/jpa-changelog-8.0.0.xml	2022-12-12 06:05:04.354678	76	EXECUTED	8:87af6a1e6d241ca4b15801d1f86a297d	addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL		\N	4.8.0	\N	\N	0825100956
9.0.0-always-display-client	keycloak	META-INF/jpa-changelog-9.0.0.xml	2022-12-12 06:05:04.360682	77	EXECUTED	8:b44f8d9b7b6ea455305a6d72a200ed15	addColumn tableName=CLIENT		\N	4.8.0	\N	\N	0825100956
9.0.0-drop-constraints-for-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2022-12-12 06:05:04.364112	78	MARK_RAN	8:2d8ed5aaaeffd0cb004c046b4a903ac5	dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...		\N	4.8.0	\N	\N	0825100956
9.0.0-increase-column-size-federated-fk	keycloak	META-INF/jpa-changelog-9.0.0.xml	2022-12-12 06:05:04.385723	79	EXECUTED	8:e290c01fcbc275326c511633f6e2acde	modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...		\N	4.8.0	\N	\N	0825100956
9.0.0-recreate-constraints-after-column-increase	keycloak	META-INF/jpa-changelog-9.0.0.xml	2022-12-12 06:05:04.388843	80	MARK_RAN	8:c9db8784c33cea210872ac2d805439f8	addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...		\N	4.8.0	\N	\N	0825100956
9.0.1-add-index-to-client.client_id	keycloak	META-INF/jpa-changelog-9.0.1.xml	2022-12-12 06:05:04.407205	81	EXECUTED	8:95b676ce8fc546a1fcfb4c92fae4add5	createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT		\N	4.8.0	\N	\N	0825100956
9.0.1-KEYCLOAK-12579-drop-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2022-12-12 06:05:04.410424	82	MARK_RAN	8:38a6b2a41f5651018b1aca93a41401e5	dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.8.0	\N	\N	0825100956
9.0.1-KEYCLOAK-12579-add-not-null-constraint	keycloak	META-INF/jpa-changelog-9.0.1.xml	2022-12-12 06:05:04.417582	83	EXECUTED	8:3fb99bcad86a0229783123ac52f7609c	addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP		\N	4.8.0	\N	\N	0825100956
9.0.1-KEYCLOAK-12579-recreate-constraints	keycloak	META-INF/jpa-changelog-9.0.1.xml	2022-12-12 06:05:04.420925	84	MARK_RAN	8:64f27a6fdcad57f6f9153210f2ec1bdb	addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP		\N	4.8.0	\N	\N	0825100956
9.0.1-add-index-to-events	keycloak	META-INF/jpa-changelog-9.0.1.xml	2022-12-12 06:05:04.438611	85	EXECUTED	8:ab4f863f39adafd4c862f7ec01890abc	createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY		\N	4.8.0	\N	\N	0825100956
map-remove-ri	keycloak	META-INF/jpa-changelog-11.0.0.xml	2022-12-12 06:05:04.445346	86	EXECUTED	8:13c419a0eb336e91ee3a3bf8fda6e2a7	dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9		\N	4.8.0	\N	\N	0825100956
map-remove-ri	keycloak	META-INF/jpa-changelog-12.0.0.xml	2022-12-12 06:05:04.453449	87	EXECUTED	8:e3fb1e698e0471487f51af1ed80fe3ac	dropForeignKeyConstraint baseTableName=REALM_DEFAULT_GROUPS, constraintName=FK_DEF_GROUPS_GROUP; dropForeignKeyConstraint baseTableName=REALM_DEFAULT_ROLES, constraintName=FK_H4WPD7W4HSOOLNI3H0SW7BTJE; dropForeignKeyConstraint baseTableName=CLIENT...		\N	4.8.0	\N	\N	0825100956
12.1.0-add-realm-localization-table	keycloak	META-INF/jpa-changelog-12.0.0.xml	2022-12-12 06:05:04.469506	88	EXECUTED	8:babadb686aab7b56562817e60bf0abd0	createTable tableName=REALM_LOCALIZATIONS; addPrimaryKey tableName=REALM_LOCALIZATIONS		\N	4.8.0	\N	\N	0825100956
default-roles	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-12-12 06:05:04.477112	89	EXECUTED	8:72d03345fda8e2f17093d08801947773	addColumn tableName=REALM; customChange		\N	4.8.0	\N	\N	0825100956
default-roles-cleanup	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-12-12 06:05:04.484941	90	EXECUTED	8:61c9233951bd96ffecd9ba75f7d978a4	dropTable tableName=REALM_DEFAULT_ROLES; dropTable tableName=CLIENT_DEFAULT_ROLES		\N	4.8.0	\N	\N	0825100956
13.0.0-KEYCLOAK-16844	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-12-12 06:05:04.502405	91	EXECUTED	8:ea82e6ad945cec250af6372767b25525	createIndex indexName=IDX_OFFLINE_USS_PRELOAD, tableName=OFFLINE_USER_SESSION		\N	4.8.0	\N	\N	0825100956
map-remove-ri-13.0.0	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-12-12 06:05:04.512832	92	EXECUTED	8:d3f4a33f41d960ddacd7e2ef30d126b3	dropForeignKeyConstraint baseTableName=DEFAULT_CLIENT_SCOPE, constraintName=FK_R_DEF_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SCOPE_CLIENT, constraintName=FK_C_CLI_SCOPE_SCOPE; dropForeignKeyConstraint baseTableName=CLIENT_SC...		\N	4.8.0	\N	\N	0825100956
13.0.0-KEYCLOAK-17992-drop-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-12-12 06:05:04.516269	93	MARK_RAN	8:1284a27fbd049d65831cb6fc07c8a783	dropPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CLSCOPE_CL, tableName=CLIENT_SCOPE_CLIENT; dropIndex indexName=IDX_CL_CLSCOPE, tableName=CLIENT_SCOPE_CLIENT		\N	4.8.0	\N	\N	0825100956
13.0.0-increase-column-size-federated	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-12-12 06:05:04.528664	94	EXECUTED	8:9d11b619db2ae27c25853b8a37cd0dea	modifyDataType columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; modifyDataType columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT		\N	4.8.0	\N	\N	0825100956
13.0.0-KEYCLOAK-17992-recreate-constraints	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-12-12 06:05:04.531476	95	MARK_RAN	8:3002bb3997451bb9e8bac5c5cd8d6327	addNotNullConstraint columnName=CLIENT_ID, tableName=CLIENT_SCOPE_CLIENT; addNotNullConstraint columnName=SCOPE_ID, tableName=CLIENT_SCOPE_CLIENT; addPrimaryKey constraintName=C_CLI_SCOPE_BIND, tableName=CLIENT_SCOPE_CLIENT; createIndex indexName=...		\N	4.8.0	\N	\N	0825100956
json-string-accomodation-fixed	keycloak	META-INF/jpa-changelog-13.0.0.xml	2022-12-12 06:05:04.538509	96	EXECUTED	8:dfbee0d6237a23ef4ccbb7a4e063c163	addColumn tableName=REALM_ATTRIBUTE; update tableName=REALM_ATTRIBUTE; dropColumn columnName=VALUE, tableName=REALM_ATTRIBUTE; renameColumn newColumnName=VALUE, oldColumnName=VALUE_NEW, tableName=REALM_ATTRIBUTE		\N	4.8.0	\N	\N	0825100956
14.0.0-KEYCLOAK-11019	keycloak	META-INF/jpa-changelog-14.0.0.xml	2022-12-12 06:05:04.578644	97	EXECUTED	8:75f3e372df18d38c62734eebb986b960	createIndex indexName=IDX_OFFLINE_CSS_PRELOAD, tableName=OFFLINE_CLIENT_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USER, tableName=OFFLINE_USER_SESSION; createIndex indexName=IDX_OFFLINE_USS_BY_USERSESS, tableName=OFFLINE_USER_SESSION		\N	4.8.0	\N	\N	0825100956
14.0.0-KEYCLOAK-18286	keycloak	META-INF/jpa-changelog-14.0.0.xml	2022-12-12 06:05:04.581937	98	MARK_RAN	8:7fee73eddf84a6035691512c85637eef	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	0825100956
14.0.0-KEYCLOAK-18286-revert	keycloak	META-INF/jpa-changelog-14.0.0.xml	2022-12-12 06:05:04.592446	99	MARK_RAN	8:7a11134ab12820f999fbf3bb13c3adc8	dropIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	0825100956
14.0.0-KEYCLOAK-18286-supported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2022-12-12 06:05:04.61091	100	EXECUTED	8:c0f6eaac1f3be773ffe54cb5b8482b70	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	0825100956
14.0.0-KEYCLOAK-18286-unsupported-dbs	keycloak	META-INF/jpa-changelog-14.0.0.xml	2022-12-12 06:05:04.614364	101	MARK_RAN	8:18186f0008b86e0f0f49b0c4d0e842ac	createIndex indexName=IDX_CLIENT_ATT_BY_NAME_VALUE, tableName=CLIENT_ATTRIBUTES		\N	4.8.0	\N	\N	0825100956
KEYCLOAK-17267-add-index-to-user-attributes	keycloak	META-INF/jpa-changelog-14.0.0.xml	2022-12-12 06:05:04.63266	102	EXECUTED	8:09c2780bcb23b310a7019d217dc7b433	createIndex indexName=IDX_USER_ATTRIBUTE_NAME, tableName=USER_ATTRIBUTE		\N	4.8.0	\N	\N	0825100956
KEYCLOAK-18146-add-saml-art-binding-identifier	keycloak	META-INF/jpa-changelog-14.0.0.xml	2022-12-12 06:05:04.637641	103	EXECUTED	8:276a44955eab693c970a42880197fff2	customChange		\N	4.8.0	\N	\N	0825100956
15.0.0-KEYCLOAK-18467	keycloak	META-INF/jpa-changelog-15.0.0.xml	2022-12-12 06:05:04.64528	104	EXECUTED	8:ba8ee3b694d043f2bfc1a1079d0760d7	addColumn tableName=REALM_LOCALIZATIONS; update tableName=REALM_LOCALIZATIONS; dropColumn columnName=TEXTS, tableName=REALM_LOCALIZATIONS; renameColumn newColumnName=TEXTS, oldColumnName=TEXTS_NEW, tableName=REALM_LOCALIZATIONS; addNotNullConstrai...		\N	4.8.0	\N	\N	0825100956
17.0.0-9562	keycloak	META-INF/jpa-changelog-17.0.0.xml	2022-12-12 06:05:04.662009	105	EXECUTED	8:5e06b1d75f5d17685485e610c2851b17	createIndex indexName=IDX_USER_SERVICE_ACCOUNT, tableName=USER_ENTITY		\N	4.8.0	\N	\N	0825100956
18.0.0-10625-IDX_ADMIN_EVENT_TIME	keycloak	META-INF/jpa-changelog-18.0.0.xml	2022-12-12 06:05:04.680749	106	EXECUTED	8:4b80546c1dc550ac552ee7b24a4ab7c0	createIndex indexName=IDX_ADMIN_EVENT_TIME, tableName=ADMIN_EVENT_ENTITY		\N	4.8.0	\N	\N	0825100956
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
1000	f	\N	\N
1001	f	\N	\N
\.


--
-- Data for Name: default_client_scope; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.default_client_scope (realm_id, scope_id, default_scope) FROM stdin;
8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	58dba37d-9afc-4d7c-8452-3845188ddd13	f
8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	ef681ffb-512f-4ffa-b5b0-f58b09331f73	t
8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	02c60c90-42a0-47fe-82ad-2f00d2565081	t
8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	9a781c4c-97ec-43be-8c19-afb75b52fa93	t
8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	e2f7910d-7196-4fd2-b42c-a8ce1a0187fb	f
8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	63bd6d13-95c1-43be-9ad7-f4a532f85ca1	f
8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	c74e1567-89b2-405c-ab3a-b6fe179214e2	t
8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	160f9b39-a84f-4ae3-9635-92d6e44b5f85	t
8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	ffdc7bb0-7513-4893-85d6-0ed1bcd7bf46	f
8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	26250cfe-8c33-4c58-b9f7-6e197d4b41a5	t
flo-dev	d6c8cea3-c301-4230-82eb-9a9d21518836	f
flo-dev	bb71a697-5575-400a-8d88-5353ca4ce58b	t
flo-dev	05852017-81b6-4a14-b47d-775c2af82441	t
flo-dev	5956f2d7-6e0c-4c3e-8fb2-73ceeeb8259a	t
flo-dev	145ac4ba-deed-4e6d-8733-6a0b1661c050	f
flo-dev	a9d62954-df3b-4257-bbfb-108e619cc19e	f
flo-dev	287af0c7-72c0-43b6-bfcf-f86344615357	t
flo-dev	b871a7b1-0931-45f8-a490-1c3b2fcc4380	t
flo-dev	b27c9329-5473-4e31-8eea-68f11c0856b7	f
flo-dev	2ff3aa09-c4c1-4464-b610-0e4437600829	t
\.


--
-- Data for Name: event_entity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.event_entity (id, client_id, details_json, error, ip_address, realm_id, session_id, event_time, type, user_id) FROM stdin;
\.


--
-- Data for Name: fed_user_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fed_user_attribute (id, name, user_id, realm_id, storage_provider_id, value) FROM stdin;
\.


--
-- Data for Name: fed_user_consent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fed_user_consent (id, client_id, user_id, realm_id, storage_provider_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: fed_user_consent_cl_scope; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fed_user_consent_cl_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: fed_user_credential; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fed_user_credential (id, salt, type, created_date, user_id, realm_id, storage_provider_id, user_label, secret_data, credential_data, priority) FROM stdin;
\.


--
-- Data for Name: fed_user_group_membership; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fed_user_group_membership (group_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_required_action; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fed_user_required_action (required_action, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: fed_user_role_mapping; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.fed_user_role_mapping (role_id, user_id, realm_id, storage_provider_id) FROM stdin;
\.


--
-- Data for Name: federated_identity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.federated_identity (identity_provider, realm_id, federated_user_id, federated_username, token, user_id) FROM stdin;
\.


--
-- Data for Name: federated_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.federated_user (id, storage_provider_id, realm_id) FROM stdin;
\.


--
-- Data for Name: group_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.group_attribute (id, name, value, group_id) FROM stdin;
\.


--
-- Data for Name: group_role_mapping; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.group_role_mapping (role_id, group_id) FROM stdin;
\.


--
-- Data for Name: identity_provider; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.identity_provider (internal_id, enabled, provider_alias, provider_id, store_token, authenticate_by_default, realm_id, add_token_role, trust_email, first_broker_login_flow_id, post_broker_login_flow_id, provider_display_name, link_only) FROM stdin;
\.


--
-- Data for Name: identity_provider_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.identity_provider_config (identity_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: identity_provider_mapper; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.identity_provider_mapper (id, name, idp_alias, idp_mapper_name, realm_id) FROM stdin;
\.


--
-- Data for Name: idp_mapper_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.idp_mapper_config (idp_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: keycloak_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.keycloak_group (id, name, parent_group, realm_id) FROM stdin;
\.


--
-- Data for Name: keycloak_role; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.keycloak_role (id, client_realm_constraint, client_role, description, name, realm_id, client, realm) FROM stdin;
8491f39e-df63-4f49-8aa5-5391ba83b094	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	f	${role_default-roles}	default-roles-master	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	\N	\N
d624f594-05f5-4694-9a4f-059236a2a54e	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	f	${role_admin}	admin	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	\N	\N
46022c92-2e53-40d0-9120-0d93f097a98c	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	f	${role_create-realm}	create-realm	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	\N	\N
ccb054d7-e5b4-4a02-82df-5e46794f63b3	b21c75eb-cadf-4f68-929e-e4a352b75419	t	${role_create-client}	create-client	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	b21c75eb-cadf-4f68-929e-e4a352b75419	\N
f8f8b5a2-cebc-46fc-be6d-2615b6bf5089	b21c75eb-cadf-4f68-929e-e4a352b75419	t	${role_view-realm}	view-realm	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	b21c75eb-cadf-4f68-929e-e4a352b75419	\N
a126f9c3-f386-4039-8f5d-142dd457f4ee	b21c75eb-cadf-4f68-929e-e4a352b75419	t	${role_view-users}	view-users	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	b21c75eb-cadf-4f68-929e-e4a352b75419	\N
10032a52-39cd-4b04-a522-be8da7f6d008	b21c75eb-cadf-4f68-929e-e4a352b75419	t	${role_view-clients}	view-clients	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	b21c75eb-cadf-4f68-929e-e4a352b75419	\N
35499e33-fde3-4de6-83ce-efb9041aa8fc	b21c75eb-cadf-4f68-929e-e4a352b75419	t	${role_view-events}	view-events	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	b21c75eb-cadf-4f68-929e-e4a352b75419	\N
048e104f-2c35-43ed-af2d-d3a9890ece4c	b21c75eb-cadf-4f68-929e-e4a352b75419	t	${role_view-identity-providers}	view-identity-providers	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	b21c75eb-cadf-4f68-929e-e4a352b75419	\N
e32a212a-56b3-4b23-80ae-0404f07746a9	b21c75eb-cadf-4f68-929e-e4a352b75419	t	${role_view-authorization}	view-authorization	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	b21c75eb-cadf-4f68-929e-e4a352b75419	\N
f2c380da-19e7-47ac-a214-d6a14a23442f	b21c75eb-cadf-4f68-929e-e4a352b75419	t	${role_manage-realm}	manage-realm	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	b21c75eb-cadf-4f68-929e-e4a352b75419	\N
075a5393-9888-4dc6-b9ce-459c9e6e78e9	b21c75eb-cadf-4f68-929e-e4a352b75419	t	${role_manage-users}	manage-users	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	b21c75eb-cadf-4f68-929e-e4a352b75419	\N
99bc35c2-b6c8-461b-93d9-152f81d6ed8d	b21c75eb-cadf-4f68-929e-e4a352b75419	t	${role_manage-clients}	manage-clients	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	b21c75eb-cadf-4f68-929e-e4a352b75419	\N
2c936fbc-55bb-4e56-8268-af95d1570511	b21c75eb-cadf-4f68-929e-e4a352b75419	t	${role_manage-events}	manage-events	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	b21c75eb-cadf-4f68-929e-e4a352b75419	\N
c82ef698-bd66-432c-80fc-d7ada47d3f3d	b21c75eb-cadf-4f68-929e-e4a352b75419	t	${role_manage-identity-providers}	manage-identity-providers	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	b21c75eb-cadf-4f68-929e-e4a352b75419	\N
4d91b5fb-59c3-4c03-89c7-3ed17682f360	b21c75eb-cadf-4f68-929e-e4a352b75419	t	${role_manage-authorization}	manage-authorization	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	b21c75eb-cadf-4f68-929e-e4a352b75419	\N
43c7ac67-0f42-4b86-8ac6-e058dec5b604	b21c75eb-cadf-4f68-929e-e4a352b75419	t	${role_query-users}	query-users	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	b21c75eb-cadf-4f68-929e-e4a352b75419	\N
fe23679b-f8f2-4fe4-8635-c81199512c7e	b21c75eb-cadf-4f68-929e-e4a352b75419	t	${role_query-clients}	query-clients	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	b21c75eb-cadf-4f68-929e-e4a352b75419	\N
933db00d-f4f7-4a5c-a4cf-d2d5db5723bb	b21c75eb-cadf-4f68-929e-e4a352b75419	t	${role_query-realms}	query-realms	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	b21c75eb-cadf-4f68-929e-e4a352b75419	\N
5954059c-80aa-4d19-a598-696e0cc28b2c	b21c75eb-cadf-4f68-929e-e4a352b75419	t	${role_query-groups}	query-groups	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	b21c75eb-cadf-4f68-929e-e4a352b75419	\N
22a000c6-4b0f-49fd-a920-34b7aa306cde	7417cca9-3f7c-44e0-b3d5-cba1caf21620	t	${role_view-profile}	view-profile	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	7417cca9-3f7c-44e0-b3d5-cba1caf21620	\N
b9c0319f-faa2-4e13-a2fb-8c0f079ddb57	7417cca9-3f7c-44e0-b3d5-cba1caf21620	t	${role_manage-account}	manage-account	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	7417cca9-3f7c-44e0-b3d5-cba1caf21620	\N
b494b73d-9404-45dc-a5ba-bc2a25856688	7417cca9-3f7c-44e0-b3d5-cba1caf21620	t	${role_manage-account-links}	manage-account-links	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	7417cca9-3f7c-44e0-b3d5-cba1caf21620	\N
31f609df-be1d-413f-a137-9b6f993ea284	7417cca9-3f7c-44e0-b3d5-cba1caf21620	t	${role_view-applications}	view-applications	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	7417cca9-3f7c-44e0-b3d5-cba1caf21620	\N
fa7144a9-8960-4f25-ad98-48b8e67fbbf1	7417cca9-3f7c-44e0-b3d5-cba1caf21620	t	${role_view-consent}	view-consent	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	7417cca9-3f7c-44e0-b3d5-cba1caf21620	\N
464f2227-23f2-484e-a5d7-8e4a0e2f2d41	7417cca9-3f7c-44e0-b3d5-cba1caf21620	t	${role_manage-consent}	manage-consent	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	7417cca9-3f7c-44e0-b3d5-cba1caf21620	\N
1507b22a-0c84-4618-ab42-f8a076f2cdf8	7417cca9-3f7c-44e0-b3d5-cba1caf21620	t	${role_delete-account}	delete-account	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	7417cca9-3f7c-44e0-b3d5-cba1caf21620	\N
dd06b616-981d-4494-b96f-7c7a479afdf1	372e9c2e-9165-403e-823e-0f4701719bd3	t	${role_read-token}	read-token	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	372e9c2e-9165-403e-823e-0f4701719bd3	\N
9487013a-ba2e-4827-836e-b820ec10d36d	b21c75eb-cadf-4f68-929e-e4a352b75419	t	${role_impersonation}	impersonation	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	b21c75eb-cadf-4f68-929e-e4a352b75419	\N
466a0bcd-f1b7-4f65-949c-4db8ccae974a	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	f	${role_offline-access}	offline_access	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	\N	\N
67f8fe38-5f14-4914-89db-b22e4a8bd406	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	f	${role_uma_authorization}	uma_authorization	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	\N	\N
961fad03-edb6-4123-813a-fd9f10e08572	flo-dev	f	${role_default-roles}	default-roles-flo-dev	flo-dev	\N	\N
6bc76bf4-b651-4e70-9f65-71d184c6e04e	67cface5-a2c1-4604-bbda-60aaa4487e03	t	${role_create-client}	create-client	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	67cface5-a2c1-4604-bbda-60aaa4487e03	\N
d1d9258e-04d6-4cd2-8a0a-97d05c7cf31e	67cface5-a2c1-4604-bbda-60aaa4487e03	t	${role_view-realm}	view-realm	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	67cface5-a2c1-4604-bbda-60aaa4487e03	\N
b68b67cb-d144-4b52-81ce-b4922d225e11	67cface5-a2c1-4604-bbda-60aaa4487e03	t	${role_view-users}	view-users	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	67cface5-a2c1-4604-bbda-60aaa4487e03	\N
9abd3b61-14e6-4784-a47b-1409ba0daa5a	67cface5-a2c1-4604-bbda-60aaa4487e03	t	${role_view-clients}	view-clients	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	67cface5-a2c1-4604-bbda-60aaa4487e03	\N
c3ed070e-9649-48cd-b4d3-44a4372465dc	67cface5-a2c1-4604-bbda-60aaa4487e03	t	${role_view-events}	view-events	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	67cface5-a2c1-4604-bbda-60aaa4487e03	\N
a337e2e7-a7ad-4073-b8ae-2bb12ad54a9d	67cface5-a2c1-4604-bbda-60aaa4487e03	t	${role_view-identity-providers}	view-identity-providers	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	67cface5-a2c1-4604-bbda-60aaa4487e03	\N
888ea168-5b19-4d17-96a7-af2056be5c78	67cface5-a2c1-4604-bbda-60aaa4487e03	t	${role_view-authorization}	view-authorization	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	67cface5-a2c1-4604-bbda-60aaa4487e03	\N
8f699b3b-2408-42d3-933d-766120b75d14	67cface5-a2c1-4604-bbda-60aaa4487e03	t	${role_manage-realm}	manage-realm	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	67cface5-a2c1-4604-bbda-60aaa4487e03	\N
24794320-6b64-471b-971c-36f113e67791	67cface5-a2c1-4604-bbda-60aaa4487e03	t	${role_manage-users}	manage-users	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	67cface5-a2c1-4604-bbda-60aaa4487e03	\N
071e6741-5b2b-4288-9477-7e354da3d754	67cface5-a2c1-4604-bbda-60aaa4487e03	t	${role_manage-clients}	manage-clients	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	67cface5-a2c1-4604-bbda-60aaa4487e03	\N
10fd68ac-50b6-45ff-b97e-3e7da10695ab	67cface5-a2c1-4604-bbda-60aaa4487e03	t	${role_manage-events}	manage-events	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	67cface5-a2c1-4604-bbda-60aaa4487e03	\N
6fecd258-e97a-41e2-94fc-5cf6c6ae3fa7	67cface5-a2c1-4604-bbda-60aaa4487e03	t	${role_manage-identity-providers}	manage-identity-providers	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	67cface5-a2c1-4604-bbda-60aaa4487e03	\N
dc724212-5f27-467c-8a2a-9e67fa5d0c90	67cface5-a2c1-4604-bbda-60aaa4487e03	t	${role_manage-authorization}	manage-authorization	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	67cface5-a2c1-4604-bbda-60aaa4487e03	\N
a0b5fe34-c9a5-4692-b727-1bdf73c7b333	67cface5-a2c1-4604-bbda-60aaa4487e03	t	${role_query-users}	query-users	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	67cface5-a2c1-4604-bbda-60aaa4487e03	\N
1537592d-a56e-41e3-8a6d-009509d055fd	67cface5-a2c1-4604-bbda-60aaa4487e03	t	${role_query-clients}	query-clients	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	67cface5-a2c1-4604-bbda-60aaa4487e03	\N
06f6c477-49d0-431d-8a98-2c8b6cc07203	67cface5-a2c1-4604-bbda-60aaa4487e03	t	${role_query-realms}	query-realms	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	67cface5-a2c1-4604-bbda-60aaa4487e03	\N
105885ce-e517-4ceb-a7ae-e3608fd023ff	67cface5-a2c1-4604-bbda-60aaa4487e03	t	${role_query-groups}	query-groups	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	67cface5-a2c1-4604-bbda-60aaa4487e03	\N
257295e5-9e8b-4133-9d57-638146c07490	6c632f23-8c66-4693-b449-624437e7c1bf	t	${role_realm-admin}	realm-admin	flo-dev	6c632f23-8c66-4693-b449-624437e7c1bf	\N
881f4654-a3cd-40cd-bee7-df6f46ba008a	6c632f23-8c66-4693-b449-624437e7c1bf	t	${role_create-client}	create-client	flo-dev	6c632f23-8c66-4693-b449-624437e7c1bf	\N
3ee45935-27c2-4f2d-9f26-08f4552adef5	6c632f23-8c66-4693-b449-624437e7c1bf	t	${role_view-realm}	view-realm	flo-dev	6c632f23-8c66-4693-b449-624437e7c1bf	\N
f41971e9-41d3-40f4-888e-2b65e180ad22	6c632f23-8c66-4693-b449-624437e7c1bf	t	${role_view-users}	view-users	flo-dev	6c632f23-8c66-4693-b449-624437e7c1bf	\N
fdaf627c-6643-4b02-9940-821ebb72f950	6c632f23-8c66-4693-b449-624437e7c1bf	t	${role_view-clients}	view-clients	flo-dev	6c632f23-8c66-4693-b449-624437e7c1bf	\N
5c341e89-70eb-42a4-86c4-24221dcbbf85	6c632f23-8c66-4693-b449-624437e7c1bf	t	${role_view-events}	view-events	flo-dev	6c632f23-8c66-4693-b449-624437e7c1bf	\N
e159be61-ae1b-4818-92d7-70783b885929	6c632f23-8c66-4693-b449-624437e7c1bf	t	${role_view-identity-providers}	view-identity-providers	flo-dev	6c632f23-8c66-4693-b449-624437e7c1bf	\N
89f5649b-9573-4a25-9efb-1abd73d0fa9b	6c632f23-8c66-4693-b449-624437e7c1bf	t	${role_view-authorization}	view-authorization	flo-dev	6c632f23-8c66-4693-b449-624437e7c1bf	\N
76462a27-89a4-4c0c-9696-253b668911d4	6c632f23-8c66-4693-b449-624437e7c1bf	t	${role_manage-realm}	manage-realm	flo-dev	6c632f23-8c66-4693-b449-624437e7c1bf	\N
a42007b7-fa10-4d6a-a9db-d68f42ae8d41	6c632f23-8c66-4693-b449-624437e7c1bf	t	${role_manage-users}	manage-users	flo-dev	6c632f23-8c66-4693-b449-624437e7c1bf	\N
ba105205-63a3-47fb-bfb6-4f84380e6d61	6c632f23-8c66-4693-b449-624437e7c1bf	t	${role_manage-clients}	manage-clients	flo-dev	6c632f23-8c66-4693-b449-624437e7c1bf	\N
e7643da6-dde7-4eca-a515-a2bad6a4416a	6c632f23-8c66-4693-b449-624437e7c1bf	t	${role_manage-events}	manage-events	flo-dev	6c632f23-8c66-4693-b449-624437e7c1bf	\N
f8a68d05-849d-4b9f-836a-786d9f303ae1	6c632f23-8c66-4693-b449-624437e7c1bf	t	${role_manage-identity-providers}	manage-identity-providers	flo-dev	6c632f23-8c66-4693-b449-624437e7c1bf	\N
ccbe1d64-bd5f-4249-b339-a9ab63c1e8c2	6c632f23-8c66-4693-b449-624437e7c1bf	t	${role_manage-authorization}	manage-authorization	flo-dev	6c632f23-8c66-4693-b449-624437e7c1bf	\N
e0aeff47-1b24-47b6-95fd-78bf11fb9eee	6c632f23-8c66-4693-b449-624437e7c1bf	t	${role_query-users}	query-users	flo-dev	6c632f23-8c66-4693-b449-624437e7c1bf	\N
ab0d2474-9c96-4d3e-bf11-2e25673ee3cd	6c632f23-8c66-4693-b449-624437e7c1bf	t	${role_query-clients}	query-clients	flo-dev	6c632f23-8c66-4693-b449-624437e7c1bf	\N
cf7a7238-cb46-4c5f-b0ab-8a9dcb34e386	6c632f23-8c66-4693-b449-624437e7c1bf	t	${role_query-realms}	query-realms	flo-dev	6c632f23-8c66-4693-b449-624437e7c1bf	\N
a2ff971d-d413-40b6-ba1f-8282e5dcfcac	6c632f23-8c66-4693-b449-624437e7c1bf	t	${role_query-groups}	query-groups	flo-dev	6c632f23-8c66-4693-b449-624437e7c1bf	\N
b846b1a6-7141-419b-bec6-f119a11c6038	789b6c13-d278-42b9-89c3-d49416835d9d	t	${role_view-profile}	view-profile	flo-dev	789b6c13-d278-42b9-89c3-d49416835d9d	\N
a386b561-0ac1-4c8b-be1f-03e3f16bfc50	789b6c13-d278-42b9-89c3-d49416835d9d	t	${role_manage-account}	manage-account	flo-dev	789b6c13-d278-42b9-89c3-d49416835d9d	\N
8b846807-32fa-45f1-aa37-1e4ef1fac592	789b6c13-d278-42b9-89c3-d49416835d9d	t	${role_manage-account-links}	manage-account-links	flo-dev	789b6c13-d278-42b9-89c3-d49416835d9d	\N
cc4da952-99ab-45f4-a353-80b2c8c2cc52	789b6c13-d278-42b9-89c3-d49416835d9d	t	${role_view-applications}	view-applications	flo-dev	789b6c13-d278-42b9-89c3-d49416835d9d	\N
8126f9b6-0e27-40b4-ab2e-fb81d3c8ea6b	789b6c13-d278-42b9-89c3-d49416835d9d	t	${role_view-consent}	view-consent	flo-dev	789b6c13-d278-42b9-89c3-d49416835d9d	\N
cf20ba4b-438b-49da-a2b2-c4f00e7470b0	789b6c13-d278-42b9-89c3-d49416835d9d	t	${role_manage-consent}	manage-consent	flo-dev	789b6c13-d278-42b9-89c3-d49416835d9d	\N
3c92355d-da37-4efb-946d-bd8fbeb5273f	789b6c13-d278-42b9-89c3-d49416835d9d	t	${role_delete-account}	delete-account	flo-dev	789b6c13-d278-42b9-89c3-d49416835d9d	\N
9467aeb3-27a1-4cf7-bf74-8bff76646695	67cface5-a2c1-4604-bbda-60aaa4487e03	t	${role_impersonation}	impersonation	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	67cface5-a2c1-4604-bbda-60aaa4487e03	\N
dab42d62-ab6d-4c04-84f8-51dec6d9a1b4	6c632f23-8c66-4693-b449-624437e7c1bf	t	${role_impersonation}	impersonation	flo-dev	6c632f23-8c66-4693-b449-624437e7c1bf	\N
5558ef5f-006c-442c-97ec-c8da2d86d038	aae5a78c-7957-49f3-acba-140069deac83	t	${role_read-token}	read-token	flo-dev	aae5a78c-7957-49f3-acba-140069deac83	\N
962e3b5a-b8b5-4eea-90c1-5bea920dba44	flo-dev	f	${role_offline-access}	offline_access	flo-dev	\N	\N
ec169112-abe8-48a5-9fc2-34bebfbb9e79	flo-dev	f	${role_uma_authorization}	uma_authorization	flo-dev	\N	\N
4bc8f8d3-f944-4820-9204-05aaaffb4904	98374355-2b89-45c6-a6f6-31fe65a3f8b2	t	\N	uma_protection	flo-dev	98374355-2b89-45c6-a6f6-31fe65a3f8b2	\N
37a543c1-6fed-4eda-a1dc-b72fec5f14a8	flo-dev	f	\N	USER	flo-dev	\N	\N
c3d48d06-09f6-4a25-8ab3-bd9f57dea7ab	flo-dev	f		ADMIN	flo-dev	\N	\N
a0be99b2-3587-4796-9d2d-c1ff227ce0ff	98374355-2b89-45c6-a6f6-31fe65a3f8b2	t	${role_query-users}	query-users	flo-dev	98374355-2b89-45c6-a6f6-31fe65a3f8b2	\N
\.


--
-- Data for Name: migration_model; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migration_model (id, version, update_time) FROM stdin;
cgld7	18.0.0	1670825107
\.


--
-- Data for Name: offline_client_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.offline_client_session (user_session_id, client_id, offline_flag, "timestamp", data, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: offline_user_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.offline_user_session (user_session_id, user_id, realm_id, created_on, offline_flag, data, last_session_refresh) FROM stdin;
\.


--
-- Data for Name: policy_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.policy_config (policy_id, name, value) FROM stdin;
796091fa-db96-4066-b6f8-de4ad475235c	code	// by default, grants any permission associated with this policy\n$evaluation.grant();\n
91a2bab6-7aa2-44ec-83c7-c62fd3c9640c	defaultResourceType	urn:FLO_API_SECRET:resources:default
\.


--
-- Data for Name: protocol_mapper; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.protocol_mapper (id, name, protocol, protocol_mapper_name, client_id, client_scope_id) FROM stdin;
5db3c005-0115-4241-8bfd-68614a5c5af5	audience resolve	openid-connect	oidc-audience-resolve-mapper	efc9e679-02e5-47ae-8fb9-f5220a093ac0	\N
69f7706e-8ddc-4abe-8a42-f886a2f6b2dc	locale	openid-connect	oidc-usermodel-attribute-mapper	eec06cf2-4948-4503-989b-a035474e93c3	\N
e5da51c0-9f9d-441c-bbd7-fbd71dc6a4d9	role list	saml	saml-role-list-mapper	\N	ef681ffb-512f-4ffa-b5b0-f58b09331f73
10af02ea-e070-4d1b-b47b-ec0cfdc87d12	full name	openid-connect	oidc-full-name-mapper	\N	02c60c90-42a0-47fe-82ad-2f00d2565081
b8ede1ca-427c-4cb6-9bf1-6e0a4c6fa9bf	family name	openid-connect	oidc-usermodel-property-mapper	\N	02c60c90-42a0-47fe-82ad-2f00d2565081
508474d8-79f7-40a2-b5e3-b14dfd37a9e0	given name	openid-connect	oidc-usermodel-property-mapper	\N	02c60c90-42a0-47fe-82ad-2f00d2565081
856dd4aa-72b2-4d8b-8a04-70e80607c2a2	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	02c60c90-42a0-47fe-82ad-2f00d2565081
92a6af40-67a7-44a1-a381-ea6ed9c49b3f	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	02c60c90-42a0-47fe-82ad-2f00d2565081
46aa08d6-b611-4bf8-9f02-463d26ed91b4	username	openid-connect	oidc-usermodel-property-mapper	\N	02c60c90-42a0-47fe-82ad-2f00d2565081
610b6c07-d11e-4299-826a-f25b310c43fc	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	02c60c90-42a0-47fe-82ad-2f00d2565081
e786b03c-417a-4021-889c-08bc24f30bb1	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	02c60c90-42a0-47fe-82ad-2f00d2565081
f4109c56-9d94-4d10-8ea5-84db2cd634c2	website	openid-connect	oidc-usermodel-attribute-mapper	\N	02c60c90-42a0-47fe-82ad-2f00d2565081
3ffec092-67d9-4b0f-b8f9-1a497d01a12a	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	02c60c90-42a0-47fe-82ad-2f00d2565081
824489b9-a412-45e4-b10c-ceb8fecfaba8	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	02c60c90-42a0-47fe-82ad-2f00d2565081
00c88444-0694-4f70-abfa-44952066f9a7	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	02c60c90-42a0-47fe-82ad-2f00d2565081
aeadaf43-84a0-4eb8-b743-7f52155b57da	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	02c60c90-42a0-47fe-82ad-2f00d2565081
407ec2ee-0640-4f1f-bb10-97974a059e07	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	02c60c90-42a0-47fe-82ad-2f00d2565081
83b0fa16-ee6d-46a7-a1c6-c8de1361a057	email	openid-connect	oidc-usermodel-property-mapper	\N	9a781c4c-97ec-43be-8c19-afb75b52fa93
66b4a090-1e12-48f5-8ab9-c63ffcf8bc75	email verified	openid-connect	oidc-usermodel-property-mapper	\N	9a781c4c-97ec-43be-8c19-afb75b52fa93
c3cdd985-0532-482f-87ac-6dc0b8b75bdd	address	openid-connect	oidc-address-mapper	\N	e2f7910d-7196-4fd2-b42c-a8ce1a0187fb
167f5a28-4f84-4788-8c19-827070df7807	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	63bd6d13-95c1-43be-9ad7-f4a532f85ca1
21035393-5d5b-4d40-82ca-b1224fe71b5f	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	63bd6d13-95c1-43be-9ad7-f4a532f85ca1
247200c9-60f4-4d6a-b6e6-b60074fe216e	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	c74e1567-89b2-405c-ab3a-b6fe179214e2
d36830a6-f6b6-4e22-98b9-aebbd3dce49c	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	c74e1567-89b2-405c-ab3a-b6fe179214e2
9a0d6c5f-7582-4acf-a3ad-5c8111e62098	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	c74e1567-89b2-405c-ab3a-b6fe179214e2
97eb94f2-63df-42f0-a2ab-1443362fb919	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	160f9b39-a84f-4ae3-9635-92d6e44b5f85
6c5000cb-8521-4c25-9105-ef5e2b15d490	upn	openid-connect	oidc-usermodel-property-mapper	\N	ffdc7bb0-7513-4893-85d6-0ed1bcd7bf46
1b005ef7-1855-40fe-940a-e5c47dba8054	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	ffdc7bb0-7513-4893-85d6-0ed1bcd7bf46
d456c622-aa96-42d5-8290-619cb7e1cf8b	acr loa level	openid-connect	oidc-acr-mapper	\N	26250cfe-8c33-4c58-b9f7-6e197d4b41a5
ee85af68-736c-4949-8feb-e8ae308cdb50	audience resolve	openid-connect	oidc-audience-resolve-mapper	a7e1d6c4-7d32-4062-aa46-0a726265e6be	\N
6f10fb83-f82f-49c3-b2b9-04fa35f72b53	role list	saml	saml-role-list-mapper	\N	bb71a697-5575-400a-8d88-5353ca4ce58b
301ebcff-c5b8-4f38-b15b-ce23c7078104	full name	openid-connect	oidc-full-name-mapper	\N	05852017-81b6-4a14-b47d-775c2af82441
8e7117a4-b235-480b-8a81-1a537128a643	family name	openid-connect	oidc-usermodel-property-mapper	\N	05852017-81b6-4a14-b47d-775c2af82441
b08fd532-0b7e-4d5a-a3a3-a67ddead3e54	given name	openid-connect	oidc-usermodel-property-mapper	\N	05852017-81b6-4a14-b47d-775c2af82441
f451f03c-4468-402b-9fbc-e897e7189484	middle name	openid-connect	oidc-usermodel-attribute-mapper	\N	05852017-81b6-4a14-b47d-775c2af82441
ae7eec11-c84e-4306-afe8-a9eec41f65e4	nickname	openid-connect	oidc-usermodel-attribute-mapper	\N	05852017-81b6-4a14-b47d-775c2af82441
21a1811a-f1d6-4719-8e7e-ca9f3d58716b	username	openid-connect	oidc-usermodel-property-mapper	\N	05852017-81b6-4a14-b47d-775c2af82441
2cb1e30a-c5f9-4d82-ad3b-27fec535e5b8	profile	openid-connect	oidc-usermodel-attribute-mapper	\N	05852017-81b6-4a14-b47d-775c2af82441
bdc6cdb7-0ebb-4aa7-8a59-78672b2a4f6f	picture	openid-connect	oidc-usermodel-attribute-mapper	\N	05852017-81b6-4a14-b47d-775c2af82441
1aadc004-092a-47ed-8ff8-169121155430	website	openid-connect	oidc-usermodel-attribute-mapper	\N	05852017-81b6-4a14-b47d-775c2af82441
8c321ae8-eb74-4884-956c-8eb42a88736d	gender	openid-connect	oidc-usermodel-attribute-mapper	\N	05852017-81b6-4a14-b47d-775c2af82441
bb3797f4-1e1c-4a8d-bb25-9f595048f85d	birthdate	openid-connect	oidc-usermodel-attribute-mapper	\N	05852017-81b6-4a14-b47d-775c2af82441
d3b78fce-f857-472f-9028-9a3d98eca640	zoneinfo	openid-connect	oidc-usermodel-attribute-mapper	\N	05852017-81b6-4a14-b47d-775c2af82441
669d1c69-d1e4-4981-8865-ab481c646508	locale	openid-connect	oidc-usermodel-attribute-mapper	\N	05852017-81b6-4a14-b47d-775c2af82441
947f086a-be51-45d0-8883-d4cf923f5201	updated at	openid-connect	oidc-usermodel-attribute-mapper	\N	05852017-81b6-4a14-b47d-775c2af82441
c2f64cae-ec62-4beb-bd74-1e05f3422b70	email	openid-connect	oidc-usermodel-property-mapper	\N	5956f2d7-6e0c-4c3e-8fb2-73ceeeb8259a
739b8ab4-e8a2-4295-bbcf-905126c9a9a8	email verified	openid-connect	oidc-usermodel-property-mapper	\N	5956f2d7-6e0c-4c3e-8fb2-73ceeeb8259a
04d39b73-e501-4b72-9e36-ffc5a08f2178	address	openid-connect	oidc-address-mapper	\N	145ac4ba-deed-4e6d-8733-6a0b1661c050
38b90e5d-2121-4798-b8f9-4dfb0244dc07	phone number	openid-connect	oidc-usermodel-attribute-mapper	\N	a9d62954-df3b-4257-bbfb-108e619cc19e
2b3bc1df-ab69-4c81-bd14-9c750fb032b1	phone number verified	openid-connect	oidc-usermodel-attribute-mapper	\N	a9d62954-df3b-4257-bbfb-108e619cc19e
a5c553c5-8942-463b-ba1e-9ace6922f198	realm roles	openid-connect	oidc-usermodel-realm-role-mapper	\N	287af0c7-72c0-43b6-bfcf-f86344615357
0056adbb-cc83-4381-8243-883ba56fc055	client roles	openid-connect	oidc-usermodel-client-role-mapper	\N	287af0c7-72c0-43b6-bfcf-f86344615357
7eaaa3d6-7728-4cb5-9e5f-9295e0d6c8bf	audience resolve	openid-connect	oidc-audience-resolve-mapper	\N	287af0c7-72c0-43b6-bfcf-f86344615357
d876c4a4-7240-4a5b-9947-500e253440a4	allowed web origins	openid-connect	oidc-allowed-origins-mapper	\N	b871a7b1-0931-45f8-a490-1c3b2fcc4380
83437747-d58b-47b8-a5cb-5896d13a5d2b	upn	openid-connect	oidc-usermodel-property-mapper	\N	b27c9329-5473-4e31-8eea-68f11c0856b7
b91c560f-76bd-4e53-bc23-52396bcdeb60	groups	openid-connect	oidc-usermodel-realm-role-mapper	\N	b27c9329-5473-4e31-8eea-68f11c0856b7
315e8888-5673-4889-90ca-23ffce7e7f0d	acr loa level	openid-connect	oidc-acr-mapper	\N	2ff3aa09-c4c1-4464-b610-0e4437600829
83956bcc-a70a-4b21-9658-3e596e030d24	locale	openid-connect	oidc-usermodel-attribute-mapper	58f6bf53-3f9f-4b00-9787-222d92d2e1a2	\N
c5f6a1c5-4e8e-467e-9c7b-0ef4cde5bd1f	Client ID	openid-connect	oidc-usersessionmodel-note-mapper	98374355-2b89-45c6-a6f6-31fe65a3f8b2	\N
ff8de050-c35a-450f-aed4-16f892e87661	Client Host	openid-connect	oidc-usersessionmodel-note-mapper	98374355-2b89-45c6-a6f6-31fe65a3f8b2	\N
26488cc9-cdc5-474a-9aca-087ac23ff98a	Client IP Address	openid-connect	oidc-usersessionmodel-note-mapper	98374355-2b89-45c6-a6f6-31fe65a3f8b2	\N
\.


--
-- Data for Name: protocol_mapper_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.protocol_mapper_config (protocol_mapper_id, value, name) FROM stdin;
69f7706e-8ddc-4abe-8a42-f886a2f6b2dc	true	userinfo.token.claim
69f7706e-8ddc-4abe-8a42-f886a2f6b2dc	locale	user.attribute
69f7706e-8ddc-4abe-8a42-f886a2f6b2dc	true	id.token.claim
69f7706e-8ddc-4abe-8a42-f886a2f6b2dc	true	access.token.claim
69f7706e-8ddc-4abe-8a42-f886a2f6b2dc	locale	claim.name
69f7706e-8ddc-4abe-8a42-f886a2f6b2dc	String	jsonType.label
e5da51c0-9f9d-441c-bbd7-fbd71dc6a4d9	false	single
e5da51c0-9f9d-441c-bbd7-fbd71dc6a4d9	Basic	attribute.nameformat
e5da51c0-9f9d-441c-bbd7-fbd71dc6a4d9	Role	attribute.name
10af02ea-e070-4d1b-b47b-ec0cfdc87d12	true	userinfo.token.claim
10af02ea-e070-4d1b-b47b-ec0cfdc87d12	true	id.token.claim
10af02ea-e070-4d1b-b47b-ec0cfdc87d12	true	access.token.claim
b8ede1ca-427c-4cb6-9bf1-6e0a4c6fa9bf	true	userinfo.token.claim
b8ede1ca-427c-4cb6-9bf1-6e0a4c6fa9bf	lastName	user.attribute
b8ede1ca-427c-4cb6-9bf1-6e0a4c6fa9bf	true	id.token.claim
b8ede1ca-427c-4cb6-9bf1-6e0a4c6fa9bf	true	access.token.claim
b8ede1ca-427c-4cb6-9bf1-6e0a4c6fa9bf	family_name	claim.name
b8ede1ca-427c-4cb6-9bf1-6e0a4c6fa9bf	String	jsonType.label
508474d8-79f7-40a2-b5e3-b14dfd37a9e0	true	userinfo.token.claim
508474d8-79f7-40a2-b5e3-b14dfd37a9e0	firstName	user.attribute
508474d8-79f7-40a2-b5e3-b14dfd37a9e0	true	id.token.claim
508474d8-79f7-40a2-b5e3-b14dfd37a9e0	true	access.token.claim
508474d8-79f7-40a2-b5e3-b14dfd37a9e0	given_name	claim.name
508474d8-79f7-40a2-b5e3-b14dfd37a9e0	String	jsonType.label
856dd4aa-72b2-4d8b-8a04-70e80607c2a2	true	userinfo.token.claim
856dd4aa-72b2-4d8b-8a04-70e80607c2a2	middleName	user.attribute
856dd4aa-72b2-4d8b-8a04-70e80607c2a2	true	id.token.claim
856dd4aa-72b2-4d8b-8a04-70e80607c2a2	true	access.token.claim
856dd4aa-72b2-4d8b-8a04-70e80607c2a2	middle_name	claim.name
856dd4aa-72b2-4d8b-8a04-70e80607c2a2	String	jsonType.label
92a6af40-67a7-44a1-a381-ea6ed9c49b3f	true	userinfo.token.claim
92a6af40-67a7-44a1-a381-ea6ed9c49b3f	nickname	user.attribute
92a6af40-67a7-44a1-a381-ea6ed9c49b3f	true	id.token.claim
92a6af40-67a7-44a1-a381-ea6ed9c49b3f	true	access.token.claim
92a6af40-67a7-44a1-a381-ea6ed9c49b3f	nickname	claim.name
92a6af40-67a7-44a1-a381-ea6ed9c49b3f	String	jsonType.label
46aa08d6-b611-4bf8-9f02-463d26ed91b4	true	userinfo.token.claim
46aa08d6-b611-4bf8-9f02-463d26ed91b4	username	user.attribute
46aa08d6-b611-4bf8-9f02-463d26ed91b4	true	id.token.claim
46aa08d6-b611-4bf8-9f02-463d26ed91b4	true	access.token.claim
46aa08d6-b611-4bf8-9f02-463d26ed91b4	preferred_username	claim.name
46aa08d6-b611-4bf8-9f02-463d26ed91b4	String	jsonType.label
610b6c07-d11e-4299-826a-f25b310c43fc	true	userinfo.token.claim
610b6c07-d11e-4299-826a-f25b310c43fc	profile	user.attribute
610b6c07-d11e-4299-826a-f25b310c43fc	true	id.token.claim
610b6c07-d11e-4299-826a-f25b310c43fc	true	access.token.claim
610b6c07-d11e-4299-826a-f25b310c43fc	profile	claim.name
610b6c07-d11e-4299-826a-f25b310c43fc	String	jsonType.label
e786b03c-417a-4021-889c-08bc24f30bb1	true	userinfo.token.claim
e786b03c-417a-4021-889c-08bc24f30bb1	picture	user.attribute
e786b03c-417a-4021-889c-08bc24f30bb1	true	id.token.claim
e786b03c-417a-4021-889c-08bc24f30bb1	true	access.token.claim
e786b03c-417a-4021-889c-08bc24f30bb1	picture	claim.name
e786b03c-417a-4021-889c-08bc24f30bb1	String	jsonType.label
f4109c56-9d94-4d10-8ea5-84db2cd634c2	true	userinfo.token.claim
f4109c56-9d94-4d10-8ea5-84db2cd634c2	website	user.attribute
f4109c56-9d94-4d10-8ea5-84db2cd634c2	true	id.token.claim
f4109c56-9d94-4d10-8ea5-84db2cd634c2	true	access.token.claim
f4109c56-9d94-4d10-8ea5-84db2cd634c2	website	claim.name
f4109c56-9d94-4d10-8ea5-84db2cd634c2	String	jsonType.label
3ffec092-67d9-4b0f-b8f9-1a497d01a12a	true	userinfo.token.claim
3ffec092-67d9-4b0f-b8f9-1a497d01a12a	gender	user.attribute
3ffec092-67d9-4b0f-b8f9-1a497d01a12a	true	id.token.claim
3ffec092-67d9-4b0f-b8f9-1a497d01a12a	true	access.token.claim
3ffec092-67d9-4b0f-b8f9-1a497d01a12a	gender	claim.name
3ffec092-67d9-4b0f-b8f9-1a497d01a12a	String	jsonType.label
824489b9-a412-45e4-b10c-ceb8fecfaba8	true	userinfo.token.claim
824489b9-a412-45e4-b10c-ceb8fecfaba8	birthdate	user.attribute
824489b9-a412-45e4-b10c-ceb8fecfaba8	true	id.token.claim
824489b9-a412-45e4-b10c-ceb8fecfaba8	true	access.token.claim
824489b9-a412-45e4-b10c-ceb8fecfaba8	birthdate	claim.name
824489b9-a412-45e4-b10c-ceb8fecfaba8	String	jsonType.label
00c88444-0694-4f70-abfa-44952066f9a7	true	userinfo.token.claim
00c88444-0694-4f70-abfa-44952066f9a7	zoneinfo	user.attribute
00c88444-0694-4f70-abfa-44952066f9a7	true	id.token.claim
00c88444-0694-4f70-abfa-44952066f9a7	true	access.token.claim
00c88444-0694-4f70-abfa-44952066f9a7	zoneinfo	claim.name
00c88444-0694-4f70-abfa-44952066f9a7	String	jsonType.label
aeadaf43-84a0-4eb8-b743-7f52155b57da	true	userinfo.token.claim
aeadaf43-84a0-4eb8-b743-7f52155b57da	locale	user.attribute
aeadaf43-84a0-4eb8-b743-7f52155b57da	true	id.token.claim
aeadaf43-84a0-4eb8-b743-7f52155b57da	true	access.token.claim
aeadaf43-84a0-4eb8-b743-7f52155b57da	locale	claim.name
aeadaf43-84a0-4eb8-b743-7f52155b57da	String	jsonType.label
407ec2ee-0640-4f1f-bb10-97974a059e07	true	userinfo.token.claim
407ec2ee-0640-4f1f-bb10-97974a059e07	updatedAt	user.attribute
407ec2ee-0640-4f1f-bb10-97974a059e07	true	id.token.claim
407ec2ee-0640-4f1f-bb10-97974a059e07	true	access.token.claim
407ec2ee-0640-4f1f-bb10-97974a059e07	updated_at	claim.name
407ec2ee-0640-4f1f-bb10-97974a059e07	long	jsonType.label
83b0fa16-ee6d-46a7-a1c6-c8de1361a057	true	userinfo.token.claim
83b0fa16-ee6d-46a7-a1c6-c8de1361a057	email	user.attribute
83b0fa16-ee6d-46a7-a1c6-c8de1361a057	true	id.token.claim
83b0fa16-ee6d-46a7-a1c6-c8de1361a057	true	access.token.claim
83b0fa16-ee6d-46a7-a1c6-c8de1361a057	email	claim.name
83b0fa16-ee6d-46a7-a1c6-c8de1361a057	String	jsonType.label
66b4a090-1e12-48f5-8ab9-c63ffcf8bc75	true	userinfo.token.claim
66b4a090-1e12-48f5-8ab9-c63ffcf8bc75	emailVerified	user.attribute
66b4a090-1e12-48f5-8ab9-c63ffcf8bc75	true	id.token.claim
66b4a090-1e12-48f5-8ab9-c63ffcf8bc75	true	access.token.claim
66b4a090-1e12-48f5-8ab9-c63ffcf8bc75	email_verified	claim.name
66b4a090-1e12-48f5-8ab9-c63ffcf8bc75	boolean	jsonType.label
c3cdd985-0532-482f-87ac-6dc0b8b75bdd	formatted	user.attribute.formatted
c3cdd985-0532-482f-87ac-6dc0b8b75bdd	country	user.attribute.country
c3cdd985-0532-482f-87ac-6dc0b8b75bdd	postal_code	user.attribute.postal_code
c3cdd985-0532-482f-87ac-6dc0b8b75bdd	true	userinfo.token.claim
c3cdd985-0532-482f-87ac-6dc0b8b75bdd	street	user.attribute.street
c3cdd985-0532-482f-87ac-6dc0b8b75bdd	true	id.token.claim
c3cdd985-0532-482f-87ac-6dc0b8b75bdd	region	user.attribute.region
c3cdd985-0532-482f-87ac-6dc0b8b75bdd	true	access.token.claim
c3cdd985-0532-482f-87ac-6dc0b8b75bdd	locality	user.attribute.locality
167f5a28-4f84-4788-8c19-827070df7807	true	userinfo.token.claim
167f5a28-4f84-4788-8c19-827070df7807	phoneNumber	user.attribute
167f5a28-4f84-4788-8c19-827070df7807	true	id.token.claim
167f5a28-4f84-4788-8c19-827070df7807	true	access.token.claim
167f5a28-4f84-4788-8c19-827070df7807	phone_number	claim.name
167f5a28-4f84-4788-8c19-827070df7807	String	jsonType.label
21035393-5d5b-4d40-82ca-b1224fe71b5f	true	userinfo.token.claim
21035393-5d5b-4d40-82ca-b1224fe71b5f	phoneNumberVerified	user.attribute
21035393-5d5b-4d40-82ca-b1224fe71b5f	true	id.token.claim
21035393-5d5b-4d40-82ca-b1224fe71b5f	true	access.token.claim
21035393-5d5b-4d40-82ca-b1224fe71b5f	phone_number_verified	claim.name
21035393-5d5b-4d40-82ca-b1224fe71b5f	boolean	jsonType.label
247200c9-60f4-4d6a-b6e6-b60074fe216e	true	multivalued
247200c9-60f4-4d6a-b6e6-b60074fe216e	foo	user.attribute
247200c9-60f4-4d6a-b6e6-b60074fe216e	true	access.token.claim
247200c9-60f4-4d6a-b6e6-b60074fe216e	realm_access.roles	claim.name
247200c9-60f4-4d6a-b6e6-b60074fe216e	String	jsonType.label
d36830a6-f6b6-4e22-98b9-aebbd3dce49c	true	multivalued
d36830a6-f6b6-4e22-98b9-aebbd3dce49c	foo	user.attribute
d36830a6-f6b6-4e22-98b9-aebbd3dce49c	true	access.token.claim
d36830a6-f6b6-4e22-98b9-aebbd3dce49c	resource_access.${client_id}.roles	claim.name
d36830a6-f6b6-4e22-98b9-aebbd3dce49c	String	jsonType.label
6c5000cb-8521-4c25-9105-ef5e2b15d490	true	userinfo.token.claim
6c5000cb-8521-4c25-9105-ef5e2b15d490	username	user.attribute
6c5000cb-8521-4c25-9105-ef5e2b15d490	true	id.token.claim
6c5000cb-8521-4c25-9105-ef5e2b15d490	true	access.token.claim
6c5000cb-8521-4c25-9105-ef5e2b15d490	upn	claim.name
6c5000cb-8521-4c25-9105-ef5e2b15d490	String	jsonType.label
1b005ef7-1855-40fe-940a-e5c47dba8054	true	multivalued
1b005ef7-1855-40fe-940a-e5c47dba8054	foo	user.attribute
1b005ef7-1855-40fe-940a-e5c47dba8054	true	id.token.claim
1b005ef7-1855-40fe-940a-e5c47dba8054	true	access.token.claim
1b005ef7-1855-40fe-940a-e5c47dba8054	groups	claim.name
1b005ef7-1855-40fe-940a-e5c47dba8054	String	jsonType.label
d456c622-aa96-42d5-8290-619cb7e1cf8b	true	id.token.claim
d456c622-aa96-42d5-8290-619cb7e1cf8b	true	access.token.claim
6f10fb83-f82f-49c3-b2b9-04fa35f72b53	false	single
6f10fb83-f82f-49c3-b2b9-04fa35f72b53	Basic	attribute.nameformat
6f10fb83-f82f-49c3-b2b9-04fa35f72b53	Role	attribute.name
301ebcff-c5b8-4f38-b15b-ce23c7078104	true	userinfo.token.claim
301ebcff-c5b8-4f38-b15b-ce23c7078104	true	id.token.claim
301ebcff-c5b8-4f38-b15b-ce23c7078104	true	access.token.claim
8e7117a4-b235-480b-8a81-1a537128a643	true	userinfo.token.claim
8e7117a4-b235-480b-8a81-1a537128a643	lastName	user.attribute
8e7117a4-b235-480b-8a81-1a537128a643	true	id.token.claim
8e7117a4-b235-480b-8a81-1a537128a643	true	access.token.claim
8e7117a4-b235-480b-8a81-1a537128a643	family_name	claim.name
8e7117a4-b235-480b-8a81-1a537128a643	String	jsonType.label
b08fd532-0b7e-4d5a-a3a3-a67ddead3e54	true	userinfo.token.claim
b08fd532-0b7e-4d5a-a3a3-a67ddead3e54	firstName	user.attribute
b08fd532-0b7e-4d5a-a3a3-a67ddead3e54	true	id.token.claim
b08fd532-0b7e-4d5a-a3a3-a67ddead3e54	true	access.token.claim
b08fd532-0b7e-4d5a-a3a3-a67ddead3e54	given_name	claim.name
b08fd532-0b7e-4d5a-a3a3-a67ddead3e54	String	jsonType.label
f451f03c-4468-402b-9fbc-e897e7189484	true	userinfo.token.claim
f451f03c-4468-402b-9fbc-e897e7189484	middleName	user.attribute
f451f03c-4468-402b-9fbc-e897e7189484	true	id.token.claim
f451f03c-4468-402b-9fbc-e897e7189484	true	access.token.claim
f451f03c-4468-402b-9fbc-e897e7189484	middle_name	claim.name
f451f03c-4468-402b-9fbc-e897e7189484	String	jsonType.label
ae7eec11-c84e-4306-afe8-a9eec41f65e4	true	userinfo.token.claim
ae7eec11-c84e-4306-afe8-a9eec41f65e4	nickname	user.attribute
ae7eec11-c84e-4306-afe8-a9eec41f65e4	true	id.token.claim
ae7eec11-c84e-4306-afe8-a9eec41f65e4	true	access.token.claim
ae7eec11-c84e-4306-afe8-a9eec41f65e4	nickname	claim.name
ae7eec11-c84e-4306-afe8-a9eec41f65e4	String	jsonType.label
21a1811a-f1d6-4719-8e7e-ca9f3d58716b	true	userinfo.token.claim
21a1811a-f1d6-4719-8e7e-ca9f3d58716b	username	user.attribute
21a1811a-f1d6-4719-8e7e-ca9f3d58716b	true	id.token.claim
21a1811a-f1d6-4719-8e7e-ca9f3d58716b	true	access.token.claim
21a1811a-f1d6-4719-8e7e-ca9f3d58716b	preferred_username	claim.name
21a1811a-f1d6-4719-8e7e-ca9f3d58716b	String	jsonType.label
2cb1e30a-c5f9-4d82-ad3b-27fec535e5b8	true	userinfo.token.claim
2cb1e30a-c5f9-4d82-ad3b-27fec535e5b8	profile	user.attribute
2cb1e30a-c5f9-4d82-ad3b-27fec535e5b8	true	id.token.claim
2cb1e30a-c5f9-4d82-ad3b-27fec535e5b8	true	access.token.claim
2cb1e30a-c5f9-4d82-ad3b-27fec535e5b8	profile	claim.name
2cb1e30a-c5f9-4d82-ad3b-27fec535e5b8	String	jsonType.label
bdc6cdb7-0ebb-4aa7-8a59-78672b2a4f6f	true	userinfo.token.claim
bdc6cdb7-0ebb-4aa7-8a59-78672b2a4f6f	picture	user.attribute
bdc6cdb7-0ebb-4aa7-8a59-78672b2a4f6f	true	id.token.claim
bdc6cdb7-0ebb-4aa7-8a59-78672b2a4f6f	true	access.token.claim
bdc6cdb7-0ebb-4aa7-8a59-78672b2a4f6f	picture	claim.name
bdc6cdb7-0ebb-4aa7-8a59-78672b2a4f6f	String	jsonType.label
1aadc004-092a-47ed-8ff8-169121155430	true	userinfo.token.claim
1aadc004-092a-47ed-8ff8-169121155430	website	user.attribute
1aadc004-092a-47ed-8ff8-169121155430	true	id.token.claim
1aadc004-092a-47ed-8ff8-169121155430	true	access.token.claim
1aadc004-092a-47ed-8ff8-169121155430	website	claim.name
1aadc004-092a-47ed-8ff8-169121155430	String	jsonType.label
8c321ae8-eb74-4884-956c-8eb42a88736d	true	userinfo.token.claim
8c321ae8-eb74-4884-956c-8eb42a88736d	gender	user.attribute
8c321ae8-eb74-4884-956c-8eb42a88736d	true	id.token.claim
8c321ae8-eb74-4884-956c-8eb42a88736d	true	access.token.claim
8c321ae8-eb74-4884-956c-8eb42a88736d	gender	claim.name
8c321ae8-eb74-4884-956c-8eb42a88736d	String	jsonType.label
bb3797f4-1e1c-4a8d-bb25-9f595048f85d	true	userinfo.token.claim
bb3797f4-1e1c-4a8d-bb25-9f595048f85d	birthdate	user.attribute
bb3797f4-1e1c-4a8d-bb25-9f595048f85d	true	id.token.claim
bb3797f4-1e1c-4a8d-bb25-9f595048f85d	true	access.token.claim
bb3797f4-1e1c-4a8d-bb25-9f595048f85d	birthdate	claim.name
bb3797f4-1e1c-4a8d-bb25-9f595048f85d	String	jsonType.label
d3b78fce-f857-472f-9028-9a3d98eca640	true	userinfo.token.claim
d3b78fce-f857-472f-9028-9a3d98eca640	zoneinfo	user.attribute
d3b78fce-f857-472f-9028-9a3d98eca640	true	id.token.claim
d3b78fce-f857-472f-9028-9a3d98eca640	true	access.token.claim
d3b78fce-f857-472f-9028-9a3d98eca640	zoneinfo	claim.name
d3b78fce-f857-472f-9028-9a3d98eca640	String	jsonType.label
669d1c69-d1e4-4981-8865-ab481c646508	true	userinfo.token.claim
669d1c69-d1e4-4981-8865-ab481c646508	locale	user.attribute
669d1c69-d1e4-4981-8865-ab481c646508	true	id.token.claim
669d1c69-d1e4-4981-8865-ab481c646508	true	access.token.claim
669d1c69-d1e4-4981-8865-ab481c646508	locale	claim.name
669d1c69-d1e4-4981-8865-ab481c646508	String	jsonType.label
947f086a-be51-45d0-8883-d4cf923f5201	true	userinfo.token.claim
947f086a-be51-45d0-8883-d4cf923f5201	updatedAt	user.attribute
947f086a-be51-45d0-8883-d4cf923f5201	true	id.token.claim
947f086a-be51-45d0-8883-d4cf923f5201	true	access.token.claim
947f086a-be51-45d0-8883-d4cf923f5201	updated_at	claim.name
947f086a-be51-45d0-8883-d4cf923f5201	long	jsonType.label
c2f64cae-ec62-4beb-bd74-1e05f3422b70	true	userinfo.token.claim
c2f64cae-ec62-4beb-bd74-1e05f3422b70	email	user.attribute
c2f64cae-ec62-4beb-bd74-1e05f3422b70	true	id.token.claim
c2f64cae-ec62-4beb-bd74-1e05f3422b70	true	access.token.claim
c2f64cae-ec62-4beb-bd74-1e05f3422b70	email	claim.name
c2f64cae-ec62-4beb-bd74-1e05f3422b70	String	jsonType.label
739b8ab4-e8a2-4295-bbcf-905126c9a9a8	true	userinfo.token.claim
739b8ab4-e8a2-4295-bbcf-905126c9a9a8	emailVerified	user.attribute
739b8ab4-e8a2-4295-bbcf-905126c9a9a8	true	id.token.claim
739b8ab4-e8a2-4295-bbcf-905126c9a9a8	true	access.token.claim
739b8ab4-e8a2-4295-bbcf-905126c9a9a8	email_verified	claim.name
739b8ab4-e8a2-4295-bbcf-905126c9a9a8	boolean	jsonType.label
04d39b73-e501-4b72-9e36-ffc5a08f2178	formatted	user.attribute.formatted
04d39b73-e501-4b72-9e36-ffc5a08f2178	country	user.attribute.country
04d39b73-e501-4b72-9e36-ffc5a08f2178	postal_code	user.attribute.postal_code
04d39b73-e501-4b72-9e36-ffc5a08f2178	true	userinfo.token.claim
04d39b73-e501-4b72-9e36-ffc5a08f2178	street	user.attribute.street
04d39b73-e501-4b72-9e36-ffc5a08f2178	true	id.token.claim
04d39b73-e501-4b72-9e36-ffc5a08f2178	region	user.attribute.region
04d39b73-e501-4b72-9e36-ffc5a08f2178	true	access.token.claim
04d39b73-e501-4b72-9e36-ffc5a08f2178	locality	user.attribute.locality
38b90e5d-2121-4798-b8f9-4dfb0244dc07	true	userinfo.token.claim
38b90e5d-2121-4798-b8f9-4dfb0244dc07	phoneNumber	user.attribute
38b90e5d-2121-4798-b8f9-4dfb0244dc07	true	id.token.claim
38b90e5d-2121-4798-b8f9-4dfb0244dc07	true	access.token.claim
38b90e5d-2121-4798-b8f9-4dfb0244dc07	phone_number	claim.name
38b90e5d-2121-4798-b8f9-4dfb0244dc07	String	jsonType.label
2b3bc1df-ab69-4c81-bd14-9c750fb032b1	true	userinfo.token.claim
2b3bc1df-ab69-4c81-bd14-9c750fb032b1	phoneNumberVerified	user.attribute
2b3bc1df-ab69-4c81-bd14-9c750fb032b1	true	id.token.claim
2b3bc1df-ab69-4c81-bd14-9c750fb032b1	true	access.token.claim
2b3bc1df-ab69-4c81-bd14-9c750fb032b1	phone_number_verified	claim.name
2b3bc1df-ab69-4c81-bd14-9c750fb032b1	boolean	jsonType.label
a5c553c5-8942-463b-ba1e-9ace6922f198	true	multivalued
a5c553c5-8942-463b-ba1e-9ace6922f198	foo	user.attribute
a5c553c5-8942-463b-ba1e-9ace6922f198	true	access.token.claim
a5c553c5-8942-463b-ba1e-9ace6922f198	realm_access.roles	claim.name
a5c553c5-8942-463b-ba1e-9ace6922f198	String	jsonType.label
0056adbb-cc83-4381-8243-883ba56fc055	true	multivalued
0056adbb-cc83-4381-8243-883ba56fc055	foo	user.attribute
0056adbb-cc83-4381-8243-883ba56fc055	true	access.token.claim
0056adbb-cc83-4381-8243-883ba56fc055	resource_access.${client_id}.roles	claim.name
0056adbb-cc83-4381-8243-883ba56fc055	String	jsonType.label
83437747-d58b-47b8-a5cb-5896d13a5d2b	true	userinfo.token.claim
83437747-d58b-47b8-a5cb-5896d13a5d2b	username	user.attribute
83437747-d58b-47b8-a5cb-5896d13a5d2b	true	id.token.claim
83437747-d58b-47b8-a5cb-5896d13a5d2b	true	access.token.claim
83437747-d58b-47b8-a5cb-5896d13a5d2b	upn	claim.name
83437747-d58b-47b8-a5cb-5896d13a5d2b	String	jsonType.label
b91c560f-76bd-4e53-bc23-52396bcdeb60	true	multivalued
b91c560f-76bd-4e53-bc23-52396bcdeb60	foo	user.attribute
b91c560f-76bd-4e53-bc23-52396bcdeb60	true	id.token.claim
b91c560f-76bd-4e53-bc23-52396bcdeb60	true	access.token.claim
b91c560f-76bd-4e53-bc23-52396bcdeb60	groups	claim.name
b91c560f-76bd-4e53-bc23-52396bcdeb60	String	jsonType.label
315e8888-5673-4889-90ca-23ffce7e7f0d	true	id.token.claim
315e8888-5673-4889-90ca-23ffce7e7f0d	true	access.token.claim
83956bcc-a70a-4b21-9658-3e596e030d24	true	userinfo.token.claim
83956bcc-a70a-4b21-9658-3e596e030d24	locale	user.attribute
83956bcc-a70a-4b21-9658-3e596e030d24	true	id.token.claim
83956bcc-a70a-4b21-9658-3e596e030d24	true	access.token.claim
83956bcc-a70a-4b21-9658-3e596e030d24	locale	claim.name
83956bcc-a70a-4b21-9658-3e596e030d24	String	jsonType.label
c5f6a1c5-4e8e-467e-9c7b-0ef4cde5bd1f	clientId	user.session.note
c5f6a1c5-4e8e-467e-9c7b-0ef4cde5bd1f	true	id.token.claim
c5f6a1c5-4e8e-467e-9c7b-0ef4cde5bd1f	true	access.token.claim
c5f6a1c5-4e8e-467e-9c7b-0ef4cde5bd1f	clientId	claim.name
c5f6a1c5-4e8e-467e-9c7b-0ef4cde5bd1f	String	jsonType.label
ff8de050-c35a-450f-aed4-16f892e87661	clientHost	user.session.note
ff8de050-c35a-450f-aed4-16f892e87661	true	id.token.claim
ff8de050-c35a-450f-aed4-16f892e87661	true	access.token.claim
ff8de050-c35a-450f-aed4-16f892e87661	clientHost	claim.name
ff8de050-c35a-450f-aed4-16f892e87661	String	jsonType.label
26488cc9-cdc5-474a-9aca-087ac23ff98a	clientAddress	user.session.note
26488cc9-cdc5-474a-9aca-087ac23ff98a	true	id.token.claim
26488cc9-cdc5-474a-9aca-087ac23ff98a	true	access.token.claim
26488cc9-cdc5-474a-9aca-087ac23ff98a	clientAddress	claim.name
26488cc9-cdc5-474a-9aca-087ac23ff98a	String	jsonType.label
\.


--
-- Data for Name: realm; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realm (id, access_code_lifespan, user_action_lifespan, access_token_lifespan, account_theme, admin_theme, email_theme, enabled, events_enabled, events_expiration, login_theme, name, not_before, password_policy, registration_allowed, remember_me, reset_password_allowed, social, ssl_required, sso_idle_timeout, sso_max_lifespan, update_profile_on_soc_login, verify_email, master_admin_client, login_lifespan, internationalization_enabled, default_locale, reg_email_as_username, admin_events_enabled, admin_events_details_enabled, edit_username_allowed, otp_policy_counter, otp_policy_window, otp_policy_period, otp_policy_digits, otp_policy_alg, otp_policy_type, browser_flow, registration_flow, direct_grant_flow, reset_credentials_flow, client_auth_flow, offline_session_idle_timeout, revoke_refresh_token, access_token_life_implicit, login_with_email_allowed, duplicate_emails_allowed, docker_auth_flow, refresh_token_max_reuse, allow_user_managed_access, sso_max_lifespan_remember_me, sso_idle_timeout_remember_me, default_role) FROM stdin;
flo-dev	60	300	300	\N	\N	\N	t	f	0	\N	flo-dev	0	\N	f	f	f	f	NONE	1800	36000	f	f	67cface5-a2c1-4604-bbda-60aaa4487e03	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	fbb7f577-e709-41ad-9969-e22ae6cc4360	f1ee496e-849d-49de-8868-5f70834e6c4f	9e52d2d1-3f65-4bc6-abf7-01d9c3415df2	f2aacbb8-e413-44c1-8edf-b7b13ef287bb	c450f8a3-4a93-4273-a3b6-cf8fc11f8f4e	2592000	f	900	t	f	7bd6cbec-f4e2-4fc8-9dc9-cd8ec1c34392	0	f	0	0	961fad03-edb6-4123-813a-fd9f10e08572
8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	60	300	60	\N	\N	\N	t	f	0	\N	master	0	\N	f	f	f	f	EXTERNAL	1800	36000	f	f	b21c75eb-cadf-4f68-929e-e4a352b75419	1800	f	\N	f	f	f	f	0	1	30	6	HmacSHA1	totp	8638d3d4-ec18-46fc-a598-601ef65083b3	31811049-db68-4215-aa35-064432b3666d	640709f3-8fe4-4f62-8461-9aa90c57c6f1	aded9432-5ac3-4fdb-8d8b-c7fd761deae9	3086f71c-ad54-42ec-9cfd-956375236c1b	2592000	f	900	t	f	bd2bfea3-4945-40b4-8dc9-4829f870630b	0	f	0	0	8491f39e-df63-4f49-8aa5-5391ba83b094
\.


--
-- Data for Name: realm_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realm_attribute (name, realm_id, value) FROM stdin;
userProfileEnabled	flo-dev	false
oauth2DeviceCodeLifespan	flo-dev	600
oauth2DevicePollingInterval	flo-dev	5
frontendUrl	flo-dev	http://localhost:8081/auth
bruteForceProtected	flo-dev	false
permanentLockout	flo-dev	false
maxFailureWaitSeconds	flo-dev	900
minimumQuickLoginWaitSeconds	flo-dev	60
waitIncrementSeconds	flo-dev	60
quickLoginCheckMilliSeconds	flo-dev	1000
maxDeltaTimeSeconds	flo-dev	43200
failureFactor	flo-dev	30
actionTokenGeneratedByAdminLifespan	flo-dev	43200
actionTokenGeneratedByUserLifespan	flo-dev	300
defaultSignatureAlgorithm	flo-dev	RS256
offlineSessionMaxLifespanEnabled	flo-dev	false
offlineSessionMaxLifespan	flo-dev	5184000
webAuthnPolicyRpEntityName	flo-dev	keycloak
webAuthnPolicySignatureAlgorithms	flo-dev	ES256
cibaBackchannelTokenDeliveryMode	flo-dev	poll
cibaExpiresIn	flo-dev	120
cibaInterval	flo-dev	5
cibaAuthRequestedUserHint	flo-dev	login_hint
parRequestUriLifespan	flo-dev	60
webAuthnPolicyRpId	flo-dev	
webAuthnPolicyAttestationConveyancePreference	flo-dev	not specified
webAuthnPolicyAuthenticatorAttachment	flo-dev	not specified
webAuthnPolicyRequireResidentKey	flo-dev	not specified
webAuthnPolicyUserVerificationRequirement	flo-dev	not specified
webAuthnPolicyCreateTimeout	flo-dev	0
webAuthnPolicyAvoidSameAuthenticatorRegister	flo-dev	false
webAuthnPolicyRpEntityNamePasswordless	flo-dev	keycloak
webAuthnPolicySignatureAlgorithmsPasswordless	flo-dev	ES256
webAuthnPolicyRpIdPasswordless	flo-dev	
webAuthnPolicyAttestationConveyancePreferencePasswordless	flo-dev	not specified
webAuthnPolicyAuthenticatorAttachmentPasswordless	flo-dev	not specified
webAuthnPolicyRequireResidentKeyPasswordless	flo-dev	not specified
clientSessionIdleTimeout	flo-dev	0
clientSessionMaxLifespan	flo-dev	0
clientOfflineSessionIdleTimeout	flo-dev	0
clientOfflineSessionMaxLifespan	flo-dev	0
webAuthnPolicyUserVerificationRequirementPasswordless	flo-dev	not specified
webAuthnPolicyCreateTimeoutPasswordless	flo-dev	0
webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless	flo-dev	false
client-policies.profiles	flo-dev	{"profiles":[]}
client-policies.policies	flo-dev	{"policies":[]}
_browser_header.contentSecurityPolicyReportOnly	flo-dev	
_browser_header.xContentTypeOptions	flo-dev	nosniff
_browser_header.xRobotsTag	flo-dev	none
_browser_header.xFrameOptions	flo-dev	SAMEORIGIN
_browser_header.contentSecurityPolicy	flo-dev	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	flo-dev	1; mode=block
_browser_header.strictTransportSecurity	flo-dev	max-age=31536000; includeSubDomains
cibaBackchannelTokenDeliveryMode	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	poll
cibaExpiresIn	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	120
cibaAuthRequestedUserHint	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	login_hint
parRequestUriLifespan	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	60
cibaInterval	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	5
oauth2DeviceCodeLifespan	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	600
oauth2DevicePollingInterval	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	600
clientSessionIdleTimeout	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	0
clientSessionMaxLifespan	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	0
clientOfflineSessionIdleTimeout	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	0
clientOfflineSessionMaxLifespan	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	0
displayName	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	Keycloak
displayNameHtml	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	<div class="kc-logo-text"><span>Keycloak</span></div>
bruteForceProtected	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	false
permanentLockout	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	false
maxFailureWaitSeconds	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	900
minimumQuickLoginWaitSeconds	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	60
waitIncrementSeconds	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	60
quickLoginCheckMilliSeconds	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	1000
maxDeltaTimeSeconds	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	43200
failureFactor	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	30
actionTokenGeneratedByAdminLifespan	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	43200
actionTokenGeneratedByUserLifespan	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	300
defaultSignatureAlgorithm	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	RS256
offlineSessionMaxLifespanEnabled	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	false
offlineSessionMaxLifespan	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	5184000
webAuthnPolicyRpEntityName	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	keycloak
webAuthnPolicySignatureAlgorithms	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	ES256
webAuthnPolicyRpId	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	
webAuthnPolicyAttestationConveyancePreference	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	not specified
webAuthnPolicyAuthenticatorAttachment	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	not specified
webAuthnPolicyRequireResidentKey	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	not specified
webAuthnPolicyUserVerificationRequirement	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	not specified
webAuthnPolicyCreateTimeout	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	0
webAuthnPolicyAvoidSameAuthenticatorRegister	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	false
webAuthnPolicyRpEntityNamePasswordless	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	keycloak
webAuthnPolicySignatureAlgorithmsPasswordless	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	ES256
webAuthnPolicyRpIdPasswordless	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	
webAuthnPolicyAttestationConveyancePreferencePasswordless	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	not specified
webAuthnPolicyAuthenticatorAttachmentPasswordless	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	not specified
webAuthnPolicyRequireResidentKeyPasswordless	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	not specified
webAuthnPolicyUserVerificationRequirementPasswordless	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	not specified
webAuthnPolicyCreateTimeoutPasswordless	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	0
webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	false
client-policies.profiles	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	{"profiles":[]}
client-policies.policies	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	{"policies":[]}
_browser_header.contentSecurityPolicyReportOnly	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	
_browser_header.xContentTypeOptions	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	nosniff
_browser_header.xRobotsTag	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	none
_browser_header.xFrameOptions	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	SAMEORIGIN
_browser_header.contentSecurityPolicy	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	frame-src 'self'; frame-ancestors 'self'; object-src 'none';
_browser_header.xXSSProtection	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	1; mode=block
_browser_header.strictTransportSecurity	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	max-age=31536000; includeSubDomains
\.


--
-- Data for Name: realm_default_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realm_default_groups (realm_id, group_id) FROM stdin;
\.


--
-- Data for Name: realm_enabled_event_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realm_enabled_event_types (realm_id, value) FROM stdin;
\.


--
-- Data for Name: realm_events_listeners; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realm_events_listeners (realm_id, value) FROM stdin;
8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	jboss-logging
flo-dev	jboss-logging
\.


--
-- Data for Name: realm_localizations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realm_localizations (realm_id, locale, texts) FROM stdin;
\.


--
-- Data for Name: realm_required_credential; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realm_required_credential (type, form_label, input, secret, realm_id) FROM stdin;
password	password	t	t	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8
password	password	t	t	flo-dev
\.


--
-- Data for Name: realm_smtp_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realm_smtp_config (realm_id, value, name) FROM stdin;
\.


--
-- Data for Name: realm_supported_locales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.realm_supported_locales (realm_id, value) FROM stdin;
\.


--
-- Data for Name: redirect_uris; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.redirect_uris (client_id, value) FROM stdin;
7417cca9-3f7c-44e0-b3d5-cba1caf21620	/realms/master/account/*
efc9e679-02e5-47ae-8fb9-f5220a093ac0	/realms/master/account/*
eec06cf2-4948-4503-989b-a035474e93c3	/admin/master/console/*
789b6c13-d278-42b9-89c3-d49416835d9d	/realms/flo-dev/account/*
a7e1d6c4-7d32-4062-aa46-0a726265e6be	/realms/flo-dev/account/*
58f6bf53-3f9f-4b00-9787-222d92d2e1a2	/admin/flo-dev/console/*
98374355-2b89-45c6-a6f6-31fe65a3f8b2	*
\.


--
-- Data for Name: required_action_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.required_action_config (required_action_id, value, name) FROM stdin;
\.


--
-- Data for Name: required_action_provider; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.required_action_provider (id, alias, name, realm_id, enabled, default_action, provider_id, priority) FROM stdin;
fb8de672-3cda-4cc2-a8ab-c290b9a9516f	VERIFY_EMAIL	Verify Email	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	t	f	VERIFY_EMAIL	50
664a5302-b26d-47a1-bdaa-dd4643d02b64	UPDATE_PROFILE	Update Profile	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	t	f	UPDATE_PROFILE	40
74172639-b677-4967-8e1e-b39c900ec126	CONFIGURE_TOTP	Configure OTP	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	t	f	CONFIGURE_TOTP	10
ac04dc73-2518-4681-997d-3b6b1fe6934d	UPDATE_PASSWORD	Update Password	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	t	f	UPDATE_PASSWORD	30
9cddf62d-a8b8-4603-b8ef-c4a3c0f333cb	terms_and_conditions	Terms and Conditions	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	f	f	terms_and_conditions	20
0d2f2acd-b23c-4c93-93ea-fd1cef22ed21	update_user_locale	Update User Locale	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	t	f	update_user_locale	1000
8e09695b-9f48-4037-8488-1b1915e63e67	delete_account	Delete Account	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	f	f	delete_account	60
07255783-dc31-4a2e-8bc9-98e376445676	VERIFY_EMAIL	Verify Email	flo-dev	t	f	VERIFY_EMAIL	50
834d5d36-95ba-43ef-8177-529386c33d06	UPDATE_PROFILE	Update Profile	flo-dev	t	f	UPDATE_PROFILE	40
7cc38014-2b05-4ca3-9a80-c9a3432c9fce	CONFIGURE_TOTP	Configure OTP	flo-dev	t	f	CONFIGURE_TOTP	10
ccbcdd04-e854-46bb-94fb-69dff55149bf	UPDATE_PASSWORD	Update Password	flo-dev	t	f	UPDATE_PASSWORD	30
3b67baaa-b0a5-45bc-badf-c1b5d9b685e6	terms_and_conditions	Terms and Conditions	flo-dev	f	f	terms_and_conditions	20
7644c1c7-9131-4586-b33b-7039b629e643	update_user_locale	Update User Locale	flo-dev	t	f	update_user_locale	1000
61e2060d-3f0e-4942-9055-83ed61d67172	delete_account	Delete Account	flo-dev	f	f	delete_account	60
\.


--
-- Data for Name: resource_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource_attribute (id, name, value, resource_id) FROM stdin;
\.


--
-- Data for Name: resource_policy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource_policy (resource_id, policy_id) FROM stdin;
cae00844-77e9-4eec-aba9-11501d04e6d9	dee5e5c6-ae38-4ad8-b9cc-8e2732a66983
cae00844-77e9-4eec-aba9-11501d04e6d9	46442ee5-7f3f-47a9-a5ac-9e341c5d4271
cae00844-77e9-4eec-aba9-11501d04e6d9	9fb6b719-be55-47e5-b3bd-fb9483e1edbd
cae00844-77e9-4eec-aba9-11501d04e6d9	2bbed615-5809-46fe-9c00-b5d98c1178e1
cae00844-77e9-4eec-aba9-11501d04e6d9	0d128634-1bac-4ee6-8352-da0a9d5b4e35
cae00844-77e9-4eec-aba9-11501d04e6d9	05681700-3dc2-417a-93f4-686f3d739c05
\.


--
-- Data for Name: resource_scope; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource_scope (resource_id, scope_id) FROM stdin;
cae00844-77e9-4eec-aba9-11501d04e6d9	2e603cc6-454d-4f4c-b9b3-e5572b0ae2c6
cae00844-77e9-4eec-aba9-11501d04e6d9	a8edf162-4590-4bb3-b629-1e2ecc7b5339
cae00844-77e9-4eec-aba9-11501d04e6d9	a843371e-7d4f-45e2-a117-4ef5ee920f63
cae00844-77e9-4eec-aba9-11501d04e6d9	b252e04a-510b-479b-b270-4ea1f3646e65
cae00844-77e9-4eec-aba9-11501d04e6d9	eb5f6fdb-2d69-45a7-8de7-d42349adc3ae
cae00844-77e9-4eec-aba9-11501d04e6d9	ce7aaf84-cdf7-4203-8170-285c6d749ab4
\.


--
-- Data for Name: resource_server; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource_server (id, allow_rs_remote_mgmt, policy_enforce_mode, decision_strategy) FROM stdin;
98374355-2b89-45c6-a6f6-31fe65a3f8b2	t	0	1
6c632f23-8c66-4693-b449-624437e7c1bf	f	0	1
b21c75eb-cadf-4f68-929e-e4a352b75419	f	0	1
\.


--
-- Data for Name: resource_server_perm_ticket; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource_server_perm_ticket (id, owner, requester, created_timestamp, granted_timestamp, resource_id, scope_id, resource_server_id, policy_id) FROM stdin;
\.


--
-- Data for Name: resource_server_policy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource_server_policy (id, name, description, type, decision_strategy, logic, resource_server_id, owner) FROM stdin;
796091fa-db96-4066-b6f8-de4ad475235c	Default Policy	A policy that grants access only for users within this realm	js	0	0	98374355-2b89-45c6-a6f6-31fe65a3f8b2	\N
91a2bab6-7aa2-44ec-83c7-c62fd3c9640c	Default Permission	A permission that applies to the default resource type	resource	1	0	98374355-2b89-45c6-a6f6-31fe65a3f8b2	\N
dee5e5c6-ae38-4ad8-b9cc-8e2732a66983	manage.permission.users	\N	scope	1	0	6c632f23-8c66-4693-b449-624437e7c1bf	\N
46442ee5-7f3f-47a9-a5ac-9e341c5d4271	view.permission.users	\N	scope	1	0	6c632f23-8c66-4693-b449-624437e7c1bf	\N
9fb6b719-be55-47e5-b3bd-fb9483e1edbd	map-roles.permission.users	\N	scope	1	0	6c632f23-8c66-4693-b449-624437e7c1bf	\N
2bbed615-5809-46fe-9c00-b5d98c1178e1	manage-group-membership.permission.users	\N	scope	1	0	6c632f23-8c66-4693-b449-624437e7c1bf	\N
0d128634-1bac-4ee6-8352-da0a9d5b4e35	admin-impersonating.permission.users	\N	scope	1	0	6c632f23-8c66-4693-b449-624437e7c1bf	\N
05681700-3dc2-417a-93f4-686f3d739c05	user-impersonated.permission.users	\N	scope	1	0	6c632f23-8c66-4693-b449-624437e7c1bf	\N
\.


--
-- Data for Name: resource_server_resource; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource_server_resource (id, name, type, icon_uri, owner, resource_server_id, owner_managed_access, display_name) FROM stdin;
50b27265-c61e-4f0a-8118-d04ed689bfc6	Default Resource	urn:FLO_API_SECRET:resources:default	\N	98374355-2b89-45c6-a6f6-31fe65a3f8b2	98374355-2b89-45c6-a6f6-31fe65a3f8b2	f	\N
cae00844-77e9-4eec-aba9-11501d04e6d9	Users	\N	\N	6c632f23-8c66-4693-b449-624437e7c1bf	6c632f23-8c66-4693-b449-624437e7c1bf	f	\N
\.


--
-- Data for Name: resource_server_scope; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource_server_scope (id, name, icon_uri, resource_server_id, display_name) FROM stdin;
74d6e7d1-8095-422d-88e2-40d03935d0c1	map-role	\N	6c632f23-8c66-4693-b449-624437e7c1bf	\N
a8c236bb-afe7-4a5b-a19c-b4e65eacdb03	map-role-client-scope	\N	6c632f23-8c66-4693-b449-624437e7c1bf	\N
6fe8abbf-daeb-4d09-9361-c574935e5639	map-role-composite	\N	6c632f23-8c66-4693-b449-624437e7c1bf	\N
a8edf162-4590-4bb3-b629-1e2ecc7b5339	manage	\N	6c632f23-8c66-4693-b449-624437e7c1bf	\N
2e603cc6-454d-4f4c-b9b3-e5572b0ae2c6	view	\N	6c632f23-8c66-4693-b449-624437e7c1bf	\N
eb5f6fdb-2d69-45a7-8de7-d42349adc3ae	map-roles	\N	6c632f23-8c66-4693-b449-624437e7c1bf	\N
ce7aaf84-cdf7-4203-8170-285c6d749ab4	impersonate	\N	6c632f23-8c66-4693-b449-624437e7c1bf	\N
a843371e-7d4f-45e2-a117-4ef5ee920f63	user-impersonated	\N	6c632f23-8c66-4693-b449-624437e7c1bf	\N
b252e04a-510b-479b-b270-4ea1f3646e65	manage-group-membership	\N	6c632f23-8c66-4693-b449-624437e7c1bf	\N
bd032735-07df-4d9b-bbef-bdfd1489d738	map-roles-client-scope	\N	6c632f23-8c66-4693-b449-624437e7c1bf	\N
77e70fcd-26c3-4056-89ce-1b02b7506da9	map-roles-composite	\N	6c632f23-8c66-4693-b449-624437e7c1bf	\N
a12a8086-675f-4327-97b9-a112c0ec1914	configure	\N	6c632f23-8c66-4693-b449-624437e7c1bf	\N
17c60926-af4d-43de-9d7d-279285722f89	token-exchange	\N	6c632f23-8c66-4693-b449-624437e7c1bf	\N
b24d765b-9bbc-42a7-be22-961e99c0705d	map-role	\N	b21c75eb-cadf-4f68-929e-e4a352b75419	\N
e5499489-829b-449f-85f4-058f63b44e14	map-role-client-scope	\N	b21c75eb-cadf-4f68-929e-e4a352b75419	\N
6036b65c-7e3c-452c-b28b-cafc63f4c1c2	map-role-composite	\N	b21c75eb-cadf-4f68-929e-e4a352b75419	\N
\.


--
-- Data for Name: resource_uris; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.resource_uris (resource_id, value) FROM stdin;
50b27265-c61e-4f0a-8118-d04ed689bfc6	/*
\.


--
-- Data for Name: role_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.role_attribute (id, role_id, name, value) FROM stdin;
\.


--
-- Data for Name: scope_mapping; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scope_mapping (client_id, role_id) FROM stdin;
efc9e679-02e5-47ae-8fb9-f5220a093ac0	b9c0319f-faa2-4e13-a2fb-8c0f079ddb57
a7e1d6c4-7d32-4062-aa46-0a726265e6be	a386b561-0ac1-4c8b-be1f-03e3f16bfc50
98374355-2b89-45c6-a6f6-31fe65a3f8b2	f41971e9-41d3-40f4-888e-2b65e180ad22
\.


--
-- Data for Name: scope_policy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.scope_policy (scope_id, policy_id) FROM stdin;
a8edf162-4590-4bb3-b629-1e2ecc7b5339	dee5e5c6-ae38-4ad8-b9cc-8e2732a66983
2e603cc6-454d-4f4c-b9b3-e5572b0ae2c6	46442ee5-7f3f-47a9-a5ac-9e341c5d4271
eb5f6fdb-2d69-45a7-8de7-d42349adc3ae	9fb6b719-be55-47e5-b3bd-fb9483e1edbd
b252e04a-510b-479b-b270-4ea1f3646e65	2bbed615-5809-46fe-9c00-b5d98c1178e1
ce7aaf84-cdf7-4203-8170-285c6d749ab4	0d128634-1bac-4ee6-8352-da0a9d5b4e35
a843371e-7d4f-45e2-a117-4ef5ee920f63	05681700-3dc2-417a-93f4-686f3d739c05
\.


--
-- Data for Name: user_attribute; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_attribute (name, value, user_id, id) FROM stdin;
\.


--
-- Data for Name: user_consent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_consent (id, client_id, user_id, created_date, last_updated_date, client_storage_provider, external_client_id) FROM stdin;
\.


--
-- Data for Name: user_consent_client_scope; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_consent_client_scope (user_consent_id, scope_id) FROM stdin;
\.


--
-- Data for Name: user_entity; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_entity (id, email, email_constraint, email_verified, enabled, federation_link, first_name, last_name, realm_id, username, created_timestamp, service_account_client_link, not_before) FROM stdin;
250fc379-c29d-42b9-a812-46ffa32f4a8b	\N	23c0b6df-862c-4b37-92dc-dd791f0c53f5	f	t	\N	\N	\N	8ad8b484-d9fd-48b2-9dac-c05b0b20f0a8	admin	1670825109480	\N	0
2a7930ea-3f6c-40f6-b304-b09eb59a7309	\N	19c11682-ff04-40be-9c6f-17fadb3a4e08	f	t	\N	\N	\N	flo-dev	service-account-flo_api_secret	1670825153430	98374355-2b89-45c6-a6f6-31fe65a3f8b2	0
1d4697f0-dfe0-4c7f-b781-55c6974f358e	admin@example.com	admin@example.com	f	t	\N	Example F	Example L	flo-dev	100000001	1670849165603	\N	0
80c951ef-a90d-4e7a-b6ee-2a804e67c75f	admin2@example.com	admin2@example.com	f	t	\N	Example F 2	Example L 2	flo-dev	100000002	1671169801228	\N	0
fa1b0745-c7c8-486d-80af-d689c2f38dc4	\N	14b6f557-b1f4-4e22-9804-358b59cf2589	f	t	\N	\N	\N	flo-dev	100000003	1671214370055	\N	0
\.


--
-- Data for Name: user_federation_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_federation_config (user_federation_provider_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_federation_mapper (id, name, federation_provider_id, federation_mapper_type, realm_id) FROM stdin;
\.


--
-- Data for Name: user_federation_mapper_config; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_federation_mapper_config (user_federation_mapper_id, value, name) FROM stdin;
\.


--
-- Data for Name: user_federation_provider; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_federation_provider (id, changed_sync_period, display_name, full_sync_period, last_sync, priority, provider_name, realm_id) FROM stdin;
\.


--
-- Data for Name: user_group_membership; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_group_membership (group_id, user_id) FROM stdin;
\.


--
-- Data for Name: user_required_action; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_required_action (user_id, required_action) FROM stdin;
\.


--
-- Data for Name: user_role_mapping; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_role_mapping (role_id, user_id) FROM stdin;
8491f39e-df63-4f49-8aa5-5391ba83b094	250fc379-c29d-42b9-a812-46ffa32f4a8b
d624f594-05f5-4694-9a4f-059236a2a54e	250fc379-c29d-42b9-a812-46ffa32f4a8b
6bc76bf4-b651-4e70-9f65-71d184c6e04e	250fc379-c29d-42b9-a812-46ffa32f4a8b
d1d9258e-04d6-4cd2-8a0a-97d05c7cf31e	250fc379-c29d-42b9-a812-46ffa32f4a8b
b68b67cb-d144-4b52-81ce-b4922d225e11	250fc379-c29d-42b9-a812-46ffa32f4a8b
9abd3b61-14e6-4784-a47b-1409ba0daa5a	250fc379-c29d-42b9-a812-46ffa32f4a8b
c3ed070e-9649-48cd-b4d3-44a4372465dc	250fc379-c29d-42b9-a812-46ffa32f4a8b
a337e2e7-a7ad-4073-b8ae-2bb12ad54a9d	250fc379-c29d-42b9-a812-46ffa32f4a8b
888ea168-5b19-4d17-96a7-af2056be5c78	250fc379-c29d-42b9-a812-46ffa32f4a8b
8f699b3b-2408-42d3-933d-766120b75d14	250fc379-c29d-42b9-a812-46ffa32f4a8b
24794320-6b64-471b-971c-36f113e67791	250fc379-c29d-42b9-a812-46ffa32f4a8b
071e6741-5b2b-4288-9477-7e354da3d754	250fc379-c29d-42b9-a812-46ffa32f4a8b
10fd68ac-50b6-45ff-b97e-3e7da10695ab	250fc379-c29d-42b9-a812-46ffa32f4a8b
6fecd258-e97a-41e2-94fc-5cf6c6ae3fa7	250fc379-c29d-42b9-a812-46ffa32f4a8b
dc724212-5f27-467c-8a2a-9e67fa5d0c90	250fc379-c29d-42b9-a812-46ffa32f4a8b
a0b5fe34-c9a5-4692-b727-1bdf73c7b333	250fc379-c29d-42b9-a812-46ffa32f4a8b
1537592d-a56e-41e3-8a6d-009509d055fd	250fc379-c29d-42b9-a812-46ffa32f4a8b
06f6c477-49d0-431d-8a98-2c8b6cc07203	250fc379-c29d-42b9-a812-46ffa32f4a8b
105885ce-e517-4ceb-a7ae-e3608fd023ff	250fc379-c29d-42b9-a812-46ffa32f4a8b
961fad03-edb6-4123-813a-fd9f10e08572	2a7930ea-3f6c-40f6-b304-b09eb59a7309
4bc8f8d3-f944-4820-9204-05aaaffb4904	2a7930ea-3f6c-40f6-b304-b09eb59a7309
37a543c1-6fed-4eda-a1dc-b72fec5f14a8	2a7930ea-3f6c-40f6-b304-b09eb59a7309
c3d48d06-09f6-4a25-8ab3-bd9f57dea7ab	2a7930ea-3f6c-40f6-b304-b09eb59a7309
961fad03-edb6-4123-813a-fd9f10e08572	1d4697f0-dfe0-4c7f-b781-55c6974f358e
c3d48d06-09f6-4a25-8ab3-bd9f57dea7ab	1d4697f0-dfe0-4c7f-b781-55c6974f358e
4bc8f8d3-f944-4820-9204-05aaaffb4904	1d4697f0-dfe0-4c7f-b781-55c6974f358e
ec169112-abe8-48a5-9fc2-34bebfbb9e79	1d4697f0-dfe0-4c7f-b781-55c6974f358e
a0be99b2-3587-4796-9d2d-c1ff227ce0ff	1d4697f0-dfe0-4c7f-b781-55c6974f358e
961fad03-edb6-4123-813a-fd9f10e08572	80c951ef-a90d-4e7a-b6ee-2a804e67c75f
f41971e9-41d3-40f4-888e-2b65e180ad22	80c951ef-a90d-4e7a-b6ee-2a804e67c75f
961fad03-edb6-4123-813a-fd9f10e08572	fa1b0745-c7c8-486d-80af-d689c2f38dc4
f41971e9-41d3-40f4-888e-2b65e180ad22	fa1b0745-c7c8-486d-80af-d689c2f38dc4
b846b1a6-7141-419b-bec6-f119a11c6038	fa1b0745-c7c8-486d-80af-d689c2f38dc4
\.


--
-- Data for Name: user_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_session (id, auth_method, ip_address, last_session_refresh, login_username, realm_id, remember_me, started, user_id, user_session_state, broker_session_id, broker_user_id) FROM stdin;
\.


--
-- Data for Name: user_session_note; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_session_note (user_session, name, value) FROM stdin;
\.


--
-- Data for Name: username_login_failure; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.username_login_failure (realm_id, username, failed_login_not_before, last_failure, last_ip_failure, num_failures) FROM stdin;
\.


--
-- Data for Name: web_origins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.web_origins (client_id, value) FROM stdin;
eec06cf2-4948-4503-989b-a035474e93c3	+
58f6bf53-3f9f-4b00-9787-222d92d2e1a2	+
98374355-2b89-45c6-a6f6-31fe65a3f8b2	*
\.


--
-- Name: username_login_failure CONSTRAINT_17-2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.username_login_failure
    ADD CONSTRAINT "CONSTRAINT_17-2" PRIMARY KEY (realm_id, username);


--
-- Name: keycloak_role UK_J3RWUVD56ONTGSUHOGM184WW2-2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT "UK_J3RWUVD56ONTGSUHOGM184WW2-2" UNIQUE (name, client_realm_constraint);


--
-- Name: client_auth_flow_bindings c_cli_flow_bind; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_auth_flow_bindings
    ADD CONSTRAINT c_cli_flow_bind PRIMARY KEY (client_id, binding_name);


--
-- Name: client_scope_client c_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_scope_client
    ADD CONSTRAINT c_cli_scope_bind PRIMARY KEY (client_id, scope_id);


--
-- Name: client_initial_access cnstr_client_init_acc_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT cnstr_client_init_acc_pk PRIMARY KEY (id);


--
-- Name: realm_default_groups con_group_id_def_groups; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT con_group_id_def_groups UNIQUE (group_id);


--
-- Name: broker_link constr_broker_link_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.broker_link
    ADD CONSTRAINT constr_broker_link_pk PRIMARY KEY (identity_provider, user_id);


--
-- Name: client_user_session_note constr_cl_usr_ses_note; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT constr_cl_usr_ses_note PRIMARY KEY (client_session, name);


--
-- Name: component_config constr_component_config_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT constr_component_config_pk PRIMARY KEY (id);


--
-- Name: component constr_component_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT constr_component_pk PRIMARY KEY (id);


--
-- Name: fed_user_required_action constr_fed_required_action; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fed_user_required_action
    ADD CONSTRAINT constr_fed_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: fed_user_attribute constr_fed_user_attr_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fed_user_attribute
    ADD CONSTRAINT constr_fed_user_attr_pk PRIMARY KEY (id);


--
-- Name: fed_user_consent constr_fed_user_consent_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fed_user_consent
    ADD CONSTRAINT constr_fed_user_consent_pk PRIMARY KEY (id);


--
-- Name: fed_user_credential constr_fed_user_cred_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fed_user_credential
    ADD CONSTRAINT constr_fed_user_cred_pk PRIMARY KEY (id);


--
-- Name: fed_user_group_membership constr_fed_user_group; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fed_user_group_membership
    ADD CONSTRAINT constr_fed_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: fed_user_role_mapping constr_fed_user_role; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fed_user_role_mapping
    ADD CONSTRAINT constr_fed_user_role PRIMARY KEY (role_id, user_id);


--
-- Name: federated_user constr_federated_user; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.federated_user
    ADD CONSTRAINT constr_federated_user PRIMARY KEY (id);


--
-- Name: realm_default_groups constr_realm_default_groups; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT constr_realm_default_groups PRIMARY KEY (realm_id, group_id);


--
-- Name: realm_enabled_event_types constr_realm_enabl_event_types; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT constr_realm_enabl_event_types PRIMARY KEY (realm_id, value);


--
-- Name: realm_events_listeners constr_realm_events_listeners; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT constr_realm_events_listeners PRIMARY KEY (realm_id, value);


--
-- Name: realm_supported_locales constr_realm_supported_locales; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT constr_realm_supported_locales PRIMARY KEY (realm_id, value);


--
-- Name: identity_provider constraint_2b; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT constraint_2b PRIMARY KEY (internal_id);


--
-- Name: client_attributes constraint_3c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT constraint_3c PRIMARY KEY (client_id, name);


--
-- Name: event_entity constraint_4; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.event_entity
    ADD CONSTRAINT constraint_4 PRIMARY KEY (id);


--
-- Name: federated_identity constraint_40; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT constraint_40 PRIMARY KEY (identity_provider, user_id);


--
-- Name: realm constraint_4a; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT constraint_4a PRIMARY KEY (id);


--
-- Name: client_session_role constraint_5; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT constraint_5 PRIMARY KEY (client_session, role_id);


--
-- Name: user_session constraint_57; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_session
    ADD CONSTRAINT constraint_57 PRIMARY KEY (id);


--
-- Name: user_federation_provider constraint_5c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT constraint_5c PRIMARY KEY (id);


--
-- Name: client_session_note constraint_5e; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT constraint_5e PRIMARY KEY (client_session, name);


--
-- Name: client constraint_7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT constraint_7 PRIMARY KEY (id);


--
-- Name: client_session constraint_8; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT constraint_8 PRIMARY KEY (id);


--
-- Name: scope_mapping constraint_81; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT constraint_81 PRIMARY KEY (client_id, role_id);


--
-- Name: client_node_registrations constraint_84; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT constraint_84 PRIMARY KEY (client_id, name);


--
-- Name: realm_attribute constraint_9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT constraint_9 PRIMARY KEY (name, realm_id);


--
-- Name: realm_required_credential constraint_92; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT constraint_92 PRIMARY KEY (realm_id, type);


--
-- Name: keycloak_role constraint_a; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT constraint_a PRIMARY KEY (id);


--
-- Name: admin_event_entity constraint_admin_event_entity; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admin_event_entity
    ADD CONSTRAINT constraint_admin_event_entity PRIMARY KEY (id);


--
-- Name: authenticator_config_entry constraint_auth_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authenticator_config_entry
    ADD CONSTRAINT constraint_auth_cfg_pk PRIMARY KEY (authenticator_id, name);


--
-- Name: authentication_execution constraint_auth_exec_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT constraint_auth_exec_pk PRIMARY KEY (id);


--
-- Name: authentication_flow constraint_auth_flow_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT constraint_auth_flow_pk PRIMARY KEY (id);


--
-- Name: authenticator_config constraint_auth_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT constraint_auth_pk PRIMARY KEY (id);


--
-- Name: client_session_auth_status constraint_auth_status_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT constraint_auth_status_pk PRIMARY KEY (client_session, authenticator);


--
-- Name: user_role_mapping constraint_c; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT constraint_c PRIMARY KEY (role_id, user_id);


--
-- Name: composite_role constraint_composite_role; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT constraint_composite_role PRIMARY KEY (composite, child_role);


--
-- Name: client_session_prot_mapper constraint_cs_pmp_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT constraint_cs_pmp_pk PRIMARY KEY (client_session, protocol_mapper_id);


--
-- Name: identity_provider_config constraint_d; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT constraint_d PRIMARY KEY (identity_provider_id, name);


--
-- Name: policy_config constraint_dpc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT constraint_dpc PRIMARY KEY (policy_id, name);


--
-- Name: realm_smtp_config constraint_e; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT constraint_e PRIMARY KEY (realm_id, name);


--
-- Name: credential constraint_f; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT constraint_f PRIMARY KEY (id);


--
-- Name: user_federation_config constraint_f9; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT constraint_f9 PRIMARY KEY (user_federation_provider_id, name);


--
-- Name: resource_server_perm_ticket constraint_fapmt; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT constraint_fapmt PRIMARY KEY (id);


--
-- Name: resource_server_resource constraint_farsr; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT constraint_farsr PRIMARY KEY (id);


--
-- Name: resource_server_policy constraint_farsrp; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT constraint_farsrp PRIMARY KEY (id);


--
-- Name: associated_policy constraint_farsrpap; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT constraint_farsrpap PRIMARY KEY (policy_id, associated_policy_id);


--
-- Name: resource_policy constraint_farsrpp; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT constraint_farsrpp PRIMARY KEY (resource_id, policy_id);


--
-- Name: resource_server_scope constraint_farsrs; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT constraint_farsrs PRIMARY KEY (id);


--
-- Name: resource_scope constraint_farsrsp; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT constraint_farsrsp PRIMARY KEY (resource_id, scope_id);


--
-- Name: scope_policy constraint_farsrsps; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT constraint_farsrsps PRIMARY KEY (scope_id, policy_id);


--
-- Name: user_entity constraint_fb; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT constraint_fb PRIMARY KEY (id);


--
-- Name: user_federation_mapper_config constraint_fedmapper_cfg_pm; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT constraint_fedmapper_cfg_pm PRIMARY KEY (user_federation_mapper_id, name);


--
-- Name: user_federation_mapper constraint_fedmapperpm; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT constraint_fedmapperpm PRIMARY KEY (id);


--
-- Name: fed_user_consent_cl_scope constraint_fgrntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.fed_user_consent_cl_scope
    ADD CONSTRAINT constraint_fgrntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent_client_scope constraint_grntcsnt_clsc_pm; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT constraint_grntcsnt_clsc_pm PRIMARY KEY (user_consent_id, scope_id);


--
-- Name: user_consent constraint_grntcsnt_pm; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT constraint_grntcsnt_pm PRIMARY KEY (id);


--
-- Name: keycloak_group constraint_group; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT constraint_group PRIMARY KEY (id);


--
-- Name: group_attribute constraint_group_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT constraint_group_attribute_pk PRIMARY KEY (id);


--
-- Name: group_role_mapping constraint_group_role; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT constraint_group_role PRIMARY KEY (role_id, group_id);


--
-- Name: identity_provider_mapper constraint_idpm; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT constraint_idpm PRIMARY KEY (id);


--
-- Name: idp_mapper_config constraint_idpmconfig; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT constraint_idpmconfig PRIMARY KEY (idp_mapper_id, name);


--
-- Name: migration_model constraint_migmod; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migration_model
    ADD CONSTRAINT constraint_migmod PRIMARY KEY (id);


--
-- Name: offline_client_session constraint_offl_cl_ses_pk3; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.offline_client_session
    ADD CONSTRAINT constraint_offl_cl_ses_pk3 PRIMARY KEY (user_session_id, client_id, client_storage_provider, external_client_id, offline_flag);


--
-- Name: offline_user_session constraint_offl_us_ses_pk2; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.offline_user_session
    ADD CONSTRAINT constraint_offl_us_ses_pk2 PRIMARY KEY (user_session_id, offline_flag);


--
-- Name: protocol_mapper constraint_pcm; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT constraint_pcm PRIMARY KEY (id);


--
-- Name: protocol_mapper_config constraint_pmconfig; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT constraint_pmconfig PRIMARY KEY (protocol_mapper_id, name);


--
-- Name: redirect_uris constraint_redirect_uris; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT constraint_redirect_uris PRIMARY KEY (client_id, value);


--
-- Name: required_action_config constraint_req_act_cfg_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.required_action_config
    ADD CONSTRAINT constraint_req_act_cfg_pk PRIMARY KEY (required_action_id, name);


--
-- Name: required_action_provider constraint_req_act_prv_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT constraint_req_act_prv_pk PRIMARY KEY (id);


--
-- Name: user_required_action constraint_required_action; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT constraint_required_action PRIMARY KEY (required_action, user_id);


--
-- Name: resource_uris constraint_resour_uris_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT constraint_resour_uris_pk PRIMARY KEY (resource_id, value);


--
-- Name: role_attribute constraint_role_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT constraint_role_attribute_pk PRIMARY KEY (id);


--
-- Name: user_attribute constraint_user_attribute_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT constraint_user_attribute_pk PRIMARY KEY (id);


--
-- Name: user_group_membership constraint_user_group; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT constraint_user_group PRIMARY KEY (group_id, user_id);


--
-- Name: user_session_note constraint_usn_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT constraint_usn_pk PRIMARY KEY (user_session, name);


--
-- Name: web_origins constraint_web_origins; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT constraint_web_origins PRIMARY KEY (client_id, value);


--
-- Name: databasechangeloglock databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- Name: client_scope_attributes pk_cl_tmpl_attr; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT pk_cl_tmpl_attr PRIMARY KEY (scope_id, name);


--
-- Name: client_scope pk_cli_template; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT pk_cli_template PRIMARY KEY (id);


--
-- Name: resource_server pk_resource_server; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server
    ADD CONSTRAINT pk_resource_server PRIMARY KEY (id);


--
-- Name: client_scope_role_mapping pk_template_scope; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT pk_template_scope PRIMARY KEY (scope_id, role_id);


--
-- Name: default_client_scope r_def_cli_scope_bind; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT r_def_cli_scope_bind PRIMARY KEY (realm_id, scope_id);


--
-- Name: realm_localizations realm_localizations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_localizations
    ADD CONSTRAINT realm_localizations_pkey PRIMARY KEY (realm_id, locale);


--
-- Name: resource_attribute res_attr_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT res_attr_pk PRIMARY KEY (id);


--
-- Name: keycloak_group sibling_names; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keycloak_group
    ADD CONSTRAINT sibling_names UNIQUE (realm_id, parent_group, name);


--
-- Name: identity_provider uk_2daelwnibji49avxsrtuf6xj33; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT uk_2daelwnibji49avxsrtuf6xj33 UNIQUE (provider_alias, realm_id);


--
-- Name: client uk_b71cjlbenv945rb6gcon438at; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT uk_b71cjlbenv945rb6gcon438at UNIQUE (realm_id, client_id);


--
-- Name: client_scope uk_cli_scope; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_scope
    ADD CONSTRAINT uk_cli_scope UNIQUE (realm_id, name);


--
-- Name: user_entity uk_dykn684sl8up1crfei6eckhd7; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_dykn684sl8up1crfei6eckhd7 UNIQUE (realm_id, email_constraint);


--
-- Name: resource_server_resource uk_frsr6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5ha6 UNIQUE (name, owner, resource_server_id);


--
-- Name: resource_server_perm_ticket uk_frsr6t700s9v50bu18ws5pmt; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT uk_frsr6t700s9v50bu18ws5pmt UNIQUE (owner, requester, resource_server_id, resource_id, scope_id);


--
-- Name: resource_server_policy uk_frsrpt700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT uk_frsrpt700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: resource_server_scope uk_frsrst700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT uk_frsrst700s9v50bu18ws5ha6 UNIQUE (name, resource_server_id);


--
-- Name: user_consent uk_jkuwuvd56ontgsuhogm8uewrt; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT uk_jkuwuvd56ontgsuhogm8uewrt UNIQUE (client_id, client_storage_provider, external_client_id, user_id);


--
-- Name: realm uk_orvsdmla56612eaefiq6wl5oi; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm
    ADD CONSTRAINT uk_orvsdmla56612eaefiq6wl5oi UNIQUE (name);


--
-- Name: user_entity uk_ru8tt6t700s9v50bu18ws5ha6; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_entity
    ADD CONSTRAINT uk_ru8tt6t700s9v50bu18ws5ha6 UNIQUE (realm_id, username);


--
-- Name: idx_admin_event_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_admin_event_time ON public.admin_event_entity USING btree (realm_id, admin_event_time);


--
-- Name: idx_assoc_pol_assoc_pol_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_assoc_pol_assoc_pol_id ON public.associated_policy USING btree (associated_policy_id);


--
-- Name: idx_auth_config_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_auth_config_realm ON public.authenticator_config USING btree (realm_id);


--
-- Name: idx_auth_exec_flow; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_auth_exec_flow ON public.authentication_execution USING btree (flow_id);


--
-- Name: idx_auth_exec_realm_flow; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_auth_exec_realm_flow ON public.authentication_execution USING btree (realm_id, flow_id);


--
-- Name: idx_auth_flow_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_auth_flow_realm ON public.authentication_flow USING btree (realm_id);


--
-- Name: idx_cl_clscope; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_cl_clscope ON public.client_scope_client USING btree (scope_id);


--
-- Name: idx_client_att_by_name_value; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_client_att_by_name_value ON public.client_attributes USING btree (name, ((value)::character varying(250)));


--
-- Name: idx_client_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_client_id ON public.client USING btree (client_id);


--
-- Name: idx_client_init_acc_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_client_init_acc_realm ON public.client_initial_access USING btree (realm_id);


--
-- Name: idx_client_session_session; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_client_session_session ON public.client_session USING btree (session_id);


--
-- Name: idx_clscope_attrs; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_clscope_attrs ON public.client_scope_attributes USING btree (scope_id);


--
-- Name: idx_clscope_cl; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_clscope_cl ON public.client_scope_client USING btree (client_id);


--
-- Name: idx_clscope_protmap; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_clscope_protmap ON public.protocol_mapper USING btree (client_scope_id);


--
-- Name: idx_clscope_role; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_clscope_role ON public.client_scope_role_mapping USING btree (scope_id);


--
-- Name: idx_compo_config_compo; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_compo_config_compo ON public.component_config USING btree (component_id);


--
-- Name: idx_component_provider_type; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_component_provider_type ON public.component USING btree (provider_type);


--
-- Name: idx_component_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_component_realm ON public.component USING btree (realm_id);


--
-- Name: idx_composite; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_composite ON public.composite_role USING btree (composite);


--
-- Name: idx_composite_child; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_composite_child ON public.composite_role USING btree (child_role);


--
-- Name: idx_defcls_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_defcls_realm ON public.default_client_scope USING btree (realm_id);


--
-- Name: idx_defcls_scope; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_defcls_scope ON public.default_client_scope USING btree (scope_id);


--
-- Name: idx_event_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_event_time ON public.event_entity USING btree (realm_id, event_time);


--
-- Name: idx_fedidentity_feduser; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fedidentity_feduser ON public.federated_identity USING btree (federated_user_id);


--
-- Name: idx_fedidentity_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fedidentity_user ON public.federated_identity USING btree (user_id);


--
-- Name: idx_fu_attribute; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_attribute ON public.fed_user_attribute USING btree (user_id, realm_id, name);


--
-- Name: idx_fu_cnsnt_ext; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_cnsnt_ext ON public.fed_user_consent USING btree (user_id, client_storage_provider, external_client_id);


--
-- Name: idx_fu_consent; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_consent ON public.fed_user_consent USING btree (user_id, client_id);


--
-- Name: idx_fu_consent_ru; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_consent_ru ON public.fed_user_consent USING btree (realm_id, user_id);


--
-- Name: idx_fu_credential; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_credential ON public.fed_user_credential USING btree (user_id, type);


--
-- Name: idx_fu_credential_ru; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_credential_ru ON public.fed_user_credential USING btree (realm_id, user_id);


--
-- Name: idx_fu_group_membership; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_group_membership ON public.fed_user_group_membership USING btree (user_id, group_id);


--
-- Name: idx_fu_group_membership_ru; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_group_membership_ru ON public.fed_user_group_membership USING btree (realm_id, user_id);


--
-- Name: idx_fu_required_action; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_required_action ON public.fed_user_required_action USING btree (user_id, required_action);


--
-- Name: idx_fu_required_action_ru; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_required_action_ru ON public.fed_user_required_action USING btree (realm_id, user_id);


--
-- Name: idx_fu_role_mapping; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_role_mapping ON public.fed_user_role_mapping USING btree (user_id, role_id);


--
-- Name: idx_fu_role_mapping_ru; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_fu_role_mapping_ru ON public.fed_user_role_mapping USING btree (realm_id, user_id);


--
-- Name: idx_group_attr_group; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_group_attr_group ON public.group_attribute USING btree (group_id);


--
-- Name: idx_group_role_mapp_group; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_group_role_mapp_group ON public.group_role_mapping USING btree (group_id);


--
-- Name: idx_id_prov_mapp_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_id_prov_mapp_realm ON public.identity_provider_mapper USING btree (realm_id);


--
-- Name: idx_ident_prov_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_ident_prov_realm ON public.identity_provider USING btree (realm_id);


--
-- Name: idx_keycloak_role_client; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_keycloak_role_client ON public.keycloak_role USING btree (client);


--
-- Name: idx_keycloak_role_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_keycloak_role_realm ON public.keycloak_role USING btree (realm);


--
-- Name: idx_offline_css_preload; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_offline_css_preload ON public.offline_client_session USING btree (client_id, offline_flag);


--
-- Name: idx_offline_uss_by_user; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_offline_uss_by_user ON public.offline_user_session USING btree (user_id, realm_id, offline_flag);


--
-- Name: idx_offline_uss_by_usersess; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_offline_uss_by_usersess ON public.offline_user_session USING btree (realm_id, offline_flag, user_session_id);


--
-- Name: idx_offline_uss_createdon; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_offline_uss_createdon ON public.offline_user_session USING btree (created_on);


--
-- Name: idx_offline_uss_preload; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_offline_uss_preload ON public.offline_user_session USING btree (offline_flag, created_on, user_session_id);


--
-- Name: idx_protocol_mapper_client; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_protocol_mapper_client ON public.protocol_mapper USING btree (client_id);


--
-- Name: idx_realm_attr_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_realm_attr_realm ON public.realm_attribute USING btree (realm_id);


--
-- Name: idx_realm_clscope; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_realm_clscope ON public.client_scope USING btree (realm_id);


--
-- Name: idx_realm_def_grp_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_realm_def_grp_realm ON public.realm_default_groups USING btree (realm_id);


--
-- Name: idx_realm_evt_list_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_realm_evt_list_realm ON public.realm_events_listeners USING btree (realm_id);


--
-- Name: idx_realm_evt_types_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_realm_evt_types_realm ON public.realm_enabled_event_types USING btree (realm_id);


--
-- Name: idx_realm_master_adm_cli; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_realm_master_adm_cli ON public.realm USING btree (master_admin_client);


--
-- Name: idx_realm_supp_local_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_realm_supp_local_realm ON public.realm_supported_locales USING btree (realm_id);


--
-- Name: idx_redir_uri_client; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_redir_uri_client ON public.redirect_uris USING btree (client_id);


--
-- Name: idx_req_act_prov_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_req_act_prov_realm ON public.required_action_provider USING btree (realm_id);


--
-- Name: idx_res_policy_policy; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_res_policy_policy ON public.resource_policy USING btree (policy_id);


--
-- Name: idx_res_scope_scope; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_res_scope_scope ON public.resource_scope USING btree (scope_id);


--
-- Name: idx_res_serv_pol_res_serv; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_res_serv_pol_res_serv ON public.resource_server_policy USING btree (resource_server_id);


--
-- Name: idx_res_srv_res_res_srv; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_res_srv_res_res_srv ON public.resource_server_resource USING btree (resource_server_id);


--
-- Name: idx_res_srv_scope_res_srv; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_res_srv_scope_res_srv ON public.resource_server_scope USING btree (resource_server_id);


--
-- Name: idx_role_attribute; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_role_attribute ON public.role_attribute USING btree (role_id);


--
-- Name: idx_role_clscope; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_role_clscope ON public.client_scope_role_mapping USING btree (role_id);


--
-- Name: idx_scope_mapping_role; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_scope_mapping_role ON public.scope_mapping USING btree (role_id);


--
-- Name: idx_scope_policy_policy; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_scope_policy_policy ON public.scope_policy USING btree (policy_id);


--
-- Name: idx_update_time; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_update_time ON public.migration_model USING btree (update_time);


--
-- Name: idx_us_sess_id_on_cl_sess; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_us_sess_id_on_cl_sess ON public.offline_client_session USING btree (user_session_id);


--
-- Name: idx_usconsent_clscope; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_usconsent_clscope ON public.user_consent_client_scope USING btree (user_consent_id);


--
-- Name: idx_user_attribute; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_attribute ON public.user_attribute USING btree (user_id);


--
-- Name: idx_user_attribute_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_attribute_name ON public.user_attribute USING btree (name, value);


--
-- Name: idx_user_consent; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_consent ON public.user_consent USING btree (user_id);


--
-- Name: idx_user_credential; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_credential ON public.credential USING btree (user_id);


--
-- Name: idx_user_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_email ON public.user_entity USING btree (email);


--
-- Name: idx_user_group_mapping; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_group_mapping ON public.user_group_membership USING btree (user_id);


--
-- Name: idx_user_reqactions; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_reqactions ON public.user_required_action USING btree (user_id);


--
-- Name: idx_user_role_mapping; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_role_mapping ON public.user_role_mapping USING btree (user_id);


--
-- Name: idx_user_service_account; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_user_service_account ON public.user_entity USING btree (realm_id, service_account_client_link);


--
-- Name: idx_usr_fed_map_fed_prv; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_usr_fed_map_fed_prv ON public.user_federation_mapper USING btree (federation_provider_id);


--
-- Name: idx_usr_fed_map_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_usr_fed_map_realm ON public.user_federation_mapper USING btree (realm_id);


--
-- Name: idx_usr_fed_prv_realm; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_usr_fed_prv_realm ON public.user_federation_provider USING btree (realm_id);


--
-- Name: idx_web_orig_client; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX idx_web_orig_client ON public.web_origins USING btree (client_id);


--
-- Name: client_session_auth_status auth_status_constraint; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_session_auth_status
    ADD CONSTRAINT auth_status_constraint FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: identity_provider fk2b4ebc52ae5c3b34; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identity_provider
    ADD CONSTRAINT fk2b4ebc52ae5c3b34 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_attributes fk3c47c64beacca966; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_attributes
    ADD CONSTRAINT fk3c47c64beacca966 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: federated_identity fk404288b92ef007a6; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.federated_identity
    ADD CONSTRAINT fk404288b92ef007a6 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_node_registrations fk4129723ba992f594; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_node_registrations
    ADD CONSTRAINT fk4129723ba992f594 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: client_session_note fk5edfb00ff51c2736; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_session_note
    ADD CONSTRAINT fk5edfb00ff51c2736 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: user_session_note fk5edfb00ff51d3472; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_session_note
    ADD CONSTRAINT fk5edfb00ff51d3472 FOREIGN KEY (user_session) REFERENCES public.user_session(id);


--
-- Name: client_session_role fk_11b7sgqw18i532811v7o2dv76; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_session_role
    ADD CONSTRAINT fk_11b7sgqw18i532811v7o2dv76 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: redirect_uris fk_1burs8pb4ouj97h5wuppahv9f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.redirect_uris
    ADD CONSTRAINT fk_1burs8pb4ouj97h5wuppahv9f FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: user_federation_provider fk_1fj32f6ptolw2qy60cd8n01e8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_federation_provider
    ADD CONSTRAINT fk_1fj32f6ptolw2qy60cd8n01e8 FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session_prot_mapper fk_33a8sgqw18i532811v7o2dk89; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_session_prot_mapper
    ADD CONSTRAINT fk_33a8sgqw18i532811v7o2dk89 FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: realm_required_credential fk_5hg65lybevavkqfki3kponh9v; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_required_credential
    ADD CONSTRAINT fk_5hg65lybevavkqfki3kponh9v FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_attribute fk_5hrm2vlf9ql5fu022kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu022kqepovbr FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: user_attribute fk_5hrm2vlf9ql5fu043kqepovbr; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_attribute
    ADD CONSTRAINT fk_5hrm2vlf9ql5fu043kqepovbr FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: user_required_action fk_6qj3w1jw9cvafhe19bwsiuvmd; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_required_action
    ADD CONSTRAINT fk_6qj3w1jw9cvafhe19bwsiuvmd FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: keycloak_role fk_6vyqfe4cn4wlq8r6kt5vdsj5c; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.keycloak_role
    ADD CONSTRAINT fk_6vyqfe4cn4wlq8r6kt5vdsj5c FOREIGN KEY (realm) REFERENCES public.realm(id);


--
-- Name: realm_smtp_config fk_70ej8xdxgxd0b9hh6180irr0o; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_smtp_config
    ADD CONSTRAINT fk_70ej8xdxgxd0b9hh6180irr0o FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_attribute fk_8shxd6l3e9atqukacxgpffptw; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_attribute
    ADD CONSTRAINT fk_8shxd6l3e9atqukacxgpffptw FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: composite_role fk_a63wvekftu8jo1pnj81e7mce2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_a63wvekftu8jo1pnj81e7mce2 FOREIGN KEY (composite) REFERENCES public.keycloak_role(id);


--
-- Name: authentication_execution fk_auth_exec_flow; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_flow FOREIGN KEY (flow_id) REFERENCES public.authentication_flow(id);


--
-- Name: authentication_execution fk_auth_exec_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authentication_execution
    ADD CONSTRAINT fk_auth_exec_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authentication_flow fk_auth_flow_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authentication_flow
    ADD CONSTRAINT fk_auth_flow_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: authenticator_config fk_auth_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.authenticator_config
    ADD CONSTRAINT fk_auth_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: client_session fk_b4ao2vcvat6ukau74wbwtfqo1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_session
    ADD CONSTRAINT fk_b4ao2vcvat6ukau74wbwtfqo1 FOREIGN KEY (session_id) REFERENCES public.user_session(id);


--
-- Name: user_role_mapping fk_c4fqv34p1mbylloxang7b1q3l; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_role_mapping
    ADD CONSTRAINT fk_c4fqv34p1mbylloxang7b1q3l FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: client_scope_attributes fk_cl_scope_attr_scope; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_scope_attributes
    ADD CONSTRAINT fk_cl_scope_attr_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_scope_role_mapping fk_cl_scope_rm_scope; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_scope_role_mapping
    ADD CONSTRAINT fk_cl_scope_rm_scope FOREIGN KEY (scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_user_session_note fk_cl_usr_ses_note; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_user_session_note
    ADD CONSTRAINT fk_cl_usr_ses_note FOREIGN KEY (client_session) REFERENCES public.client_session(id);


--
-- Name: protocol_mapper fk_cli_scope_mapper; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_cli_scope_mapper FOREIGN KEY (client_scope_id) REFERENCES public.client_scope(id);


--
-- Name: client_initial_access fk_client_init_acc_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client_initial_access
    ADD CONSTRAINT fk_client_init_acc_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: component_config fk_component_config; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.component_config
    ADD CONSTRAINT fk_component_config FOREIGN KEY (component_id) REFERENCES public.component(id);


--
-- Name: component fk_component_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.component
    ADD CONSTRAINT fk_component_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_default_groups fk_def_groups_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_default_groups
    ADD CONSTRAINT fk_def_groups_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_mapper_config fk_fedmapper_cfg; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_federation_mapper_config
    ADD CONSTRAINT fk_fedmapper_cfg FOREIGN KEY (user_federation_mapper_id) REFERENCES public.user_federation_mapper(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_fedprv; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_fedprv FOREIGN KEY (federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_federation_mapper fk_fedmapperpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_federation_mapper
    ADD CONSTRAINT fk_fedmapperpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: associated_policy fk_frsr5s213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsr5s213xcx4wnkog82ssrfy FOREIGN KEY (associated_policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrasp13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrasp13xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog82sspmt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82sspmt FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_resource fk_frsrho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_resource
    ADD CONSTRAINT fk_frsrho213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog83sspmt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog83sspmt FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_server_perm_ticket fk_frsrho213xcx4wnkog84sspmt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrho213xcx4wnkog84sspmt FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: associated_policy fk_frsrpas14xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.associated_policy
    ADD CONSTRAINT fk_frsrpas14xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: scope_policy fk_frsrpass3xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scope_policy
    ADD CONSTRAINT fk_frsrpass3xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_perm_ticket fk_frsrpo2128cx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_perm_ticket
    ADD CONSTRAINT fk_frsrpo2128cx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_server_policy fk_frsrpo213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_policy
    ADD CONSTRAINT fk_frsrpo213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: resource_scope fk_frsrpos13xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrpos13xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpos53xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpos53xcx4wnkog82ssrfy FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: resource_policy fk_frsrpp213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_policy
    ADD CONSTRAINT fk_frsrpp213xcx4wnkog82ssrfy FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: resource_scope fk_frsrps213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_scope
    ADD CONSTRAINT fk_frsrps213xcx4wnkog82ssrfy FOREIGN KEY (scope_id) REFERENCES public.resource_server_scope(id);


--
-- Name: resource_server_scope fk_frsrso213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_server_scope
    ADD CONSTRAINT fk_frsrso213xcx4wnkog82ssrfy FOREIGN KEY (resource_server_id) REFERENCES public.resource_server(id);


--
-- Name: composite_role fk_gr7thllb9lu8q4vqa4524jjy8; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.composite_role
    ADD CONSTRAINT fk_gr7thllb9lu8q4vqa4524jjy8 FOREIGN KEY (child_role) REFERENCES public.keycloak_role(id);


--
-- Name: user_consent_client_scope fk_grntcsnt_clsc_usc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_consent_client_scope
    ADD CONSTRAINT fk_grntcsnt_clsc_usc FOREIGN KEY (user_consent_id) REFERENCES public.user_consent(id);


--
-- Name: user_consent fk_grntcsnt_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_consent
    ADD CONSTRAINT fk_grntcsnt_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: group_attribute fk_group_attribute_group; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_attribute
    ADD CONSTRAINT fk_group_attribute_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: group_role_mapping fk_group_role_group; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.group_role_mapping
    ADD CONSTRAINT fk_group_role_group FOREIGN KEY (group_id) REFERENCES public.keycloak_group(id);


--
-- Name: realm_enabled_event_types fk_h846o4h0w8epx5nwedrf5y69j; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_enabled_event_types
    ADD CONSTRAINT fk_h846o4h0w8epx5nwedrf5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: realm_events_listeners fk_h846o4h0w8epx5nxev9f5y69j; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_events_listeners
    ADD CONSTRAINT fk_h846o4h0w8epx5nxev9f5y69j FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: identity_provider_mapper fk_idpm_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identity_provider_mapper
    ADD CONSTRAINT fk_idpm_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: idp_mapper_config fk_idpmconfig; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.idp_mapper_config
    ADD CONSTRAINT fk_idpmconfig FOREIGN KEY (idp_mapper_id) REFERENCES public.identity_provider_mapper(id);


--
-- Name: web_origins fk_lojpho213xcx4wnkog82ssrfy; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.web_origins
    ADD CONSTRAINT fk_lojpho213xcx4wnkog82ssrfy FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: scope_mapping fk_ouse064plmlr732lxjcn1q5f1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.scope_mapping
    ADD CONSTRAINT fk_ouse064plmlr732lxjcn1q5f1 FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: protocol_mapper fk_pcm_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.protocol_mapper
    ADD CONSTRAINT fk_pcm_realm FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: credential fk_pfyr0glasqyl0dei3kl69r6v0; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.credential
    ADD CONSTRAINT fk_pfyr0glasqyl0dei3kl69r6v0 FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: protocol_mapper_config fk_pmconfig; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.protocol_mapper_config
    ADD CONSTRAINT fk_pmconfig FOREIGN KEY (protocol_mapper_id) REFERENCES public.protocol_mapper(id);


--
-- Name: default_client_scope fk_r_def_cli_scope_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.default_client_scope
    ADD CONSTRAINT fk_r_def_cli_scope_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: required_action_provider fk_req_act_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.required_action_provider
    ADD CONSTRAINT fk_req_act_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: resource_uris fk_resource_server_uris; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.resource_uris
    ADD CONSTRAINT fk_resource_server_uris FOREIGN KEY (resource_id) REFERENCES public.resource_server_resource(id);


--
-- Name: role_attribute fk_role_attribute_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.role_attribute
    ADD CONSTRAINT fk_role_attribute_id FOREIGN KEY (role_id) REFERENCES public.keycloak_role(id);


--
-- Name: realm_supported_locales fk_supported_locales_realm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.realm_supported_locales
    ADD CONSTRAINT fk_supported_locales_realm FOREIGN KEY (realm_id) REFERENCES public.realm(id);


--
-- Name: user_federation_config fk_t13hpu1j94r2ebpekr39x5eu5; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_federation_config
    ADD CONSTRAINT fk_t13hpu1j94r2ebpekr39x5eu5 FOREIGN KEY (user_federation_provider_id) REFERENCES public.user_federation_provider(id);


--
-- Name: user_group_membership fk_user_group_user; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_group_membership
    ADD CONSTRAINT fk_user_group_user FOREIGN KEY (user_id) REFERENCES public.user_entity(id);


--
-- Name: policy_config fkdc34197cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.policy_config
    ADD CONSTRAINT fkdc34197cf864c4e43 FOREIGN KEY (policy_id) REFERENCES public.resource_server_policy(id);


--
-- Name: identity_provider_config fkdc4897cf864c4e43; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.identity_provider_config
    ADD CONSTRAINT fkdc4897cf864c4e43 FOREIGN KEY (identity_provider_id) REFERENCES public.identity_provider(internal_id);


--
-- PostgreSQL database dump complete
--

