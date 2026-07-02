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
-- Name: comet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.comet (
    comet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    speed integer,
    description text,
    is_periodic boolean
);


ALTER TABLE public.comet OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.comet_comet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comet_comet_id_seq OWNER TO freecodecamp;

--
-- Name: comet_comet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.comet_comet_id_seq OWNED BY public.comet.comet_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    galaxy_type character varying(60) NOT NULL,
    diameter integer,
    age_billions numeric,
    has_black_hole boolean NOT NULL,
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
    name character varying(30) NOT NULL,
    diameter integer,
    is_spherical boolean,
    description text,
    planet_id integer NOT NULL
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
    name character varying(30) NOT NULL,
    planet_type character varying(60) NOT NULL,
    diameter integer,
    has_life boolean,
    description text,
    star_id integer NOT NULL
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    star_type character varying(60) NOT NULL,
    temperature integer,
    is_visible boolean,
    description text,
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
-- Name: comet comet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet ALTER COLUMN comet_id SET DEFAULT nextval('public.comet_comet_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: comet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.comet VALUES (1, 'Halley', 70, 'Most famous periodic comet', true);
INSERT INTO public.comet VALUES (2, 'Hale-Bopp', 44, 'Very bright comet discovered in 1995', false);
INSERT INTO public.comet VALUES (3, 'Hyakutake', 59, 'Comet with a very long tail', false);
INSERT INTO public.comet VALUES (4, 'Encke', 69, 'Short-period comet', true);
INSERT INTO public.comet VALUES (5, 'Tempel 1', 41, 'Visited by the Deep Impact mission', true);
INSERT INTO public.comet VALUES (6, 'Wild 2', 47, 'Visited by the Stardust mission', true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (4, 'Milky Way', 'Spiral', NULL, NULL, true, NULL);
INSERT INTO public.galaxy VALUES (5, 'Andromeda', 'Spiral', NULL, NULL, true, NULL);
INSERT INTO public.galaxy VALUES (6, 'Triangulum', 'Spiral', NULL, NULL, false, NULL);
INSERT INTO public.galaxy VALUES (7, 'Whirlpool', 'Spiral', NULL, NULL, true, NULL);
INSERT INTO public.galaxy VALUES (8, 'Sombrero', 'Elliptical', NULL, NULL, true, NULL);
INSERT INTO public.galaxy VALUES (9, 'Black Eye', 'Spiral', NULL, NULL, false, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (21, 'Moon', 3474, true, 'Natural satellite of Earth', 3);
INSERT INTO public.moon VALUES (22, 'Phobos', 22, false, 'Moon of Mars', 4);
INSERT INTO public.moon VALUES (23, 'Deimos', 12, false, 'Moon of Mars', 4);
INSERT INTO public.moon VALUES (24, 'Io', 3643, true, 'Moon of Jupiter', 5);
INSERT INTO public.moon VALUES (25, 'Europa', 3122, true, 'Moon of Jupiter', 5);
INSERT INTO public.moon VALUES (26, 'Ganymede', 5268, true, 'Largest moon in the Solar System', 5);
INSERT INTO public.moon VALUES (27, 'Callisto', 4821, true, 'Moon of Jupiter', 5);
INSERT INTO public.moon VALUES (28, 'Titan', 5150, true, 'Largest moon of Saturn', 6);
INSERT INTO public.moon VALUES (29, 'Enceladus', 504, true, 'Moon of Saturn', 6);
INSERT INTO public.moon VALUES (30, 'Mimas', 396, true, 'Moon of Saturn', 6);
INSERT INTO public.moon VALUES (31, 'Rhea', 1528, true, 'Moon of Saturn', 6);
INSERT INTO public.moon VALUES (32, 'Dione', 1123, true, 'Moon of Saturn', 6);
INSERT INTO public.moon VALUES (33, 'Tethys', 1062, true, 'Moon of Saturn', 6);
INSERT INTO public.moon VALUES (34, 'Miranda', 472, true, 'Moon of Uranus', 7);
INSERT INTO public.moon VALUES (35, 'Ariel', 1158, true, 'Moon of Uranus', 7);
INSERT INTO public.moon VALUES (36, 'Umbriel', 1169, true, 'Moon of Uranus', 7);
INSERT INTO public.moon VALUES (37, 'Titania', 1578, true, 'Moon of Uranus', 7);
INSERT INTO public.moon VALUES (38, 'Oberon', 1523, true, 'Moon of Uranus', 7);
INSERT INTO public.moon VALUES (39, 'Triton', 2706, true, 'Moon of Neptune', 8);
INSERT INTO public.moon VALUES (40, 'Charon', 1212, true, 'Largest moon of Pluto', 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'Terrestrial', 4879, false, 'Closest planet to the Sun', 7);
INSERT INTO public.planet VALUES (2, 'Venus', 'Terrestrial', 12104, false, 'Second planet from the Sun', 7);
INSERT INTO public.planet VALUES (3, 'Earth', 'Terrestrial', 12742, true, 'Home planet of humans', 7);
INSERT INTO public.planet VALUES (4, 'Mars', 'Terrestrial', 6779, false, 'The Red Planet', 7);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gas Giant', 139820, false, 'Largest planet in the Solar System', 7);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas Giant', 116460, false, 'Planet with prominent rings', 7);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice Giant', 50724, false, 'Rotates on its side', 7);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Ice Giant', 49244, false, 'Farthest planet from the Sun', 7);
INSERT INTO public.planet VALUES (9, 'Proxima b', 'Exoplanet', 11400, false, 'Orbits Proxima Centauri', 8);
INSERT INTO public.planet VALUES (10, 'Kepler-22b', 'Exoplanet', 29000, false, 'Candidate habitable exoplanet', 9);
INSERT INTO public.planet VALUES (11, 'Kepler-452b', 'Exoplanet', 18000, false, 'Earth-like exoplanet', 11);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1e', 'Exoplanet', 11500, false, 'Rocky exoplanet', 12);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (7, 'Sun', 'Yellow Dwarf', 5778, true, 'Star of the Solar System', 4);
INSERT INTO public.star VALUES (8, 'Proxima Centauri', 'Red Dwarf', 3042, false, 'Closest star to the Sun', 4);
INSERT INTO public.star VALUES (9, 'Sirius', 'Main Sequence', 9940, true, 'Brightest star in the night sky', 4);
INSERT INTO public.star VALUES (10, 'Betelgeuse', 'Red Supergiant', 3500, true, 'Very large red star', 6);
INSERT INTO public.star VALUES (11, 'Vega', 'Main Sequence', 9602, true, 'Bright star in Lyra', 5);
INSERT INTO public.star VALUES (12, 'Polaris', 'Supergiant', 6015, true, 'North Star', 7);


--
-- Name: comet_comet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.comet_comet_id_seq', 6, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 9, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 40, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 12, true);


--
-- Name: comet comet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_name_key UNIQUE (name);


--
-- Name: comet comet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.comet
    ADD CONSTRAINT comet_pkey PRIMARY KEY (comet_id);


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

