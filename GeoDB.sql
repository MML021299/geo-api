PGDMP      8                |            GeoDB    17.2    17.2     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            �           1262    16388    GeoDB    DATABASE     �   CREATE DATABASE "GeoDB" WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_Philippines.1252';
    DROP DATABASE "GeoDB";
                     postgres    false                        3079    16419    pgcrypto 	   EXTENSION     <   CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;
    DROP EXTENSION pgcrypto;
                        false            �           0    0    EXTENSION pgcrypto    COMMENT     <   COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';
                             false    2            �            1259    16457    history    TABLE     _   CREATE TABLE public.history (
    id integer NOT NULL,
    ip_address character varying(50)
);
    DROP TABLE public.history;
       public         heap r       postgres    false            �            1259    16456    history_id_seq    SEQUENCE     �   CREATE SEQUENCE public.history_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.history_id_seq;
       public               postgres    false    221            �           0    0    history_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.history_id_seq OWNED BY public.history.id;
          public               postgres    false    220            �            1259    16411    users    TABLE     �   CREATE TABLE public.users (
    id integer NOT NULL,
    username character varying(50) NOT NULL,
    password text NOT NULL
);
    DROP TABLE public.users;
       public         heap r       postgres    false            �            1259    16410    users_id_seq    SEQUENCE     �   CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.users_id_seq;
       public               postgres    false    219            �           0    0    users_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;
          public               postgres    false    218            L           2604    16460 
   history id    DEFAULT     h   ALTER TABLE ONLY public.history ALTER COLUMN id SET DEFAULT nextval('public.history_id_seq'::regclass);
 9   ALTER TABLE public.history ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    221    220    221            K           2604    16414    users id    DEFAULT     d   ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);
 7   ALTER TABLE public.users ALTER COLUMN id DROP DEFAULT;
       public               postgres    false    218    219    219            �          0    16457    history 
   TABLE DATA           1   COPY public.history (id, ip_address) FROM stdin;
    public               postgres    false    221   ,       �          0    16411    users 
   TABLE DATA           7   COPY public.users (id, username, password) FROM stdin;
    public               postgres    false    219   g       �           0    0    history_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('public.history_id_seq', 3, true);
          public               postgres    false    220            �           0    0    users_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('public.users_id_seq', 1, true);
          public               postgres    false    218            P           2606    16462    history history_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.history
    ADD CONSTRAINT history_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.history DROP CONSTRAINT history_pkey;
       public                 postgres    false    221            N           2606    16418    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public                 postgres    false    219            �   +   x�3�4ճ0�37�3�2B�s�����Zi�=... ǽ      �   S   x�3�,N�-�I�T1JT10S�t2�+�H�LK��(�0�����M��0(Iζ,w�J���317H�L�Lw�ӫ*������� uZ�     