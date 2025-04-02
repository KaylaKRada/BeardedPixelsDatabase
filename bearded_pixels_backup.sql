PGDMP      -                }           bearded_pixels_studio    17.0    17.0 O    N           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            O           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            P           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            Q           1262    16388    bearded_pixels_studio    DATABASE     �   CREATE DATABASE bearded_pixels_studio WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'English_United States.1252';
 %   DROP DATABASE bearded_pixels_studio;
                     postgres    false            R           0    0    DATABASE bearded_pixels_studio    ACL     ?   GRANT ALL ON DATABASE bearded_pixels_studio TO bearded_tucker;
                        postgres    false    4945            �            1259    16391    admin    TABLE       CREATE TABLE public.admin (
    admin_id integer NOT NULL,
    username character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    created_at character varying(255) DEFAULT CURRENT_TIMESTAMP
);
    DROP TABLE public.admin;
       public         heap r       bearded_tucker    false            S           0    0    COLUMN admin.username    ACL     =   GRANT ALL(username) ON TABLE public.admin TO bearded_tucker;
          public               bearded_tucker    false    218            �            1259    16390    admin_admin_id_seq    SEQUENCE     �   CREATE SEQUENCE public.admin_admin_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE public.admin_admin_id_seq;
       public               bearded_tucker    false    218            T           0    0    admin_admin_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE public.admin_admin_id_seq OWNED BY public.admin.admin_id;
          public               bearded_tucker    false    217            �            1259    16460    album_photos    TABLE     c   CREATE TABLE public.album_photos (
    album_id integer NOT NULL,
    photo_id integer NOT NULL
);
     DROP TABLE public.album_photos;
       public         heap r       postgres    false            U           0    0    TABLE album_photos    ACL     :   GRANT ALL ON TABLE public.album_photos TO bearded_tucker;
          public               postgres    false    227            �            1259    16430    albums    TABLE     �   CREATE TABLE public.albums (
    album_id bigint NOT NULL,
    title character varying(255),
    description character varying(255),
    cover_photo_url character varying(255),
    created_at timestamp(6) without time zone
);
    DROP TABLE public.albums;
       public         heap r       bearded_tucker    false            V           0    0    COLUMN albums.title    ACL     ;   GRANT ALL(title) ON TABLE public.albums TO bearded_tucker;
          public               bearded_tucker    false    224            �            1259    16429    albums_album_id_seq    SEQUENCE     �   CREATE SEQUENCE public.albums_album_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.albums_album_id_seq;
       public               bearded_tucker    false    224            W           0    0    albums_album_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.albums_album_id_seq OWNED BY public.albums.album_id;
          public               bearded_tucker    false    223            �            1259    16509    booking_clients    TABLE     i   CREATE TABLE public.booking_clients (
    booking_id integer NOT NULL,
    client_id integer NOT NULL
);
 #   DROP TABLE public.booking_clients;
       public         heap r       postgres    false            X           0    0    TABLE booking_clients    ACL     =   GRANT ALL ON TABLE public.booking_clients TO bearded_tucker;
          public               postgres    false    232            �            1259    16416    bookings    TABLE     ,  CREATE TABLE public.bookings (
    booking_id bigint NOT NULL,
    client_id bigint,
    booking_date timestamp without time zone,
    session_date date,
    location character varying(255),
    session_type character varying(25),
    status character varying(20),
    CONSTRAINT bookings_session_type_check CHECK (((session_type)::text = ANY ((ARRAY['couples'::character varying, 'family'::character varying, 'group'::character varying, 'single'::character varying, 'portrait'::character varying, 'wedding'::character varying, 'event'::character varying, 'other'::character varying])::text[]))),
    CONSTRAINT bookings_status_check CHECK (((status)::text = ANY ((ARRAY['pending'::character varying, 'confirmed'::character varying, 'completed'::character varying, 'cancelled'::character varying])::text[])))
);
    DROP TABLE public.bookings;
       public         heap r       bearded_tucker    false            �            1259    16415    bookings_booking_id_seq    SEQUENCE     �   CREATE SEQUENCE public.bookings_booking_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.bookings_booking_id_seq;
       public               bearded_tucker    false    222            Y           0    0    bookings_booking_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.bookings_booking_id_seq OWNED BY public.bookings.booking_id;
          public               bearded_tucker    false    221            �            1259    16403    clients    TABLE     �   CREATE TABLE public.clients (
    client_id bigint NOT NULL,
    name character varying(255),
    phone character varying(255),
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    admin_id integer
);
    DROP TABLE public.clients;
       public         heap r       bearded_tucker    false            �            1259    16402    clients_client_id_seq    SEQUENCE     �   CREATE SEQUENCE public.clients_client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.clients_client_id_seq;
       public               bearded_tucker    false    220            Z           0    0    clients_client_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.clients_client_id_seq OWNED BY public.clients.client_id;
          public               bearded_tucker    false    219            �            1259    16490    order_items    TABLE     �   CREATE TABLE public.order_items (
    order_item_id integer NOT NULL,
    order_id integer,
    photo_id integer,
    quantity integer,
    price numeric(10,2),
    subtotal numeric(10,2) GENERATED ALWAYS AS (((quantity)::numeric * price)) STORED
);
    DROP TABLE public.order_items;
       public         heap r       postgres    false            [           0    0    TABLE order_items    ACL     9   GRANT ALL ON TABLE public.order_items TO bearded_tucker;
          public               postgres    false    231            �            1259    16489    order_items_order_item_id_seq    SEQUENCE     �   CREATE SEQUENCE public.order_items_order_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.order_items_order_item_id_seq;
       public               postgres    false    231            \           0    0    order_items_order_item_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE public.order_items_order_item_id_seq OWNED BY public.order_items.order_item_id;
          public               postgres    false    230            ]           0    0 &   SEQUENCE order_items_order_item_id_seq    ACL     W   GRANT SELECT,USAGE ON SEQUENCE public.order_items_order_item_id_seq TO bearded_tucker;
          public               postgres    false    230            �            1259    16476    orders    TABLE     �  CREATE TABLE public.orders (
    order_id integer NOT NULL,
    total_amount numeric(10,2),
    client_id integer,
    order_date timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    status character varying(20),
    CONSTRAINT orders_status_check CHECK (((status)::text = ANY ((ARRAY['processing'::character varying, 'shipped'::character varying, 'delivered'::character varying])::text[])))
);
    DROP TABLE public.orders;
       public         heap r       postgres    false            ^           0    0    TABLE orders    ACL     4   GRANT ALL ON TABLE public.orders TO bearded_tucker;
          public               postgres    false    229            �            1259    16475    orders_order_id_seq    SEQUENCE     �   CREATE SEQUENCE public.orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.orders_order_id_seq;
       public               postgres    false    229            _           0    0    orders_order_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.orders_order_id_seq OWNED BY public.orders.order_id;
          public               postgres    false    228            `           0    0    SEQUENCE orders_order_id_seq    ACL     M   GRANT SELECT,USAGE ON SEQUENCE public.orders_order_id_seq TO bearded_tucker;
          public               postgres    false    228            �            1259    16443    photos    TABLE     �   CREATE TABLE public.photos (
    photo_id bigint NOT NULL,
    title character varying(255),
    uploaded_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    description character varying(255),
    price numeric(38,2)
);
    DROP TABLE public.photos;
       public         heap r       bearded_tucker    false            �            1259    16442    photos_photo_id_seq    SEQUENCE     �   CREATE SEQUENCE public.photos_photo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.photos_photo_id_seq;
       public               bearded_tucker    false    226            a           0    0    photos_photo_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.photos_photo_id_seq OWNED BY public.photos.photo_id;
          public               bearded_tucker    false    225            }           2604    16394    admin admin_id    DEFAULT     p   ALTER TABLE ONLY public.admin ALTER COLUMN admin_id SET DEFAULT nextval('public.admin_admin_id_seq'::regclass);
 =   ALTER TABLE public.admin ALTER COLUMN admin_id DROP DEFAULT;
       public               bearded_tucker    false    218    217    218            �           2604    16530    albums album_id    DEFAULT     r   ALTER TABLE ONLY public.albums ALTER COLUMN album_id SET DEFAULT nextval('public.albums_album_id_seq'::regclass);
 >   ALTER TABLE public.albums ALTER COLUMN album_id DROP DEFAULT;
       public               bearded_tucker    false    223    224    224            �           2604    16547    bookings booking_id    DEFAULT     z   ALTER TABLE ONLY public.bookings ALTER COLUMN booking_id SET DEFAULT nextval('public.bookings_booking_id_seq'::regclass);
 B   ALTER TABLE public.bookings ALTER COLUMN booking_id DROP DEFAULT;
       public               bearded_tucker    false    221    222    222                       2604    16568    clients client_id    DEFAULT     v   ALTER TABLE ONLY public.clients ALTER COLUMN client_id SET DEFAULT nextval('public.clients_client_id_seq'::regclass);
 @   ALTER TABLE public.clients ALTER COLUMN client_id DROP DEFAULT;
       public               bearded_tucker    false    219    220    220            �           2604    16493    order_items order_item_id    DEFAULT     �   ALTER TABLE ONLY public.order_items ALTER COLUMN order_item_id SET DEFAULT nextval('public.order_items_order_item_id_seq'::regclass);
 H   ALTER TABLE public.order_items ALTER COLUMN order_item_id DROP DEFAULT;
       public               postgres    false    231    230    231            �           2604    16479    orders order_id    DEFAULT     r   ALTER TABLE ONLY public.orders ALTER COLUMN order_id SET DEFAULT nextval('public.orders_order_id_seq'::regclass);
 >   ALTER TABLE public.orders ALTER COLUMN order_id DROP DEFAULT;
       public               postgres    false    228    229    229            �           2604    16592    photos photo_id    DEFAULT     r   ALTER TABLE ONLY public.photos ALTER COLUMN photo_id SET DEFAULT nextval('public.photos_photo_id_seq'::regclass);
 >   ALTER TABLE public.photos ALTER COLUMN photo_id DROP DEFAULT;
       public               bearded_tucker    false    225    226    226            =          0    16391    admin 
   TABLE DATA           P   COPY public.admin (admin_id, username, email, password, created_at) FROM stdin;
    public               bearded_tucker    false    218   �`       F          0    16460    album_photos 
   TABLE DATA           :   COPY public.album_photos (album_id, photo_id) FROM stdin;
    public               postgres    false    227   9a       C          0    16430    albums 
   TABLE DATA           [   COPY public.albums (album_id, title, description, cover_photo_url, created_at) FROM stdin;
    public               bearded_tucker    false    224   Va       K          0    16509    booking_clients 
   TABLE DATA           @   COPY public.booking_clients (booking_id, client_id) FROM stdin;
    public               postgres    false    232   9b       A          0    16416    bookings 
   TABLE DATA           u   COPY public.bookings (booking_id, client_id, booking_date, session_date, location, session_type, status) FROM stdin;
    public               bearded_tucker    false    222   fb       ?          0    16403    clients 
   TABLE DATA           O   COPY public.clients (client_id, name, phone, created_at, admin_id) FROM stdin;
    public               bearded_tucker    false    220   /c       J          0    16490    order_items 
   TABLE DATA           Y   COPY public.order_items (order_item_id, order_id, photo_id, quantity, price) FROM stdin;
    public               postgres    false    231   )d       H          0    16476    orders 
   TABLE DATA           W   COPY public.orders (order_id, total_amount, client_id, order_date, status) FROM stdin;
    public               postgres    false    229   Fd       E          0    16443    photos 
   TABLE DATA           R   COPY public.photos (photo_id, title, uploaded_at, description, price) FROM stdin;
    public               bearded_tucker    false    226   �d       b           0    0    admin_admin_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('public.admin_admin_id_seq', 3, true);
          public               bearded_tucker    false    217            c           0    0    albums_album_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.albums_album_id_seq', 10, true);
          public               bearded_tucker    false    223            d           0    0    bookings_booking_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.bookings_booking_id_seq', 6, true);
          public               bearded_tucker    false    221            e           0    0    clients_client_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.clients_client_id_seq', 11, true);
          public               bearded_tucker    false    219            f           0    0    order_items_order_item_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('public.order_items_order_item_id_seq', 1, false);
          public               postgres    false    230            g           0    0    orders_order_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.orders_order_id_seq', 3, true);
          public               postgres    false    228            h           0    0    photos_photo_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.photos_photo_id_seq', 6, true);
          public               bearded_tucker    false    225            �           2606    16525    admin admin_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.admin DROP CONSTRAINT admin_email_key;
       public                 bearded_tucker    false    218            �           2606    16397    admin admin_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (admin_id);
 :   ALTER TABLE ONLY public.admin DROP CONSTRAINT admin_pkey;
       public                 bearded_tucker    false    218            �           2606    16529    admin admin_username_key 
   CONSTRAINT     W   ALTER TABLE ONLY public.admin
    ADD CONSTRAINT admin_username_key UNIQUE (username);
 B   ALTER TABLE ONLY public.admin DROP CONSTRAINT admin_username_key;
       public                 bearded_tucker    false    218            �           2606    16464    album_photos album_photos_pkey 
   CONSTRAINT     l   ALTER TABLE ONLY public.album_photos
    ADD CONSTRAINT album_photos_pkey PRIMARY KEY (album_id, photo_id);
 H   ALTER TABLE ONLY public.album_photos DROP CONSTRAINT album_photos_pkey;
       public                 postgres    false    227    227            �           2606    16532    albums albums_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.albums
    ADD CONSTRAINT albums_pkey PRIMARY KEY (album_id);
 <   ALTER TABLE ONLY public.albums DROP CONSTRAINT albums_pkey;
       public                 bearded_tucker    false    224            �           2606    16513 $   booking_clients booking_clients_pkey 
   CONSTRAINT     u   ALTER TABLE ONLY public.booking_clients
    ADD CONSTRAINT booking_clients_pkey PRIMARY KEY (booking_id, client_id);
 N   ALTER TABLE ONLY public.booking_clients DROP CONSTRAINT booking_clients_pkey;
       public                 postgres    false    232    232            �           2606    16549    bookings bookings_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_pkey PRIMARY KEY (booking_id);
 @   ALTER TABLE ONLY public.bookings DROP CONSTRAINT bookings_pkey;
       public                 bearded_tucker    false    222            �           2606    16570    clients clients_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (client_id);
 >   ALTER TABLE ONLY public.clients DROP CONSTRAINT clients_pkey;
       public                 bearded_tucker    false    220            �           2606    16496    order_items order_items_pkey 
   CONSTRAINT     e   ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (order_item_id);
 F   ALTER TABLE ONLY public.order_items DROP CONSTRAINT order_items_pkey;
       public                 postgres    false    231            �           2606    16483    orders orders_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (order_id);
 <   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_pkey;
       public                 postgres    false    229            �           2606    16594    photos photos_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.photos
    ADD CONSTRAINT photos_pkey PRIMARY KEY (photo_id);
 <   ALTER TABLE ONLY public.photos DROP CONSTRAINT photos_pkey;
       public                 bearded_tucker    false    226            �           2606    16538 '   album_photos album_photos_album_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.album_photos
    ADD CONSTRAINT album_photos_album_id_fkey FOREIGN KEY (album_id) REFERENCES public.albums(album_id);
 Q   ALTER TABLE ONLY public.album_photos DROP CONSTRAINT album_photos_album_id_fkey;
       public               postgres    false    227    4759    224            �           2606    16595 '   album_photos album_photos_photo_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.album_photos
    ADD CONSTRAINT album_photos_photo_id_fkey FOREIGN KEY (photo_id) REFERENCES public.photos(photo_id);
 Q   ALTER TABLE ONLY public.album_photos DROP CONSTRAINT album_photos_photo_id_fkey;
       public               postgres    false    227    226    4761            �           2606    16550 /   booking_clients booking_clients_booking_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.booking_clients
    ADD CONSTRAINT booking_clients_booking_id_fkey FOREIGN KEY (booking_id) REFERENCES public.bookings(booking_id) ON DELETE CASCADE;
 Y   ALTER TABLE ONLY public.booking_clients DROP CONSTRAINT booking_clients_booking_id_fkey;
       public               postgres    false    222    4757    232            �           2606    16576 .   booking_clients booking_clients_client_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.booking_clients
    ADD CONSTRAINT booking_clients_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.clients(client_id) ON DELETE CASCADE;
 X   ALTER TABLE ONLY public.booking_clients DROP CONSTRAINT booking_clients_client_id_fkey;
       public               postgres    false    4755    232    220            �           2606    16581     bookings bookings_client_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.clients(client_id) ON DELETE CASCADE;
 J   ALTER TABLE ONLY public.bookings DROP CONSTRAINT bookings_client_id_fkey;
       public               bearded_tucker    false    220    222    4755            �           2606    16410    clients clients_admin_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_admin_id_fkey FOREIGN KEY (admin_id) REFERENCES public.admin(admin_id) ON DELETE CASCADE;
 G   ALTER TABLE ONLY public.clients DROP CONSTRAINT clients_admin_id_fkey;
       public               bearded_tucker    false    4751    220    218            �           2606    16497 %   order_items order_items_order_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(order_id);
 O   ALTER TABLE ONLY public.order_items DROP CONSTRAINT order_items_order_id_fkey;
       public               postgres    false    4765    229    231            �           2606    16600 %   order_items order_items_photo_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_photo_id_fkey FOREIGN KEY (photo_id) REFERENCES public.photos(photo_id);
 O   ALTER TABLE ONLY public.order_items DROP CONSTRAINT order_items_photo_id_fkey;
       public               postgres    false    226    231    4761            �           2606    16571    orders orders_client_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.clients(client_id);
 F   ALTER TABLE ONLY public.orders DROP CONSTRAINT orders_client_id_fkey;
       public               postgres    false    229    220    4755            =   �   x�-�1�  �NQ �JE���ut��c�6`���t{�Cv��7���g���|�0��"�!�Bݔi���C�Pa- �
�3ʁ�G�T\3R�a�#��K�J��[t���]��ԇ�C�N��q���6�?$��.�0�      F      x������ � �      C   �   x�u��N�@Ek�+���G��$"Ѭ��İ�<����{LP
�\Ʌ-��k_�X��3���q��s�A��3�~sRA��Д{��5��y�5OoEۯ�'��K)FN
�Ys`�7r�E?j\�ٴ@�aq��R��`�9��X�dc�WJؤ"�3s��Z�������R�爎���\�I$����/8;M�7���&�˒���Iks       K      x�3�4�2�4�2�4�2������� �      A   �   x����
�0@��Wdr��jS�M�\��%�Qi��ҿ7U�J]D�[��B��$b��!el~�׍þr�9I�Z��Uv��(�BfJ�d%sC�d�{Jf��7M�@6��rX�FWa��ȥ�t�B� �����vE�Z���M��e?Ԥ0�d�]���ҵp���R煾��r��q�      ?   �   x��ѻn�0Й�
�����ʘ��tI:val1�ȁ���W)� R@�@����%��s�Ŏ[U��$U�JRQb)�Z�z�j�jҵ*����tmVp�����t�q�����层��n��\
/g��'�G������[cf��,��������M��vW[q燴�/l����xj��x�>v��:{���NSU������>�tN���yQ��P��      J      x������ � �      H   J   x�3�425�30�4�4202�54�50T00�#��̂��.#�2�ʌ9!�̱*+(�ON-.��K����� ;y�      E   �   x�}��n� E����@��i2�&]t��:>�ߗ)�i�h	�sϽ�b�F�q���e(��� b�M��@Y�a�u�`;�%�9�ƙ�;�Y�3�Y�H3,�9����:��y&Ĭdgu�^��1�_�#\i��\R�K>s�*D3(Gk��n��H�"=���c��%{�u���3@�8o:��	,��e)~PM����fe��L�=���%xW�]%
Ѷ��,Q@�iuQi-���y+�,�!�y     