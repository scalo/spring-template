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
    email character varying(100),
    cost numeric(8,2),
    start_date date,
    mod_timestamp timestamp without time zone
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

INSERT INTO person (id, name, email, cost, start_date, mod_timestamp) VALUES (1, 'pippo', 'pippo@disney.com', 12.50, '2014-12-08', '2014-12-08 11:59:32.425012');
INSERT INTO person (id, name, email, cost, start_date, mod_timestamp) VALUES (2, 'pluto', 'pluto@disney.com', 20.34, '2014-12-08', '2014-12-08 11:59:35.641005');
INSERT INTO person (id, name, email, cost, start_date, mod_timestamp) VALUES (3, 'paperino', 'paperino@disney.com', 120.20, '2014-12-08', '2014-12-08 11:59:38.464772');
INSERT INTO person (id, name, email, cost, start_date, mod_timestamp) VALUES (4, 'topolino', 'topolino@disney.com', 2.30, '2014-12-08', '2014-12-08 11:59:41.016121');
INSERT INTO person (id, name, email, cost, start_date, mod_timestamp) VALUES (5, 'ciccio', 'ciccio@pasticcio.com', 0.40, '2014-12-08', '2014-12-08 11:59:43.568671');
INSERT INTO person (id, name, email, cost, start_date, mod_timestamp) VALUES (6, 'pino', 'pino@pinuccio.com', 34.00, '2014-12-08', '2014-12-08 11:59:46.104837');
INSERT INTO person (id, name, email, cost, start_date, mod_timestamp) VALUES (7, 'franco', 'fraco@ff.com', 133.00, '2014-12-08', '2014-12-08 11:59:49.240798');
INSERT INTO person (id, name, email, cost, start_date, mod_timestamp) VALUES (8, 'gianni', 'pinoli', 120.00, '2014-12-08', '2014-12-08 11:59:54.400757');


--
-- TOC entry 1984 (class 0 OID 0)
-- Dependencies: 170
-- Name: person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: spring
--

SELECT pg_catalog.setval('person_id_seq', 8, true);


--
-- TOC entry 1865 (class 2606 OID 215941)
-- Name: person_pkey; Type: CONSTRAINT; Schema: public; Owner: spring; Tablespace: 
--

ALTER TABLE ONLY person
    ADD CONSTRAINT person_pkey PRIMARY KEY (id);