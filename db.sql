--
-- PostgreSQL database dump
--

-- Dumped from database version 14.14 (Homebrew)
-- Dumped by pg_dump version 17.1

-- Started on 2024-11-17 04:34:47 +05

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
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: kareenean
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO kareenean;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 210 (class 1259 OID 16421)
-- Name: country; Type: TABLE; Schema: public; Owner: kareenean
--

CREATE TABLE public.country (
    cname character varying(50) NOT NULL,
    population bigint
);




--
-- TOC entry 214 (class 1259 OID 16456)
-- Name: discover; Type: TABLE; Schema: public; Owner: kareenean
--

CREATE TABLE public.discover (
    cname character varying(50) NOT NULL,
    disease_code character varying(50) NOT NULL,
    first_enc_date date
);




--
-- TOC entry 213 (class 1259 OID 16446)
-- Name: disease; Type: TABLE; Schema: public; Owner: kareenean
--

CREATE TABLE public.disease (
    disease_code character varying(50) NOT NULL,
    pathogen character varying(20),
    description character varying(140),
    id integer
);




--
-- TOC entry 209 (class 1259 OID 16416)
-- Name: diseasetype; Type: TABLE; Schema: public; Owner: kareenean
--

CREATE TABLE public.diseasetype (
    id integer NOT NULL,
    description character varying(140)
);




--
-- TOC entry 217 (class 1259 OID 16496)
-- Name: doctor; Type: TABLE; Schema: public; Owner: kareenean
--

CREATE TABLE public.doctor (
    email character varying(60) NOT NULL,
    degree character varying(20)
);




--
-- TOC entry 215 (class 1259 OID 16471)
-- Name: patientdisease; Type: TABLE; Schema: public; Owner: kareenean
--

CREATE TABLE public.patientdisease (
    email character varying(60) NOT NULL,
    disease_code character varying(50) NOT NULL
);




--
-- TOC entry 212 (class 1259 OID 16436)
-- Name: patients; Type: TABLE; Schema: public; Owner: kareenean
--

CREATE TABLE public.patients (
    email character varying(60) NOT NULL
);




--
-- TOC entry 216 (class 1259 OID 16486)
-- Name: publicservant; Type: TABLE; Schema: public; Owner: kareenean
--

CREATE TABLE public.publicservant (
    email character varying(60) NOT NULL,
    department character varying(50)
);




--
-- TOC entry 219 (class 1259 OID 16521)
-- Name: record; Type: TABLE; Schema: public; Owner: kareenean
--

CREATE TABLE public.record (
    email character varying(60) NOT NULL,
    cname character varying(50) NOT NULL,
    disease_code character varying(50) NOT NULL,
    total_deaths integer,
    total_patients integer
);




--
-- TOC entry 218 (class 1259 OID 16506)
-- Name: specialize; Type: TABLE; Schema: public; Owner: kareenean
--

CREATE TABLE public.specialize (
    id integer NOT NULL,
    email character varying(60) NOT NULL
);




--
-- TOC entry 211 (class 1259 OID 16426)
-- Name: users; Type: TABLE; Schema: public; Owner: kareenean
--

CREATE TABLE public.users (
    email character varying(60) NOT NULL,
    name character varying(30),
    surname character varying(40),
    salary integer,
    phone character varying(20),
    cname character varying(50)
);




--
-- TOC entry 3713 (class 0 OID 16421)
-- Dependencies: 210
-- Data for Name: country; Type: TABLE DATA; Schema: public; Owner: kareenean
--

COPY public.country (cname, population) FROM stdin;
India	1450935791
China	1419321278
USA	345426571
Indonesia	283487931
Pakistan	251269164
Nigeria	232679478
Brazil	211998573
Bangladesh	173562364
Russia	144820423
Ethiopia	132059767
Kazakhstan	20592571
Germany	84373946
UK	69292801
Italy	59342867
Greece	10047817
Japan	123753041
Denmark	5977412
France	66548530
Algeria	46814308
Austria	9120813
\.


--
-- TOC entry 3717 (class 0 OID 16456)
-- Dependencies: 214
-- Data for Name: discover; Type: TABLE DATA; Schema: public; Owner: kareenean
--

COPY public.discover (cname, disease_code, first_enc_date) FROM stdin;
Germany	TB	1882-03-24
UK	STREP	1874-11-01
Italy	CHOLERA	1854-08-17
UK	TYPHOID	1880-11-01
Germany	CANDID	1839-01-01
Greece	RINGWORM	0500-01-01
Italy	ASPERGIL	1729-01-01
Algeria	MALARIA	1880-01-01
Germany	GIARDIA	1859-01-01
Brazil	TOXO	1908-01-01
Brazil	CHAGAS	1909-01-01
China	COVID19	2019-12-01
UK	FLU	1933-01-01
Japan	DENGUE	1943-01-01
Denmark	MEASLES	1846-01-01
USA	BREASTCANCER	1894-01-01
France	SKINTUMOR	1804-01-01
Italy	HYPERTEN	1896-01-01
Austria	ATHEROSCL	1852-01-01
UK	LUPUS	1786-01-01
France	RA	1800-01-01
USA	IBS	1940-01-01
UK	DIABETES	1674-01-01
France	DEPRESSION	1856-01-01
UK	EPILEPSY	1861-01-01
UK	HYPOTHY	1873-01-01
USA	HYPERAD	1912-01-01
France	HIV	1983-01-01
UK	ALLERGIES	1819-01-01
\.


--
-- TOC entry 3716 (class 0 OID 16446)
-- Dependencies: 213
-- Data for Name: disease; Type: TABLE DATA; Schema: public; Owner: kareenean
--

COPY public.disease (disease_code, pathogen, description, id) FROM stdin;
TB	Bacteria	Tuberculosis	1
STREP	Bacteria	Strep Throat	1
CHOLERA	Bacteria	Cholera	1
TYPHOID	Bacteria	Typhoid Fever	1
CANDID	Fungus	Candidiasis	2
RINGWORM	Fungus	Ringworm	2
ASPERGIL	Fungus	Aspergillosis	2
HISTO	Fungus	Histoplasmosis	2
MALARIA	Protist	Malaria	3
GIARDIA	Protist	Giardiasis	3
TOXO	Protist	Toxoplasmosis	3
CHAGAS	Protist	Chagas Disease	3
COVID19	Virus	COVID-19	4
FLU	Virus	Influenza	4
DENGUE	Virus	Dengue Fever	4
MEASLES	Virus	Measles	4
BREASTCANCER	N/A	Breast Cancer	5
SKINTUMOR	N/A	Skin Tumor	5
HYPERTEN	N/A	Hypertension	6
ATHEROSCL	N/A	Atherosclerosis	6
LUPUS	N/A	Lupus	7
RA	N/A	Rheumatoid Arthritis	7
IBS	N/A	Irritable Bowel Syndrome	8
DIABETES	N/A	Diabetes	8
DEPRESSION	N/A	Depression	9
EPILEPSY	N/A	Epilepsy	9
HYPOTHY	N/A	Hypothyroidism	10
HYPERAD	N/A	Hyperadrenocorticism	10
HIV	Virus	HIV	11
ALLERGIES	N/A	Allergies	11
\.


--
-- TOC entry 3712 (class 0 OID 16416)
-- Dependencies: 209
-- Data for Name: diseasetype; Type: TABLE DATA; Schema: public; Owner: kareenean
--

COPY public.diseasetype (id, description) FROM stdin;
1	Bacterial Diseases
2	Fungal Diseases
3	Protist Diseases
4	Viral Diseases
5	Cancers and Benign Tumors
6	Circulatory System Diseases
7	Connective Tissue Diseases
8	Digestive System Diseases and Metabolic Diseases
9	Nervous System Diseases and Mental Diseases
10	Endocrine System Diseases
11	Immune Diseases
\.


--
-- TOC entry 3720 (class 0 OID 16496)
-- Dependencies: 217
-- Data for Name: doctor; Type: TABLE DATA; Schema: public; Owner: kareenean
--

COPY public.doctor (email, degree) FROM stdin;
maria_oliveira@gmail.com	MD
rahim_hasan@gmail.com	PhD
amirbek_kaz@gmail.com	MD
nurlanbek_kaz@gmail.com	MD
zhannabek_kaz@gmail.com	PhD
akmalbek_uz@gmail.com	MD
mohammed_brahimi_algeria@gmail.com	MD
imane_ghazi_algeria@gmail.com	PhD
george_muller_germany@gmail.com	MD
lara_schmidt_germany@gmail.com	MD
nora_durand_france@gmail.com	PhD
lucas_martin_france@gmail.com	MD
\.


--
-- TOC entry 3718 (class 0 OID 16471)
-- Dependencies: 215
-- Data for Name: patientdisease; Type: TABLE DATA; Schema: public; Owner: kareenean
--

COPY public.patientdisease (email, disease_code) FROM stdin;
abebe_kebede@gmail.com	CANDID
abebe_kebede@gmail.com	TB
adi_santoso@gmail.com	CANDID
amaka_nwosu@gmail.com	HIV
asylgul_sabyr@gmail.com	STREP
chinedu_okafor@gmail.com	HYPERTEN
arjun_verma@gmail.com	IBS
carlos_souza@gmail.com	IBS
ivan_petrov@gmail.com	DEPRESSION
ivan_petrov@gmail.com	CANDID
joao_silva@gmail.com	HYPOTHY
bakytgul_ab@gmail.com	ALLERGIES
aldibek_karat@gmail.com	COVID19
\.


--
-- TOC entry 3715 (class 0 OID 16436)
-- Dependencies: 212
-- Data for Name: patients; Type: TABLE DATA; Schema: public; Owner: kareenean
--

COPY public.patients (email) FROM stdin;
abebe_kebede@gmail.com
adi_santoso@gmail.com
amaka_nwosu@gmail.com
asylgul_sabyr@gmail.com
chinedu_okafor@gmail.com
arjun_verma@gmail.com
carlos_souza@gmail.com
ivan_petrov@gmail.com
joao_silva@gmail.com
bakytgul_ab@gmail.com
aldibek_karat@gmail.com
\.


--
-- TOC entry 3719 (class 0 OID 16486)
-- Dependencies: 216
-- Data for Name: publicservant; Type: TABLE DATA; Schema: public; Owner: kareenean
--

COPY public.publicservant (email, department) FROM stdin;
aibek_nur@gmail.com	Nutrition Services
gulnara_kz@gmail.com	Maternal and Child Health
nurbek_alma@gmail.com	Maternal and Child Health
ling_zhang@gmail.com	Emergency Response
wei_liu@gmail.com	Nutrition Services
sydab_piano@gmail.com	Healthcare Administration
aripova_k@gmail.com	Healthcare Administration
priya_patel@gmail.com	Emergency Response
john_smith@gmail.com	Emergency Response
ali_khan@gmail.com	Mental Health Services
fatima_yousaf@gmail.com	Disease Surveillance
\.


--
-- TOC entry 3722 (class 0 OID 16521)
-- Dependencies: 219
-- Data for Name: record; Type: TABLE DATA; Schema: public; Owner: kareenean
--

COPY public.record (email, cname, disease_code, total_deaths, total_patients) FROM stdin;
aibek_nur@gmail.com	Kazakhstan	DIABETES	40	705
ali_khan@gmail.com	Pakistan	DEPRESSION	5	844
aripova_k@gmail.com	Kazakhstan	EPILEPSY	15	500
fatima_yousaf@gmail.com	Pakistan	TB	400	1200
gulnara_kz@gmail.com	Kazakhstan	MALARIA	50	2002
john_smith@gmail.com	USA	MALARIA	103	3405
ling_zhang@gmail.com	China	IBS	354	2000
nurbek_alma@gmail.com	Kazakhstan	HIV	5	59
priya_patel@gmail.com	India	CHOLERA	250	1204
sydab_piano@gmail.com	Kazakhstan	COVID19	180	300
wei_liu@gmail.com	China	TYPHOID	300	1563
\.


--
-- TOC entry 3721 (class 0 OID 16506)
-- Dependencies: 218
-- Data for Name: specialize; Type: TABLE DATA; Schema: public; Owner: kareenean
--

COPY public.specialize (id, email) FROM stdin;
1	maria_oliveira@gmail.com
2	rahim_hasan@gmail.com
3	amirbek_kaz@gmail.com
4	nurlanbek_kaz@gmail.com
5	zhannabek_kaz@gmail.com
6	akmalbek_uz@gmail.com
7	mohammed_brahimi_algeria@gmail.com
8	imane_ghazi_algeria@gmail.com
9	george_muller_germany@gmail.com
10	lara_schmidt_germany@gmail.com
11	nora_durand_france@gmail.com
1	lucas_martin_france@gmail.com
\.


--
-- TOC entry 3714 (class 0 OID 16426)
-- Dependencies: 211
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: kareenean
--

COPY public.users (email, name, surname, salary, phone, cname) FROM stdin;
aripova_k@gmail.com	Karine	Aripova	2000000	87787777777	Kazakhstan
aibek_nur@gmail.com	Aibek	Nurpeisov	155000	87787777778	Kazakhstan
gulnara_kz@gmail.com	Gulnara	Baigulova	120000	87027777779	Kazakhstan
nurbek_alma@gmail.com	Nurbek	Almagulov	180000	87473777780	Kazakhstan
bakytgul_ab@gmail.com	Bakytgul	Abenova	130000	87017777781	Kazakhstan
aldibek_karat@gmail.com	Aldibek	Karataiuly	1405000	87017777782	Kazakhstan
asylgul_sabyr@gmail.com	Asylgul	Sabyrkhanova	125000	87017777783	Kazakhstan
sydab_piano@gmail.com	Abylay	Sydykov	10570570	87017777784	Kazakhstan
ling_zhang@gmail.com	Ling	Zhang	900000	8613900000051	China
wei_liu@gmail.com	Wei	Liu	95000	8613900000056	China
arjun_verma@gmail.com	Arjun	Verma	110000	919810000041	India
priya_patel@gmail.com	Priya	Patel	105000	919810000042	India
adi_santoso@gmail.com	Adi	Santoso	850000	6285100000041	Indonesia
john_smith@gmail.com	John	Smith	2000000	123456789	USA
ali_khan@gmail.com	Ali	Khan	950000	923000000001	Pakistan
fatima_yousaf@gmail.com	Fatima	Yousaf	900000	923000000002	Pakistan
chinedu_okafor@gmail.com	Chinedu	Okafor	800000	2348000000001	Nigeria
amaka_nwosu@gmail.com	Amaka	Nwosu	75000	2348000000002	Nigeria
joao_silva@gmail.com	Joao	Silva	100000	5511900000001	Brazil
maria_oliveira@gmail.com	Maria	Oliveira	950000	5511900000002	Brazil
carlos_souza@gmail.com	Carlos	Souza	1050000	5511900000003	Brazil
rahim_hasan@gmail.com	Rahim	Hasan	850000	8801700000001	Bangladesh
ivan_petrov@gmail.com	Ivan	Petrov	570000	749500000001	Russia
abebe_kebede@gmail.com	Abebe	Kebede	750000	2519000000001	Ethiopia
amirbek_kaz@gmail.com	Amirbek	Kassymov	250000	77011234567	Kazakhstan
nurlanbek_kaz@gmail.com	Nurlanbek	Suleimenov	30000	77013456789	Kazakhstan
zhannabek_kaz@gmail.com	Zhanna	Bekmuratova	220000	77014567890	Kazakhstan
akmalbek_uz@gmail.com	Akmal	Rakhmetov	180000	77291234567	Kazakhstan
mohammed_brahimi_algeria@gmail.com	Mohammed	Brahimi	240000	213561234567	Algeria
imane_ghazi_algeria@gmail.com	Imane	Ghazi	230000	213561234568	Algeria
george_muller_germany@gmail.com	George	Muller	380000	493112345678	Germany
lara_schmidt_germany@gmail.com	Lara	Schmidt	390000	493122345678	Germany
nora_durand_france@gmail.com	Nora	Durand	370000	334561234567	France
lucas_martin_france@gmail.com	Lucas	Martin	3800000	334561234568	France
\.


--
-- TOC entry 3540 (class 2606 OID 16425)
-- Name: country country_pkey; Type: CONSTRAINT; Schema: public; Owner: kareenean
--

ALTER TABLE ONLY public.country
    ADD CONSTRAINT country_pkey PRIMARY KEY (cname);


--
-- TOC entry 3548 (class 2606 OID 16460)
-- Name: discover discover_pkey; Type: CONSTRAINT; Schema: public; Owner: kareenean
--

ALTER TABLE ONLY public.discover
    ADD CONSTRAINT discover_pkey PRIMARY KEY (cname, disease_code);


--
-- TOC entry 3546 (class 2606 OID 16450)
-- Name: disease disease_pkey; Type: CONSTRAINT; Schema: public; Owner: kareenean
--

ALTER TABLE ONLY public.disease
    ADD CONSTRAINT disease_pkey PRIMARY KEY (disease_code);


--
-- TOC entry 3538 (class 2606 OID 16420)
-- Name: diseasetype diseasetype_pkey; Type: CONSTRAINT; Schema: public; Owner: kareenean
--

ALTER TABLE ONLY public.diseasetype
    ADD CONSTRAINT diseasetype_pkey PRIMARY KEY (id);


--
-- TOC entry 3554 (class 2606 OID 16500)
-- Name: doctor doctor_pkey; Type: CONSTRAINT; Schema: public; Owner: kareenean
--

ALTER TABLE ONLY public.doctor
    ADD CONSTRAINT doctor_pkey PRIMARY KEY (email);


--
-- TOC entry 3550 (class 2606 OID 16475)
-- Name: patientdisease patientdisease_pkey; Type: CONSTRAINT; Schema: public; Owner: kareenean
--

ALTER TABLE ONLY public.patientdisease
    ADD CONSTRAINT patientdisease_pkey PRIMARY KEY (email, disease_code);


--
-- TOC entry 3544 (class 2606 OID 16440)
-- Name: patients patients_pkey; Type: CONSTRAINT; Schema: public; Owner: kareenean
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_pkey PRIMARY KEY (email);


--
-- TOC entry 3552 (class 2606 OID 16490)
-- Name: publicservant publicservant_pkey; Type: CONSTRAINT; Schema: public; Owner: kareenean
--

ALTER TABLE ONLY public.publicservant
    ADD CONSTRAINT publicservant_pkey PRIMARY KEY (email);


--
-- TOC entry 3558 (class 2606 OID 16525)
-- Name: record record_pkey; Type: CONSTRAINT; Schema: public; Owner: kareenean
--

ALTER TABLE ONLY public.record
    ADD CONSTRAINT record_pkey PRIMARY KEY (email, cname, disease_code);


--
-- TOC entry 3556 (class 2606 OID 16510)
-- Name: specialize specialize_pkey; Type: CONSTRAINT; Schema: public; Owner: kareenean
--

ALTER TABLE ONLY public.specialize
    ADD CONSTRAINT specialize_pkey PRIMARY KEY (id, email);


--
-- TOC entry 3542 (class 2606 OID 16430)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: kareenean
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (email);


--
-- TOC entry 3562 (class 2606 OID 16461)
-- Name: discover discover_cname_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kareenean
--

ALTER TABLE ONLY public.discover
    ADD CONSTRAINT discover_cname_fkey FOREIGN KEY (cname) REFERENCES public.country(cname);


--
-- TOC entry 3563 (class 2606 OID 16466)
-- Name: discover discover_disease_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kareenean
--

ALTER TABLE ONLY public.discover
    ADD CONSTRAINT discover_disease_code_fkey FOREIGN KEY (disease_code) REFERENCES public.disease(disease_code);


--
-- TOC entry 3561 (class 2606 OID 16451)
-- Name: disease disease_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kareenean
--

ALTER TABLE ONLY public.disease
    ADD CONSTRAINT disease_id_fkey FOREIGN KEY (id) REFERENCES public.diseasetype(id);


--
-- TOC entry 3567 (class 2606 OID 16501)
-- Name: doctor doctor_email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kareenean
--

ALTER TABLE ONLY public.doctor
    ADD CONSTRAINT doctor_email_fkey FOREIGN KEY (email) REFERENCES public.users(email);


--
-- TOC entry 3564 (class 2606 OID 16481)
-- Name: patientdisease patientdisease_disease_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kareenean
--

ALTER TABLE ONLY public.patientdisease
    ADD CONSTRAINT patientdisease_disease_code_fkey FOREIGN KEY (disease_code) REFERENCES public.disease(disease_code);


--
-- TOC entry 3565 (class 2606 OID 16476)
-- Name: patientdisease patientdisease_email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kareenean
--

ALTER TABLE ONLY public.patientdisease
    ADD CONSTRAINT patientdisease_email_fkey FOREIGN KEY (email) REFERENCES public.users(email);


--
-- TOC entry 3560 (class 2606 OID 16441)
-- Name: patients patients_email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kareenean
--

ALTER TABLE ONLY public.patients
    ADD CONSTRAINT patients_email_fkey FOREIGN KEY (email) REFERENCES public.users(email);


--
-- TOC entry 3566 (class 2606 OID 16491)
-- Name: publicservant publicservant_email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kareenean
--

ALTER TABLE ONLY public.publicservant
    ADD CONSTRAINT publicservant_email_fkey FOREIGN KEY (email) REFERENCES public.users(email);


--
-- TOC entry 3570 (class 2606 OID 16531)
-- Name: record record_cname_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kareenean
--

ALTER TABLE ONLY public.record
    ADD CONSTRAINT record_cname_fkey FOREIGN KEY (cname) REFERENCES public.country(cname);


--
-- TOC entry 3571 (class 2606 OID 16536)
-- Name: record record_disease_code_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kareenean
--

ALTER TABLE ONLY public.record
    ADD CONSTRAINT record_disease_code_fkey FOREIGN KEY (disease_code) REFERENCES public.disease(disease_code);


--
-- TOC entry 3572 (class 2606 OID 16526)
-- Name: record record_email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kareenean
--

ALTER TABLE ONLY public.record
    ADD CONSTRAINT record_email_fkey FOREIGN KEY (email) REFERENCES public.publicservant(email);


--
-- TOC entry 3568 (class 2606 OID 16516)
-- Name: specialize specialize_email_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kareenean
--

ALTER TABLE ONLY public.specialize
    ADD CONSTRAINT specialize_email_fkey FOREIGN KEY (email) REFERENCES public.doctor(email);


--
-- TOC entry 3569 (class 2606 OID 16511)
-- Name: specialize specialize_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kareenean
--

ALTER TABLE ONLY public.specialize
    ADD CONSTRAINT specialize_id_fkey FOREIGN KEY (id) REFERENCES public.diseasetype(id);


--
-- TOC entry 3559 (class 2606 OID 16431)
-- Name: users users_cname_fkey; Type: FK CONSTRAINT; Schema: public; Owner: kareenean
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_cname_fkey FOREIGN KEY (cname) REFERENCES public.country(cname);


--
-- TOC entry 3728 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: kareenean
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2024-11-17 04:34:48 +05

--
-- PostgreSQL database dump complete
--

