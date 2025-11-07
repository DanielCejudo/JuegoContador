--
-- PostgreSQL database cluster dump
--

-- Started on 2025-11-06 18:27:31

\restrict 7lX35ej4OrcbW2gWuxDAnYSefqyJF4smFehY6gJgAPZizTvdwvV7BO1LY67mrBo

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE hmb;
ALTER ROLE hmb WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS;

--
-- User Configurations
--








\unrestrict 7lX35ej4OrcbW2gWuxDAnYSefqyJF4smFehY6gJgAPZizTvdwvV7BO1LY67mrBo

--
-- Databases
--

--
-- Database "template1" dump
--

\connect template1

--
-- PostgreSQL database dump
--

\restrict e8DT02SMrRdCiEbhfQyng7DdLigbQa5cYuvqp8o8wPmwQK9holPYR1jUZ7L9A0m

-- Dumped from database version 16.10 (Debian 16.10-1.pgdg13+1)
-- Dumped by pg_dump version 17.6

-- Started on 2025-11-06 18:27:32

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

-- Completed on 2025-11-06 18:27:32

--
-- PostgreSQL database dump complete
--

\unrestrict e8DT02SMrRdCiEbhfQyng7DdLigbQa5cYuvqp8o8wPmwQK9holPYR1jUZ7L9A0m

--
-- Database "hmbdb" dump
--

--
-- PostgreSQL database dump
--

\restrict AqLOlaGwitZFSCbvWqS9aUGcp1Z9df6yYRFZIkGQ19eVfKqUqO3aAVphuRUIEBG

-- Dumped from database version 16.10 (Debian 16.10-1.pgdg13+1)
-- Dumped by pg_dump version 17.6

-- Started on 2025-11-06 18:27:32

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 3448 (class 1262 OID 16384)
-- Name: hmbdb; Type: DATABASE; Schema: -; Owner: hmb
--

CREATE DATABASE hmbdb WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';


ALTER DATABASE hmbdb OWNER TO hmb;

\unrestrict AqLOlaGwitZFSCbvWqS9aUGcp1Z9df6yYRFZIkGQ19eVfKqUqO3aAVphuRUIEBG
\connect hmbdb
\restrict AqLOlaGwitZFSCbvWqS9aUGcp1Z9df6yYRFZIkGQ19eVfKqUqO3aAVphuRUIEBG

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
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
-- TOC entry 218 (class 1259 OID 16395)
-- Name: juegos; Type: TABLE; Schema: public; Owner: hmb
--

CREATE TABLE public.juegos (
    id bigint NOT NULL,
    nombre character varying(50) NOT NULL
);


ALTER TABLE public.juegos OWNER TO hmb;

--
-- TOC entry 217 (class 1259 OID 16394)
-- Name: juegos_id_seq; Type: SEQUENCE; Schema: public; Owner: hmb
--

CREATE SEQUENCE public.juegos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.juegos_id_seq OWNER TO hmb;

--
-- TOC entry 3449 (class 0 OID 0)
-- Dependencies: 217
-- Name: juegos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hmb
--

ALTER SEQUENCE public.juegos_id_seq OWNED BY public.juegos.id;


--
-- TOC entry 220 (class 1259 OID 16404)
-- Name: records; Type: TABLE; Schema: public; Owner: hmb
--

CREATE TABLE public.records (
    id bigint NOT NULL,
    usuario_id bigint NOT NULL,
    juego_id bigint NOT NULL,
    puntaje integer NOT NULL,
    fecha date NOT NULL,
    posicion integer DEFAULT 0
);


ALTER TABLE public.records OWNER TO hmb;

--
-- TOC entry 219 (class 1259 OID 16403)
-- Name: records_id_seq; Type: SEQUENCE; Schema: public; Owner: hmb
--

CREATE SEQUENCE public.records_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.records_id_seq OWNER TO hmb;

--
-- TOC entry 3450 (class 0 OID 0)
-- Dependencies: 219
-- Name: records_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hmb
--

ALTER SEQUENCE public.records_id_seq OWNED BY public.records.id;


--
-- TOC entry 216 (class 1259 OID 16386)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: hmb
--

CREATE TABLE public.usuarios (
    id bigint NOT NULL,
    login character varying(50) NOT NULL,
    password character varying(255) NOT NULL,
    correo character varying(120)
);


ALTER TABLE public.usuarios OWNER TO hmb;

--
-- TOC entry 215 (class 1259 OID 16385)
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: hmb
--

CREATE SEQUENCE public.usuarios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.usuarios_id_seq OWNER TO hmb;

--
-- TOC entry 3451 (class 0 OID 0)
-- Dependencies: 215
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: hmb
--

ALTER SEQUENCE public.usuarios_id_seq OWNED BY public.usuarios.id;


--
-- TOC entry 3278 (class 2604 OID 16398)
-- Name: juegos id; Type: DEFAULT; Schema: public; Owner: hmb
--

ALTER TABLE ONLY public.juegos ALTER COLUMN id SET DEFAULT nextval('public.juegos_id_seq'::regclass);


--
-- TOC entry 3279 (class 2604 OID 16407)
-- Name: records id; Type: DEFAULT; Schema: public; Owner: hmb
--

ALTER TABLE ONLY public.records ALTER COLUMN id SET DEFAULT nextval('public.records_id_seq'::regclass);


--
-- TOC entry 3277 (class 2604 OID 16389)
-- Name: usuarios id; Type: DEFAULT; Schema: public; Owner: hmb
--

ALTER TABLE ONLY public.usuarios ALTER COLUMN id SET DEFAULT nextval('public.usuarios_id_seq'::regclass);


--
-- TOC entry 3440 (class 0 OID 16395)
-- Dependencies: 218
-- Data for Name: juegos; Type: TABLE DATA; Schema: public; Owner: hmb
--

COPY public.juegos (id, nombre) FROM stdin;
1	HMB
\.


--
-- TOC entry 3442 (class 0 OID 16404)
-- Dependencies: 220
-- Data for Name: records; Type: TABLE DATA; Schema: public; Owner: hmb
--

COPY public.records (id, usuario_id, juego_id, puntaje, fecha, posicion) FROM stdin;
1	1	1	10	2025-11-05	0
2	2	1	8	2025-11-05	0
3	3	1	7	2025-11-05	0
4	4	1	6	2025-11-05	0
\.


--
-- TOC entry 3438 (class 0 OID 16386)
-- Dependencies: 216
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: hmb
--

COPY public.usuarios (id, login, password, correo) FROM stdin;
1	hmb	p123	
2	daniel	123	dcejudoc@gmail.com
3	cajas	ola	huesos@gmail.com
4	puchis	gei	
\.


--
-- TOC entry 3452 (class 0 OID 0)
-- Dependencies: 217
-- Name: juegos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hmb
--

SELECT pg_catalog.setval('public.juegos_id_seq', 1, true);


--
-- TOC entry 3453 (class 0 OID 0)
-- Dependencies: 219
-- Name: records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hmb
--

SELECT pg_catalog.setval('public.records_id_seq', 4, true);


--
-- TOC entry 3454 (class 0 OID 0)
-- Dependencies: 215
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: hmb
--

SELECT pg_catalog.setval('public.usuarios_id_seq', 4, true);


--
-- TOC entry 3286 (class 2606 OID 16402)
-- Name: juegos juegos_nombre_key; Type: CONSTRAINT; Schema: public; Owner: hmb
--

ALTER TABLE ONLY public.juegos
    ADD CONSTRAINT juegos_nombre_key UNIQUE (nombre);


--
-- TOC entry 3288 (class 2606 OID 16400)
-- Name: juegos juegos_pkey; Type: CONSTRAINT; Schema: public; Owner: hmb
--

ALTER TABLE ONLY public.juegos
    ADD CONSTRAINT juegos_pkey PRIMARY KEY (id);


--
-- TOC entry 3290 (class 2606 OID 16410)
-- Name: records records_pkey; Type: CONSTRAINT; Schema: public; Owner: hmb
--

ALTER TABLE ONLY public.records
    ADD CONSTRAINT records_pkey PRIMARY KEY (id);


--
-- TOC entry 3282 (class 2606 OID 16393)
-- Name: usuarios usuarios_login_key; Type: CONSTRAINT; Schema: public; Owner: hmb
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_login_key UNIQUE (login);


--
-- TOC entry 3284 (class 2606 OID 16391)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: hmb
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- TOC entry 3291 (class 1259 OID 16421)
-- Name: ux_record_mejor; Type: INDEX; Schema: public; Owner: hmb
--

CREATE UNIQUE INDEX ux_record_mejor ON public.records USING btree (usuario_id, juego_id, puntaje, fecha);


--
-- TOC entry 3292 (class 2606 OID 16416)
-- Name: records records_juego_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hmb
--

ALTER TABLE ONLY public.records
    ADD CONSTRAINT records_juego_id_fkey FOREIGN KEY (juego_id) REFERENCES public.juegos(id);


--
-- TOC entry 3293 (class 2606 OID 16411)
-- Name: records records_usuario_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: hmb
--

ALTER TABLE ONLY public.records
    ADD CONSTRAINT records_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES public.usuarios(id) ON DELETE CASCADE;


-- Completed on 2025-11-06 18:27:32

--
-- PostgreSQL database dump complete
--

\unrestrict AqLOlaGwitZFSCbvWqS9aUGcp1Z9df6yYRFZIkGQ19eVfKqUqO3aAVphuRUIEBG

--
-- Database "postgres" dump
--

\connect postgres

--
-- PostgreSQL database dump
--

\restrict XKyb9AsgQvTh2fYHjA17IcTJQpmIvXbgDec5kUt2wt00IfFW0c7oQqwvpvnNKMu

-- Dumped from database version 16.10 (Debian 16.10-1.pgdg13+1)
-- Dumped by pg_dump version 17.6

-- Started on 2025-11-06 18:27:32

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

-- Completed on 2025-11-06 18:27:32

--
-- PostgreSQL database dump complete
--

\unrestrict XKyb9AsgQvTh2fYHjA17IcTJQpmIvXbgDec5kUt2wt00IfFW0c7oQqwvpvnNKMu

-- Completed on 2025-11-06 18:27:32

--
-- PostgreSQL database cluster dump complete
--

