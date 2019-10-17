--
-- PostgreSQL database dump
--

-- Dumped from database version 12.0
-- Dumped by pg_dump version 12.0

-- Started on 2019-10-14 17:08:18 PDT

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
-- TOC entry 203 (class 1259 OID 16797)
-- Name: departments; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departments (
    dept_n character varying(4) NOT NULL,
    dept_name character varying(50) NOT NULL
);


ALTER TABLE public.departments OWNER TO postgres;

--
-- TOC entry 205 (class 1259 OID 16817)
-- Name: dept_emp; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dept_emp (
    emp_n integer NOT NULL,
    dept_n character varying(4) NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL
);


ALTER TABLE public.dept_emp OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 16802)
-- Name: dept_manager; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dept_manager (
    dept_n character varying(4) NOT NULL,
    emp_n integer NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL
);


ALTER TABLE public.dept_manager OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 16792)
-- Name: employees; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.employees (
    emp_n integer NOT NULL,
    birth_date date NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    gender character varying(2) NOT NULL,
    hire_date date NOT NULL
);


ALTER TABLE public.employees OWNER TO postgres;

--
-- TOC entry 207 (class 1259 OID 16838)
-- Name: salaries; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.salaries (
    emp_n integer NOT NULL,
    salary integer NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL
);


ALTER TABLE public.salaries OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 16830)
-- Name: titles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.titles (
    emp_n integer NOT NULL,
    title character varying(50) NOT NULL,
    from_date date NOT NULL,
    to_date date NOT NULL
);


ALTER TABLE public.titles OWNER TO postgres;

--
-- TOC entry 3025 (class 2606 OID 16801)
-- Name: departments departments_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (dept_n);


--
-- TOC entry 3027 (class 2606 OID 16806)
-- Name: dept_manager dept_manager_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_manager
    ADD CONSTRAINT dept_manager_pkey PRIMARY KEY (emp_n);


--
-- TOC entry 3023 (class 2606 OID 16796)
-- Name: employees employees_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.employees
    ADD CONSTRAINT employees_pkey PRIMARY KEY (emp_n);


--
-- TOC entry 3029 (class 2606 OID 16842)
-- Name: salaries salaries_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salaries
    ADD CONSTRAINT salaries_pkey PRIMARY KEY (emp_n);


--
-- TOC entry 3033 (class 2606 OID 16825)
-- Name: dept_emp dept_emp_dept_n_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_emp
    ADD CONSTRAINT dept_emp_dept_n_fkey FOREIGN KEY (dept_n) REFERENCES public.departments(dept_n);


--
-- TOC entry 3032 (class 2606 OID 16820)
-- Name: dept_emp dept_emp_emp_n_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_emp
    ADD CONSTRAINT dept_emp_emp_n_fkey FOREIGN KEY (emp_n) REFERENCES public.employees(emp_n);


--
-- TOC entry 3031 (class 2606 OID 16812)
-- Name: dept_manager dept_manager_dept_n_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_manager
    ADD CONSTRAINT dept_manager_dept_n_fkey FOREIGN KEY (dept_n) REFERENCES public.departments(dept_n);


--
-- TOC entry 3030 (class 2606 OID 16807)
-- Name: dept_manager dept_manager_emp_n_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dept_manager
    ADD CONSTRAINT dept_manager_emp_n_fkey FOREIGN KEY (emp_n) REFERENCES public.employees(emp_n);


--
-- TOC entry 3035 (class 2606 OID 16843)
-- Name: salaries salaries_emp_n_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.salaries
    ADD CONSTRAINT salaries_emp_n_fkey FOREIGN KEY (emp_n) REFERENCES public.employees(emp_n);


--
-- TOC entry 3034 (class 2606 OID 16833)
-- Name: titles titles_emp_n_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.titles
    ADD CONSTRAINT titles_emp_n_fkey FOREIGN KEY (emp_n) REFERENCES public.employees(emp_n);


-- Completed on 2019-10-14 17:08:18 PDT

--
-- PostgreSQL database dump complete
--

