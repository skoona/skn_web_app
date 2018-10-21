--
-- PostgreSQL database Seed
--

-- Dumped from database version 9.6.8
-- Dumped by pg_dump version 10.1

-- Started on 2018-10-14 22:17:06 EDT

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;


SET search_path = "public", pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;




--
-- TOC entry 2314 (class 0 OID 19368)
-- Dependencies: 196
-- Data for Name: profile_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "profile_types" VALUES (1, 'Developer', 'Open Source Independent Consultancy', '2018-01-15 14:48:56.421634', '2018-01-15 14:48:56.421634');
INSERT INTO "profile_types" VALUES (2, 'Manager', 'Corporate Managers', '2018-01-15 14:48:56.440737', '2018-01-15 14:48:56.440737');
INSERT INTO "profile_types" VALUES (3, 'EmployeePrimary', 'Department Managers', '2018-01-15 14:48:56.448697', '2018-01-15 14:48:56.448697');
INSERT INTO "profile_types" VALUES (4, 'EmployeeSecondary', 'Corporate Staff', '2018-01-15 14:48:56.490582', '2018-01-15 14:48:56.490582');
INSERT INTO "profile_types" VALUES (5, 'BranchPrimary', 'Branch Manager', '2018-01-15 14:48:56.498873', '2018-01-15 14:48:56.498873');
INSERT INTO "profile_types" VALUES (6, 'BranchSecondary', 'Branch Staff', '2018-01-15 14:48:56.507175', '2018-01-15 14:48:56.507175');
INSERT INTO "profile_types" VALUES (7, 'VendorPrimary', 'Partner Manager', '2018-01-15 14:48:56.515525', '2018-01-15 14:48:56.515525');
INSERT INTO "profile_types" VALUES (8, 'VendorSecondary', 'Partner Staff', '2018-01-15 14:48:56.523806', '2018-01-15 14:48:56.523806');


--
-- TOC entry 2306 (class 0 OID 19322)
-- Dependencies: 188
-- Data for Name: content_profiles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "content_profiles" VALUES (1, '8e07bebf8050de449c73a37d2aca7cfd', 1, 'SknService::Bcrypt', 'developer', 'Skoona Developer', 'skoona@gmail.com', '2018-01-15 14:48:58.342689', '2018-01-15 14:48:58.342689');
INSERT INTO "content_profiles" VALUES (2, 'd400080cff7114d42c4e750f07eaba5d', 2, 'SknService::Bcrypt', 'emtester', 'Department Manager', 'systems@skoona.net', '2018-01-15 14:48:58.494167', '2018-01-15 14:48:58.494167');
INSERT INTO "content_profiles" VALUES (3, 'c96b013427bf3220f4ad6f32a17f5692', 3, 'SknService::Bcrypt', 'eptester', 'Employee Primary User', 'appdev@domain.com', '2018-01-15 14:48:58.583968', '2018-01-15 14:48:58.583968');
INSERT INTO "content_profiles" VALUES (4, 'a1efb66f26e07a94dd893c085823f2ad', 4, 'SknService::Bcrypt', 'estester', 'Employee Secondary User', 'appdev1@domain.com', '2018-01-15 14:48:58.697712', '2018-01-15 14:48:58.697712');
INSERT INTO "content_profiles" VALUES (5, '5f8bcc3f52726f79f204322fb190f862', 5, 'SknService::Bcrypt', 'bptester', 'Branch Primary User', 'appdev2@domain.com', '2018-01-15 14:48:58.773122', '2018-01-15 14:48:58.773122');
INSERT INTO "content_profiles" VALUES (6, '2adf06b81402f8813ce660f6ed234835', 6, 'SknService::Bcrypt', 'bstester', 'Branch Secondary User', 'appdev3@domain.com', '2018-01-15 14:48:58.812271', '2018-01-15 14:48:58.812271');
INSERT INTO "content_profiles" VALUES (7, '80a8da39842673963d7714f524fbc454', 7, 'SknService::Bcrypt', 'vptester', 'Vendor Primary User', 'appdev4@domain.com', '2018-01-15 14:48:58.837388', '2018-01-15 14:48:58.837388');


--
-- TOC entry 2304 (class 0 OID 19311)
-- Dependencies: 186
-- Data for Name: content_profile_entries; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "content_profile_entries" VALUES (1, '---
- ''0034''
', 'Branch', 'Branch Actions for a specific branch', '---
- "*.pdf"
', 'Experience', 'Monthly Experience Reports and Files', 'Branch Experience Statements', '2018-01-15 14:48:56.944915', '2018-01-15 14:48:56.944915');
INSERT INTO "content_profile_entries" VALUES (2, '---
- ''0034''
', 'Branch', 'Branch Actions for a specific branch', '---
- "*.pdf"
', 'Commission', 'Monthly Commission Reports and Files', 'Access Branch Commission PDF Files', '2018-01-15 14:48:56.972038', '2018-01-15 14:48:56.972038');
INSERT INTO "content_profile_entries" VALUES (3, '---
- ''0034''
', 'Branch', 'Branch Actions for a specific branch', '---
- AdvCancel
', 'Notification', 'Email Notification of Related Events', 'Notify Branch of Policy Events', '2018-01-15 14:48:56.988472', '2018-01-15 14:48:56.988472');
INSERT INTO "content_profile_entries" VALUES (4, '---
- ''0034''
', 'Branch', 'Branch Actions for a specific branch', '---
- ''21''
', 'LicensedStates', 'Business Operational Metric', 'Licensed to operate in state', '2018-01-15 14:48:57.02056', '2018-01-15 14:48:57.02056');
INSERT INTO "content_profile_entries" VALUES (5, '---
- ''0034''
', 'Branch', 'Branch Actions for a specific branch', '---
- ''12''
', 'LicensedStates', 'Business Operational Metric', 'Licensed to operate in state', '2018-01-15 14:48:57.055357', '2018-01-15 14:48:57.055357');
INSERT INTO "content_profile_entries" VALUES (6, '---
- ''0034''
', 'Branch', 'Branch Actions for a specific branch', '---
- ''13''
', 'LicensedStates', 'Business Operational Metric', 'Licensed to operate in state', '2018-01-15 14:48:57.087661', '2018-01-15 14:48:57.087661');
INSERT INTO "content_profile_entries" VALUES (7, '---
- ''0099''
', 'Partner', 'This Corporate Account', '---
- "*.pdf"
', 'Activity', 'Partner Relationship Reports', 'Partner Relationship Reports', '2018-01-15 14:48:57.104337', '2018-01-15 14:48:57.104337');
INSERT INTO "content_profile_entries" VALUES (8, '---
- ''0037''
', 'Branch', 'Branch Actions for a specific branch', '---
- "*.pdf"
', 'Experience', 'Monthly Experience Reports and Files', 'Branch Experience Statements', '2018-01-15 14:48:57.123906', '2018-01-15 14:48:57.123906');
INSERT INTO "content_profile_entries" VALUES (9, '---
- ''0037''
', 'Branch', 'Branch Actions for a specific branch', '---
- "*.pdf"
', 'Commission', 'Monthly Commission Reports and Files', 'Access Branch Commission CSV Files', '2018-01-15 14:48:57.138146', '2018-01-15 14:48:57.138146');
INSERT INTO "content_profile_entries" VALUES (10, '---
- ''0037''
', 'Branch', 'Branch Actions for a specific branch', '---
- Cancel
', 'Notification', 'Email Notification of Related Events', 'Notify Branch of Policy Events', '2018-01-15 14:48:57.157253', '2018-01-15 14:48:57.157253');
INSERT INTO "content_profile_entries" VALUES (11, '---
- ''0037''
', 'Branch', 'Branch Actions for a specific branch', '---
- ''34''
', 'LicensedStates', 'Business Operational Metric', 'Licensed to operate in state', '2018-01-15 14:48:57.183562', '2018-01-15 14:48:57.183562');
INSERT INTO "content_profile_entries" VALUES (12, '---
- ''0037''
', 'Branch', 'Branch Actions for a specific branch', '---
- ''37''
', 'LicensedStates', 'Business Operational Metric', 'Licensed to operate in state', '2018-01-15 14:48:57.209037', '2018-01-15 14:48:57.209037');
INSERT INTO "content_profile_entries" VALUES (13, '---
- ''0037''
', 'Branch', 'Branch Actions for a specific branch', '---
- ''31''
', 'LicensedStates', 'Business Operational Metric', 'Licensed to operate in state', '2018-01-15 14:48:57.234297', '2018-01-15 14:48:57.234297');
INSERT INTO "content_profile_entries" VALUES (14, '---
- ''0040''
', 'Branch', 'Branch Actions for a specific branch', '---
- "*.pdf"
', 'Experience', 'Monthly Experience Reports and Files', 'Branch Experience Statements', '2018-01-15 14:48:57.246253', '2018-01-15 14:48:57.246253');
INSERT INTO "content_profile_entries" VALUES (15, '---
- ''0040''
', 'Branch', 'Branch Actions for a specific branch', '---
- "*.pdf"
', 'Commission', 'Monthly Commission Reports and Files', 'Access Branch Commission PDF Files', '2018-01-15 14:48:57.264456', '2018-01-15 14:48:57.264456');
INSERT INTO "content_profile_entries" VALUES (16, '---
- ''0040''
', 'Branch', 'Branch Actions for a specific branch', '---
- FutCancel
', 'Notification', 'Email Notification of Related Events', 'Notify Branch of Policy Events', '2018-01-15 14:48:57.290176', '2018-01-15 14:48:57.290176');
INSERT INTO "content_profile_entries" VALUES (17, '---
- ''0040''
', 'Branch', 'Branch Actions for a specific branch', '---
- ''24''
', 'LicensedStates', 'Business Operational Metric', 'Licensed to operate in state', '2018-01-15 14:48:57.31898', '2018-01-15 14:48:57.31898');
INSERT INTO "content_profile_entries" VALUES (18, '---
- ''0040''
', 'Branch', 'Branch Actions for a specific branch', '---
- ''14''
', 'LicensedStates', 'Business Operational Metric', 'Licensed to operate in state', '2018-01-15 14:48:57.355162', '2018-01-15 14:48:57.355162');
INSERT INTO "content_profile_entries" VALUES (19, '---
- ''0040''
', 'Branch', 'Branch Actions for a specific branch', '---
- ''3''
', 'LicensedStates', 'Business Operational Metric', 'Licensed to operate in state', '2018-01-15 14:48:57.388462', '2018-01-15 14:48:57.388462');
INSERT INTO "content_profile_entries" VALUES (20, '---
- Developer
', 'UserGroups', 'Shared access to project working files', '---
- "*.pdf"
', 'FileDownload', 'Project Related Resources', 'Shared access to project working files', '2018-01-15 14:48:57.409254', '2018-01-15 14:48:57.409254');
INSERT INTO "content_profile_entries" VALUES (21, '---
- Developer
', 'UserGroups', 'Shared access to project working files', '---
- "*.png"
', 'FileDownload', 'Project Related Resources', 'Shared access to project working files', '2018-01-15 14:48:57.423089', '2018-01-15 14:48:57.423089');
INSERT INTO "content_profile_entries" VALUES (22, '---
- Developer
', 'UserGroups', 'Shared access to project working files', '---
- "*.jpg"
', 'FileDownload', 'Project Related Resources', 'Shared access to project working files', '2018-01-15 14:48:57.439563', '2018-01-15 14:48:57.439563');
INSERT INTO "content_profile_entries" VALUES (23, '---
- Developer
', 'UserGroups', 'Shared access to project working files', '---
- "*.log"
', 'FileDownload', 'Project Related Resources', 'Shared access to project working files', '2018-01-15 14:48:57.458373', '2018-01-15 14:48:57.458373');
INSERT INTO "content_profile_entries" VALUES (24, '---
- ''0034''
', 'Branch', 'Branch Actions for a specific branch', '---
- "*.pdf"
', 'Experience', 'Monthly Experience Reports and Files', 'Branch Experience Statements', '2018-01-15 14:48:57.471381', '2018-01-15 14:48:57.471381');
INSERT INTO "content_profile_entries" VALUES (25, '---
- ''0034''
', 'Branch', 'Branch Actions for a specific branch', '---
- "*.pdf"
', 'Commission', 'Monthly Commission Reports and Files', 'Access Branch Commission PDF Files', '2018-01-15 14:48:57.488083', '2018-01-15 14:48:57.488083');
INSERT INTO "content_profile_entries" VALUES (26, '---
- ''0034''
', 'Branch', 'Branch Actions for a specific branch', '---
- AdvCancel
', 'Notification', 'Email Notification of Related Events', 'Notify Branch of Policy Events', '2018-01-15 14:48:57.505295', '2018-01-15 14:48:57.505295');
INSERT INTO "content_profile_entries" VALUES (27, '---
- ''0034''
', 'Branch', 'Branch Actions for a specific branch', '---
- ''21''
', 'LicensedStates', 'Business Operational Metric', 'Licensed to operate in state', '2018-01-15 14:48:57.537549', '2018-01-15 14:48:57.537549');
INSERT INTO "content_profile_entries" VALUES (28, '---
- ''0034''
', 'Branch', 'Branch Actions for a specific branch', '---
- ''12''
', 'LicensedStates', 'Business Operational Metric', 'Licensed to operate in state', '2018-01-15 14:48:57.571539', '2018-01-15 14:48:57.571539');
INSERT INTO "content_profile_entries" VALUES (29, '---
- ''0034''
', 'Branch', 'Branch Actions for a specific branch', '---
- ''13''
', 'LicensedStates', 'Business Operational Metric', 'Licensed to operate in state', '2018-01-15 14:48:57.605174', '2018-01-15 14:48:57.605174');
INSERT INTO "content_profile_entries" VALUES (30, '---
- ''0099''
', 'Partner', 'This Corporate Account', '---
- "*.pdf"
', 'Activity', 'Partner Relationship Reports', 'Partner Relationship Reports', '2018-01-15 14:48:57.620708', '2018-01-15 14:48:57.620708');
INSERT INTO "content_profile_entries" VALUES (31, '---
- ''0037''
', 'Branch', 'Branch Actions for a specific branch', '---
- "*.pdf"
', 'Experience', 'Monthly Experience Reports and Files', 'Branch Experience Statements', '2018-01-15 14:48:57.64068', '2018-01-15 14:48:57.64068');
INSERT INTO "content_profile_entries" VALUES (32, '---
- ''0037''
', 'Branch', 'Branch Actions for a specific branch', '---
- "*.csv"
', 'Commission', 'Monthly Commission Reports and Files', 'Access Branch Commission CSV Files', '2018-01-15 14:48:57.655168', '2018-01-15 14:48:57.655168');
INSERT INTO "content_profile_entries" VALUES (33, '---
- ''0037''
', 'Branch', 'Branch Actions for a specific branch', '---
- Cancel
', 'Notification', 'Email Notification of Related Events', 'Notify Branch of Policy Events', '2018-01-15 14:48:57.674503', '2018-01-15 14:48:57.674503');
INSERT INTO "content_profile_entries" VALUES (34, '---
- ''0037''
', 'Branch', 'Branch Actions for a specific branch', '---
- ''34''
', 'LicensedStates', 'Business Operational Metric', 'Licensed to operate in state', '2018-01-15 14:48:57.706611', '2018-01-15 14:48:57.706611');
INSERT INTO "content_profile_entries" VALUES (35, '---
- ''0037''
', 'Branch', 'Branch Actions for a specific branch', '---
- ''37''
', 'LicensedStates', 'Business Operational Metric', 'Licensed to operate in state', '2018-01-15 14:48:57.738664', '2018-01-15 14:48:57.738664');
INSERT INTO "content_profile_entries" VALUES (36, '---
- ''0037''
', 'Branch', 'Branch Actions for a specific branch', '---
- ''31''
', 'LicensedStates', 'Business Operational Metric', 'Licensed to operate in state', '2018-01-15 14:48:57.770835', '2018-01-15 14:48:57.770835');
INSERT INTO "content_profile_entries" VALUES (37, '---
- ''0040''
', 'Branch', 'Branch Actions for a specific branch', '---
- "*.pdf"
', 'Experience', 'Monthly Experience Reports and Files', 'Branch Experience Statements', '2018-01-15 14:48:57.788272', '2018-01-15 14:48:57.788272');
INSERT INTO "content_profile_entries" VALUES (38, '---
- ''0040''
', 'Branch', 'Branch Actions for a specific branch', '---
- "*.pdf"
', 'Commission', 'Monthly Commission Reports and Files', 'Access Branch Commission PDF Files', '2018-01-15 14:48:57.806371', '2018-01-15 14:48:57.806371');
INSERT INTO "content_profile_entries" VALUES (39, '---
- ''0040''
', 'Branch', 'Branch Actions for a specific branch', '---
- FutCancel
', 'Notification', 'Email Notification of Related Events', 'Notify Branch of Policy Events', '2018-01-15 14:48:57.823154', '2018-01-15 14:48:57.823154');
INSERT INTO "content_profile_entries" VALUES (40, '---
- ''0040''
', 'Branch', 'Branch Actions for a specific branch', '---
- ''24''
', 'LicensedStates', 'Business Operational Metric', 'Licensed to operate in state', '2018-01-15 14:48:57.852877', '2018-01-15 14:48:57.852877');
INSERT INTO "content_profile_entries" VALUES (41, '---
- ''0040''
', 'Branch', 'Branch Actions for a specific branch', '---
- ''14''
', 'LicensedStates', 'Business Operational Metric', 'Licensed to operate in state', '2018-01-15 14:48:57.887899', '2018-01-15 14:48:57.887899');
INSERT INTO "content_profile_entries" VALUES (42, '---
- ''0040''
', 'Branch', 'Branch Actions for a specific branch', '---
- ''3''
', 'LicensedStates', 'Business Operational Metric', 'Licensed to operate in state', '2018-01-15 14:48:57.961558', '2018-01-15 14:48:57.961558');
INSERT INTO "content_profile_entries" VALUES (43, '---
- EmployeePrimary
', 'UserGroups', 'Shared access to project working files', '---
- "*.pdf"
', 'FileDownload', 'Project Related Resources', 'Shared access to project working files', '2018-01-15 14:48:57.981792', '2018-01-15 14:48:57.981792');
INSERT INTO "content_profile_entries" VALUES (44, '---
- EmployeePrimary
', 'UserGroups', 'Shared access to project working files', '---
- "*.png"
', 'FileDownload', 'Project Related Resources', 'Shared access to project working files', '2018-01-15 14:48:57.998723', '2018-01-15 14:48:57.998723');
INSERT INTO "content_profile_entries" VALUES (45, '---
- EmployeePrimary
', 'UserGroups', 'Shared access to project working files', '---
- "*.jpg"
', 'FileDownload', 'Project Related Resources', 'Shared access to project working files', '2018-01-15 14:48:58.015321', '2018-01-15 14:48:58.015321');
INSERT INTO "content_profile_entries" VALUES (46, '---
- EmployeePrimary
', 'UserGroups', 'Shared access to project working files', '---
- "*.log"
', 'FileDownload', 'Project Related Resources', 'Shared access to project working files', '2018-01-15 14:48:58.032223', '2018-01-15 14:48:58.032223');
INSERT INTO "content_profile_entries" VALUES (47, '---
- ''0034''
', 'Branch', 'Branch Actions for a specific branch', '---
- "*.pdf"
', 'Experience', 'Monthly Experience Reports and Files', 'Branch Experience Statements', '2018-01-15 14:48:58.053236', '2018-01-15 14:48:58.053236');
INSERT INTO "content_profile_entries" VALUES (48, '---
- ''0034''
', 'Branch', 'Branch Actions for a specific branch', '---
- "*.pdf"
', 'Commission', 'Monthly Commission Reports and Files', 'Access Branch Commission PDF Files', '2018-01-15 14:48:58.074282', '2018-01-15 14:48:58.074282');
INSERT INTO "content_profile_entries" VALUES (49, '---
- ''0034''
', 'Branch', 'Branch Actions for a specific branch', '---
- AdvCancel
', 'Notification', 'Email Notification of Related Events', 'Notify Branch of Policy Events', '2018-01-15 14:48:58.089036', '2018-01-15 14:48:58.089036');
INSERT INTO "content_profile_entries" VALUES (50, '---
- ''0099''
', 'Partner', 'This Corporate Account', '---
- "*.pdf"
', 'Activity', 'Partner Relationship Reports', 'Partner Relationship Reports', '2018-01-15 14:48:58.106691', '2018-01-15 14:48:58.106691');
INSERT INTO "content_profile_entries" VALUES (51, '---
- ''0040''
', 'Branch', 'Branch Actions for a specific branch', '---
- "*.pdf"
', 'Experience', 'Monthly Experience Reports and Files', 'Branch Experience Statements', '2018-01-15 14:48:58.138176', '2018-01-15 14:48:58.138176');
INSERT INTO "content_profile_entries" VALUES (52, '---
- ''0040''
', 'Branch', 'Branch Actions for a specific branch', '---
- "*.pdf"
', 'Commission', 'Monthly Commission Reports and Files', 'Access Branch Commission PDF Files', '2018-01-15 14:48:58.154987', '2018-01-15 14:48:58.154987');
INSERT INTO "content_profile_entries" VALUES (53, '---
- ''0040''
', 'Branch', 'Branch Actions for a specific branch', '---
- FutCancel
', 'Notification', 'Email Notification of Related Events', 'Notify Branch of Policy Events', '2018-01-15 14:48:58.170906', '2018-01-15 14:48:58.170906');
INSERT INTO "content_profile_entries" VALUES (54, '---
- EmployeeSecondary
', 'UserGroups', 'Shared access to project working files', '---
- "*.pdf"
', 'FileDownload', 'Project Related Resources', 'Shared access to project working files', '2018-01-15 14:48:58.188227', '2018-01-15 14:48:58.188227');
INSERT INTO "content_profile_entries" VALUES (55, '---
- BranchPrimary
', 'UserGroups', 'Shared access to project working files', '---
- "*.pdf"
', 'FileDownload', 'Project Related Resources', 'Shared access to project working files', '2018-01-15 14:48:58.206606', '2018-01-15 14:48:58.206606');
INSERT INTO "content_profile_entries" VALUES (56, '---
- ''0099''
', 'Partner', 'This Corporate Account', '---
- "*.pdf"
', 'Activity', 'Partner Relationship Reports', 'Partner Relationship Reports', '2018-01-15 14:48:58.219642', '2018-01-15 14:48:58.219642');
INSERT INTO "content_profile_entries" VALUES (57, '---
- VendorPrimary
', 'UserGroups', 'Shared access to project working files', '---
- "*.log"
', 'FileDownload', 'Project Related Resources', 'Shared access to project working files', '2018-01-15 14:48:58.240715', '2018-01-15 14:48:58.240715');


--
-- TOC entry 2308 (class 0 OID 19335)
-- Dependencies: 190
-- Data for Name: content_profiles_entries; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "content_profiles_entries" VALUES (1, 1, 1);
INSERT INTO "content_profiles_entries" VALUES (2, 1, 2);
INSERT INTO "content_profiles_entries" VALUES (3, 1, 3);
INSERT INTO "content_profiles_entries" VALUES (4, 1, 4);
INSERT INTO "content_profiles_entries" VALUES (5, 1, 5);
INSERT INTO "content_profiles_entries" VALUES (6, 1, 6);
INSERT INTO "content_profiles_entries" VALUES (7, 1, 7);
INSERT INTO "content_profiles_entries" VALUES (8, 1, 8);
INSERT INTO "content_profiles_entries" VALUES (9, 1, 9);
INSERT INTO "content_profiles_entries" VALUES (10, 1, 10);
INSERT INTO "content_profiles_entries" VALUES (11, 1, 11);
INSERT INTO "content_profiles_entries" VALUES (12, 1, 12);
INSERT INTO "content_profiles_entries" VALUES (13, 1, 13);
INSERT INTO "content_profiles_entries" VALUES (14, 1, 14);
INSERT INTO "content_profiles_entries" VALUES (15, 1, 15);
INSERT INTO "content_profiles_entries" VALUES (16, 1, 16);
INSERT INTO "content_profiles_entries" VALUES (17, 1, 17);
INSERT INTO "content_profiles_entries" VALUES (18, 1, 18);
INSERT INTO "content_profiles_entries" VALUES (19, 1, 19);
INSERT INTO "content_profiles_entries" VALUES (20, 1, 20);
INSERT INTO "content_profiles_entries" VALUES (21, 1, 21);
INSERT INTO "content_profiles_entries" VALUES (22, 1, 22);
INSERT INTO "content_profiles_entries" VALUES (23, 1, 23);
INSERT INTO "content_profiles_entries" VALUES (24, 2, 24);
INSERT INTO "content_profiles_entries" VALUES (25, 2, 25);
INSERT INTO "content_profiles_entries" VALUES (26, 2, 26);
INSERT INTO "content_profiles_entries" VALUES (27, 2, 27);
INSERT INTO "content_profiles_entries" VALUES (28, 2, 28);
INSERT INTO "content_profiles_entries" VALUES (29, 2, 29);
INSERT INTO "content_profiles_entries" VALUES (30, 2, 30);
INSERT INTO "content_profiles_entries" VALUES (31, 2, 31);
INSERT INTO "content_profiles_entries" VALUES (32, 2, 32);
INSERT INTO "content_profiles_entries" VALUES (33, 2, 33);
INSERT INTO "content_profiles_entries" VALUES (34, 2, 34);
INSERT INTO "content_profiles_entries" VALUES (35, 2, 35);
INSERT INTO "content_profiles_entries" VALUES (36, 2, 36);
INSERT INTO "content_profiles_entries" VALUES (37, 2, 37);
INSERT INTO "content_profiles_entries" VALUES (38, 2, 38);
INSERT INTO "content_profiles_entries" VALUES (39, 2, 39);
INSERT INTO "content_profiles_entries" VALUES (40, 2, 40);
INSERT INTO "content_profiles_entries" VALUES (41, 2, 41);
INSERT INTO "content_profiles_entries" VALUES (42, 2, 42);
INSERT INTO "content_profiles_entries" VALUES (43, 2, 43);
INSERT INTO "content_profiles_entries" VALUES (44, 2, 44);
INSERT INTO "content_profiles_entries" VALUES (45, 2, 45);
INSERT INTO "content_profiles_entries" VALUES (46, 2, 46);
INSERT INTO "content_profiles_entries" VALUES (47, 3, 24);
INSERT INTO "content_profiles_entries" VALUES (48, 3, 25);
INSERT INTO "content_profiles_entries" VALUES (49, 3, 26);
INSERT INTO "content_profiles_entries" VALUES (50, 3, 27);
INSERT INTO "content_profiles_entries" VALUES (51, 3, 28);
INSERT INTO "content_profiles_entries" VALUES (52, 3, 29);
INSERT INTO "content_profiles_entries" VALUES (53, 3, 30);
INSERT INTO "content_profiles_entries" VALUES (54, 3, 31);
INSERT INTO "content_profiles_entries" VALUES (55, 3, 32);
INSERT INTO "content_profiles_entries" VALUES (56, 3, 33);
INSERT INTO "content_profiles_entries" VALUES (57, 3, 34);
INSERT INTO "content_profiles_entries" VALUES (58, 3, 35);
INSERT INTO "content_profiles_entries" VALUES (59, 3, 36);
INSERT INTO "content_profiles_entries" VALUES (60, 3, 37);
INSERT INTO "content_profiles_entries" VALUES (61, 3, 38);
INSERT INTO "content_profiles_entries" VALUES (62, 3, 39);
INSERT INTO "content_profiles_entries" VALUES (63, 3, 40);
INSERT INTO "content_profiles_entries" VALUES (64, 3, 41);
INSERT INTO "content_profiles_entries" VALUES (65, 3, 42);
INSERT INTO "content_profiles_entries" VALUES (66, 3, 43);
INSERT INTO "content_profiles_entries" VALUES (67, 3, 44);
INSERT INTO "content_profiles_entries" VALUES (68, 3, 45);
INSERT INTO "content_profiles_entries" VALUES (69, 3, 46);
INSERT INTO "content_profiles_entries" VALUES (70, 4, 47);
INSERT INTO "content_profiles_entries" VALUES (71, 4, 48);
INSERT INTO "content_profiles_entries" VALUES (72, 4, 49);
INSERT INTO "content_profiles_entries" VALUES (73, 4, 50);
INSERT INTO "content_profiles_entries" VALUES (74, 4, 51);
INSERT INTO "content_profiles_entries" VALUES (75, 4, 52);
INSERT INTO "content_profiles_entries" VALUES (76, 4, 53);
INSERT INTO "content_profiles_entries" VALUES (77, 4, 54);
INSERT INTO "content_profiles_entries" VALUES (78, 4, 55);
INSERT INTO "content_profiles_entries" VALUES (79, 5, 47);
INSERT INTO "content_profiles_entries" VALUES (80, 5, 48);
INSERT INTO "content_profiles_entries" VALUES (81, 5, 49);
INSERT INTO "content_profiles_entries" VALUES (82, 5, 50);
INSERT INTO "content_profiles_entries" VALUES (83, 5, 51);
INSERT INTO "content_profiles_entries" VALUES (84, 5, 52);
INSERT INTO "content_profiles_entries" VALUES (85, 5, 53);
INSERT INTO "content_profiles_entries" VALUES (86, 5, 54);
INSERT INTO "content_profiles_entries" VALUES (87, 5, 55);
INSERT INTO "content_profiles_entries" VALUES (88, 6, 56);
INSERT INTO "content_profiles_entries" VALUES (89, 6, 57);
INSERT INTO "content_profiles_entries" VALUES (90, 7, 56);
INSERT INTO "content_profiles_entries" VALUES (91, 7, 57);


--
-- TOC entry 2312 (class 0 OID 19357)
-- Dependencies: 194
-- Data for Name: content_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "content_types" VALUES (1, 'Experience', 'Monthly Experience Reports and Files', 'String', '2018-01-15 14:48:56.551743', '2018-01-15 14:48:56.551743');
INSERT INTO "content_types" VALUES (2, 'Commission', 'Monthly Commission Reports and Files', 'String', '2018-01-15 14:48:56.609505', '2018-01-15 14:48:56.609505');
INSERT INTO "content_types" VALUES (3, 'Notification', 'Email Notification of Related Events', 'String', '2018-01-15 14:48:56.625795', '2018-01-15 14:48:56.625795');
INSERT INTO "content_types" VALUES (4, 'LicensedStates', 'Business Operational Metric', 'Integer', '2018-01-15 14:48:56.672317', '2018-01-15 14:48:56.672317');
INSERT INTO "content_types" VALUES (5, 'Activity', 'Partner Relationship Reports', 'String', '2018-01-15 14:48:56.766625', '2018-01-15 14:48:56.766625');
INSERT INTO "content_types" VALUES (6, 'FileDownload', 'Project Related Resources', 'String', '2018-01-15 14:48:56.777389', '2018-01-15 14:48:56.777389');


--
-- TOC entry 2310 (class 0 OID 19345)
-- Dependencies: 192
-- Data for Name: content_type_opts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "content_type_opts" VALUES (1, '*.pdf', 'Document store Experience PDF Type', 'Experience', 1, '2018-01-15 14:48:56.56869', '2018-01-15 14:48:56.56869');
INSERT INTO "content_type_opts" VALUES (2, '*.pdf', 'Document store Commision Document Type ID', 'Commission', 2, '2018-01-15 14:48:56.611412', '2018-01-15 14:48:56.611412');
INSERT INTO "content_type_opts" VALUES (3, '*.csv', 'Document store Commision CSV Document Type ID', 'Commission', 2, '2018-01-15 14:48:56.61344', '2018-01-15 14:48:56.61344');
INSERT INTO "content_type_opts" VALUES (4, 'AdvCancel', 'Advance Cancel', 'Notification', 3, '2018-01-15 14:48:56.627179', '2018-01-15 14:48:56.627179');
INSERT INTO "content_type_opts" VALUES (5, 'FutCancel', 'Future Cancel', 'Notification', 3, '2018-01-15 14:48:56.628794', '2018-01-15 14:48:56.628794');
INSERT INTO "content_type_opts" VALUES (6, 'Cancel', 'Cancel', 'Notification', 3, '2018-01-15 14:48:56.630662', '2018-01-15 14:48:56.630662');
INSERT INTO "content_type_opts" VALUES (7, '54', 'Alaska', 'LicensedStates', 4, '2018-01-15 14:48:56.674143', '2018-01-15 14:48:56.674143');
INSERT INTO "content_type_opts" VALUES (8, '1', 'Alabama', 'LicensedStates', 4, '2018-01-15 14:48:56.675681', '2018-01-15 14:48:56.675681');
INSERT INTO "content_type_opts" VALUES (9, '3', 'Arkansas', 'LicensedStates', 4, '2018-01-15 14:48:56.677098', '2018-01-15 14:48:56.677098');
INSERT INTO "content_type_opts" VALUES (10, '2', 'Arizona', 'LicensedStates', 4, '2018-01-15 14:48:56.678465', '2018-01-15 14:48:56.678465');
INSERT INTO "content_type_opts" VALUES (11, '4', 'California', 'LicensedStates', 4, '2018-01-15 14:48:56.679792', '2018-01-15 14:48:56.679792');
INSERT INTO "content_type_opts" VALUES (12, '5', 'Colorado', 'LicensedStates', 4, '2018-01-15 14:48:56.681231', '2018-01-15 14:48:56.681231');
INSERT INTO "content_type_opts" VALUES (13, '6', 'Connecticut', 'LicensedStates', 4, '2018-01-15 14:48:56.68263', '2018-01-15 14:48:56.68263');
INSERT INTO "content_type_opts" VALUES (14, '8', 'Washington Dc', 'LicensedStates', 4, '2018-01-15 14:48:56.683996', '2018-01-15 14:48:56.683996');
INSERT INTO "content_type_opts" VALUES (15, '7', 'Delaware', 'LicensedStates', 4, '2018-01-15 14:48:56.685414', '2018-01-15 14:48:56.685414');
INSERT INTO "content_type_opts" VALUES (16, '9', 'Florida', 'LicensedStates', 4, '2018-01-15 14:48:56.686774', '2018-01-15 14:48:56.686774');
INSERT INTO "content_type_opts" VALUES (17, '10', 'Georgia', 'LicensedStates', 4, '2018-01-15 14:48:56.688134', '2018-01-15 14:48:56.688134');
INSERT INTO "content_type_opts" VALUES (18, '52', 'Hawaii', 'LicensedStates', 4, '2018-01-15 14:48:56.689524', '2018-01-15 14:48:56.689524');
INSERT INTO "content_type_opts" VALUES (19, '14', 'Iowa', 'LicensedStates', 4, '2018-01-15 14:48:56.690893', '2018-01-15 14:48:56.690893');
INSERT INTO "content_type_opts" VALUES (20, '11', 'Idaho', 'LicensedStates', 4, '2018-01-15 14:48:56.692244', '2018-01-15 14:48:56.692244');
INSERT INTO "content_type_opts" VALUES (21, '12', 'Illinois', 'LicensedStates', 4, '2018-01-15 14:48:56.693618', '2018-01-15 14:48:56.693618');
INSERT INTO "content_type_opts" VALUES (22, '13', 'Indiana', 'LicensedStates', 4, '2018-01-15 14:48:56.694979', '2018-01-15 14:48:56.694979');
INSERT INTO "content_type_opts" VALUES (23, '15', 'Kansas', 'LicensedStates', 4, '2018-01-15 14:48:56.696562', '2018-01-15 14:48:56.696562');
INSERT INTO "content_type_opts" VALUES (24, '16', 'Kentucky', 'LicensedStates', 4, '2018-01-15 14:48:56.69833', '2018-01-15 14:48:56.69833');
INSERT INTO "content_type_opts" VALUES (25, '17', 'Louisiana', 'LicensedStates', 4, '2018-01-15 14:48:56.700066', '2018-01-15 14:48:56.700066');
INSERT INTO "content_type_opts" VALUES (26, '20', 'Massachusetts', 'LicensedStates', 4, '2018-01-15 14:48:56.701939', '2018-01-15 14:48:56.701939');
INSERT INTO "content_type_opts" VALUES (27, '19', 'Maryland', 'LicensedStates', 4, '2018-01-15 14:48:56.703672', '2018-01-15 14:48:56.703672');
INSERT INTO "content_type_opts" VALUES (28, '18', 'Maine', 'LicensedStates', 4, '2018-01-15 14:48:56.705488', '2018-01-15 14:48:56.705488');
INSERT INTO "content_type_opts" VALUES (29, '21', 'Michigan', 'LicensedStates', 4, '2018-01-15 14:48:56.70721', '2018-01-15 14:48:56.70721');
INSERT INTO "content_type_opts" VALUES (30, '22', 'Minnesota', 'LicensedStates', 4, '2018-01-15 14:48:56.708915', '2018-01-15 14:48:56.708915');
INSERT INTO "content_type_opts" VALUES (31, '24', 'Missouri', 'LicensedStates', 4, '2018-01-15 14:48:56.71038', '2018-01-15 14:48:56.71038');
INSERT INTO "content_type_opts" VALUES (32, '23', 'Mississippi', 'LicensedStates', 4, '2018-01-15 14:48:56.711746', '2018-01-15 14:48:56.711746');
INSERT INTO "content_type_opts" VALUES (33, '25', 'Montana', 'LicensedStates', 4, '2018-01-15 14:48:56.71314', '2018-01-15 14:48:56.71314');
INSERT INTO "content_type_opts" VALUES (34, '32', 'North Carolina', 'LicensedStates', 4, '2018-01-15 14:48:56.714391', '2018-01-15 14:48:56.714391');
INSERT INTO "content_type_opts" VALUES (35, '33', 'North Dakota', 'LicensedStates', 4, '2018-01-15 14:48:56.71564', '2018-01-15 14:48:56.71564');
INSERT INTO "content_type_opts" VALUES (36, '26', 'Nebraska', 'LicensedStates', 4, '2018-01-15 14:48:56.716917', '2018-01-15 14:48:56.716917');
INSERT INTO "content_type_opts" VALUES (37, '28', 'New Hampshire', 'LicensedStates', 4, '2018-01-15 14:48:56.718176', '2018-01-15 14:48:56.718176');
INSERT INTO "content_type_opts" VALUES (38, '29', 'New Jersey', 'LicensedStates', 4, '2018-01-15 14:48:56.719411', '2018-01-15 14:48:56.719411');
INSERT INTO "content_type_opts" VALUES (39, '30', 'New Mexico', 'LicensedStates', 4, '2018-01-15 14:48:56.720654', '2018-01-15 14:48:56.720654');
INSERT INTO "content_type_opts" VALUES (40, '27', 'Nevada', 'LicensedStates', 4, '2018-01-15 14:48:56.721941', '2018-01-15 14:48:56.721941');
INSERT INTO "content_type_opts" VALUES (41, '31', 'New York', 'LicensedStates', 4, '2018-01-15 14:48:56.723174', '2018-01-15 14:48:56.723174');
INSERT INTO "content_type_opts" VALUES (42, '34', 'Ohio', 'LicensedStates', 4, '2018-01-15 14:48:56.724382', '2018-01-15 14:48:56.724382');
INSERT INTO "content_type_opts" VALUES (43, '35', 'Oklahoma', 'LicensedStates', 4, '2018-01-15 14:48:56.725666', '2018-01-15 14:48:56.725666');
INSERT INTO "content_type_opts" VALUES (44, '36', 'Oregon', 'LicensedStates', 4, '2018-01-15 14:48:56.726918', '2018-01-15 14:48:56.726918');
INSERT INTO "content_type_opts" VALUES (45, '37', 'Pennsylvania', 'LicensedStates', 4, '2018-01-15 14:48:56.728097', '2018-01-15 14:48:56.728097');
INSERT INTO "content_type_opts" VALUES (46, '38', 'Rhode Island', 'LicensedStates', 4, '2018-01-15 14:48:56.729393', '2018-01-15 14:48:56.729393');
INSERT INTO "content_type_opts" VALUES (47, '39', 'South Carolina', 'LicensedStates', 4, '2018-01-15 14:48:56.730609', '2018-01-15 14:48:56.730609');
INSERT INTO "content_type_opts" VALUES (48, '40', 'South Dakota', 'LicensedStates', 4, '2018-01-15 14:48:56.731837', '2018-01-15 14:48:56.731837');
INSERT INTO "content_type_opts" VALUES (49, '41', 'Tennessee', 'LicensedStates', 4, '2018-01-15 14:48:56.733069', '2018-01-15 14:48:56.733069');
INSERT INTO "content_type_opts" VALUES (50, '42', 'Texas', 'LicensedStates', 4, '2018-01-15 14:48:56.734316', '2018-01-15 14:48:56.734316');
INSERT INTO "content_type_opts" VALUES (51, '43', 'Utah', 'LicensedStates', 4, '2018-01-15 14:48:56.735525', '2018-01-15 14:48:56.735525');
INSERT INTO "content_type_opts" VALUES (52, '45', 'Virginia', 'LicensedStates', 4, '2018-01-15 14:48:56.736741', '2018-01-15 14:48:56.736741');
INSERT INTO "content_type_opts" VALUES (53, '44', 'Vermont', 'LicensedStates', 4, '2018-01-15 14:48:56.738062', '2018-01-15 14:48:56.738062');
INSERT INTO "content_type_opts" VALUES (54, '46', 'Washington', 'LicensedStates', 4, '2018-01-15 14:48:56.739271', '2018-01-15 14:48:56.739271');
INSERT INTO "content_type_opts" VALUES (55, '48', 'Wisconsin', 'LicensedStates', 4, '2018-01-15 14:48:56.740477', '2018-01-15 14:48:56.740477');
INSERT INTO "content_type_opts" VALUES (56, '47', 'West Virginia', 'LicensedStates', 4, '2018-01-15 14:48:56.742122', '2018-01-15 14:48:56.742122');
INSERT INTO "content_type_opts" VALUES (57, '49', 'Wyoming', 'LicensedStates', 4, '2018-01-15 14:48:56.743356', '2018-01-15 14:48:56.743356');
INSERT INTO "content_type_opts" VALUES (58, '58', 'Puerto Rico', 'LicensedStates', 4, '2018-01-15 14:48:56.744586', '2018-01-15 14:48:56.744586');
INSERT INTO "content_type_opts" VALUES (59, '81', 'A F Americas', 'LicensedStates', 4, '2018-01-15 14:48:56.745799', '2018-01-15 14:48:56.745799');
INSERT INTO "content_type_opts" VALUES (60, '82', 'A F Europe', 'LicensedStates', 4, '2018-01-15 14:48:56.74704', '2018-01-15 14:48:56.74704');
INSERT INTO "content_type_opts" VALUES (61, '83', 'A F Pacific', 'LicensedStates', 4, '2018-01-15 14:48:56.748294', '2018-01-15 14:48:56.748294');
INSERT INTO "content_type_opts" VALUES (62, '84', 'American Samoa', 'LicensedStates', 4, '2018-01-15 14:48:56.749563', '2018-01-15 14:48:56.749563');
INSERT INTO "content_type_opts" VALUES (63, '85', 'Micronesia', 'LicensedStates', 4, '2018-01-15 14:48:56.750806', '2018-01-15 14:48:56.750806');
INSERT INTO "content_type_opts" VALUES (64, '86', 'Guam', 'LicensedStates', 4, '2018-01-15 14:48:56.752012', '2018-01-15 14:48:56.752012');
INSERT INTO "content_type_opts" VALUES (65, '87', 'Marshall Isl', 'LicensedStates', 4, '2018-01-15 14:48:56.753293', '2018-01-15 14:48:56.753293');
INSERT INTO "content_type_opts" VALUES (66, '88', 'N Mariana Isl', 'LicensedStates', 4, '2018-01-15 14:48:56.7545', '2018-01-15 14:48:56.7545');
INSERT INTO "content_type_opts" VALUES (67, '89', 'Palau', 'LicensedStates', 4, '2018-01-15 14:48:56.755737', '2018-01-15 14:48:56.755737');
INSERT INTO "content_type_opts" VALUES (68, '99', 'Not Found', 'LicensedStates', 4, '2018-01-15 14:48:56.756964', '2018-01-15 14:48:56.756964');
INSERT INTO "content_type_opts" VALUES (69, '*.pdf', 'Document store Project Status Report Document Type ID', 'Activity', 5, '2018-01-15 14:48:56.768002', '2018-01-15 14:48:56.768002');
INSERT INTO "content_type_opts" VALUES (70, '*.png', 'Project Related by Document Type PNG', 'FileDownload', 6, '2018-01-15 14:48:56.779141', '2018-01-15 14:48:56.779141');
INSERT INTO "content_type_opts" VALUES (71, '*.jpg', 'Project Related by Document Type JPEG', 'FileDownload', 6, '2018-01-15 14:48:56.780615', '2018-01-15 14:48:56.780615');
INSERT INTO "content_type_opts" VALUES (72, '*.pdf', 'Project Related by Document Type PDF', 'FileDownload', 6, '2018-01-15 14:48:56.782018', '2018-01-15 14:48:56.782018');
INSERT INTO "content_type_opts" VALUES (73, '*.log', 'Project Related by Document Type LOG', 'FileDownload', 6, '2018-01-15 14:48:56.783395', '2018-01-15 14:48:56.783395');


--
-- TOC entry 2327 (class 0 OID 19484)
-- Dependencies: 209
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--
--
-- INSERT INTO "schema_migrations" VALUES ('20181021035542');
--


--
-- TOC entry 2318 (class 0 OID 19391)
-- Dependencies: 200
-- Data for Name: topic_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "topic_types" VALUES (1, 'Branch', 'Branch Actions for a specific branch', 'N', '2018-01-15 14:48:56.810891', '2018-01-15 14:48:56.810891');
INSERT INTO "topic_types" VALUES (2, 'Partner', 'This Corporate Account', 'N', '2018-01-15 14:48:56.867125', '2018-01-15 14:48:56.867125');
INSERT INTO "topic_types" VALUES (3, 'UserGroups', 'Shared access to project working files', 'N', '2018-01-15 14:48:56.879029', '2018-01-15 14:48:56.879029');

--
-- TOC entry 2316 (class 0 OID 19379)
-- Dependencies: 198
-- Data for Name: topic_type_opts; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "topic_type_opts" VALUES (1, '0034', 'South Branch Number', 'Branch', 1, '2018-01-15 14:48:56.832886', '2018-01-15 14:48:56.832886');
INSERT INTO "topic_type_opts" VALUES (2, '0037', 'North Branch Number', 'Branch', 1, '2018-01-15 14:48:56.841878', '2018-01-15 14:48:56.841878');
INSERT INTO "topic_type_opts" VALUES (3, '0040', 'West Branch Number', 'Branch', 1, '2018-01-15 14:48:56.843733', '2018-01-15 14:48:56.843733');
INSERT INTO "topic_type_opts" VALUES (4, '0099', 'Skoona Consulting', 'Partner', 2, '2018-01-15 14:48:56.869', '2018-01-15 14:48:56.869');
INSERT INTO "topic_type_opts" VALUES (5, 'Manager', 'Project Workfiles', 'UserGroups', 3, '2018-01-15 14:48:56.880482', '2018-01-15 14:48:56.880482');
INSERT INTO "topic_type_opts" VALUES (6, 'EmployeePrimary', 'Project Workfiles', 'UserGroups', 3, '2018-01-15 14:48:56.882096', '2018-01-15 14:48:56.882096');
INSERT INTO "topic_type_opts" VALUES (7, 'EmployeeSecondary', 'Project Workfiles', 'UserGroups', 3, '2018-01-15 14:48:56.883518', '2018-01-15 14:48:56.883518');
INSERT INTO "topic_type_opts" VALUES (8, 'VendorPrimary', 'Project Workfiles', 'UserGroups', 3, '2018-01-15 14:48:56.884897', '2018-01-15 14:48:56.884897');
INSERT INTO "topic_type_opts" VALUES (9, 'VendorSecondary', 'Project Workfiles', 'UserGroups', 3, '2018-01-15 14:48:56.886238', '2018-01-15 14:48:56.886238');
INSERT INTO "topic_type_opts" VALUES (10, 'BranchPrimary', 'Project Workfiles', 'UserGroups', 3, '2018-01-15 14:48:56.887619', '2018-01-15 14:48:56.887619');
INSERT INTO "topic_type_opts" VALUES (11, 'BranchSecondary', 'Project Workfiles', 'UserGroups', 3, '2018-01-15 14:48:56.888974', '2018-01-15 14:48:56.888974');
INSERT INTO "topic_type_opts" VALUES (12, 'Developer', 'Project Workfiles', 'UserGroups', 3, '2018-01-15 14:48:56.890335', '2018-01-15 14:48:56.890335');


--
-- TOC entry 2320 (class 0 OID 19402)
-- Dependencies: 202
-- Data for Name: user_group_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "user_group_roles" VALUES (1, 'Developer', 'Open Source Independent Consultancy', 'Skoona Consulting', '2018-01-15 14:48:54.638795', '2018-01-15 14:48:54.638795');
INSERT INTO "user_group_roles" VALUES (2, 'Manager', 'Corporate Managers', 'Corporate Manager', '2018-01-15 14:48:54.685189', '2018-01-15 14:48:54.685189');
INSERT INTO "user_group_roles" VALUES (3, 'EmployeePrimary', 'Department Manager', 'Department Manager', '2018-01-15 14:48:54.718401', '2018-01-15 14:48:54.718401');
INSERT INTO "user_group_roles" VALUES (4, 'EmployeeSecondary', 'Corporate Staff', 'Corporate Staff', '2018-01-15 14:48:54.726185', '2018-01-15 14:48:54.726185');
INSERT INTO "user_group_roles" VALUES (5, 'BranchPrimary', 'Branch Manager', 'Branch Admin', '2018-01-15 14:48:54.734131', '2018-01-15 14:48:54.734131');
INSERT INTO "user_group_roles" VALUES (6, 'BranchSecondary', 'Branch Staff', 'Branch Staff', '2018-01-15 14:48:54.742769', '2018-01-15 14:48:54.742769');
INSERT INTO "user_group_roles" VALUES (7, 'VendorPrimary', 'Partner Manager', 'Partner Admin', '2018-01-15 14:48:54.750934', '2018-01-15 14:48:54.750934');
INSERT INTO "user_group_roles" VALUES (8, 'VendorSecondary', 'Partner Staff', 'Partner Staff', '2018-01-15 14:48:54.758923', '2018-01-15 14:48:54.758923');



--
-- TOC entry 2324 (class 0 OID 19424)
-- Dependencies: 206
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "user_roles" VALUES (1, 'Services.Action.Admin', 'Employee Managers', '2018-01-15 14:48:54.294171', '2018-01-15 14:48:54.294171');
INSERT INTO "user_roles" VALUES (2, 'Services.Action.Primary', 'Branch Managers', '2018-01-15 14:48:54.3507', '2018-01-15 14:48:54.3507');
INSERT INTO "user_roles" VALUES (3, 'Services.Action.Developer', 'Super User or Developer', '2018-01-15 14:48:54.400687', '2018-01-15 14:48:54.400687');
INSERT INTO "user_roles" VALUES (4, 'Services.Branch.Commission.Access', 'Access Branch Commission Statements', '2018-01-15 14:48:54.41792', '2018-01-15 14:48:54.41792');
INSERT INTO "user_roles" VALUES (5, 'Services.Branch.Experience.Access', 'Access Branch Experience Report', '2018-01-15 14:48:54.425887', '2018-01-15 14:48:54.425887');
INSERT INTO "user_roles" VALUES (6, 'Services.Branch.Notification.Access', 'Access Branch Notification Mailings', '2018-01-15 14:48:54.434019', '2018-01-15 14:48:54.434019');
INSERT INTO "user_roles" VALUES (7, 'Services.Branch.LicensedStates.Access', 'Access Branch Licensed USA States', '2018-01-15 14:48:54.442468', '2018-01-15 14:48:54.442468');
INSERT INTO "user_roles" VALUES (8, 'Services.UserGroups.FileDownload.Access', 'Access Shared UserGroup Resources', '2018-01-15 14:48:54.4922', '2018-01-15 14:48:54.4922');
INSERT INTO "user_roles" VALUES (9, 'Services.Partner.Activity.Access', 'Access Partner Project Resources', '2018-01-15 14:48:54.525497', '2018-01-15 14:48:54.525497');
INSERT INTO "user_roles" VALUES (10, 'Services.Action.ResetPassword', 'Reset Forgotten Password via EMail', '2018-01-15 14:48:54.568151', '2018-01-15 14:48:54.568151');
INSERT INTO "user_roles" VALUES (11, 'Services.Action.Use.ContentProfile', 'Consumer of Authorization Content Profile', '2018-01-15 14:48:54.576063', '2018-01-15 14:48:54.576063');
INSERT INTO "user_roles" VALUES (12, 'Services.Action.Use.UserRecords', 'Consumer of User Records', '2018-01-15 14:48:54.584343', '2018-01-15 14:48:54.584343');
INSERT INTO "user_roles" VALUES (13, 'Services.UserGroups.Admin.FileDownload', 'Administer Datafile Downloads', '2018-01-15 14:48:54.592661', '2018-01-15 14:48:54.592661');
INSERT INTO "user_roles" VALUES (14, 'Services.UserGroups.Use.FileDownload', 'Consumer of Datafile Downloads', '2018-01-15 14:48:54.601042', '2018-01-15 14:48:54.601042');
INSERT INTO "user_roles" VALUES (15, 'Services.Action.Admin.ContentProfile', 'Administer Authorization Content Profile', '2018-01-15 14:48:54.608944', '2018-01-15 14:48:54.608944');
INSERT INTO "user_roles" VALUES (16, 'Services.Action.Admin.UserRecords', 'Administer User Records', '2018-01-15 14:48:54.617721', '2018-01-15 14:48:54.617721');


--
-- TOC entry 2322 (class 0 OID 19414)
-- Dependencies: 204
-- Data for Name: user_group_roles_user_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "user_group_roles_user_roles" VALUES (1, 1, 1);
INSERT INTO "user_group_roles_user_roles" VALUES (2, 1, 2);
INSERT INTO "user_group_roles_user_roles" VALUES (3, 1, 3);
INSERT INTO "user_group_roles_user_roles" VALUES (4, 1, 4);
INSERT INTO "user_group_roles_user_roles" VALUES (5, 1, 5);
INSERT INTO "user_group_roles_user_roles" VALUES (6, 1, 6);
INSERT INTO "user_group_roles_user_roles" VALUES (7, 1, 7);
INSERT INTO "user_group_roles_user_roles" VALUES (8, 1, 8);
INSERT INTO "user_group_roles_user_roles" VALUES (9, 1, 9);
INSERT INTO "user_group_roles_user_roles" VALUES (10, 1, 10);
INSERT INTO "user_group_roles_user_roles" VALUES (11, 1, 11);
INSERT INTO "user_group_roles_user_roles" VALUES (12, 1, 12);
INSERT INTO "user_group_roles_user_roles" VALUES (13, 1, 13);
INSERT INTO "user_group_roles_user_roles" VALUES (14, 1, 14);
INSERT INTO "user_group_roles_user_roles" VALUES (15, 1, 15);
INSERT INTO "user_group_roles_user_roles" VALUES (16, 1, 16);
INSERT INTO "user_group_roles_user_roles" VALUES (17, 2, 1);
INSERT INTO "user_group_roles_user_roles" VALUES (18, 2, 2);
INSERT INTO "user_group_roles_user_roles" VALUES (19, 2, 3);
INSERT INTO "user_group_roles_user_roles" VALUES (20, 2, 4);
INSERT INTO "user_group_roles_user_roles" VALUES (21, 2, 5);
INSERT INTO "user_group_roles_user_roles" VALUES (22, 2, 6);
INSERT INTO "user_group_roles_user_roles" VALUES (23, 2, 7);
INSERT INTO "user_group_roles_user_roles" VALUES (24, 2, 8);
INSERT INTO "user_group_roles_user_roles" VALUES (25, 2, 9);
INSERT INTO "user_group_roles_user_roles" VALUES (26, 2, 10);
INSERT INTO "user_group_roles_user_roles" VALUES (27, 2, 11);
INSERT INTO "user_group_roles_user_roles" VALUES (28, 2, 12);
INSERT INTO "user_group_roles_user_roles" VALUES (29, 2, 13);
INSERT INTO "user_group_roles_user_roles" VALUES (30, 2, 14);
INSERT INTO "user_group_roles_user_roles" VALUES (31, 2, 15);
INSERT INTO "user_group_roles_user_roles" VALUES (32, 2, 16);
INSERT INTO "user_group_roles_user_roles" VALUES (33, 3, 1);
INSERT INTO "user_group_roles_user_roles" VALUES (34, 3, 2);
INSERT INTO "user_group_roles_user_roles" VALUES (35, 3, 3);
INSERT INTO "user_group_roles_user_roles" VALUES (36, 3, 4);
INSERT INTO "user_group_roles_user_roles" VALUES (37, 3, 5);
INSERT INTO "user_group_roles_user_roles" VALUES (38, 3, 6);
INSERT INTO "user_group_roles_user_roles" VALUES (39, 3, 7);
INSERT INTO "user_group_roles_user_roles" VALUES (40, 3, 8);
INSERT INTO "user_group_roles_user_roles" VALUES (41, 3, 9);
INSERT INTO "user_group_roles_user_roles" VALUES (42, 3, 10);
INSERT INTO "user_group_roles_user_roles" VALUES (43, 3, 11);
INSERT INTO "user_group_roles_user_roles" VALUES (44, 3, 12);
INSERT INTO "user_group_roles_user_roles" VALUES (45, 3, 13);
INSERT INTO "user_group_roles_user_roles" VALUES (46, 3, 15);
INSERT INTO "user_group_roles_user_roles" VALUES (47, 3, 16);
INSERT INTO "user_group_roles_user_roles" VALUES (48, 4, 4);
INSERT INTO "user_group_roles_user_roles" VALUES (49, 4, 5);
INSERT INTO "user_group_roles_user_roles" VALUES (50, 4, 6);
INSERT INTO "user_group_roles_user_roles" VALUES (51, 4, 7);
INSERT INTO "user_group_roles_user_roles" VALUES (52, 4, 8);
INSERT INTO "user_group_roles_user_roles" VALUES (53, 4, 9);
INSERT INTO "user_group_roles_user_roles" VALUES (54, 4, 10);
INSERT INTO "user_group_roles_user_roles" VALUES (55, 4, 11);
INSERT INTO "user_group_roles_user_roles" VALUES (56, 4, 12);
INSERT INTO "user_group_roles_user_roles" VALUES (57, 4, 14);
INSERT INTO "user_group_roles_user_roles" VALUES (58, 4, 16);
INSERT INTO "user_group_roles_user_roles" VALUES (59, 5, 4);
INSERT INTO "user_group_roles_user_roles" VALUES (60, 5, 5);
INSERT INTO "user_group_roles_user_roles" VALUES (61, 5, 6);
INSERT INTO "user_group_roles_user_roles" VALUES (62, 5, 7);
INSERT INTO "user_group_roles_user_roles" VALUES (63, 5, 8);
INSERT INTO "user_group_roles_user_roles" VALUES (64, 5, 9);
INSERT INTO "user_group_roles_user_roles" VALUES (65, 5, 10);
INSERT INTO "user_group_roles_user_roles" VALUES (66, 5, 11);
INSERT INTO "user_group_roles_user_roles" VALUES (67, 5, 12);
INSERT INTO "user_group_roles_user_roles" VALUES (68, 5, 14);
INSERT INTO "user_group_roles_user_roles" VALUES (69, 5, 16);
INSERT INTO "user_group_roles_user_roles" VALUES (70, 6, 4);
INSERT INTO "user_group_roles_user_roles" VALUES (71, 6, 5);
INSERT INTO "user_group_roles_user_roles" VALUES (72, 6, 6);
INSERT INTO "user_group_roles_user_roles" VALUES (73, 6, 7);
INSERT INTO "user_group_roles_user_roles" VALUES (74, 6, 8);
INSERT INTO "user_group_roles_user_roles" VALUES (75, 6, 9);
INSERT INTO "user_group_roles_user_roles" VALUES (76, 6, 10);
INSERT INTO "user_group_roles_user_roles" VALUES (77, 6, 11);
INSERT INTO "user_group_roles_user_roles" VALUES (78, 6, 12);
INSERT INTO "user_group_roles_user_roles" VALUES (79, 6, 14);
INSERT INTO "user_group_roles_user_roles" VALUES (80, 7, 8);
INSERT INTO "user_group_roles_user_roles" VALUES (81, 7, 9);
INSERT INTO "user_group_roles_user_roles" VALUES (82, 7, 10);
INSERT INTO "user_group_roles_user_roles" VALUES (83, 7, 11);
INSERT INTO "user_group_roles_user_roles" VALUES (84, 7, 12);
INSERT INTO "user_group_roles_user_roles" VALUES (85, 7, 14);
INSERT INTO "user_group_roles_user_roles" VALUES (86, 8, 8);
INSERT INTO "user_group_roles_user_roles" VALUES (87, 8, 9);
INSERT INTO "user_group_roles_user_roles" VALUES (88, 8, 10);
INSERT INTO "user_group_roles_user_roles" VALUES (89, 8, 11);
INSERT INTO "user_group_roles_user_roles" VALUES (90, 8, 12);
INSERT INTO "user_group_roles_user_roles" VALUES (91, 8, 14);

--
-- TOC entry 2326 (class 0 OID 19436)
-- Dependencies: 208
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO "users" VALUES (1, 'developer', 'Skoona Developer', 'skoona@gmail.com', '$2a$10$whtSKC3/kypGUbIGNZqUgOQjqpWVH1.n3Qrk3V6gKRvWF3S/LFuOa', '8K6cWuT7VgdbI9pG47iT9Q', NULL, NULL, '---
- Developer
', NULL, true, NULL, '2018-01-15 14:48:55.418879', '2018-01-15 14:48:55.418879', '8e07bebf8050de449c73a37d2aca7cfd', '---
- Services.Action.Developer
', '$2a$07$mvFLCrhxofEZOkJu8oIJa.HZV4LpeQNqtPLhu14/4UUBilg1/c0RS', '---
- Developer
- ''0034''
- ''0037''
- ''0040''
- ''0099''
');
INSERT INTO "users" VALUES (2, 'emtester', 'Department Manager', 'systems@skoona.net', '$2a$10$rc1NzoFxFT42GkwyFkyqmeJQkZ5h2ak6w0hoEaMoY.Tga4WAO2/PC', 'b2m4Sg67ClSRPl9Csr4Nmg', NULL, NULL, '---
- Manager
', NULL, true, NULL, '2018-01-15 14:48:55.593552', '2018-01-15 14:48:55.593552', 'd400080cff7114d42c4e750f07eaba5d', '---
- Services.Action.Admin
', '$2a$07$r0cDJxp5DQGU6OsHFOF9R.RdvRqMqP1Z9UiHTUscRZf4vt0llpcjG', '---
- Manager
- ''0034''
- ''0037''
- ''0040''
- ''0099''
');
INSERT INTO "users" VALUES (3, 'eptester', 'Employee Primary User', 'appdev@localhost.com', '$2a$10$OdNcJNQA5M.M0dOXEyko9uUae6xEZlNR5JViDw0rp2Mkw7kDBoj6q', 'nVjI4IPD3bQzZCWDVk-PrA', NULL, NULL, '---
- EmployeePrimary
', NULL, true, NULL, '2018-01-15 14:48:55.693337', '2018-01-15 14:48:55.693337', 'c96b013427bf3220f4ad6f32a17f5692', '---
- Services.Action.Admin
', '$2a$07$b8ZkcG0CzI8tU0Xn3dW3WuXtLVW4IUktT4Tnjnb7R477HyInTzyyi', '---
- EmployeePrimary
- ''0034''
- ''0037''
- ''0040''
- ''0099''
');
INSERT INTO "users" VALUES (4, 'estester', 'Employee Secondary User', 'appdev1@localhost.com', '$2a$10$ogHFpVNVmWWIIG2CEkNpEuAo2uZD0m01zlVEodeq2llicfb3mJcty', '35eFxY4lDZSmdoDF0I_07w', NULL, NULL, '---
- EmployeeSecondary
', NULL, true, NULL, '2018-01-15 14:48:55.793142', '2018-01-15 14:48:55.793142', 'a1efb66f26e07a94dd893c085823f2ad', NULL, '$2a$07$Ual2Sr7SRT95QQ8tu0pKwuryjTVwyOGNPnzA0q78DV/iKXOoynOLW', '---
- EmployeeSecondary
- ''0037''
- ''0099''
');
INSERT INTO "users" VALUES (5, 'bptester', 'Branch Primary User', 'appdev2@localhost.com', '$2a$10$.ELflYtDfBO.J447.EVW0e1yK1pgo42RO26N2Ua8y6Aw6xbkZCB6e', 'FLjNT_U5vVdomduyoK0Z5w', NULL, NULL, '---
- BranchPrimary
', NULL, true, NULL, '2018-01-15 14:48:55.892374', '2018-01-15 14:48:55.892374', '5f8bcc3f52726f79f204322fb190f862', '---
- Services.Action.Primary
', '$2a$07$qhPXGym7HOMYLYzwJ6ql1Ojh9iFPLKYhsGVyaV1kVAVB2F813W98S', '---
- BranchPrimary
- ''0034''
- ''0037''
- ''0040''
- ''0099''
');
INSERT INTO "users" VALUES (6, 'bstester', 'Branch Secondary User', 'appdev3@localhost.com', '$2a$10$tXdr7fwISyTNVfpR8L8hFez/L2z4Gsr/r4BQZVPIssjhHVzoKNEQC', 'kgBfWQm20arQrsgHQXPTSg', NULL, NULL, '---
- BranchSecondary
', NULL, true, NULL, '2018-01-15 14:48:55.987418', '2018-01-15 14:48:55.987418', '2adf06b81402f8813ce660f6ed234835', NULL, '$2a$07$N6Gk7XLk/eXIbZ7pwHkju.mqwVCFRNJ8XKHiT4LC1MB1m9s7pqqoG', '---
- BranchSecondary
- ''0037''
- ''0099''
');
INSERT INTO "users" VALUES (7, 'bnptester', 'Branch No Privileges User', 'appdev6@localhost.com', '$2a$10$AMlaks012ozRNXci2zADSeeHBxZfq3jorsTlrI4D6hwsAAdpsXdMe', 'B4mGehdj2eDuqYkpsnwaEQ', NULL, NULL, '---
- BranchSecondary
', NULL, true, NULL, '2018-01-15 14:48:56.089894', '2018-01-15 14:48:56.089894', 'bba058c5a39ee1e4c0974a8427e2ce75', NULL, '$2a$07$N4xp6ZszEI9EcynAewAxOOGL/fMHMjOPLvpxlSoJF11MnTC8db77u', NULL);
INSERT INTO "users" VALUES (8, 'vptester', 'Vendor Primary User', 'appdev4@localhost.com', '$2a$10$kZHB6IznP7CRkCWsmQulne1j6XXRvDZOPbDhEJvG5uIQcCEsH5LZG', 'gjoHpnv8t9JXdrLK16KTZw', NULL, NULL, '---
- VendorPrimary
', NULL, true, NULL, '2018-01-15 14:48:56.179344', '2018-01-15 14:48:56.179344', '80a8da39842673963d7714f524fbc454', NULL, '$2a$07$QHyto595LX.C5TnNSf1KaO/QT0oDHt/NB/TVy86/qfpU0gG97AybK', '---
- VendorPrimary
- ''0099''
');
INSERT INTO "users" VALUES (9, 'vstester', 'Vendor Secondary User', 'appdev5@localhost.com', '$2a$10$YvnEOhujt1fdRyldIwPAXePcmXIrLQoeDmgQ1lXoowAJB9N7DWDyO', 'RxK8JznlBcavHsQCa7-uIA', NULL, NULL, '---
- VendorSecondary
', NULL, true, NULL, '2018-01-15 14:48:56.270727', '2018-01-15 14:48:56.270727', '5062a2aaafd465bb3fb8dde904608a38', NULL, '$2a$07$7q6cfgsnY48gW/eeiiWQqO4STL50aln/tVgz9Q2QmuO/34frAiW9m', '---
- VendorSecondary
- ''0099''
');


--
-- TOC entry 2348 (class 0 OID 0)
-- Dependencies: 185
-- Name: content_profile_entries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"content_profile_entries_id_seq"', 57, true);


--
-- TOC entry 2349 (class 0 OID 0)
-- Dependencies: 189
-- Name: content_profiles_entries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"content_profiles_entries_id_seq"', 91, true);


--
-- TOC entry 2350 (class 0 OID 0)
-- Dependencies: 187
-- Name: content_profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"content_profiles_id_seq"', 7, true);


--
-- TOC entry 2351 (class 0 OID 0)
-- Dependencies: 191
-- Name: content_type_opts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"content_type_opts_id_seq"', 73, true);


--
-- TOC entry 2352 (class 0 OID 0)
-- Dependencies: 193
-- Name: content_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"content_types_id_seq"', 6, true);


--
-- TOC entry 2353 (class 0 OID 0)
-- Dependencies: 195
-- Name: profile_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"profile_types_id_seq"', 8, true);


--
-- TOC entry 2354 (class 0 OID 0)
-- Dependencies: 197
-- Name: topic_type_opts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"topic_type_opts_id_seq"', 12, true);


--
-- TOC entry 2355 (class 0 OID 0)
-- Dependencies: 199
-- Name: topic_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"topic_types_id_seq"', 3, true);


--
-- TOC entry 2356 (class 0 OID 0)
-- Dependencies: 201
-- Name: user_group_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"user_group_roles_id_seq"', 8, true);


--
-- TOC entry 2357 (class 0 OID 0)
-- Dependencies: 203
-- Name: user_group_roles_user_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"user_group_roles_user_roles_id_seq"', 91, true);


--
-- TOC entry 2358 (class 0 OID 0)
-- Dependencies: 205
-- Name: user_roles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"user_roles_id_seq"', 16, true);


--
-- TOC entry 2359 (class 0 OID 0)
-- Dependencies: 207
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"users_id_seq"', 9, true);


-- Completed on 2018-10-14 22:17:06 EDT

--
-- PostgreSQL database Seed complete
--

