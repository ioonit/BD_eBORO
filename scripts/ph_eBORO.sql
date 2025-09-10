--
-- ER/Studio Data Architect SQL Code Generation
-- Project :      EDR_eBORO_v09092025_noindice.DM1
--
-- Date Created : Wednesday, September 10, 2025 10:57:59
-- Target DBMS : PostgreSQL 10.x-12.x
--

-- 
-- TABLE: audit_logs 
--

CREATE TABLE audit_logs(
    audit_id         serial,
    user_id          integer           NOT NULL,
    action           varchar(128)      NOT NULL,
    tb_entity        varchar(24)       NOT NULL,
    entity_id        serial,
    previous_data    json              NOT NULL,
    new_data         json              NOT NULL,
    create_at        timestamptz(6)    NOT NULL,
    CONSTRAINT pk_audit_id PRIMARY KEY (audit_id)
)
;



-- 
-- TABLE: customer_files 
--

CREATE TABLE customer_files(
    files_id                serial,
    prospect_id             integer           NOT NULL,
    url_front_cardnumber    varchar(256)      NOT NULL,
    url_back_cardnumber     varchar(256),
    url_doc_evidencia       varchar(256),
    create_at               timestamptz(6)    NOT NULL,
    update_at               timestamptz(6),
    CONSTRAINT pk_files_id PRIMARY KEY (files_id)
)
;



-- 
-- TABLE: customer_route_point 
--

CREATE TABLE customer_route_point(
    waypoint_id                   serial,
    route_id                      integer           NOT NULL,
    latitude                      numeric(9, 6)     NOT NULL,
    longitude                     numeric(9, 6)     NOT NULL,
    order_number                  bigint            NOT NULL,
    estimated_duration_minutes    integer           NOT NULL,
    estimated_distance_km         numeric(6, 2),
    visited_at                    timestamptz(6),
    CONSTRAINT pk_waypoint_id PRIMARY KEY (waypoint_id)
)
;



-- 
-- TABLE: customer_visit_history 
--

CREATE TABLE customer_visit_history(
    waypoint_history_id    serial,
    waypoint_id            integer           NOT NULL,
    visit_status           varchar(16),
    notes                  text,
    created_at             timestamptz(6)    DEFAULT now(),
    update_at              timestamptz(6),
    CONSTRAINT pk_wawpoint_history_id PRIMARY KEY (waypoint_history_id)
)
;



-- 
-- TABLE: customers 
--

CREATE TABLE customers(
    customer_id         serial,
    employee_id         integer           NOT NULL,
    ident_cardnumber    varchar(16),
    names               varchar(48)       NOT NULL,
    surnames            varchar(48)       NOT NULL,
    address             varchar(254)      DEFAULT 'Desconocido' NOT NULL,
    latitude            numeric(9, 6),
    longitude           numeric(9, 6),
    phone_numbers       varchar[],
    created_at          timestamptz(6)    DEFAULT now(),
    update_at           timestamptz(6),
    active              int2              DEFAULT 1,
    CONSTRAINT pk_customer_id PRIMARY KEY (customer_id)
)
;



-- 
-- TABLE: employees 
--

CREATE TABLE employees(
    employee_id       serial,
    code_employee     varchar(16)       NOT NULL,
    names             varchar(48)       NOT NULL,
    surname           varchar(48)       NOT NULL,
    phone             varchar(16)       NOT NULL,
    assigned_phone    varchar(16)       NOT NULL,
    create_at         timestamptz(6)    NOT NULL,
    update_at         timestamptz(6),
    active            int2              DEFAULT 1 NOT NULL,
    CONSTRAINT pk_employee_id PRIMARY KEY (employee_id)
)
;



-- 
-- TABLE: permissions 
--

CREATE TABLE permissions(
    id_permission    integer         GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    name             varchar(48)     NOT NULL,
    description      varchar(256)    NOT NULL,
    CONSTRAINT pk_id_permission PRIMARY KEY (id_permission)
)
;



-- 
-- TABLE: prospects 
--

CREATE TABLE prospects(
    prospect_id         serial,
    employee_id         integer           NOT NULL,
    ident_cardnumber    varchar(16)       NOT NULL,
    names               varchar(48)       NOT NULL,
    surname             varchar(48)       NOT NULL,
    zone                varchar(48)       NOT NULL,
    phone               varchar(16)       NOT NULL,
    amount              decimal(6, 4),
    income              decimal(6, 4)     NOT NULL,
    prospect_status     varchar(16)       NOT NULL,
    comments            varchar(256),
    "dateVisit"         timestamptz(6)    NOT NULL,
    update_at           timestamptz(6)    NOT NULL,
    active              int2              DEFAULT 1 NOT NULL,
    CONSTRAINT pk_prespect_id PRIMARY KEY (prospect_id)
)
;



-- 
-- TABLE: role_permissions 
--

CREATE TABLE role_permissions(
    id_rol_permissions    integer    GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    id_user_rol           integer    NOT NULL,
    id_permission         integer    NOT NULL,
    CONSTRAINT pk_id_user_rol PRIMARY KEY (id_rol_permissions)
)
;



-- 
-- TABLE: roles 
--

CREATE TABLE roles(
    rol_id         integer         GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    name           varchar(32)     NOT NULL,
    description    varchar(128)    NOT NULL,
    CONSTRAINT pk_rol_id PRIMARY KEY (rol_id)
)
;



-- 
-- TABLE: route_assignment 
--

CREATE TABLE route_assignment(
    route_id         serial,
    employee_id      integer           NOT NULL,
    route_code       serial,
    name             varchar(64)       NOT NULL,
    description      varchar(128)      NOT NULL,
    priority         varchar(24)       NOT NULL,
    route_status     varchar(16)       NOT NULL,
    create_at        timestamptz(6)    NOT NULL,
    programmed_at    date              NOT NULL,
    update_at        timestamptz(6),
    active           int2              DEFAULT 1 NOT NULL,
    CONSTRAINT pk_route_id PRIMARY KEY (route_id)
)
;



-- 
-- TABLE: user_devices 
--

CREATE TABLE user_devices(
    id_device       integer         GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    user_id         integer         NOT NULL,
    device_id       text            NOT NULL,
    mobile_token    text            NOT NULL,
    is_active       boolean         DEFAULT true NOT NULL,
    last_updated    timestamp(6)    DEFAULT now() NOT NULL,
    CONSTRAINT pk_id_device PRIMARY KEY (id_device)
)
;



-- 
-- TABLE: user_roles 
--

CREATE TABLE user_roles(
    id_user_rol    integer    GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    user_id        integer    NOT NULL,
    rol_id         integer    NOT NULL,
    CONSTRAINT pk_id_user_rol PRIMARY KEY (id_user_rol)
)
;



-- 
-- TABLE: users 
--

CREATE TABLE users(
    user_id          integer           GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1),
    employee_id      integer           NOT NULL,
    username         varchar(128)      NOT NULL,
    password_hash    bytea,
    hash_salt        bytea,
    create_at        timestamptz(6)    NOT NULL,
    update_at        timestamptz(6),
    active           int2              DEFAULT 1 NOT NULL,
    CONSTRAINT pk_user_id PRIMARY KEY (user_id)
)
;



-- 
-- INDEX: ix_users_iser_id 
--

CREATE UNIQUE INDEX ix_users_iser_id ON audit_logs(user_id)
;
-- 
-- INDEX: ix_employees_employee_id 
--

CREATE UNIQUE INDEX ix_employees_employee_id ON users(employee_id)
;
-- 
-- TABLE: audit_logs 
--

ALTER TABLE audit_logs ADD CONSTRAINT FK-audit_logs_user_id 
    FOREIGN KEY (user_id)
    REFERENCES users(user_id)
;


-- 
-- TABLE: customer_files 
--

ALTER TABLE customer_files ADD CONSTRAINT FK_customer_files_prospect_id 
    FOREIGN KEY (prospect_id)
    REFERENCES prospects(prospect_id)
;


-- 
-- TABLE: customer_route_point 
--

ALTER TABLE customer_route_point ADD CONSTRAINT FK_customer_route_point_route_id 
    FOREIGN KEY (route_id)
    REFERENCES route_assignment(route_id)
;


-- 
-- TABLE: customer_visit_history 
--

ALTER TABLE customer_visit_history ADD CONSTRAINT FK_customer_visit_history_waypoint_id 
    FOREIGN KEY (waypoint_id)
    REFERENCES customer_route_point(waypoint_id)
;


-- 
-- TABLE: customers 
--

ALTER TABLE customers ADD CONSTRAINT FK_customers_employee_id 
    FOREIGN KEY (employee_id)
    REFERENCES employees(employee_id)
;


-- 
-- TABLE: prospects 
--

ALTER TABLE prospects ADD CONSTRAINT FK_prospects_employee_id 
    FOREIGN KEY (employee_id)
    REFERENCES employees(employee_id)
;


-- 
-- TABLE: role_permissions 
--

ALTER TABLE role_permissions ADD CONSTRAINT FK_role_permissions_id_permission 
    FOREIGN KEY (id_permission)
    REFERENCES permissions(id_permission)
;

ALTER TABLE role_permissions ADD CONSTRAINT FK_role_permissions_id_user_rol 
    FOREIGN KEY (id_user_rol)
    REFERENCES user_roles(id_user_rol)
;


-- 
-- TABLE: route_assignment 
--

ALTER TABLE route_assignment ADD CONSTRAINT FK_route_assignment_employee_id 
    FOREIGN KEY (employee_id)
    REFERENCES employees(employee_id)
;


-- 
-- TABLE: user_devices 
--

ALTER TABLE user_devices ADD CONSTRAINT FK_user_devices_user_id 
    FOREIGN KEY (user_id)
    REFERENCES users(user_id)
;


-- 
-- TABLE: user_roles 
--

ALTER TABLE user_roles ADD CONSTRAINT FK_user_roles_rol_id 
    FOREIGN KEY (rol_id)
    REFERENCES roles(rol_id)
;

ALTER TABLE user_roles ADD CONSTRAINT FK_user_roles_user_id 
    FOREIGN KEY (user_id)
    REFERENCES users(user_id)
;


-- 
-- TABLE: users 
--

ALTER TABLE users ADD CONSTRAINT FK_users_employee_id 
    FOREIGN KEY (employee_id)
    REFERENCES employees(employee_id)
;


