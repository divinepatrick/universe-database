--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
    name character varying NOT NULL,
    galaxy_type character varying NOT NULL,
    distance_from_earth numeric(10,2) NOT NULL,
    has_life boolean DEFAULT false NOT NULL,
    description text
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
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    diameter numeric(10,2) NOT NULL,
    orbital_period integer NOT NULL,
    is_captured boolean DEFAULT false NOT NULL
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
    name character varying NOT NULL,
    planet_type character varying NOT NULL,
    orbital_period integer NOT NULL,
    has_atmosphere boolean DEFAULT false NOT NULL,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_characteristics; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_characteristics (
    planet_characteristics_id integer NOT NULL,
    name character varying(50) NOT NULL,
    planet_id integer NOT NULL,
    diameter numeric(10,2) NOT NULL,
    orbital_period integer NOT NULL,
    is_captured boolean DEFAULT false NOT NULL
);


ALTER TABLE public.planet_characteristics OWNER TO freecodecamp;

--
-- Name: planet_characteristics_planet_characteristics_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_characteristics_planet_characteristics_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_characteristics_planet_characteristics_id_seq OWNER TO freecodecamp;

--
-- Name: planet_characteristics_planet_characteristics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_characteristics_planet_characteristics_id_seq OWNED BY public.planet_characteristics.planet_characteristics_id;


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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    star_type character varying NOT NULL,
    age_in_millions_of_years integer NOT NULL,
    is_spherical boolean DEFAULT true NOT NULL,
    galaxy_id integer NOT NULL
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
-- Name: planet_characteristics planet_characteristics_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_characteristics ALTER COLUMN planet_characteristics_id SET DEFAULT nextval('public.planet_characteristics_planet_characteristics_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andromeda', 'Spiral', 2.50, false, 'Largest nearby galaxy');
INSERT INTO public.galaxy VALUES (2, 'Milky Way', 'Barred Spiral', 0.00, true, 'Our home galaxy');
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 3.00, false, 'Small nearby galaxy');
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Spiral', 28.00, false, 'Unbarred spiral galaxy');
INSERT INTO public.galaxy VALUES (5, 'Pinwheel', 'Face-on Spiral', 21.00, false, 'Face-on spiral galaxy');
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 'Grand-design Spiral', 27.00, false, 'Grand-design spiral galaxy');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 3475.00, 27, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 22.00, 0, true);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 12.00, 1, true);
INSERT INTO public.moon VALUES (4, 'Io', 5, 3643.00, 2, false);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 3130.00, 4, false);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 5262.00, 7, false);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 4821.00, 30, false);
INSERT INTO public.moon VALUES (8, 'Amalthea', 5, 167.00, 1, false);
INSERT INTO public.moon VALUES (9, 'Himalia', 5, 170.00, 250, false);
INSERT INTO public.moon VALUES (10, 'Thebe', 5, 99.00, 45, false);
INSERT INTO public.moon VALUES (11, 'Metis', 5, 60.00, 7, false);
INSERT INTO public.moon VALUES (12, 'Adrastea', 5, 20.00, 0, false);
INSERT INTO public.moon VALUES (13, 'Themisto', 5, 8.00, 130, false);
INSERT INTO public.moon VALUES (14, 'Carme', 5, 46.00, 693, true);
INSERT INTO public.moon VALUES (15, 'Pasiphae', 5, 60.00, 764, true);
INSERT INTO public.moon VALUES (16, 'Sinope', 5, 59.00, 758, true);
INSERT INTO public.moon VALUES (17, 'Leda', 5, 20.00, 238, true);
INSERT INTO public.moon VALUES (18, 'Hypsipyle', 5, 18.00, 539, true);
INSERT INTO public.moon VALUES (19, 'Lysithea', 5, 18.00, 259, true);
INSERT INTO public.moon VALUES (20, 'Elara', 5, 76.00, 259, false);
INSERT INTO public.moon VALUES (21, 'Dia', 5, 4.00, 278, true);
INSERT INTO public.moon VALUES (22, 'Carpo', 5, 3.00, 456, true);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Terrestrial', 365, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'Terrestrial', 687, false, 1);
INSERT INTO public.planet VALUES (3, 'Venus', 'Terrestrial', 225, true, 1);
INSERT INTO public.planet VALUES (4, 'Mercury', 'Terrestrial', 88, false, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gas Giant', 4333, true, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas Giant', 10759, true, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice Giant', 30687, true, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Ice Giant', 60190, true, 1);
INSERT INTO public.planet VALUES (9, 'Kepler-452b', 'Super-Earth', 385, false, 6);
INSERT INTO public.planet VALUES (10, 'Kepler-62f', 'Super-Earth', 267, false, 6);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1e', 'Terrestrial', 9, false, 6);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1f', 'Terrestrial', 11, false, 6);


--
-- Data for Name: planet_characteristics; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_characteristics VALUES (1, 'Earth', 3, -31.00, 10, false);
INSERT INTO public.planet_characteristics VALUES (2, 'Mars', 4, -9.00, 4, false);
INSERT INTO public.planet_characteristics VALUES (3, 'Venus', 2, -20.00, 9, false);
INSERT INTO public.planet_characteristics VALUES (4, 'Mercury', 1, -300.00, 4, false);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'G-type main-sequence', 4600, true, 2);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 'M-type red dwarf', 4800, true, 2);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 'Red supergiant', 1000, true, 2);
INSERT INTO public.star VALUES (4, 'Rigel', 'Blue-white supergiant', 100, true, 2);
INSERT INTO public.star VALUES (5, 'Sirius', 'White main-sequence', 250, true, 2);
INSERT INTO public.star VALUES (6, 'Alpha Centauri', 'Triple star system', 4730, true, 2);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_characteristics_planet_characteristics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_characteristics_planet_characteristics_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id UNIQUE (name);


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
-- Name: planet_characteristics planet_characteristics_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_characteristics
    ADD CONSTRAINT planet_characteristics_name_key UNIQUE (name);


--
-- Name: planet_characteristics planet_characteristics_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_characteristics
    ADD CONSTRAINT planet_characteristics_pkey PRIMARY KEY (planet_characteristics_id);


--
-- Name: planet planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_id UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id UNIQUE (name);


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
-- Name: planet_characteristics planet_characteristics_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_characteristics
    ADD CONSTRAINT planet_characteristics_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


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

