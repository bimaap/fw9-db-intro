--
-- PostgreSQL database dump
--

-- Dumped from database version 14.3
-- Dumped by pg_dump version 14.3

-- Started on 2022-06-24 13:48:47

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

DROP DATABASE portal_artikel;
--
-- TOC entry 3349 (class 1262 OID 16394)
-- Name: portal_artikel; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE portal_artikel WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'English_Indonesia.1252';


ALTER DATABASE portal_artikel OWNER TO postgres;

\connect portal_artikel

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

--
-- TOC entry 3 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- TOC entry 3350 (class 0 OID 0)
-- Dependencies: 3
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 212 (class 1259 OID 16402)
-- Name: komentar; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.komentar (
    id integer NOT NULL,
    konten character varying NOT NULL,
    user_id integer NOT NULL,
    postingan_id integer NOT NULL
);


ALTER TABLE public.komentar OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16401)
-- Name: biodata_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.komentar ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.biodata_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 214 (class 1259 OID 16424)
-- Name: postingan; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.postingan (
    id integer NOT NULL,
    judul character varying NOT NULL,
    waktu_dibuat datemultirange NOT NULL,
    konten text NOT NULL,
    lokasi character varying NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.postingan OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16423)
-- Name: postingan_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.postingan ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.postingan_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 216 (class 1259 OID 16430)
-- Name: profile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.profile (
    id integer NOT NULL,
    gender integer NOT NULL,
    no_tlp character varying NOT NULL,
    tanggal_lahir character varying NOT NULL,
    bio character varying NOT NULL,
    user_id integer NOT NULL,
    saldo double precision NOT NULL
);


ALTER TABLE public.profile OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16429)
-- Name: profile_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.profile ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.profile_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 210 (class 1259 OID 16396)
-- Name: user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."user" (
    id integer NOT NULL,
    nik character varying NOT NULL,
    nama character varying NOT NULL,
    email character varying NOT NULL,
    password character varying NOT NULL
);


ALTER TABLE public."user" OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16395)
-- Name: user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."user" ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 3339 (class 0 OID 16402)
-- Dependencies: 212
-- Data for Name: komentar; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.komentar (id, konten, user_id, postingan_id) FROM stdin;
\.


--
-- TOC entry 3341 (class 0 OID 16424)
-- Dependencies: 214
-- Data for Name: postingan; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.postingan (id, judul, waktu_dibuat, konten, lokasi, user_id) FROM stdin;
\.


--
-- TOC entry 3343 (class 0 OID 16430)
-- Dependencies: 216
-- Data for Name: profile; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.profile (id, gender, no_tlp, tanggal_lahir, bio, user_id, saldo) FROM stdin;
\.


--
-- TOC entry 3337 (class 0 OID 16396)
-- Dependencies: 210
-- Data for Name: user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."user" (id, nik, nama, email, password) FROM stdin;
\.


--
-- TOC entry 3351 (class 0 OID 0)
-- Dependencies: 211
-- Name: biodata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.biodata_id_seq', 1, false);


--
-- TOC entry 3352 (class 0 OID 0)
-- Dependencies: 213
-- Name: postingan_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.postingan_id_seq', 1, false);


--
-- TOC entry 3353 (class 0 OID 0)
-- Dependencies: 215
-- Name: profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.profile_id_seq', 1, false);


--
-- TOC entry 3354 (class 0 OID 0)
-- Dependencies: 209
-- Name: user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_id_seq', 1, false);


--
-- TOC entry 3182 (class 2606 OID 16436)
-- Name: komentar komentar_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.komentar
    ADD CONSTRAINT komentar_pk PRIMARY KEY (id);


--
-- TOC entry 3184 (class 2606 OID 16442)
-- Name: komentar komentar_postinganid_un; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.komentar
    ADD CONSTRAINT komentar_postinganid_un UNIQUE (postingan_id);


--
-- TOC entry 3186 (class 2606 OID 16440)
-- Name: komentar komentar_userid_un; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.komentar
    ADD CONSTRAINT komentar_userid_un UNIQUE (user_id);


--
-- TOC entry 3188 (class 2606 OID 16459)
-- Name: postingan postingan_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.postingan
    ADD CONSTRAINT postingan_pk PRIMARY KEY (id);


--
-- TOC entry 3190 (class 2606 OID 16461)
-- Name: postingan postingan_userid_un; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.postingan
    ADD CONSTRAINT postingan_userid_un UNIQUE (user_id);


--
-- TOC entry 3192 (class 2606 OID 16468)
-- Name: profile profile_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile
    ADD CONSTRAINT profile_pk PRIMARY KEY (id);


--
-- TOC entry 3180 (class 2606 OID 16408)
-- Name: user user_id; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."user"
    ADD CONSTRAINT user_id PRIMARY KEY (id);


--
-- TOC entry 3193 (class 2606 OID 16499)
-- Name: komentar komentar_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.komentar
    ADD CONSTRAINT komentar_fk FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- TOC entry 3194 (class 2606 OID 16504)
-- Name: komentar komentar_fk2; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.komentar
    ADD CONSTRAINT komentar_fk2 FOREIGN KEY (postingan_id) REFERENCES public.postingan(id);


--
-- TOC entry 3195 (class 2606 OID 16494)
-- Name: postingan postingan_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.postingan
    ADD CONSTRAINT postingan_fk FOREIGN KEY (user_id) REFERENCES public."user"(id);


--
-- TOC entry 3196 (class 2606 OID 16489)
-- Name: profile profile_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.profile
    ADD CONSTRAINT profile_fk FOREIGN KEY (user_id) REFERENCES public."user"(id);


-- Completed on 2022-06-24 13:48:48

--
-- PostgreSQL database dump complete
--

