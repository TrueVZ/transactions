--
-- PostgreSQL database dump
--

-- Dumped from database version 13.6 (Debian 13.6-1.pgdg110+1)
-- Dumped by pg_dump version 14.2

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
-- Name: item; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.item (
    order_id integer,
    item_id bigint NOT NULL,
    product_id integer,
    actual_price double precision,
    quantity integer,
    total double precision
);


ALTER TABLE public.item OWNER TO admin;

--
-- Name: item_item_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.item_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.item_item_id_seq OWNER TO admin;

--
-- Name: item_item_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.item_item_id_seq OWNED BY public.item.item_id;


--
-- Name: product; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.product (
    product_id bigint NOT NULL,
    description character varying(30)
);


ALTER TABLE public.product OWNER TO admin;

--
-- Name: product_product_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.product_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_product_id_seq OWNER TO admin;

--
-- Name: product_product_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.product_product_id_seq OWNED BY public.product.product_id;


--
-- Name: sales_order; Type: TABLE; Schema: public; Owner: admin
--

CREATE TABLE public.sales_order (
    order_id bigint NOT NULL,
    order_date date,
    customer_id integer,
    ship_date date,
    total double precision
);


ALTER TABLE public.sales_order OWNER TO admin;

--
-- Name: sales_order_order_id_seq; Type: SEQUENCE; Schema: public; Owner: admin
--

CREATE SEQUENCE public.sales_order_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sales_order_order_id_seq OWNER TO admin;

--
-- Name: sales_order_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: admin
--

ALTER SEQUENCE public.sales_order_order_id_seq OWNED BY public.sales_order.order_id;


--
-- Name: item item_id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.item ALTER COLUMN item_id SET DEFAULT nextval('public.item_item_id_seq'::regclass);


--
-- Name: product product_id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.product ALTER COLUMN product_id SET DEFAULT nextval('public.product_product_id_seq'::regclass);


--
-- Name: sales_order order_id; Type: DEFAULT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.sales_order ALTER COLUMN order_id SET DEFAULT nextval('public.sales_order_order_id_seq'::regclass);


--
-- Data for Name: item; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.item (order_id, item_id, product_id, actual_price, quantity, total) FROM stdin;
1	1	1	100	5	500
\.


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.product (product_id, description) FROM stdin;
\.


--
-- Data for Name: sales_order; Type: TABLE DATA; Schema: public; Owner: admin
--

COPY public.sales_order (order_id, order_date, customer_id, ship_date, total) FROM stdin;
6	2022-05-20	1	2022-05-20	30000
7	2022-05-20	1	2022-05-20	30000
8	2022-05-20	1	2022-05-20	20000
9	2022-05-20	1	2022-05-20	30000
11	2022-05-20	1	2022-05-20	30000
12	2022-05-20	1	2022-05-20	30000
14	2022-05-20	1	2022-05-20	30000
15	2022-05-20	1	2022-05-20	20000
\.


--
-- Name: item_item_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.item_item_id_seq', 5, true);


--
-- Name: product_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.product_product_id_seq', 1, false);


--
-- Name: sales_order_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: admin
--

SELECT pg_catalog.setval('public.sales_order_order_id_seq', 15, true);


--
-- Name: item item_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.item
    ADD CONSTRAINT item_pkey PRIMARY KEY (item_id);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (product_id);


--
-- Name: sales_order sales_order_pkey; Type: CONSTRAINT; Schema: public; Owner: admin
--

ALTER TABLE ONLY public.sales_order
    ADD CONSTRAINT sales_order_pkey PRIMARY KEY (order_id);


--
-- PostgreSQL database dump complete
--

