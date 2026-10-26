--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: comet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    orbital_period_years numeric(10,2),
    is_periodic boolean NOT NULL,
    description text
);


ALTER TABLE public.comet OWNER TO postgres;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO postgres;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    distance_from_earth numeric(15,2),
    number_of_stars bigint NOT NULL,
    has_life boolean NOT NULL
);


ALTER TABLE public.galaxy OWNER TO postgres;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO postgres;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer NOT NULL,
    diameter_in_km integer NOT NULL,
    is_spherical boolean NOT NULL,
    description text
);


ALTER TABLE public.moon OWNER TO postgres;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO postgres;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer NOT NULL,
    diameter_in_km integer NOT NULL,
    has_life boolean NOT NULL,
    distance_from_star numeric(12,2)
);


ALTER TABLE public.planet OWNER TO postgres;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO postgres;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer NOT NULL,
    spectral_type character varying(10),
    mass_in_solar_masses numeric(10,4),
    is_spherical boolean NOT NULL
);


ALTER TABLE public.star OWNER TO postgres;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO postgres;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.comet VALUES (1, 'Halley', 75.32, true, 'Famous periodic comet visible from Earth');
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 2533.00, true, 'Long-period comet discovered in 1995');
INSERT INTO public.comet VALUES (3, 'Encke', 3.30, true, 'Comet with the shortest known period');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy, a barred spiral galaxy', 0.00, 200000000000, true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The nearest large galaxy to the Milky Way', 2537000.00, 100000000000, false);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'A spiral galaxy in the Local Group', 2730000.00, 40000000000, false);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud', 'A satellite galaxy of the Milky Way', 163000.00, 30000000000, false);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud', 'A dwarf irregular galaxy', 200000.00, 3000000000, false);
INSERT INTO public.galaxy VALUES (6, 'Sombrero Galaxy', 'A large lenticular galaxy', 2937000.00, 100000000000, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.moon VALUES (1, 'The Moon', 3, 3474, true, 'Earth''s only natural satellite');
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 22, false, 'Smallest moon of Mars');
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 12, false, 'Larger moon of Mars');
INSERT INTO public.moon VALUES (4, 'Io', 5, 3643, true, 'Most volcanically active body in the solar system');
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3122, true, 'Has a subsurface ocean');
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 5268, true, 'Largest moon in the solar system');
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4821, true, 'One of Jupiter''s Galilean moons');
INSERT INTO public.moon VALUES (8, 'Iapetus', 6, 1469, true, 'Saturn''s second-largest moon');
INSERT INTO public.moon VALUES (9, 'Titan', 6, 5150, true, 'Largest moon of Saturn with thick atmosphere');
INSERT INTO public.moon VALUES (10, 'Rhea', 6, 1527, true, 'Saturn''s third-largest moon');
INSERT INTO public.moon VALUES (11, 'Dione', 6, 1123, true, 'A major moon of Saturn');
INSERT INTO public.moon VALUES (12, 'Tethys', 6, 1066, true, 'A moon of Saturn');
INSERT INTO public.moon VALUES (13, 'Enceladus', 6, 504, true, 'Geologically active with geysers');
INSERT INTO public.moon VALUES (14, 'Mimas', 6, 396, true, 'Resembles the Death Star');
INSERT INTO public.moon VALUES (15, 'Ariel', 7, 1158, true, 'Uranus''s second-largest moon');
INSERT INTO public.moon VALUES (16, 'Umbriel', 7, 1169, true, 'Uranus''s second-largest moon by size');
INSERT INTO public.moon VALUES (17, 'Titania', 7, 1578, true, 'Largest moon of Uranus');
INSERT INTO public.moon VALUES (18, 'Oberon', 7, 1523, true, 'Second-largest moon of Uranus');
INSERT INTO public.moon VALUES (19, 'Miranda', 7, 472, true, 'Smallest of Uranus''s major moons');
INSERT INTO public.moon VALUES (20, 'Triton', 8, 2707, true, 'Neptune''s largest moon, orbits retrograde');
INSERT INTO public.moon VALUES (21, 'Nereid', 8, 340, false, 'Neptune''s second-largest moon');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 4879, false, 57.90);
INSERT INTO public.planet VALUES (2, 'Venus', 1, 12104, false, 108.20);
INSERT INTO public.planet VALUES (3, 'Earth', 1, 12742, true, 149.60);
INSERT INTO public.planet VALUES (4, 'Mars', 1, 6779, false, 227.90);
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 139820, false, 778.50);
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 116460, false, 1434.00);
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 50724, false, 2871.00);
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 49244, false, 4495.00);
INSERT INTO public.planet VALUES (9, 'Proxima b', 2, 14746, false, 0.05);
INSERT INTO public.planet VALUES (10, 'TRAPPIST-1b', 3, 14324, false, 0.01);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1c', 3, 15396, false, 0.02);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1d', 3, 13484, false, 0.02);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G2V', 1.0000, true);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 'M5.5V', 0.1225, true);
INSERT INTO public.star VALUES (3, 'TRAPPIST-1', 1, 'M8V', 0.0899, true);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 'M1-2Ia', 16.5000, true);
INSERT INTO public.star VALUES (5, 'Sirius A', 1, 'A1V', 2.0600, true);
INSERT INTO public.star VALUES (6, 'Vega', 1, 'A0V', 2.1380, true);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

