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

DROP DATABASE numberguessinggame;
--
-- Name: numberguessinggame; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE numberguessinggame WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE numberguessinggame OWNER TO freecodecamp;

\connect numberguessinggame

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
    user_id integer NOT NULL,
    username character varying(30) NOT NULL,
    games_played integer NOT NULL,
    best_game integer NOT NULL
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

INSERT INTO public.users VALUES (2, 'user_1669083850000', 0, 0);
INSERT INTO public.users VALUES (3, 'user_1669083849999', 0, 0);
INSERT INTO public.users VALUES (4, 'user_1669085285690', 0, 0);
INSERT INTO public.users VALUES (5, 'user_1669085285689', 0, 0);
INSERT INTO public.users VALUES (15, 'user_1669087295306', 2, 582);
INSERT INTO public.users VALUES (7, 'user_1669086474384', 2, 676);
INSERT INTO public.users VALUES (14, 'user_1669087295307', 5, 64);
INSERT INTO public.users VALUES (6, 'user_1669086474385', 5, 142);
INSERT INTO public.users VALUES (9, 'user_1669087082202', 2, 741);
INSERT INTO public.users VALUES (17, 'user_1669087538086', 2, 669);
INSERT INTO public.users VALUES (8, 'user_1669087082203', 5, 6);
INSERT INTO public.users VALUES (16, 'user_1669087538087', 5, 126);
INSERT INTO public.users VALUES (11, 'user_1669087197865', 2, 299);
INSERT INTO public.users VALUES (10, 'user_1669087197866', 5, 409);
INSERT INTO public.users VALUES (19, 'user_1669087546073', 2, 177);
INSERT INTO public.users VALUES (18, 'user_1669087546074', 5, 91);
INSERT INTO public.users VALUES (1, 'THenry', 5, 7);
INSERT INTO public.users VALUES (13, 'user_1669087207487', 2, 277);
INSERT INTO public.users VALUES (20, 'Trevor', 1, 9);
INSERT INTO public.users VALUES (12, 'user_1669087207488', 5, 209);
INSERT INTO public.users VALUES (22, 'user_1669088907699', 2, 231);
INSERT INTO public.users VALUES (21, 'user_1669088907700', 5, 501);
INSERT INTO public.users VALUES (24, 'user_1669089020207', 2, 419);
INSERT INTO public.users VALUES (23, 'user_1669089020208', 5, 15);
INSERT INTO public.users VALUES (26, 'user_1669089067134', 2, 381);
INSERT INTO public.users VALUES (25, 'user_1669089067135', 5, 169);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 26, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- PostgreSQL database dump complete
--

