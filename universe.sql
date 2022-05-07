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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    dist_from_earth_mly numeric,
    name character varying(20),
    galaxy_types character varying(20),
    star_count_est integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying(20) NOT NULL,
    descrip text,
    has_life boolean,
    has_water boolean,
    age_millions_of_years numeric,
    size_rank_planet_sys integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    star_id integer NOT NULL,
    name character varying(20) NOT NULL,
    descrip text,
    has_life boolean,
    has_water boolean,
    dist_from_earth_au numeric,
    age_millions_of_years numeric
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: probe; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.probe (
    probe_id integer NOT NULL,
    name character varying(20) NOT NULL,
    descrip text,
    launch_year integer
);


ALTER TABLE public.probe OWNER TO freecodecamp;

--
-- Name: probe_probe_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.probe_probe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.probe_probe_id_seq OWNER TO freecodecamp;

--
-- Name: probe_probe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.probe_probe_id_seq OWNED BY public.probe.probe_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    dist_from_earth_ly numeric,
    surf_temp_kel integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: probe probe_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.probe ALTER COLUMN probe_id SET DEFAULT nextval('public.probe_probe_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 2.5, 'Andromeda', 'barred spiral', 100);
INSERT INTO public.galaxy VALUES (2, 0.27, 'Milky Way', 'barred spiral', 400);
INSERT INTO public.galaxy VALUES (3, 31.1, 'Sombrero', 'spiral', 0);
INSERT INTO public.galaxy VALUES (4, 11.7, 'Messier 81', 'grand design spiral', 100);
INSERT INTO public.galaxy VALUES (5, 12.1, 'Centaurus A', 'starburst', 400);
INSERT INTO public.galaxy VALUES (6, 2.73, 'Triangulum', 'spiral', 0);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 5, 'Metis', 'thats no moon', false, false, 4000, 1);
INSERT INTO public.moon VALUES (2, 5, 'Adrastea', 'thats no moon', false, false, 4000, 2);
INSERT INTO public.moon VALUES (3, 5, 'Amalthea', 'thats no moon', false, false, 4000, 3);
INSERT INTO public.moon VALUES (4, 5, 'Thebe', 'thats no moon', false, false, 4000, 4);
INSERT INTO public.moon VALUES (5, 5, 'Io', 'thats no moon', false, false, 4000, 5);
INSERT INTO public.moon VALUES (6, 5, 'Europa', 'thats no moon', false, false, 4000, 6);
INSERT INTO public.moon VALUES (7, 5, 'Ganymede', 'thats no moon', false, false, 4000, 7);
INSERT INTO public.moon VALUES (8, 5, 'Callisto', 'thats no moon', false, false, 4000, 8);
INSERT INTO public.moon VALUES (9, 5, 'Themisto', 'thats no moon', false, false, 4000, 9);
INSERT INTO public.moon VALUES (10, 5, 'Leda', 'thats no moon', false, false, 4000, 10);
INSERT INTO public.moon VALUES (11, 5, 'Ersa', 'thats no moon', false, false, 4000, 11);
INSERT INTO public.moon VALUES (12, 5, 'Himalia', 'thats no moon', false, false, 4000, 12);
INSERT INTO public.moon VALUES (13, 5, 'Pandia', 'thats no moon', false, false, 4000, 13);
INSERT INTO public.moon VALUES (14, 5, 'Lysithea', 'thats no moon', false, false, 4000, 14);
INSERT INTO public.moon VALUES (15, 5, 'Elara', 'thats no moon', false, false, 4000, 15);
INSERT INTO public.moon VALUES (16, 5, 'Dia', 'thats no moon', false, false, 4000, 16);
INSERT INTO public.moon VALUES (17, 3, 'Luna', 'thats no moon', false, false, 4000, 17);
INSERT INTO public.moon VALUES (18, 4, 'Deimos', 'thats no moon', false, false, 4000, 18);
INSERT INTO public.moon VALUES (19, 4, 'Phobos', 'thats no moon', false, false, 4000, 19);
INSERT INTO public.moon VALUES (20, 7, 'Titan', 'thats no moon', false, false, 4000, 20);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 6, 'Mercury', '1st planet from sun', false, false, 1.0087, 4503.00);
INSERT INTO public.planet VALUES (2, 2, 'Venus', '2nd planet from sun', false, false, 0.93773, 4503.00);
INSERT INTO public.planet VALUES (3, 2, 'Earth', '3rd rock from the sun', true, true, 0, 4543.00);
INSERT INTO public.planet VALUES (4, 2, 'Mars', 'Bringer of War', false, true, 1.6827, 4603.00);
INSERT INTO public.planet VALUES (5, 2, 'Jupiter', 'Bringer of Jolity', false, false, 5.7459, 4603.00);
INSERT INTO public.planet VALUES (6, 2, 'Nibiru', 'Anunnaki homeworld', true, true, 101.2, 100000);
INSERT INTO public.planet VALUES (7, 6, 'Saturn', 'Io, Saturnalia!', false, false, 10.179, 4503.00);
INSERT INTO public.planet VALUES (8, 6, 'Uranus', 'Proctology homeworld', false, true, 20.69, 4503.00);
INSERT INTO public.planet VALUES (9, 6, 'Neptune', 'The Mystic', false, true, 30.68, 4503.00);
INSERT INTO public.planet VALUES (10, 6, 'Earth Mark II', 'Commissioned by mice, built by the Magratheans', true, true, 0, 0.00000005);
INSERT INTO public.planet VALUES (11, 6, 'Pluto', 'non-planet iceball', false, false, 34.39, 4600);
INSERT INTO public.planet VALUES (12, 6, 'Yuggoth', 'Namorha--capital city', true, false, 34.39, 4600);


--
-- Data for Name: probe; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.probe VALUES (1, 'Pioneer 10', 'heading to Aldebaran(65 lya) contactlost in 2003', 1972);
INSERT INTO public.probe VALUES (2, 'Pioneer 11', 'Headed toward constellation Aquila Contact lost in 2005', 1973);
INSERT INTO public.probe VALUES (3, 'Voyager 1', 'Passed heliopause at 121AU in 2012 still active in 2022', 1977);
INSERT INTO public.probe VALUES (4, 'Voyager 2', 'still active in 2022 should reach Sirius  4.3 LYA in 296000 year', 1977);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 2, 'Cygnus OB2-12', 5707.74, 13700);
INSERT INTO public.star VALUES (2, 2, 'Eta Canis Majoris', 2000, 15000);
INSERT INTO public.star VALUES (3, 2, 'Gamma Cassiopeiae', 550, 25000);
INSERT INTO public.star VALUES (4, 2, 'Achernar', 139, 15000);
INSERT INTO public.star VALUES (5, 2, 'van Maanen 2', 14.07, 6130);
INSERT INTO public.star VALUES (6, 2, 'Sun', 0.000015, 5772);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: probe_probe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.probe_probe_id_seq', 4, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: probe probe_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.probe
    ADD CONSTRAINT probe_name_key UNIQUE (name);


--
-- Name: probe probe_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.probe
    ADD CONSTRAINT probe_pkey PRIMARY KEY (probe_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


