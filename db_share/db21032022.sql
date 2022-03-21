--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2 (Ubuntu 14.2-1.pgdg20.04+1)
-- Dumped by pg_dump version 14.2 (Ubuntu 14.2-1.pgdg20.04+1)

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
-- Name: account_emailaddress; Type: TABLE; Schema: public; Owner: avdhari
--

CREATE TABLE public.account_emailaddress (
    id integer NOT NULL,
    email character varying(254) NOT NULL,
    verified boolean NOT NULL,
    "primary" boolean NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.account_emailaddress OWNER TO avdhari;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE; Schema: public; Owner: avdhari
--

CREATE SEQUENCE public.account_emailaddress_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailaddress_id_seq OWNER TO avdhari;

--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: avdhari
--

ALTER SEQUENCE public.account_emailaddress_id_seq OWNED BY public.account_emailaddress.id;


--
-- Name: account_emailconfirmation; Type: TABLE; Schema: public; Owner: avdhari
--

CREATE TABLE public.account_emailconfirmation (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    sent timestamp with time zone,
    key character varying(64) NOT NULL,
    email_address_id integer NOT NULL
);


ALTER TABLE public.account_emailconfirmation OWNER TO avdhari;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE; Schema: public; Owner: avdhari
--

CREATE SEQUENCE public.account_emailconfirmation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.account_emailconfirmation_id_seq OWNER TO avdhari;

--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: avdhari
--

ALTER SEQUENCE public.account_emailconfirmation_id_seq OWNED BY public.account_emailconfirmation.id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: avdhari
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO avdhari;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: avdhari
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO avdhari;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: avdhari
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: avdhari
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO avdhari;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: avdhari
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO avdhari;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: avdhari
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: avdhari
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO avdhari;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: avdhari
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO avdhari;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: avdhari
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: avdhari
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO avdhari;

--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: avdhari
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO avdhari;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: avdhari
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO avdhari;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: avdhari
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: avdhari
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO avdhari;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: avdhari
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO avdhari;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: avdhari
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: avdhari
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO avdhari;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: avdhari
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO avdhari;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: avdhari
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: avdhari
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO avdhari;

--
-- Name: django_site; Type: TABLE; Schema: public; Owner: avdhari
--

CREATE TABLE public.django_site (
    id integer NOT NULL,
    domain character varying(100) NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.django_site OWNER TO avdhari;

--
-- Name: django_site_id_seq; Type: SEQUENCE; Schema: public; Owner: avdhari
--

CREATE SEQUENCE public.django_site_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_site_id_seq OWNER TO avdhari;

--
-- Name: django_site_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: avdhari
--

ALTER SEQUENCE public.django_site_id_seq OWNED BY public.django_site.id;


--
-- Name: socialaccount_socialaccount; Type: TABLE; Schema: public; Owner: avdhari
--

CREATE TABLE public.socialaccount_socialaccount (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    uid character varying(191) NOT NULL,
    last_login timestamp with time zone NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    extra_data text NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialaccount OWNER TO avdhari;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE; Schema: public; Owner: avdhari
--

CREATE SEQUENCE public.socialaccount_socialaccount_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialaccount_id_seq OWNER TO avdhari;

--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: avdhari
--

ALTER SEQUENCE public.socialaccount_socialaccount_id_seq OWNED BY public.socialaccount_socialaccount.id;


--
-- Name: socialaccount_socialapp; Type: TABLE; Schema: public; Owner: avdhari
--

CREATE TABLE public.socialaccount_socialapp (
    id integer NOT NULL,
    provider character varying(30) NOT NULL,
    name character varying(40) NOT NULL,
    client_id character varying(191) NOT NULL,
    secret character varying(191) NOT NULL,
    key character varying(191) NOT NULL
);


ALTER TABLE public.socialaccount_socialapp OWNER TO avdhari;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE; Schema: public; Owner: avdhari
--

CREATE SEQUENCE public.socialaccount_socialapp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_id_seq OWNER TO avdhari;

--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: avdhari
--

ALTER SEQUENCE public.socialaccount_socialapp_id_seq OWNED BY public.socialaccount_socialapp.id;


--
-- Name: socialaccount_socialapp_sites; Type: TABLE; Schema: public; Owner: avdhari
--

CREATE TABLE public.socialaccount_socialapp_sites (
    id integer NOT NULL,
    socialapp_id integer NOT NULL,
    site_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialapp_sites OWNER TO avdhari;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE; Schema: public; Owner: avdhari
--

CREATE SEQUENCE public.socialaccount_socialapp_sites_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialapp_sites_id_seq OWNER TO avdhari;

--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: avdhari
--

ALTER SEQUENCE public.socialaccount_socialapp_sites_id_seq OWNED BY public.socialaccount_socialapp_sites.id;


--
-- Name: socialaccount_socialtoken; Type: TABLE; Schema: public; Owner: avdhari
--

CREATE TABLE public.socialaccount_socialtoken (
    id integer NOT NULL,
    token text NOT NULL,
    token_secret text NOT NULL,
    expires_at timestamp with time zone,
    account_id integer NOT NULL,
    app_id integer NOT NULL
);


ALTER TABLE public.socialaccount_socialtoken OWNER TO avdhari;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE; Schema: public; Owner: avdhari
--

CREATE SEQUENCE public.socialaccount_socialtoken_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.socialaccount_socialtoken_id_seq OWNER TO avdhari;

--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: avdhari
--

ALTER SEQUENCE public.socialaccount_socialtoken_id_seq OWNED BY public.socialaccount_socialtoken.id;


--
-- Name: users_company; Type: TABLE; Schema: public; Owner: avdhari
--

CREATE TABLE public.users_company (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    site_url character varying(200) NOT NULL,
    contact_mail character varying(254) NOT NULL,
    admin_mail character varying(254) NOT NULL,
    is_paid boolean NOT NULL,
    expires_on timestamp with time zone,
    company_admin_id integer NOT NULL,
    created_by_id integer,
    is_removed boolean NOT NULL
);


ALTER TABLE public.users_company OWNER TO avdhari;

--
-- Name: users_company_id_seq; Type: SEQUENCE; Schema: public; Owner: avdhari
--

CREATE SEQUENCE public.users_company_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_company_id_seq OWNER TO avdhari;

--
-- Name: users_company_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: avdhari
--

ALTER SEQUENCE public.users_company_id_seq OWNED BY public.users_company.id;


--
-- Name: users_companyadmin; Type: TABLE; Schema: public; Owner: avdhari
--

CREATE TABLE public.users_companyadmin (
    id integer NOT NULL,
    name character varying(200) NOT NULL,
    mail character varying(254) NOT NULL,
    company_mail character varying(254) NOT NULL,
    company_owned_id integer,
    is_removed boolean NOT NULL
);


ALTER TABLE public.users_companyadmin OWNER TO avdhari;

--
-- Name: users_companyadmin_id_seq; Type: SEQUENCE; Schema: public; Owner: avdhari
--

CREATE SEQUENCE public.users_companyadmin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_companyadmin_id_seq OWNER TO avdhari;

--
-- Name: users_companyadmin_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: avdhari
--

ALTER SEQUENCE public.users_companyadmin_id_seq OWNED BY public.users_companyadmin.id;


--
-- Name: users_product; Type: TABLE; Schema: public; Owner: avdhari
--

CREATE TABLE public.users_product (
    id integer NOT NULL,
    is_removed boolean NOT NULL,
    name character varying(255) NOT NULL,
    description text,
    product_site_url character varying(200),
    keywords text,
    company_id integer
);


ALTER TABLE public.users_product OWNER TO avdhari;

--
-- Name: users_product_id_seq; Type: SEQUENCE; Schema: public; Owner: avdhari
--

CREATE SEQUENCE public.users_product_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_product_id_seq OWNER TO avdhari;

--
-- Name: users_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: avdhari
--

ALTER SEQUENCE public.users_product_id_seq OWNED BY public.users_product.id;


--
-- Name: users_user; Type: TABLE; Schema: public; Owner: avdhari
--

CREATE TABLE public.users_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL,
    name character varying(255) NOT NULL,
    company_id integer,
    company_mail character varying(254),
    is_company_admin boolean NOT NULL,
    phone character varying(12)
);


ALTER TABLE public.users_user OWNER TO avdhari;

--
-- Name: users_user_groups; Type: TABLE; Schema: public; Owner: avdhari
--

CREATE TABLE public.users_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.users_user_groups OWNER TO avdhari;

--
-- Name: users_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: avdhari
--

CREATE SEQUENCE public.users_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_groups_id_seq OWNER TO avdhari;

--
-- Name: users_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: avdhari
--

ALTER SEQUENCE public.users_user_groups_id_seq OWNED BY public.users_user_groups.id;


--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: avdhari
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO avdhari;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: avdhari
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users_user.id;


--
-- Name: users_user_user_permissions; Type: TABLE; Schema: public; Owner: avdhari
--

CREATE TABLE public.users_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.users_user_user_permissions OWNER TO avdhari;

--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: avdhari
--

CREATE SEQUENCE public.users_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_user_permissions_id_seq OWNER TO avdhari;

--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: avdhari
--

ALTER SEQUENCE public.users_user_user_permissions_id_seq OWNED BY public.users_user_user_permissions.id;


--
-- Name: account_emailaddress id; Type: DEFAULT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.account_emailaddress ALTER COLUMN id SET DEFAULT nextval('public.account_emailaddress_id_seq'::regclass);


--
-- Name: account_emailconfirmation id; Type: DEFAULT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.account_emailconfirmation ALTER COLUMN id SET DEFAULT nextval('public.account_emailconfirmation_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: django_site id; Type: DEFAULT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.django_site ALTER COLUMN id SET DEFAULT nextval('public.django_site_id_seq'::regclass);


--
-- Name: socialaccount_socialaccount id; Type: DEFAULT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.socialaccount_socialaccount ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialaccount_id_seq'::regclass);


--
-- Name: socialaccount_socialapp id; Type: DEFAULT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.socialaccount_socialapp ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_id_seq'::regclass);


--
-- Name: socialaccount_socialapp_sites id; Type: DEFAULT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialapp_sites_id_seq'::regclass);


--
-- Name: socialaccount_socialtoken id; Type: DEFAULT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.socialaccount_socialtoken ALTER COLUMN id SET DEFAULT nextval('public.socialaccount_socialtoken_id_seq'::regclass);


--
-- Name: users_company id; Type: DEFAULT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.users_company ALTER COLUMN id SET DEFAULT nextval('public.users_company_id_seq'::regclass);


--
-- Name: users_companyadmin id; Type: DEFAULT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.users_companyadmin ALTER COLUMN id SET DEFAULT nextval('public.users_companyadmin_id_seq'::regclass);


--
-- Name: users_product id; Type: DEFAULT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.users_product ALTER COLUMN id SET DEFAULT nextval('public.users_product_id_seq'::regclass);


--
-- Name: users_user id; Type: DEFAULT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.users_user ALTER COLUMN id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Name: users_user_groups id; Type: DEFAULT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.users_user_groups ALTER COLUMN id SET DEFAULT nextval('public.users_user_groups_id_seq'::regclass);


--
-- Name: users_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.users_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.users_user_user_permissions_id_seq'::regclass);


--
-- Data for Name: account_emailaddress; Type: TABLE DATA; Schema: public; Owner: avdhari
--

COPY public.account_emailaddress (id, email, verified, "primary", user_id) FROM stdin;
1	avd@h.com	f	f	1
\.


--
-- Data for Name: account_emailconfirmation; Type: TABLE DATA; Schema: public; Owner: avdhari
--

COPY public.account_emailconfirmation (id, created, sent, key, email_address_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: avdhari
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: avdhari
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: avdhari
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add permission	1	add_permission
2	Can change permission	1	change_permission
3	Can delete permission	1	delete_permission
4	Can view permission	1	view_permission
5	Can add group	2	add_group
6	Can change group	2	change_group
7	Can delete group	2	delete_group
8	Can view group	2	view_group
9	Can add content type	3	add_contenttype
10	Can change content type	3	change_contenttype
11	Can delete content type	3	delete_contenttype
12	Can view content type	3	view_contenttype
13	Can add session	4	add_session
14	Can change session	4	change_session
15	Can delete session	4	delete_session
16	Can view session	4	view_session
17	Can add site	5	add_site
18	Can change site	5	change_site
19	Can delete site	5	delete_site
20	Can view site	5	view_site
21	Can add log entry	6	add_logentry
22	Can change log entry	6	change_logentry
23	Can delete log entry	6	delete_logentry
24	Can view log entry	6	view_logentry
25	Can add email address	7	add_emailaddress
26	Can change email address	7	change_emailaddress
27	Can delete email address	7	delete_emailaddress
28	Can view email address	7	view_emailaddress
29	Can add email confirmation	8	add_emailconfirmation
30	Can change email confirmation	8	change_emailconfirmation
31	Can delete email confirmation	8	delete_emailconfirmation
32	Can view email confirmation	8	view_emailconfirmation
33	Can add social account	9	add_socialaccount
34	Can change social account	9	change_socialaccount
35	Can delete social account	9	delete_socialaccount
36	Can view social account	9	view_socialaccount
37	Can add social application	10	add_socialapp
38	Can change social application	10	change_socialapp
39	Can delete social application	10	delete_socialapp
40	Can view social application	10	view_socialapp
41	Can add social application token	11	add_socialtoken
42	Can change social application token	11	change_socialtoken
43	Can delete social application token	11	delete_socialtoken
44	Can view social application token	11	view_socialtoken
45	Can add Token	12	add_token
46	Can change Token	12	change_token
47	Can delete Token	12	delete_token
48	Can view Token	12	view_token
49	Can add token	13	add_tokenproxy
50	Can change token	13	change_tokenproxy
51	Can delete token	13	delete_tokenproxy
52	Can view token	13	view_tokenproxy
53	Can add user	14	add_user
54	Can change user	14	change_user
55	Can delete user	14	delete_user
56	Can view user	14	view_user
57	Can add company	15	add_company
58	Can change company	15	change_company
59	Can delete company	15	delete_company
60	Can view company	15	view_company
61	Can add company admin	16	add_companyadmin
62	Can change company admin	16	change_companyadmin
63	Can delete company admin	16	delete_companyadmin
64	Can view company admin	16	view_companyadmin
65	Can add product	17	add_product
66	Can change product	17	change_product
67	Can delete product	17	delete_product
68	Can view product	17	view_product
\.


--
-- Data for Name: authtoken_token; Type: TABLE DATA; Schema: public; Owner: avdhari
--

COPY public.authtoken_token (key, created, user_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: avdhari
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-03-16 11:40:45.980844+00	1	projectlab@heimdall	2	[{"changed": {"fields": ["Name of User"]}}]	14	1
2	2022-03-16 14:45:58.811286+00	2	test	1	[{"added": {}}]	14	1
3	2022-03-16 14:46:05.958347+00	2	test	2	[{"changed": {"fields": ["Name of User"]}}]	14	1
4	2022-03-17 12:32:13.258001+00	3	anjask	1	[{"added": {}}]	14	1
5	2022-03-17 12:32:20.80018+00	3	anjask	2	[{"changed": {"fields": ["Name of User"]}}]	14	1
6	2022-03-21 14:14:27.797589+00	1	Harvey Specter	1	[{"added": {}}]	16	1
7	2022-03-21 14:16:04.395813+00	1	Specter Pharmaceuticals	1	[{"added": {}}]	15	1
8	2022-03-21 14:16:34.983561+00	4		1	[{"added": {}}]	14	1
9	2022-03-21 14:17:17.452666+00	4	Harvey Specter	2	[{"changed": {"fields": ["Name of User", "Email address", "Company", "Is company admin", "Company mail", "Phone"]}}]	14	1
10	2022-03-21 14:23:23.350791+00	2	Specter Pharmaceuticals | Hand Sanitiser	1	[{"added": {}}]	17	1
11	2022-03-21 14:23:40.211139+00	4	dbe2a7fcbf28b32f25c8d6ec508fb50a800ce5d4	1	[{"added": {}}]	13	1
12	2022-03-21 14:23:46.311088+00	4	dbe2a7fcbf28b32f25c8d6ec508fb50a800ce5d4	3		13	1
13	2022-03-21 14:23:55.113463+00	4	7046401ca23c5a0369aa2378b68ccfe353366998	1	[{"added": {}}]	13	1
14	2022-03-21 14:23:59.856717+00	4	7046401ca23c5a0369aa2378b68ccfe353366998	3		13	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: avdhari
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	auth	permission
2	auth	group
3	contenttypes	contenttype
4	sessions	session
5	sites	site
6	admin	logentry
7	account	emailaddress
8	account	emailconfirmation
9	socialaccount	socialaccount
10	socialaccount	socialapp
11	socialaccount	socialtoken
12	authtoken	token
13	authtoken	tokenproxy
14	users	user
15	users	company
16	users	companyadmin
17	users	product
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: avdhari
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-03-16 11:38:49.029382+00
2	contenttypes	0002_remove_content_type_name	2022-03-16 11:38:49.086637+00
3	auth	0001_initial	2022-03-16 11:38:49.568287+00
4	auth	0002_alter_permission_name_max_length	2022-03-16 11:38:49.58116+00
5	auth	0003_alter_user_email_max_length	2022-03-16 11:38:49.5942+00
6	auth	0004_alter_user_username_opts	2022-03-16 11:38:49.603121+00
7	auth	0005_alter_user_last_login_null	2022-03-16 11:38:49.613425+00
8	auth	0006_require_contenttypes_0002	2022-03-16 11:38:49.616487+00
9	auth	0007_alter_validators_add_error_messages	2022-03-16 11:38:49.628611+00
10	auth	0008_alter_user_username_max_length	2022-03-16 11:38:49.637221+00
11	users	0001_initial	2022-03-16 11:38:50.118843+00
12	account	0001_initial	2022-03-16 11:38:50.527125+00
13	account	0002_email_max_length	2022-03-16 11:38:50.557918+00
14	admin	0001_initial	2022-03-16 11:38:50.785772+00
15	admin	0002_logentry_remove_auto_add	2022-03-16 11:38:50.819427+00
16	admin	0003_logentry_add_action_flag_choices	2022-03-16 11:38:50.843533+00
17	auth	0009_alter_user_last_name_max_length	2022-03-16 11:38:50.8583+00
18	auth	0010_alter_group_name_max_length	2022-03-16 11:38:50.876428+00
19	auth	0011_update_proxy_permissions	2022-03-16 11:38:50.892911+00
20	auth	0012_alter_user_first_name_max_length	2022-03-16 11:38:50.907483+00
21	authtoken	0001_initial	2022-03-16 11:38:51.060602+00
22	authtoken	0002_auto_20160226_1747	2022-03-16 11:38:51.139135+00
23	authtoken	0003_tokenproxy	2022-03-16 11:38:51.142897+00
24	sessions	0001_initial	2022-03-16 11:38:51.327574+00
25	sites	0001_initial	2022-03-16 11:38:51.380691+00
26	sites	0002_alter_domain_unique	2022-03-16 11:38:51.49726+00
27	sites	0003_set_site_domain_and_name	2022-03-16 11:38:51.555448+00
28	sites	0004_alter_options_ordering_domain	2022-03-16 11:38:51.561988+00
29	socialaccount	0001_initial	2022-03-16 11:38:52.245234+00
30	socialaccount	0002_token_max_lengths	2022-03-16 11:38:52.304819+00
31	socialaccount	0003_extra_data_default_dict	2022-03-16 11:38:52.339824+00
32	users	0002_auto_20220319_1328	2022-03-21 13:52:43.833535+00
33	users	0003_alter_companyadmin_company_owned	2022-03-21 13:52:43.889698+00
34	users	0004_auto_20220319_1621	2022-03-21 13:52:43.998649+00
35	users	0005_company_is_removed	2022-03-21 13:52:44.024957+00
36	users	0006_companyadmin_is_removed	2022-03-21 13:52:44.062312+00
37	users	0007_product	2022-03-21 14:02:54.146169+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: avdhari
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
fi9ywhp9jqjjtnnzot7v78o3aelb55wv	.eJxVjMsOwiAQRf-FtSEwPOvSvd9ABgakaiAp7cr479qkC93ec859sYDbWsM28hJmYmcm2el3i5geue2A7thunafe1mWOfFf4QQe_dsrPy-H-HVQc9Vur4mUxUYCLBhC1IEopa-0nKpCVhQjaKkAn0U_OeyuUomSy8zJCKYW9P-ION9Q:1nUS0t:G6SxWbEKLAWYe-ffBJTXOXNaqRNsLY8apjhtwxxO9kI	2022-03-30 11:40:23.385141+00
\.


--
-- Data for Name: django_site; Type: TABLE DATA; Schema: public; Owner: avdhari
--

COPY public.django_site (id, domain, name) FROM stdin;
1	example.com	heimdall
\.


--
-- Data for Name: socialaccount_socialaccount; Type: TABLE DATA; Schema: public; Owner: avdhari
--

COPY public.socialaccount_socialaccount (id, provider, uid, last_login, date_joined, extra_data, user_id) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialapp; Type: TABLE DATA; Schema: public; Owner: avdhari
--

COPY public.socialaccount_socialapp (id, provider, name, client_id, secret, key) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialapp_sites; Type: TABLE DATA; Schema: public; Owner: avdhari
--

COPY public.socialaccount_socialapp_sites (id, socialapp_id, site_id) FROM stdin;
\.


--
-- Data for Name: socialaccount_socialtoken; Type: TABLE DATA; Schema: public; Owner: avdhari
--

COPY public.socialaccount_socialtoken (id, token, token_secret, expires_at, account_id, app_id) FROM stdin;
\.


--
-- Data for Name: users_company; Type: TABLE DATA; Schema: public; Owner: avdhari
--

COPY public.users_company (id, name, site_url, contact_mail, admin_mail, is_paid, expires_on, company_admin_id, created_by_id, is_removed) FROM stdin;
1	Specter Pharmaceuticals	http://specterpharma.com	contact@specter.com	harvey@specter.com	t	2022-12-31 00:00:00+00	1	1	f
\.


--
-- Data for Name: users_companyadmin; Type: TABLE DATA; Schema: public; Owner: avdhari
--

COPY public.users_companyadmin (id, name, mail, company_mail, company_owned_id, is_removed) FROM stdin;
1	Harvey Specter	harvey@specter.com	harvey@specter.com	\N	f
\.


--
-- Data for Name: users_product; Type: TABLE DATA; Schema: public; Owner: avdhari
--

COPY public.users_product (id, is_removed, name, description, product_site_url, keywords, company_id) FROM stdin;
2	f	Hand Sanitiser	a liquid or gel, typically one containing alcohol, that is used to clean the hands and kill infection-causing microorganisms.\r\n\r\nHand sanitizer (also known as hand antiseptic, hand disinfectant, hand rub, or handrub) is a liquid, gel or foam generally used to kill many viruses/bacteria/microorganisms on the hands. In most settings, hand washing with soap and water is generally preferred. Hand sanitizer is less effective at killing certain kinds of germs, such as norovirus and Clostridium difficile, and unlike hand washing, it cannot physically remove harmful chemicals. People may incorrectly wipe off hand sanitizer before it has dried, and some are less effective because their alcohol concentrations are too low	\N	sanitiser	1
\.


--
-- Data for Name: users_user; Type: TABLE DATA; Schema: public; Owner: avdhari
--

COPY public.users_user (id, password, last_login, is_superuser, username, email, is_staff, is_active, date_joined, name, company_id, company_mail, is_company_admin, phone) FROM stdin;
2	argon2$argon2id$v=19$m=102400,t=2,p=8$VGdvTHA0V0hXN0FaY2oxZkZxMU9mbw$m8LY0ncmsGu/X3URaXLX5w	\N	f	test		f	t	2022-03-16 14:45:58+00	test user	\N	\N	f	\N
3	argon2$argon2id$v=19$m=102400,t=2,p=8$a3RFMFRmWHJkcGp1d0FQdDlOR0ZSdw$Vp/NcM7q6J5xLxO0rMykVw	\N	f	anjask		f	t	2022-03-17 12:32:13+00	Anjas K	\N	\N	f	\N
1	argon2$argon2id$v=19$m=102400,t=2,p=8$MkltdTVMNXBBYll6QzUzNnhMZm5FUw$PVlsjpRkQkLai7VVKeRtyw	2022-03-16 11:40:23+00	t	projectlab@heimdall	avd@h.com	t	t	2022-03-16 11:39:35+00	Aravind Hari	\N	\N	f	\N
4	argon2$argon2id$v=19$m=102400,t=2,p=8$RU5WMkoxNmF2VWRCVThDVmhvSFp3UQ$Am73ADgXlZ265p/Nu4KKHw	\N	f	harvey@specter.com	harvey@specter.com	f	t	2022-03-21 14:16:34+00	Harvey Specter	1	harvey@specter.com	t	9656998820
\.


--
-- Data for Name: users_user_groups; Type: TABLE DATA; Schema: public; Owner: avdhari
--

COPY public.users_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: users_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: avdhari
--

COPY public.users_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Name: account_emailaddress_id_seq; Type: SEQUENCE SET; Schema: public; Owner: avdhari
--

SELECT pg_catalog.setval('public.account_emailaddress_id_seq', 1, true);


--
-- Name: account_emailconfirmation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: avdhari
--

SELECT pg_catalog.setval('public.account_emailconfirmation_id_seq', 1, false);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: avdhari
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: avdhari
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: avdhari
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 68, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: avdhari
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 14, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: avdhari
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 17, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: avdhari
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 37, true);


--
-- Name: django_site_id_seq; Type: SEQUENCE SET; Schema: public; Owner: avdhari
--

SELECT pg_catalog.setval('public.django_site_id_seq', 1, false);


--
-- Name: socialaccount_socialaccount_id_seq; Type: SEQUENCE SET; Schema: public; Owner: avdhari
--

SELECT pg_catalog.setval('public.socialaccount_socialaccount_id_seq', 1, false);


--
-- Name: socialaccount_socialapp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: avdhari
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_id_seq', 1, false);


--
-- Name: socialaccount_socialapp_sites_id_seq; Type: SEQUENCE SET; Schema: public; Owner: avdhari
--

SELECT pg_catalog.setval('public.socialaccount_socialapp_sites_id_seq', 1, false);


--
-- Name: socialaccount_socialtoken_id_seq; Type: SEQUENCE SET; Schema: public; Owner: avdhari
--

SELECT pg_catalog.setval('public.socialaccount_socialtoken_id_seq', 1, false);


--
-- Name: users_company_id_seq; Type: SEQUENCE SET; Schema: public; Owner: avdhari
--

SELECT pg_catalog.setval('public.users_company_id_seq', 1, true);


--
-- Name: users_companyadmin_id_seq; Type: SEQUENCE SET; Schema: public; Owner: avdhari
--

SELECT pg_catalog.setval('public.users_companyadmin_id_seq', 1, true);


--
-- Name: users_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: avdhari
--

SELECT pg_catalog.setval('public.users_product_id_seq', 2, true);


--
-- Name: users_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: avdhari
--

SELECT pg_catalog.setval('public.users_user_groups_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: avdhari
--

SELECT pg_catalog.setval('public.users_user_id_seq', 4, true);


--
-- Name: users_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: avdhari
--

SELECT pg_catalog.setval('public.users_user_user_permissions_id_seq', 1, false);


--
-- Name: account_emailaddress account_emailaddress_email_key; Type: CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_email_key UNIQUE (email);


--
-- Name: account_emailaddress account_emailaddress_pkey; Type: CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_pkey PRIMARY KEY (id);


--
-- Name: account_emailconfirmation account_emailconfirmation_key_key; Type: CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_key_key UNIQUE (key);


--
-- Name: account_emailconfirmation account_emailconfirmation_pkey; Type: CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirmation_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: django_site django_site_domain_a2e37b91_uniq; Type: CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_domain_a2e37b91_uniq UNIQUE (domain);


--
-- Name: django_site django_site_pkey; Type: CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.django_site
    ADD CONSTRAINT django_site_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_pkey; Type: CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_provider_uid_fc810c6e_uniq; Type: CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_provider_uid_fc810c6e_uniq UNIQUE (provider, uid);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq; Type: CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp__socialapp_id_site_id_71a9a768_uniq UNIQUE (socialapp_id, site_id);


--
-- Name: socialaccount_socialapp socialaccount_socialapp_pkey; Type: CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.socialaccount_socialapp
    ADD CONSTRAINT socialaccount_socialapp_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialapp_sites socialaccount_socialapp_sites_pkey; Type: CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_socialapp_sites_pkey PRIMARY KEY (id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq; Type: CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_app_id_account_id_fca4e0ac_uniq UNIQUE (app_id, account_id);


--
-- Name: socialaccount_socialtoken socialaccount_socialtoken_pkey; Type: CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_socialtoken_pkey PRIMARY KEY (id);


--
-- Name: users_company users_company_name_key; Type: CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.users_company
    ADD CONSTRAINT users_company_name_key UNIQUE (name);


--
-- Name: users_company users_company_pkey; Type: CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.users_company
    ADD CONSTRAINT users_company_pkey PRIMARY KEY (id);


--
-- Name: users_companyadmin users_companyadmin_pkey; Type: CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.users_companyadmin
    ADD CONSTRAINT users_companyadmin_pkey PRIMARY KEY (id);


--
-- Name: users_product users_product_pkey; Type: CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.users_product
    ADD CONSTRAINT users_product_pkey PRIMARY KEY (id);


--
-- Name: users_user_groups users_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_pkey PRIMARY KEY (id);


--
-- Name: users_user_groups users_user_groups_user_id_group_id_b88eab82_uniq; Type: CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_group_id_b88eab82_uniq UNIQUE (user_id, group_id);


--
-- Name: users_user users_user_pkey; Type: CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions users_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: users_user_user_permissions users_user_user_permissions_user_id_permission_id_43338c45_uniq; Type: CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_permission_id_43338c45_uniq UNIQUE (user_id, permission_id);


--
-- Name: users_user users_user_username_key; Type: CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_username_key UNIQUE (username);


--
-- Name: account_emailaddress_email_03be32b2_like; Type: INDEX; Schema: public; Owner: avdhari
--

CREATE INDEX account_emailaddress_email_03be32b2_like ON public.account_emailaddress USING btree (email varchar_pattern_ops);


--
-- Name: account_emailaddress_user_id_2c513194; Type: INDEX; Schema: public; Owner: avdhari
--

CREATE INDEX account_emailaddress_user_id_2c513194 ON public.account_emailaddress USING btree (user_id);


--
-- Name: account_emailconfirmation_email_address_id_5b7f8c58; Type: INDEX; Schema: public; Owner: avdhari
--

CREATE INDEX account_emailconfirmation_email_address_id_5b7f8c58 ON public.account_emailconfirmation USING btree (email_address_id);


--
-- Name: account_emailconfirmation_key_f43612bd_like; Type: INDEX; Schema: public; Owner: avdhari
--

CREATE INDEX account_emailconfirmation_key_f43612bd_like ON public.account_emailconfirmation USING btree (key varchar_pattern_ops);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: avdhari
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: avdhari
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: avdhari
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: avdhari
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: avdhari
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: avdhari
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: avdhari
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: avdhari
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: avdhari
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: django_site_domain_a2e37b91_like; Type: INDEX; Schema: public; Owner: avdhari
--

CREATE INDEX django_site_domain_a2e37b91_like ON public.django_site USING btree (domain varchar_pattern_ops);


--
-- Name: socialaccount_socialaccount_user_id_8146e70c; Type: INDEX; Schema: public; Owner: avdhari
--

CREATE INDEX socialaccount_socialaccount_user_id_8146e70c ON public.socialaccount_socialaccount USING btree (user_id);


--
-- Name: socialaccount_socialapp_sites_site_id_2579dee5; Type: INDEX; Schema: public; Owner: avdhari
--

CREATE INDEX socialaccount_socialapp_sites_site_id_2579dee5 ON public.socialaccount_socialapp_sites USING btree (site_id);


--
-- Name: socialaccount_socialapp_sites_socialapp_id_97fb6e7d; Type: INDEX; Schema: public; Owner: avdhari
--

CREATE INDEX socialaccount_socialapp_sites_socialapp_id_97fb6e7d ON public.socialaccount_socialapp_sites USING btree (socialapp_id);


--
-- Name: socialaccount_socialtoken_account_id_951f210e; Type: INDEX; Schema: public; Owner: avdhari
--

CREATE INDEX socialaccount_socialtoken_account_id_951f210e ON public.socialaccount_socialtoken USING btree (account_id);


--
-- Name: socialaccount_socialtoken_app_id_636a42d7; Type: INDEX; Schema: public; Owner: avdhari
--

CREATE INDEX socialaccount_socialtoken_app_id_636a42d7 ON public.socialaccount_socialtoken USING btree (app_id);


--
-- Name: users_company_company_admin_id_627a44a3; Type: INDEX; Schema: public; Owner: avdhari
--

CREATE INDEX users_company_company_admin_id_627a44a3 ON public.users_company USING btree (company_admin_id);


--
-- Name: users_company_created_by_id_914a0245; Type: INDEX; Schema: public; Owner: avdhari
--

CREATE INDEX users_company_created_by_id_914a0245 ON public.users_company USING btree (created_by_id);


--
-- Name: users_company_name_d7dc344c_like; Type: INDEX; Schema: public; Owner: avdhari
--

CREATE INDEX users_company_name_d7dc344c_like ON public.users_company USING btree (name varchar_pattern_ops);


--
-- Name: users_companyadmin_company_owned_id_34092334; Type: INDEX; Schema: public; Owner: avdhari
--

CREATE INDEX users_companyadmin_company_owned_id_34092334 ON public.users_companyadmin USING btree (company_owned_id);


--
-- Name: users_product_company_id_580cf74b; Type: INDEX; Schema: public; Owner: avdhari
--

CREATE INDEX users_product_company_id_580cf74b ON public.users_product USING btree (company_id);


--
-- Name: users_user_company_id_14799323; Type: INDEX; Schema: public; Owner: avdhari
--

CREATE INDEX users_user_company_id_14799323 ON public.users_user USING btree (company_id);


--
-- Name: users_user_groups_group_id_9afc8d0e; Type: INDEX; Schema: public; Owner: avdhari
--

CREATE INDEX users_user_groups_group_id_9afc8d0e ON public.users_user_groups USING btree (group_id);


--
-- Name: users_user_groups_user_id_5f6f5a90; Type: INDEX; Schema: public; Owner: avdhari
--

CREATE INDEX users_user_groups_user_id_5f6f5a90 ON public.users_user_groups USING btree (user_id);


--
-- Name: users_user_user_permissions_permission_id_0b93982e; Type: INDEX; Schema: public; Owner: avdhari
--

CREATE INDEX users_user_user_permissions_permission_id_0b93982e ON public.users_user_user_permissions USING btree (permission_id);


--
-- Name: users_user_user_permissions_user_id_20aca447; Type: INDEX; Schema: public; Owner: avdhari
--

CREATE INDEX users_user_user_permissions_user_id_20aca447 ON public.users_user_user_permissions USING btree (user_id);


--
-- Name: users_user_username_06e46fe6_like; Type: INDEX; Schema: public; Owner: avdhari
--

CREATE INDEX users_user_username_06e46fe6_like ON public.users_user USING btree (username varchar_pattern_ops);


--
-- Name: account_emailaddress account_emailaddress_user_id_2c513194_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.account_emailaddress
    ADD CONSTRAINT account_emailaddress_user_id_2c513194_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: account_emailconfirmation account_emailconfirm_email_address_id_5b7f8c58_fk_account_e; Type: FK CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.account_emailconfirmation
    ADD CONSTRAINT account_emailconfirm_email_address_id_5b7f8c58_fk_account_e FOREIGN KEY (email_address_id) REFERENCES public.account_emailaddress(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_social_account_id_951f210e_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_social_account_id_951f210e_fk_socialacc FOREIGN KEY (account_id) REFERENCES public.socialaccount_socialaccount(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialtoken socialaccount_social_app_id_636a42d7_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.socialaccount_socialtoken
    ADD CONSTRAINT socialaccount_social_app_id_636a42d7_fk_socialacc FOREIGN KEY (app_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialapp_sites socialaccount_social_site_id_2579dee5_fk_django_si; Type: FK CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_site_id_2579dee5_fk_django_si FOREIGN KEY (site_id) REFERENCES public.django_site(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialapp_sites socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc; Type: FK CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.socialaccount_socialapp_sites
    ADD CONSTRAINT socialaccount_social_socialapp_id_97fb6e7d_fk_socialacc FOREIGN KEY (socialapp_id) REFERENCES public.socialaccount_socialapp(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: socialaccount_socialaccount socialaccount_socialaccount_user_id_8146e70c_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.socialaccount_socialaccount
    ADD CONSTRAINT socialaccount_socialaccount_user_id_8146e70c_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_company users_company_company_admin_id_627a44a3_fk_users_com; Type: FK CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.users_company
    ADD CONSTRAINT users_company_company_admin_id_627a44a3_fk_users_com FOREIGN KEY (company_admin_id) REFERENCES public.users_companyadmin(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_company users_company_created_by_id_914a0245_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.users_company
    ADD CONSTRAINT users_company_created_by_id_914a0245_fk_users_user_id FOREIGN KEY (created_by_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_companyadmin users_companyadmin_company_owned_id_34092334_fk_users_com; Type: FK CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.users_companyadmin
    ADD CONSTRAINT users_companyadmin_company_owned_id_34092334_fk_users_com FOREIGN KEY (company_owned_id) REFERENCES public.users_company(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_product users_product_company_id_580cf74b_fk_users_company_id; Type: FK CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.users_product
    ADD CONSTRAINT users_product_company_id_580cf74b_fk_users_company_id FOREIGN KEY (company_id) REFERENCES public.users_company(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user users_user_company_id_14799323_fk_users_company_id; Type: FK CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.users_user
    ADD CONSTRAINT users_user_company_id_14799323_fk_users_company_id FOREIGN KEY (company_id) REFERENCES public.users_company(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups users_user_groups_group_id_9afc8d0e_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_group_id_9afc8d0e_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_groups users_user_groups_user_id_5f6f5a90_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.users_user_groups
    ADD CONSTRAINT users_user_groups_user_id_5f6f5a90_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions users_user_user_perm_permission_id_0b93982e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_perm_permission_id_0b93982e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: users_user_user_permissions users_user_user_permissions_user_id_20aca447_fk_users_user_id; Type: FK CONSTRAINT; Schema: public; Owner: avdhari
--

ALTER TABLE ONLY public.users_user_user_permissions
    ADD CONSTRAINT users_user_user_permissions_user_id_20aca447_fk_users_user_id FOREIGN KEY (user_id) REFERENCES public.users_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

