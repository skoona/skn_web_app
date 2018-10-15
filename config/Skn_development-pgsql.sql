--
-- PostgreSQL database dump
--

-- DROP DATABASE name;
-- CREATE DATABASE dbname TEMPLATE template0;

-- Dumped from database version 9.4.1
-- Dumped by pg_dump version 9.4.0
-- Started on 2018-01-17 16:05:46 EST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 195 (class 1259 OID 272385)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    username character varying(255),
    name character varying(255),
    email character varying(255),
    password_digest character varying(255),
    remember_token character varying(255),
    password_reset_token character varying(255),
    password_reset_date timestamp without time zone,
    assigned_groups character varying(4096),
    roles character varying(4096),
    active boolean DEFAULT true,
    file_access_token character varying(255),
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    person_authenticated_key character varying(255),
    assigned_roles character varying(4096),
    remember_token_digest character varying(255),
    user_options character varying(4096)
);


ALTER TABLE users OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 272383)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO postgres;

--
-- TOC entry 2341 (class 0 OID 0)
-- Dependencies: 194
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- TOC entry 2219 (class 2604 OID 272388)
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- TOC entry 2336 (class 0 OID 272385)
-- Dependencies: 195
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO users (id, username, name, email, password_digest, remember_token, password_reset_token, password_reset_date, assigned_groups, roles, active, file_access_token, created_at, updated_at, person_authenticated_key, assigned_roles, remember_token_digest, user_options) VALUES (1, 'developer', 'Skoona Developer', 'skoona@gmail.com', '$2a$10$Nx5AeWbk77HXLHgJPp3FteKOZKhGwwSlESVk6HtWzW5DABjHXdlc2', 'ECLuMFBZCuiUVqILFuAtyQ', NULL, NULL, '---
- Developer
', NULL, true, NULL, '2018-01-17 15:14:43.888955', '2018-01-17 15:14:43.888955', 'a1a02ea8c5ac6ed09051166bc79f98e7', '---
- Services.Action.Developer
', '$2a$07$uQaWlEoWQ6vC6ee4QjwPTO6n/CevA/q8gxHTz86Melt57hVbzdqTi', '---
- Developer
- ''0034''
- ''0037''
- ''0040''
- ''0099''
');
INSERT INTO users (id, username, name, email, password_digest, remember_token, password_reset_token, password_reset_date, assigned_groups, roles, active, file_access_token, created_at, updated_at, person_authenticated_key, assigned_roles, remember_token_digest, user_options) VALUES (2, 'emtester', 'Department Manager', 'emtester@localhost.com', '$2a$10$japIq0O3jrAwjirIBxhuxOy2zJmLDkz9bN1qO5MHc9Q6QyCvs3uXO', 'xVw2fVayFYgZvMdpUSkHAQ', NULL, NULL, '---
- Manager
', NULL, true, NULL, '2018-01-17 15:14:43.994054', '2018-01-17 15:14:43.994054', '0ebaf775e772728503b7c51951343016', '---
- Services.Action.Admin
', '$2a$07$V4ue9XY9N/yp7S9gsL5Oxu883eBSyzhQxVCYQvnN9NzEl3Ul/5fBu', '---
- Manager
- ''0034''
- ''0037''
- ''0040''
- ''0099''
');
INSERT INTO users (id, username, name, email, password_digest, remember_token, password_reset_token, password_reset_date, assigned_groups, roles, active, file_access_token, created_at, updated_at, person_authenticated_key, assigned_roles, remember_token_digest, user_options) VALUES (3, 'eptester', 'Employee Primary User', 'appdev@localhost.com', '$2a$10$A2nDx49QfVr1GkyXyzmldOA0GpZJYeFCPG.TjpPGl1QlPy8jKIPwy', '-ghvBu9fdMPm_326fa37vA', NULL, NULL, '---
- EmployeePrimary
', NULL, true, NULL, '2018-01-17 15:14:44.09017', '2018-01-17 15:14:44.09017', '6a9973cadeadaa1d43736d740b6024be', '---
- Services.Action.Admin
', '$2a$07$7e1vQmR3YcgGQwSPuD6xDupF3EotSjgM.RlkBCWYf5MMyHIloPJsW', '---
- EmployeePrimary
- ''0034''
- ''0037''
- ''0040''
- ''0099''
');
INSERT INTO users (id, username, name, email, password_digest, remember_token, password_reset_token, password_reset_date, assigned_groups, roles, active, file_access_token, created_at, updated_at, person_authenticated_key, assigned_roles, remember_token_digest, user_options) VALUES (4, 'estester', 'Employee Secondary User', 'appdev1@localhost.com', '$2a$10$s13rA4FCQ3FkAotXzPQtB.942ABbz0.r3CC5woyoBJi4D7dJo/H0q', 'RE7kwKhkf_hVb51iN6dTtA', NULL, NULL, '---
- EmployeeSecondary
', NULL, true, NULL, '2018-01-17 15:14:44.182028', '2018-01-17 15:14:44.182028', '18475b49d4dfad228233c8104cc5bca9', NULL, '$2a$07$94aPJ0dLAtbxvI6MKLaId.Xuuc7oDzUqn30zeuZHajur75mEXg1d6', '---
- EmployeeSecondary
- ''0037''
- ''0099''
');
INSERT INTO users (id, username, name, email, password_digest, remember_token, password_reset_token, password_reset_date, assigned_groups, roles, active, file_access_token, created_at, updated_at, person_authenticated_key, assigned_roles, remember_token_digest, user_options) VALUES (5, 'bptester', 'Branch Primary User', 'appdev2@localhost.com', '$2a$10$KQ9cUsk/ZbN8BpnVIVRqpuUZo1DqzO3P4ydye5/FMS8ILgH9gbhzO', 'UJGXCByPUjFodkHglefOYQ', NULL, NULL, '---
- BranchPrimary
', NULL, true, NULL, '2018-01-17 15:14:44.270014', '2018-01-17 15:14:44.270014', '2784303c23af89696adb61251ddeb82d', '---
- Services.Action.Primary
', '$2a$07$W2pwWkYzAVuMFsaJvAMlqeoNWb2PXO7VXphujCjm8YkbvyEJ0qm2C', '---
- BranchPrimary
- ''0034''
- ''0037''
- ''0040''
- ''0099''
');
INSERT INTO users (id, username, name, email, password_digest, remember_token, password_reset_token, password_reset_date, assigned_groups, roles, active, file_access_token, created_at, updated_at, person_authenticated_key, assigned_roles, remember_token_digest, user_options) VALUES (6, 'bstester', 'Branch Secondary User', 'appdev3@localhost.com', '$2a$10$Sg/gS63fixhrvaEwvhOpY./wNMO56ESi2V7PGQcJOdsr.NyaNeSge', 'XV5g-Mf7JEUoa5rJ0jJQ3g', NULL, NULL, '---
- BranchSecondary
', NULL, true, NULL, '2018-01-17 15:14:44.3572', '2018-01-17 15:14:44.3572', '22d58ace69e78fa3c4973f6cdff33bb4', NULL, '$2a$07$RlaTI4AgyafwsxKIrlECWO3WBTwCWWGxoVKetgxOWK4bARPRFCXCW', '---
- BranchSecondary
- ''0037''
- ''0099''
');
INSERT INTO users (id, username, name, email, password_digest, remember_token, password_reset_token, password_reset_date, assigned_groups, roles, active, file_access_token, created_at, updated_at, person_authenticated_key, assigned_roles, remember_token_digest, user_options) VALUES (7, 'bnptester', 'Branch No Privileges User', 'appdev6@localhost.com', '$2a$10$kLbBTdLYRgslOBA9xwNqrOuu1wGgQ8LSzaKYeVAhwOvn0uQdiYn4m', 'xA-RYP1l4WypFe8AqDwX9A', NULL, NULL, '---
- BranchSecondary
', NULL, true, NULL, '2018-01-17 15:14:44.443622', '2018-01-17 15:14:44.443622', '03c8269a12a904bf1a9590985559f6c6', NULL, '$2a$07$TJ4OZeMm9iauafNCkiVq.OV7YRArwU79BJiuf1Gc6elFh/.ruO9Ge', NULL);
INSERT INTO users (id, username, name, email, password_digest, remember_token, password_reset_token, password_reset_date, assigned_groups, roles, active, file_access_token, created_at, updated_at, person_authenticated_key, assigned_roles, remember_token_digest, user_options) VALUES (8, 'vptester', 'Vendor Primary User', 'appdev4@localhost.com', '$2a$10$yrsSd1MmP.50JYNYR07DTOGQUmJNVEolj/FILIqg4fgBj/qPiABhO', 'kwuJWyZ8TxnAWnlWeaXC_w', NULL, NULL, '---
- VendorPrimary
', NULL, true, NULL, '2018-01-17 15:14:44.535722', '2018-01-17 15:14:44.535722', 'c5d08d2f4f83f77ec569727657f5400c', NULL, '$2a$07$AIdGHe3xPLik0J0tsiI5lOfoVmR/.vpf7JhmYnntzgu.CsuDx6fGq', '---
- VendorPrimary
- ''0099''
');
INSERT INTO users (id, username, name, email, password_digest, remember_token, password_reset_token, password_reset_date, assigned_groups, roles, active, file_access_token, created_at, updated_at, person_authenticated_key, assigned_roles, remember_token_digest, user_options) VALUES (9, 'vstester', 'Vendor Secondary User', 'appdev5@localhost.com', '$2a$10$GsGashvVKcBVG.0DZ3g7XubJp/6PFDE8KyrO.B9IeLPQ.nDAAPFsm', 'pJ8uUPWLwlD5c_7zl21RLw', NULL, NULL, '---
- VendorSecondary
', NULL, true, NULL, '2018-01-17 15:14:44.627342', '2018-01-17 15:14:44.627342', '6f4ab863b52edc97ae0099215b6bac54', NULL, '$2a$07$AljvFMuz5A7WhCIQ0cdFHeKWNe3CZgjlx8ho09qq.UtMloCDC8kZO', '---
- VendorSecondary
- ''0099''
');


--
-- TOC entry 2342 (class 0 OID 0)
-- Dependencies: 194
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('users_id_seq', 9, true);


--
-- TOC entry 2225 (class 2606 OID 272394)
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 2221 (class 1259 OID 272395)
-- Name: index_users_on_person_authenticated_key; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_person_authenticated_key ON users USING btree (person_authenticated_key);


--
-- TOC entry 2222 (class 1259 OID 272396)
-- Name: index_users_on_remember_token; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_users_on_remember_token ON users USING btree (remember_token);


--
-- TOC entry 2223 (class 1259 OID 272397)
-- Name: index_users_on_username; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX index_users_on_username ON users USING btree (username);


-- Completed on 2018-01-17 16:05:46 EST

--
-- PostgreSQL database dump complete
--

