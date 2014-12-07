SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 171 (class 1259 OID 215936)
-- Name: person; Type: TABLE; Schema: public; Owner: spring; Tablespace: 
--

CREATE TABLE person (
    id integer NOT NULL,
    name character varying(50),
    email character varying(100)
);


ALTER TABLE public.person OWNER TO spring;

--
-- TOC entry 170 (class 1259 OID 215934)
-- Name: person_id_seq; Type: SEQUENCE; Schema: public; Owner: spring
--

CREATE SEQUENCE person_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.person_id_seq OWNER TO spring;

--
-- TOC entry 1983 (class 0 OID 0)
-- Dependencies: 170
-- Name: person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: spring
--

ALTER SEQUENCE person_id_seq OWNED BY person.id;


--
-- TOC entry 1863 (class 2604 OID 215939)
-- Name: id; Type: DEFAULT; Schema: public; Owner: spring
--

ALTER TABLE ONLY person ALTER COLUMN id SET DEFAULT nextval('person_id_seq'::regclass);


--
-- TOC entry 1974 (class 0 OID 215936)
-- Dependencies: 171
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: spring
--

INSERT INTO person (id, name, email) VALUES (4, 'topolino', 'topolino@disney.com');
INSERT INTO person (id, name, email) VALUES (1, 'pippo', 'pippo@disney.com');
INSERT INTO person (id, name, email) VALUES (2, 'pluto', 'pluto@disney.com');
INSERT INTO person (id, name, email) VALUES (3, 'paperino', 'paperino@disney.com');


--
-- TOC entry 1984 (class 0 OID 0)
-- Dependencies: 170
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spring
--

SELECT pg_catalog.setval('person_id_seq', 4, true);


--
-- TOC entry 1865 (class 2606 OID 215941)
-- Name: person_pkey; Type: CONSTRAINT; Schema: public; Owner: spring; Tablespace: 
--

ALTER TABLE ONLY person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);


--
-- TOC entry 1981 (class 0 OID 0)
-- Dependencies: 5
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2014-12-07 23:05:34 CET

--
-- PostgreSQL database dump complete
--
