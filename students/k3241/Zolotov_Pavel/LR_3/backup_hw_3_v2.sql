PGDMP     3                     y         	   homework3    13.2    13.2 J               0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false                       0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false                       0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false                       1262    16394 	   homework3    DATABASE     f   CREATE DATABASE homework3 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'Russian_Russia.1251';
    DROP DATABASE homework3;
                postgres    false            �            1259    16396    author    TABLE     �   CREATE TABLE public.author (
    author_id integer NOT NULL,
    author_email character varying(50),
    author_name character varying(50) NOT NULL,
    author_surname character varying(50) NOT NULL,
    author_patronymic character varying(50)
);
    DROP TABLE public.author;
       public         heap    postgres    false            �            1259    24748    Author_author_id_seq    SEQUENCE     �   ALTER TABLE public.author ALTER COLUMN author_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Author_author_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    200            �            1259    16407    book    TABLE     �   CREATE TABLE public.book (
    book_id integer NOT NULL,
    book_pages integer NOT NULL,
    book_illustrated boolean,
    book_year integer,
    book_name character varying(200) NOT NULL
);
    DROP TABLE public.book;
       public         heap    postgres    false            �            1259    24750    Book_book_id_seq    SEQUENCE     �   ALTER TABLE public.book ALTER COLUMN book_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Book_book_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    202            �            1259    16415    category    TABLE     q   CREATE TABLE public.category (
    category_id integer NOT NULL,
    category character varying(200) NOT NULL
);
    DROP TABLE public.category;
       public         heap    postgres    false            �            1259    24753    Category_category_id_seq    SEQUENCE     �   ALTER TABLE public.category ALTER COLUMN category_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Category_category_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    203            �            1259    24732    client    TABLE     4  CREATE TABLE public.client (
    client_id integer NOT NULL,
    client_name character varying(50) NOT NULL,
    client_surname character varying(50) NOT NULL,
    client_patronymic character varying(50),
    client_address character varying(200) NOT NULL,
    client_phone character varying(13) NOT NULL
);
    DROP TABLE public.client;
       public         heap    postgres    false            �            1259    24755    Client_client_id_seq    SEQUENCE     �   ALTER TABLE public.client ALTER COLUMN client_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Client_client_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    208            �            1259    16439    manager    TABLE       CREATE TABLE public.manager (
    manager_id integer NOT NULL,
    manager_phone character varying(13) NOT NULL,
    manager_name character varying(50) NOT NULL,
    manager_surname character varying(50) NOT NULL,
    manager_patronymic character varying(50)
);
    DROP TABLE public.manager;
       public         heap    postgres    false            �            1259    24757    Manager_manager_id_seq    SEQUENCE     �   ALTER TABLE public.manager ALTER COLUMN manager_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Manager_manager_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    207            �            1259    16434    order    TABLE       CREATE TABLE public."order" (
    order_id integer NOT NULL,
    order_date date NOT NULL,
    order_finish date NOT NULL,
    order_size integer NOT NULL,
    order_status "char" NOT NULL,
    client_id integer NOT NULL,
    manager_id integer NOT NULL
);
    DROP TABLE public."order";
       public         heap    postgres    false            �            1259    24759    Order_order_id_seq    SEQUENCE     �   ALTER TABLE public."order" ALTER COLUMN order_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Order_order_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    206            �            1259    16404    author_book    TABLE     �   CREATE TABLE public.author_book (
    author_id integer NOT NULL,
    book_id integer NOT NULL,
    "order" integer,
    id integer NOT NULL
);
    DROP TABLE public.author_book;
       public         heap    postgres    false            �            1259    24783    author_book_id_seq    SEQUENCE     �   ALTER TABLE public.author_book ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.author_book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    201            �            1259    16423    category_book    TABLE        CREATE TABLE public.category_book (
    book_id integer NOT NULL,
    category_id integer NOT NULL,
    id integer NOT NULL
);
 !   DROP TABLE public.category_book;
       public         heap    postgres    false            �            1259    24790    category_book_id_seq    SEQUENCE     �   ALTER TABLE public.category_book ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.category_book_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    204            �            1259    16426    edition    TABLE       CREATE TABLE public.edition (
    edition_date date NOT NULL,
    edition_size integer NOT NULL,
    edition_warehouse integer NOT NULL,
    edition_price numeric NOT NULL,
    book_id integer NOT NULL,
    order_id integer NOT NULL,
    isbn character varying(13) NOT NULL
);
    DROP TABLE public.edition;
       public         heap    postgres    false            �            1259    24769    edition_order    TABLE     �   CREATE TABLE public.edition_order (
    isbn character varying(13) NOT NULL,
    order_id integer NOT NULL,
    amount integer NOT NULL,
    id integer NOT NULL
);
 !   DROP TABLE public.edition_order;
       public         heap    postgres    false            �            1259    24797    edition_order_id_seq    SEQUENCE     �   ALTER TABLE public.edition_order ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.edition_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);
            public          postgres    false    215                      0    16396    author 
   TABLE DATA           i   COPY public.author (author_id, author_email, author_name, author_surname, author_patronymic) FROM stdin;
    public          postgres    false    200   [                 0    16404    author_book 
   TABLE DATA           F   COPY public.author_book (author_id, book_id, "order", id) FROM stdin;
    public          postgres    false    201   c[                 0    16407    book 
   TABLE DATA           [   COPY public.book (book_id, book_pages, book_illustrated, book_year, book_name) FROM stdin;
    public          postgres    false    202   �[       	          0    16415    category 
   TABLE DATA           9   COPY public.category (category_id, category) FROM stdin;
    public          postgres    false    203   �[       
          0    16423    category_book 
   TABLE DATA           A   COPY public.category_book (book_id, category_id, id) FROM stdin;
    public          postgres    false    204   *\                 0    24732    client 
   TABLE DATA           y   COPY public.client (client_id, client_name, client_surname, client_patronymic, client_address, client_phone) FROM stdin;
    public          postgres    false    208   T\                 0    16426    edition 
   TABLE DATA           x   COPY public.edition (edition_date, edition_size, edition_warehouse, edition_price, book_id, order_id, isbn) FROM stdin;
    public          postgres    false    205   �\                 0    24769    edition_order 
   TABLE DATA           C   COPY public.edition_order (isbn, order_id, amount, id) FROM stdin;
    public          postgres    false    215   K]                 0    16439    manager 
   TABLE DATA           o   COPY public.manager (manager_id, manager_phone, manager_name, manager_surname, manager_patronymic) FROM stdin;
    public          postgres    false    207   h]                 0    16434    order 
   TABLE DATA           v   COPY public."order" (order_id, order_date, order_finish, order_size, order_status, client_id, manager_id) FROM stdin;
    public          postgres    false    206   �]                  0    0    Author_author_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."Author_author_id_seq"', 76, true);
          public          postgres    false    209                        0    0    Book_book_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public."Book_book_id_seq"', 76, true);
          public          postgres    false    210            !           0    0    Category_category_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public."Category_category_id_seq"', 35, true);
          public          postgres    false    211            "           0    0    Client_client_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public."Client_client_id_seq"', 39, true);
          public          postgres    false    212            #           0    0    Manager_manager_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public."Manager_manager_id_seq"', 1, true);
          public          postgres    false    213            $           0    0    Order_order_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public."Order_order_id_seq"', 1, true);
          public          postgres    false    214            %           0    0    author_book_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.author_book_id_seq', 2, true);
          public          postgres    false    216            &           0    0    category_book_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.category_book_id_seq', 2, true);
          public          postgres    false    217            '           0    0    edition_order_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('public.edition_order_id_seq', 1, false);
          public          postgres    false    218            h           2606    16403    author Author_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.author
    ADD CONSTRAINT "Author_pkey" PRIMARY KEY (author_id);
 >   ALTER TABLE ONLY public.author DROP CONSTRAINT "Author_pkey";
       public            postgres    false    200            l           2606    16414    book Book_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY public.book
    ADD CONSTRAINT "Book_pkey" PRIMARY KEY (book_id);
 :   ALTER TABLE ONLY public.book DROP CONSTRAINT "Book_pkey";
       public            postgres    false    202            n           2606    16422    category Category_pkey 
   CONSTRAINT     _   ALTER TABLE ONLY public.category
    ADD CONSTRAINT "Category_pkey" PRIMARY KEY (category_id);
 B   ALTER TABLE ONLY public.category DROP CONSTRAINT "Category_pkey";
       public            postgres    false    203            x           2606    24736    client Client_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.client
    ADD CONSTRAINT "Client_pkey" PRIMARY KEY (client_id);
 >   ALTER TABLE ONLY public.client DROP CONSTRAINT "Client_pkey";
       public            postgres    false    208            r           2606    24678    edition Edition_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.edition
    ADD CONSTRAINT "Edition_pkey" PRIMARY KEY (isbn);
 @   ALTER TABLE ONLY public.edition DROP CONSTRAINT "Edition_pkey";
       public            postgres    false    205            v           2606    24676    manager Manager_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.manager
    ADD CONSTRAINT "Manager_pkey" PRIMARY KEY (manager_id);
 @   ALTER TABLE ONLY public.manager DROP CONSTRAINT "Manager_pkey";
       public            postgres    false    207            t           2606    16438    order Order_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public."order"
    ADD CONSTRAINT "Order_pkey" PRIMARY KEY (order_id);
 >   ALTER TABLE ONLY public."order" DROP CONSTRAINT "Order_pkey";
       public            postgres    false    206            f           2606    24782    edition_order amount_check    CHECK CONSTRAINT     y   ALTER TABLE public.edition_order
    ADD CONSTRAINT amount_check CHECK (((amount > 0) AND (amount < 100000))) NOT VALID;
 ?   ALTER TABLE public.edition_order DROP CONSTRAINT amount_check;
       public          postgres    false    215    215            Z           2606    24668    author author_email_check    CHECK CONSTRAINT     y   ALTER TABLE public.author
    ADD CONSTRAINT author_email_check CHECK (((author_email)::text ~~ '%@%'::text)) NOT VALID;
 >   ALTER TABLE public.author DROP CONSTRAINT author_email_check;
       public          postgres    false    200    200            [           2606    24680    book book_pages_check    CHECK CONSTRAINT     {   ALTER TABLE public.book
    ADD CONSTRAINT book_pages_check CHECK (((book_pages < 10000) AND (book_pages > 0))) NOT VALID;
 :   ALTER TABLE public.book DROP CONSTRAINT book_pages_check;
       public          postgres    false    202    202            \           2606    24681    book book_year_check    CHECK CONSTRAINT     z   ALTER TABLE public.book
    ADD CONSTRAINT book_year_check CHECK (((book_year > 1900) AND (book_year < 2100))) NOT VALID;
 9   ALTER TABLE public.book DROP CONSTRAINT book_year_check;
       public          postgres    false    202    202            p           2606    24796     category_book category_book_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.category_book
    ADD CONSTRAINT category_book_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.category_book DROP CONSTRAINT category_book_pkey;
       public            postgres    false    204            e           2606    24767    client client_phone_check    CHECK CONSTRAINT        ALTER TABLE public.client
    ADD CONSTRAINT client_phone_check CHECK (((client_phone)::text !~~ '%[^0-9]%'::text)) NOT VALID;
 >   ALTER TABLE public.client DROP CONSTRAINT client_phone_check;
       public          postgres    false    208    208            ]           2606    24696    edition edition_date_check    CHECK CONSTRAINT     �   ALTER TABLE public.edition
    ADD CONSTRAINT edition_date_check CHECK (((edition_date >= '1990-01-01'::date) AND (edition_date <= '2100-01-01'::date))) NOT VALID;
 ?   ALTER TABLE public.edition DROP CONSTRAINT edition_date_check;
       public          postgres    false    205    205            z           2606    24803     edition_order edition_order_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY public.edition_order
    ADD CONSTRAINT edition_order_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY public.edition_order DROP CONSTRAINT edition_order_pkey;
       public            postgres    false    215            ^           2606    24684    edition edition_price_check    CHECK CONSTRAINT     �   ALTER TABLE public.edition
    ADD CONSTRAINT edition_price_check CHECK (((edition_price > (0)::numeric) AND (edition_price < (100000)::numeric))) NOT VALID;
 @   ALTER TABLE public.edition DROP CONSTRAINT edition_price_check;
       public          postgres    false    205    205            _           2606    24682    edition edition_size_check    CHECK CONSTRAINT     �   ALTER TABLE public.edition
    ADD CONSTRAINT edition_size_check CHECK (((edition_size > 0) AND (edition_size < 100000))) NOT VALID;
 ?   ALTER TABLE public.edition DROP CONSTRAINT edition_size_check;
       public          postgres    false    205    205            `           2606    24683    edition edition_warehouse_check    CHECK CONSTRAINT     �   ALTER TABLE public.edition
    ADD CONSTRAINT edition_warehouse_check CHECK (((edition_warehouse > 0) AND (edition_warehouse < 100000))) NOT VALID;
 D   ALTER TABLE public.edition DROP CONSTRAINT edition_warehouse_check;
       public          postgres    false    205    205            j           2606    24789    author_book id 
   CONSTRAINT     L   ALTER TABLE ONLY public.author_book
    ADD CONSTRAINT id PRIMARY KEY (id);
 8   ALTER TABLE ONLY public.author_book DROP CONSTRAINT id;
       public            postgres    false    201            d           2606    24768    manager manager_phone_check    CHECK CONSTRAINT     �   ALTER TABLE public.manager
    ADD CONSTRAINT manager_phone_check CHECK (((manager_phone)::text !~~ '%[^0-9]%'::text)) NOT VALID;
 @   ALTER TABLE public.manager DROP CONSTRAINT manager_phone_check;
       public          postgres    false    207    207            a           2606    24694    order order_date_check    CHECK CONSTRAINT     �   ALTER TABLE public."order"
    ADD CONSTRAINT order_date_check CHECK (((order_date >= '1990-01-01'::date) AND (order_date <= '2100-01-01'::date))) NOT VALID;
 =   ALTER TABLE public."order" DROP CONSTRAINT order_date_check;
       public          postgres    false    206    206            b           2606    24695    order order_finish_check    CHECK CONSTRAINT     �   ALTER TABLE public."order"
    ADD CONSTRAINT order_finish_check CHECK (((order_finish >= '1990-01-01'::date) AND (order_finish <= '2100-01-01'::date))) NOT VALID;
 ?   ALTER TABLE public."order" DROP CONSTRAINT order_finish_check;
       public          postgres    false    206    206            c           2606    24685    order order_size_check    CHECK CONSTRAINT        ALTER TABLE public."order"
    ADD CONSTRAINT order_size_check CHECK (((order_size > 0) AND (order_size < 100000))) NOT VALID;
 =   ALTER TABLE public."order" DROP CONSTRAINT order_size_check;
       public          postgres    false    206    206            {           2606    24697    author_book author_id    FK CONSTRAINT     ~   ALTER TABLE ONLY public.author_book
    ADD CONSTRAINT author_id FOREIGN KEY (author_id) REFERENCES public.author(author_id);
 ?   ALTER TABLE ONLY public.author_book DROP CONSTRAINT author_id;
       public          postgres    false    201    2920    200            |           2606    24702    author_book book_id    FK CONSTRAINT     v   ALTER TABLE ONLY public.author_book
    ADD CONSTRAINT book_id FOREIGN KEY (book_id) REFERENCES public.book(book_id);
 =   ALTER TABLE ONLY public.author_book DROP CONSTRAINT book_id;
       public          postgres    false    2924    201    202            ~           2606    24707    category_book book_id    FK CONSTRAINT     x   ALTER TABLE ONLY public.category_book
    ADD CONSTRAINT book_id FOREIGN KEY (book_id) REFERENCES public.book(book_id);
 ?   ALTER TABLE ONLY public.category_book DROP CONSTRAINT book_id;
       public          postgres    false    204    202    2924                       2606    24717    edition book_id    FK CONSTRAINT     r   ALTER TABLE ONLY public.edition
    ADD CONSTRAINT book_id FOREIGN KEY (book_id) REFERENCES public.book(book_id);
 9   ALTER TABLE ONLY public.edition DROP CONSTRAINT book_id;
       public          postgres    false    2924    205    202            }           2606    24727    category_book category_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.category_book
    ADD CONSTRAINT category_id FOREIGN KEY (category_id) REFERENCES public.category(category_id);
 C   ALTER TABLE ONLY public.category_book DROP CONSTRAINT category_id;
       public          postgres    false    204    2926    203            �           2606    24738    order client_id    FK CONSTRAINT     z   ALTER TABLE ONLY public."order"
    ADD CONSTRAINT client_id FOREIGN KEY (client_id) REFERENCES public.client(client_id);
 ;   ALTER TABLE ONLY public."order" DROP CONSTRAINT client_id;
       public          postgres    false    206    2936    208            �           2606    24772    edition_order isbn    FK CONSTRAINT     |   ALTER TABLE ONLY public.edition_order
    ADD CONSTRAINT isbn FOREIGN KEY (isbn) REFERENCES public.edition(isbn) NOT VALID;
 <   ALTER TABLE ONLY public.edition_order DROP CONSTRAINT isbn;
       public          postgres    false    215    2930    205            �           2606    24743    order manager_id    FK CONSTRAINT     ~   ALTER TABLE ONLY public."order"
    ADD CONSTRAINT manager_id FOREIGN KEY (manager_id) REFERENCES public.manager(manager_id);
 <   ALTER TABLE ONLY public."order" DROP CONSTRAINT manager_id;
       public          postgres    false    207    206    2934            �           2606    24777    edition_order order_id    FK CONSTRAINT     �   ALTER TABLE ONLY public.edition_order
    ADD CONSTRAINT order_id FOREIGN KEY (order_id) REFERENCES public."order"(order_id) NOT VALID;
 @   ALTER TABLE ONLY public.edition_order DROP CONSTRAINT order_id;
       public          postgres    false    215    206    2932               N   x�37��,K�sH�M���K���0�¦.�3.컰	�sa��v.s3΂Ԓ"d��/l��t�΀hD�5��qqq �Ab            x�37�47�4�4�27�"CN#�=... /ij         \   x�37�440�,�4����0�¾��x#��27�4J�IC�.6_l��xaׅ�*\�{a����-�^�
�e6\������� �J/6      	      x�36弰�®.l�;�b���� }e
8      
      x�37�46�4�27�F\1z\\\ "��         �   x�����@FϻUlH�&��b,���$���x��$�Lf�}/[��ii��)ֆ3��R��6r\�R-8�J����������<��;���%f��ɧl���4�h`�M~jt�_�{����~��O�e��Z�Ӊ�         E   x�U˱�0�z�@�^��g���e{} !@�D� ��✑���S����w�nk�u0~�6U��            x������ � �         0   x�3�4�424� ��.l��xaǅ�@��{�����8c��b���� ���         +   x�3�4202�50�5��2MuM8�88�-9�b���� ���     