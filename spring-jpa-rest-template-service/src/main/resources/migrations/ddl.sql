DROP SCHEMA public;

CREATE SCHEMA public AUTHORIZATION app;

DROP IF EXISTS SEQUENCE public.despesa_id_seq;
CREATE SEQUENCE public.despesa_id_seq
	INCREMENT BY 50
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;

DROP IF EXISTS SEQUENCE public.receita_id_seq;
CREATE SEQUENCE public.receita_id_seq
	INCREMENT BY 50
	MINVALUE 1
	MAXVALUE 9223372036854775807
	START 1
	CACHE 1
	NO CYCLE;

DROP IF EXISTS TABLE public.despesa;
CREATE TABLE public.despesa (
	id bigserial NOT NULL DEFAULT nextval('despesa_id_seq'),
	criada_em timestamp NOT NULL DEFAULT now(),
	descricao varchar(255) NOT NULL,
	realizada_em date NOT NULL,
	valor numeric(15, 2) NOT NULL,
	"version" int8 NOT NULL DEFAULT 0,
	CONSTRAINT despesa_pkey PRIMARY KEY (id)
);

DROP IF EXISTS TABLE public.receita;
CREATE TABLE public.receita (
	id bigserial NOT NULL DEFAULT nextval('receita_id_seq'),
	criada_em timestamp NOT NULL DEFAULT now(),
	descricao varchar(255) NOT NULL,
	realizada_em date NOT NULL,
	valor numeric(15, 2) NOT NULL,
	"version" int8 NOT NULL DEFAULT 0,
	CONSTRAINT receita_pkey PRIMARY KEY (id)
);
