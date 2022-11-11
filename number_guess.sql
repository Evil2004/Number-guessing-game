--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guessing;
--
-- Name: number_guessing; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guessing WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guessing OWNER TO freecodecamp;

\connect number_guessing

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    name character varying(50) NOT NULL,
    user_id integer NOT NULL,
    min_guess integer,
    number_of_games integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('user_1668172961128', 28, 27, 2);
INSERT INTO public.users VALUES ('user_1668173312962', 41, 7, 2);
INSERT INTO public.users VALUES ('user_1668172961129', 27, 268, 5);
INSERT INTO public.users VALUES ('user_1668173614560', 51, 503, 2);
INSERT INTO public.users VALUES ('user_1668173312963', 40, 158, 5);
INSERT INTO public.users VALUES ('user_1668173012838', 30, 309, 2);
INSERT INTO public.users VALUES ('user_1668173614561', 50, 944, 5);
INSERT INTO public.users VALUES ('user_1668173012839', 29, 477, 5);
INSERT INTO public.users VALUES ('tarun', 31, 7, 2);
INSERT INTO public.users VALUES ('user_1668173342518', 43, 27, 2);
INSERT INTO public.users VALUES ('user_1668173239570', 33, 493, 2);
INSERT INTO public.users VALUES ('user_1668173342519', 42, 48, 5);
INSERT INTO public.users VALUES ('user_1668173239571', 32, 226, 5);
INSERT INTO public.users VALUES ('user_1668173248867', 35, 417, 2);
INSERT INTO public.users VALUES ('user_1668173360783', 45, 143, 2);
INSERT INTO public.users VALUES ('user_1668173248868', 34, 354, 5);
INSERT INTO public.users VALUES ('user_1668173360784', 44, 357, 5);
INSERT INTO public.users VALUES ('user_1668173252282', 37, 275, 2);
INSERT INTO public.users VALUES ('user_1668173363727', 47, 975, 2);
INSERT INTO public.users VALUES ('user_1668173252283', 36, 15, 5);
INSERT INTO public.users VALUES ('user_1668173255407', 39, 817, 2);
INSERT INTO public.users VALUES ('user_1668173363728', 46, 479, 5);
INSERT INTO public.users VALUES ('user_1668173255408', 38, 799, 5);
INSERT INTO public.users VALUES ('user_1668173491776', 49, 738, 2);
INSERT INTO public.users VALUES ('user_1668173491777', 48, 695, 5);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 51, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

