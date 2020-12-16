

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


SET SESSION AUTHORIZATION DEFAULT;

ALTER TABLE public.todos DISABLE TRIGGER ALL;

INSERT INTO public.todos (id, todo, completed, created_at, description) VALUES ('00a47665-4710-44a0-a5f3-f4df1d9b554e', 'Build a Haskell Todo app', false, '2020-11-09 21:47:19.882446+01', 'Use IHP to build a todo app in Haskell without prior Haskell knowledge');


ALTER TABLE public.todos ENABLE TRIGGER ALL;


ALTER TABLE public.comments DISABLE TRIGGER ALL;

INSERT INTO public.comments (id, todo_id, author, comment) VALUES ('d262d093-ede3-4dc2-95d5-f63c6e39afc4', '00a47665-4710-44a0-a5f3-f4df1d9b554e', 'Kenneth', 'This is our first comment!');
INSERT INTO public.comments (id, todo_id, author, comment) VALUES ('81ce3722-fdf6-474e-bb4e-e37fe8b0d4ae', '00a47665-4710-44a0-a5f3-f4df1d9b554e', 'Kenneth', 'Testing the redirect');


ALTER TABLE public.comments ENABLE TRIGGER ALL;


