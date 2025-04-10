CREATE TABLE IF NOT EXISTS public.flyway_schema_history
(
    installed_rank integer NOT NULL,
    version character varying(50) COLLATE pg_catalog."default",
    description character varying(200) COLLATE pg_catalog."default" NOT NULL,
    type character varying(20) COLLATE pg_catalog."default" NOT NULL,
    script character varying(1000) COLLATE pg_catalog."default" NOT NULL,
    checksum integer,
    installed_by character varying(100) COLLATE pg_catalog."default" NOT NULL,
    installed_on timestamp without time zone NOT NULL DEFAULT now(),
    execution_time integer NOT NULL,
    success boolean NOT NULL,
    CONSTRAINT flyway_schema_history_pk PRIMARY KEY (installed_rank)
);

CREATE TABLE IF NOT EXISTS public.problems
(
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 9223372036854775807 CACHE 1 ),
    name character varying(300) COLLATE pg_catalog."default" NOT NULL,
    "section-id" smallint NOT NULL,
    "difficulty-id" smallint NOT NULL,
    description character varying(2000) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT problems_pkey PRIMARY KEY (id),
    CONSTRAINT unq_problems_name UNIQUE (name)
);

CREATE TABLE IF NOT EXISTS public."problems-sections"
(
    id smallint NOT NULL GENERATED ALWAYS AS IDENTITY ( INCREMENT 1 START 1 MINVALUE 1 MAXVALUE 32767 CACHE 1 ),
    name character varying(100) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT "pk-problems-sections-id" PRIMARY KEY (id),
    CONSTRAINT unq_problems_sections_name UNIQUE (name)
);

CREATE TABLE IF NOT EXISTS public.examples
(
    id bigint NOT NULL GENERATED ALWAYS AS IDENTITY,
    "problem-id" bigint NOT NULL,
    input character varying NOT NULL,
    output character varying NOT NULL,
    explanation character varying,
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.difficulties
(
    id smallint NOT NULL GENERATED ALWAYS AS IDENTITY,
    name character varying NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT "unq-difficulties-name" UNIQUE (name)
);

ALTER TABLE IF EXISTS public.problems
    ADD CONSTRAINT "problems_section-id_fkey" FOREIGN KEY ("section-id")
    REFERENCES public."problems-sections" (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.problems
    ADD FOREIGN KEY ("difficulty-id")
    REFERENCES public.difficulties (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.examples
    ADD FOREIGN KEY ("problem-id")
    REFERENCES public.problems (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

INSERT INTO
    public."problems-sections"
    (name)
VALUES
    ('Arrays'),
    ('Strings'),
    ('Linked Lists'),
    ('Trees'),
    ('Graphs'),
    ('Dynamic Programming'),
    ('Sorting'),
    ('Searching'),
    ('Math'),
    ('Hash Tables');

INSERT INTO
    public."difficulties"
    (name)
VALUES
    ('EASY'),
    ('MEDIUM'),
    ('HARD');

INSERT INTO
    public.problems
    (name, "section-id", "difficulty-id", description)
VALUES
    ('A + B', 9, 1, 'Two numbers are given, you need to find sum of them.');

INSERT INTO
    "examples"
    ("problem-id", "input", "output")
VALUES
    (1, '8 10', '18'),
    (1, '8 -10', '-2');
