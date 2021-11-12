--
-- PostgreSQL database dump
--

-- Dumped from database version 14.0
-- Dumped by pg_dump version 14.0

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
-- Name: Альбом; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Альбом" (
    id integer NOT NULL,
    "Название" character varying(255) NOT NULL,
    "Год_выпуска" integer NOT NULL,
    "id_исполнителя" integer,
    "id_жанра" integer
);


ALTER TABLE public."Альбом" OWNER TO postgres;

--
-- Name: Альбом_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Альбом_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Альбом_id_seq" OWNER TO postgres;

--
-- Name: Альбом_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Альбом_id_seq" OWNED BY public."Альбом".id;


--
-- Name: Жанр; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Жанр" (
    id integer NOT NULL,
    "Название" character varying(255) NOT NULL,
    "Описание" character varying(255)
);


ALTER TABLE public."Жанр" OWNER TO postgres;

--
-- Name: Жанр_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Жанр_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Жанр_id_seq" OWNER TO postgres;

--
-- Name: Жанр_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Жанр_id_seq" OWNED BY public."Жанр".id;


--
-- Name: Исполнитель; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Исполнитель" (
    id integer NOT NULL,
    "Название" character varying(255) NOT NULL,
    "Рейтинг" real,
    "Страна" character varying(255) NOT NULL,
    "Описание" text
);


ALTER TABLE public."Исполнитель" OWNER TO postgres;

--
-- Name: Исполнитель_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Исполнитель_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Исполнитель_id_seq" OWNER TO postgres;

--
-- Name: Исполнитель_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Исполнитель_id_seq" OWNED BY public."Исполнитель".id;


--
-- Name: Песня; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Песня" (
    id integer NOT NULL,
    "Название" character varying(255) NOT NULL,
    url character varying(255) NOT NULL,
    "Количество_прослушиваний" integer DEFAULT 0 NOT NULL,
    "id_альбома" integer
);


ALTER TABLE public."Песня" OWNER TO postgres;

--
-- Name: Песня_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Песня_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Песня_id_seq" OWNER TO postgres;

--
-- Name: Песня_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Песня_id_seq" OWNED BY public."Песня".id;


--
-- Name: Песня_в_плейлисте_пользователя; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Песня_в_плейлисте_пользователя" (
    "id_плейлиста" integer,
    "id_пользователя" integer,
    "id_песни" integer
);


ALTER TABLE public."Песня_в_плейлисте_пользователя" OWNER TO postgres;

--
-- Name: Плейлист; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Плейлист" (
    id integer NOT NULL,
    "Название" character varying(255) NOT NULL,
    "Описание" text
);


ALTER TABLE public."Плейлист" OWNER TO postgres;

--
-- Name: Плейлист_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Плейлист_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Плейлист_id_seq" OWNER TO postgres;

--
-- Name: Плейлист_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Плейлист_id_seq" OWNED BY public."Плейлист".id;


--
-- Name: Подписка; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Подписка" (
    id integer NOT NULL,
    "Тип_подписки" character varying(255) NOT NULL,
    "Цена_за_месяц" money
);


ALTER TABLE public."Подписка" OWNER TO postgres;

--
-- Name: Подписка_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Подписка_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Подписка_id_seq" OWNER TO postgres;

--
-- Name: Подписка_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Подписка_id_seq" OWNED BY public."Подписка".id;


--
-- Name: Пользователь; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Пользователь" (
    id integer NOT NULL,
    "Имя" character varying(255) NOT NULL,
    "Фамилия" character varying(255) NOT NULL,
    "Псевдоним" character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    "Пароль" character varying(255) NOT NULL,
    "Дата_окончания_подписки" date NOT NULL,
    "id_подписки" integer
);


ALTER TABLE public."Пользователь" OWNER TO postgres;

--
-- Name: Пользователь_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Пользователь_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Пользователь_id_seq" OWNER TO postgres;

--
-- Name: Пользователь_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Пользователь_id_seq" OWNED BY public."Пользователь".id;


--
-- Name: Альбом id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Альбом" ALTER COLUMN id SET DEFAULT nextval('public."Альбом_id_seq"'::regclass);


--
-- Name: Жанр id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Жанр" ALTER COLUMN id SET DEFAULT nextval('public."Жанр_id_seq"'::regclass);


--
-- Name: Исполнитель id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Исполнитель" ALTER COLUMN id SET DEFAULT nextval('public."Исполнитель_id_seq"'::regclass);


--
-- Name: Песня id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Песня" ALTER COLUMN id SET DEFAULT nextval('public."Песня_id_seq"'::regclass);


--
-- Name: Плейлист id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Плейлист" ALTER COLUMN id SET DEFAULT nextval('public."Плейлист_id_seq"'::regclass);


--
-- Name: Подписка id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Подписка" ALTER COLUMN id SET DEFAULT nextval('public."Подписка_id_seq"'::regclass);


--
-- Name: Пользователь id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Пользователь" ALTER COLUMN id SET DEFAULT nextval('public."Пользователь_id_seq"'::regclass);


--
-- Data for Name: Альбом; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Альбом" (id, "Название", "Год_выпуска", "id_исполнителя", "id_жанра") FROM stdin;
\.


--
-- Data for Name: Жанр; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Жанр" (id, "Название", "Описание") FROM stdin;
\.


--
-- Data for Name: Исполнитель; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Исполнитель" (id, "Название", "Рейтинг", "Страна", "Описание") FROM stdin;
\.


--
-- Data for Name: Песня; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Песня" (id, "Название", url, "Количество_прослушиваний", "id_альбома") FROM stdin;
\.


--
-- Data for Name: Песня_в_плейлисте_пользователя; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Песня_в_плейлисте_пользователя" ("id_плейлиста", "id_пользователя", "id_песни") FROM stdin;
\.


--
-- Data for Name: Плейлист; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Плейлист" (id, "Название", "Описание") FROM stdin;
\.


--
-- Data for Name: Подписка; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Подписка" (id, "Тип_подписки", "Цена_за_месяц") FROM stdin;
\.


--
-- Data for Name: Пользователь; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Пользователь" (id, "Имя", "Фамилия", "Псевдоним", email, "Пароль", "Дата_окончания_подписки", "id_подписки") FROM stdin;
\.


--
-- Name: Альбом_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Альбом_id_seq"', 1, false);


--
-- Name: Жанр_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Жанр_id_seq"', 1, false);


--
-- Name: Исполнитель_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Исполнитель_id_seq"', 1, false);


--
-- Name: Песня_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Песня_id_seq"', 1, false);


--
-- Name: Плейлист_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Плейлист_id_seq"', 1, false);


--
-- Name: Подписка_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Подписка_id_seq"', 1, false);


--
-- Name: Пользователь_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Пользователь_id_seq"', 1, false);


--
-- Name: Альбом Альбом_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Альбом"
    ADD CONSTRAINT "Альбом_pkey" PRIMARY KEY (id);


--
-- Name: Песня Песня_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Песня"
    ADD CONSTRAINT "Песня_pkey" PRIMARY KEY (id);


--
-- Name: Песня Песня_url_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Песня"
    ADD CONSTRAINT "Песня_url_key" UNIQUE (url);


--
-- Name: Плейлист Плейлист_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Плейлист"
    ADD CONSTRAINT "Плейлист_pkey" PRIMARY KEY (id);


--
-- Name: Подписка Подписка_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Подписка"
    ADD CONSTRAINT "Подписка_pkey" PRIMARY KEY (id);


--
-- Name: Подписка Подписка_Тип_подписки_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Подписка"
    ADD CONSTRAINT "Подписка_Тип_подписки_key" UNIQUE ("Тип_подписки");


--
-- Name: Пользователь Пользователь_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Пользователь"
    ADD CONSTRAINT "Пользователь_email_key" UNIQUE (email);


--
-- Name: Пользователь Пользователь_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Пользователь"
    ADD CONSTRAINT "Пользователь_pkey" PRIMARY KEY (id);


--
-- Name: Пользователь Пользователь_Псевдоним_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Пользователь"
    ADD CONSTRAINT "Пользователь_Псевдоним_key" UNIQUE ("Псевдоним");


--
-- Name: Жанр жанр_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Жанр"
    ADD CONSTRAINT "жанр_pk" PRIMARY KEY (id);


--
-- Name: Исполнитель исполнитель_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Исполнитель"
    ADD CONSTRAINT "исполнитель_pk" PRIMARY KEY (id);


--
-- Name: жанр_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "жанр_id_uindex" ON public."Жанр" USING btree (id);


--
-- Name: жанр_название_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "жанр_название_uindex" ON public."Жанр" USING btree ("Название");


--
-- Name: исполнитель_id_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "исполнитель_id_uindex" ON public."Исполнитель" USING btree (id);


--
-- Name: исполнитель_название_uindex; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX "исполнитель_название_uindex" ON public."Исполнитель" USING btree ("Название");


--
-- Name: Альбом Альбом_id_жанра_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Альбом"
    ADD CONSTRAINT "Альбом_id_жанра_fkey" FOREIGN KEY ("id_жанра") REFERENCES public."Жанр"(id);


--
-- Name: Альбом Альбом_id_исполнителя_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Альбом"
    ADD CONSTRAINT "Альбом_id_исполнителя_fkey" FOREIGN KEY ("id_исполнителя") REFERENCES public."Исполнитель"(id);


--
-- Name: Песня Песня_id_альбома_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Песня"
    ADD CONSTRAINT "Песня_id_альбома_fkey" FOREIGN KEY ("id_альбома") REFERENCES public."Альбом"(id);


--
-- Name: Песня_в_плейлисте_пользователя Песня_в_плейлист_id_пользователя_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Песня_в_плейлисте_пользователя"
    ADD CONSTRAINT "Песня_в_плейлист_id_пользователя_fkey" FOREIGN KEY ("id_пользователя") REFERENCES public."Пользователь"(id);


--
-- Name: Песня_в_плейлисте_пользователя Песня_в_плейлисте_п_id_плейлиста_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Песня_в_плейлисте_пользователя"
    ADD CONSTRAINT "Песня_в_плейлисте_п_id_плейлиста_fkey" FOREIGN KEY ("id_плейлиста") REFERENCES public."Плейлист"(id);


--
-- Name: Песня_в_плейлисте_пользователя Песня_в_плейлисте_польз_id_песни_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Песня_в_плейлисте_пользователя"
    ADD CONSTRAINT "Песня_в_плейлисте_польз_id_песни_fkey" FOREIGN KEY ("id_песни") REFERENCES public."Песня"(id);


--
-- Name: Пользователь Пользователь_id_подписки_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Пользователь"
    ADD CONSTRAINT "Пользователь_id_подписки_fkey" FOREIGN KEY ("id_подписки") REFERENCES public."Подписка"(id);


--
-- PostgreSQL database dump complete
--

