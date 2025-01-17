PGDMP         "                x            postgres    11.7    11.7 �    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                       false            �           1262    13012    postgres    DATABASE     �   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'French_France.1252' LC_CTYPE = 'French_France.1252';
    DROP DATABASE postgres;
             postgres    false            �           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                  postgres    false    3035                        2615    16609    fac1    SCHEMA        CREATE SCHEMA fac1;
    DROP SCHEMA fac1;
             postgres    false            �            1259    16612    article    TABLE     �  CREATE TABLE fac1.article (
    type character varying(1),
    reference character varying(20),
    nomarticle character varying(50),
    prixachat numeric(10,2),
    tauxtaxe numeric(10,2),
    unite character varying(10),
    minqte numeric(10,2),
    image character varying(100),
    user_create character varying(25),
    date_maj timestamp with time zone,
    date_create timestamp with time zone DEFAULT now() NOT NULL,
    id bigint NOT NULL,
    idcateg bigint,
    idcompte bigint
);
    DROP TABLE fac1.article;
       fac1         postgres    false    6            �           0    0    COLUMN article.type    COMMENT     M   COMMENT ON COLUMN fac1.article.type IS 'type d''article : service, produit';
            fac1       postgres    false    199            �           0    0    COLUMN article.reference    COMMENT     �   COMMENT ON COLUMN fac1.article.reference IS 'référence de l''article représente la numérotation du fournisseur ou  du client
cette numérotation est définit par tiers ';
            fac1       postgres    false    199            �           0    0    COLUMN article.tauxtaxe    COMMENT     �   COMMENT ON COLUMN fac1.article.tauxtaxe IS 'tauxtaxe : montant de taxe 
exemple: 0.19,0.17,0.09,...
pour affichage on affiche 19%,17%,9%,...';
            fac1       postgres    false    199            �           0    0    COLUMN article.unite    COMMENT     _   COMMENT ON COLUMN fac1.article.unite IS 'unite: unité de mesure 
ex: heure, kg,m2, km,.....';
            fac1       postgres    false    199            �           0    0    COLUMN article.minqte    COMMENT     �   COMMENT ON COLUMN fac1.article.minqte IS 'minqte: quantité minimum de l''article
cette quantité est utilisé pour le module Gestion de stock  ';
            fac1       postgres    false    199            �           0    0    COLUMN article.date_maj    COMMENT     K   COMMENT ON COLUMN fac1.article.date_maj IS 'derniére date de mis a jour';
            fac1       postgres    false    199            �            1259    16975    article_id_seq    SEQUENCE     u   CREATE SEQUENCE fac1.article_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE fac1.article_id_seq;
       fac1       postgres    false    199    6            �           0    0    article_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE fac1.article_id_seq OWNED BY fac1.article.id;
            fac1       postgres    false    220            �            1259    16617    bl    TABLE     7  CREATE TABLE fac1.bl (
    blnum character varying(8) NOT NULL,
    bldat date,
    iddevis bigint,
    idfacture bigint,
    date_create timestamp with time zone DEFAULT now() NOT NULL,
    date_maj timestamp with time zone,
    user_create character varying(25),
    id bigint NOT NULL,
    idtiers bigint
);
    DROP TABLE fac1.bl;
       fac1         postgres    false    6            �           0    0    COLUMN bl.blnum    COMMENT     �   COMMENT ON COLUMN fac1.bl.blnum IS 'blnum: numéro du bon de livraison 
ex: 00000/20
pour l''état d''édition 
ça sera : BL00000/20 
';
            fac1       postgres    false    200            �           0    0    COLUMN bl.iddevis    COMMENT     F   COMMENT ON COLUMN fac1.bl.iddevis IS 'iddevis: le numéro du devis ';
            fac1       postgres    false    200            �           0    0    COLUMN bl.idfacture    COMMENT     V   COMMENT ON COLUMN fac1.bl.idfacture IS 'idfacture: c''est le numéro de la facture ';
            fac1       postgres    false    200            �           0    0    COLUMN bl.date_create    COMMENT     =   COMMENT ON COLUMN fac1.bl.date_create IS 'date de creation';
            fac1       postgres    false    200            �            1259    16983 	   bl_id_seq    SEQUENCE     p   CREATE SEQUENCE fac1.bl_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    DROP SEQUENCE fac1.bl_id_seq;
       fac1       postgres    false    200    6            �           0    0 	   bl_id_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE fac1.bl_id_seq OWNED BY fac1.bl.id;
            fac1       postgres    false    221            �            1259    16625 	   detail_bl    TABLE     '  CREATE TABLE fac1.detail_bl (
    idarticle bigint,
    duree numeric(10,2),
    qte numeric(10,2),
    blid bigint NOT NULL,
    date_create timestamp with time zone DEFAULT now() NOT NULL,
    user_create character varying(25),
    date_maj timestamp with time zone,
    id bigint NOT NULL
);
    DROP TABLE fac1.detail_bl;
       fac1         postgres    false    6            �            1259    17014    detail_bl_id_seq    SEQUENCE     w   CREATE SEQUENCE fac1.detail_bl_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE fac1.detail_bl_id_seq;
       fac1       postgres    false    6    202            �           0    0    detail_bl_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE fac1.detail_bl_id_seq OWNED BY fac1.detail_bl.id;
            fac1       postgres    false    222            �            1259    16623    detail_bl_seq    SEQUENCE     t   CREATE SEQUENCE fac1.detail_bl_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE fac1.detail_bl_seq;
       fac1       postgres    false    6            �            1259    16632    detail_devis    TABLE     �  CREATE TABLE fac1.detail_devis (
    idarticle integer,
    duree numeric(10,2),
    qte numeric(10,2),
    pu numeric(10,2),
    mtn numeric(10,2),
    remise numeric(10,2),
    mtva numeric(10,2),
    mttc numeric(10,2),
    date_create timestamp with time zone DEFAULT now() NOT NULL,
    user_create character varying(25),
    date_maj timestamp with time zone,
    id bigint NOT NULL,
    idttv bigint,
    idtr bigint,
    iddevis bigint
);
    DROP TABLE fac1.detail_devis;
       fac1         postgres    false    6            �            1259    17022    detail_devis_id_seq    SEQUENCE     z   CREATE SEQUENCE fac1.detail_devis_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE fac1.detail_devis_id_seq;
       fac1       postgres    false    6    204            �           0    0    detail_devis_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE fac1.detail_devis_id_seq OWNED BY fac1.detail_devis.id;
            fac1       postgres    false    223            �            1259    16630    detail_devis_seq    SEQUENCE     w   CREATE SEQUENCE fac1.detail_devis_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE fac1.detail_devis_seq;
       fac1       postgres    false    6            �            1259    16639    detail_facture    TABLE     �  CREATE TABLE fac1.detail_facture (
    idarticle integer,
    duree numeric(10,2),
    qte numeric(10,2),
    pu numeric(10,2),
    mtn numeric(10,2),
    remise numeric(10,2),
    mtva numeric(10,2),
    mttc numeric(10,2),
    idfacture bigint,
    date_create character varying DEFAULT now() NOT NULL,
    user_create character varying(25),
    date_maj timestamp with time zone,
    id bigint NOT NULL,
    idttv bigint,
    idtr bigint
);
     DROP TABLE fac1.detail_facture;
       fac1         postgres    false    6            �            1259    17030    detail_facture_id_seq    SEQUENCE     |   CREATE SEQUENCE fac1.detail_facture_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE fac1.detail_facture_id_seq;
       fac1       postgres    false    206    6            �           0    0    detail_facture_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE fac1.detail_facture_id_seq OWNED BY fac1.detail_facture.id;
            fac1       postgres    false    224            �            1259    16637    detail_facture_seq    SEQUENCE     y   CREATE SEQUENCE fac1.detail_facture_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE fac1.detail_facture_seq;
       fac1       postgres    false    6            �            1259    16647 
   deviis_seq    SEQUENCE     q   CREATE SEQUENCE fac1.deviis_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    DROP SEQUENCE fac1.deviis_seq;
       fac1       postgres    false    6            �            1259    16649    devis    TABLE     �  CREATE TABLE fac1.devis (
    devdat date,
    devmtn numeric(10,2),
    devremise numeric(10,2),
    devtva numeric(10,2),
    devtmb numeric(10,2),
    devttc numeric(10,2),
    mrgcod character varying(2),
    date_create timestamp with time zone DEFAULT now(),
    user_create character varying(25),
    date_maj timestamp with time zone,
    devnum character varying(8),
    id bigint NOT NULL,
    codetiers bigint
);
    DROP TABLE fac1.devis;
       fac1         postgres    false    6            �            1259    17041    devis_id_seq    SEQUENCE     s   CREATE SEQUENCE fac1.devis_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE fac1.devis_id_seq;
       fac1       postgres    false    208    6            �           0    0    devis_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE fac1.devis_id_seq OWNED BY fac1.devis.id;
            fac1       postgres    false    225            �            1259    16656    facture    TABLE     �  CREATE TABLE fac1.facture (
    factdat date,
    factmtn numeric(10,2),
    factremise numeric(10,2),
    facttva numeric(10,2),
    facttmb numeric(10,2),
    factttc numeric(10,2),
    mrgcod character varying(2),
    date_create timestamp with time zone DEFAULT now() NOT NULL,
    user_create character varying(25),
    date_maj timestamp with time zone,
    id bigint NOT NULL,
    codetiers bigint,
    facnum character varying(8)
);
    DROP TABLE fac1.facture;
       fac1         postgres    false    6            �            1259    17050    facture_id_seq    SEQUENCE     u   CREATE SEQUENCE fac1.facture_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE fac1.facture_id_seq;
       fac1       postgres    false    6    210            �           0    0    facture_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE fac1.facture_id_seq OWNED BY fac1.facture.id;
            fac1       postgres    false    226            �            1259    16654    facture_seq    SEQUENCE     r   CREATE SEQUENCE fac1.facture_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
     DROP SEQUENCE fac1.facture_seq;
       fac1       postgres    false    6            �            1259    16661    infotrs    TABLE     �  CREATE TABLE fac1.infotrs (
    paycod character varying(6) NOT NULL,
    trsadr character varying(80),
    trsvil character varying(80),
    trstel character varying(20),
    trsfax character varying(20),
    trsweb character varying(80),
    trseml character varying(80),
    trsbnq character varying(80),
    dateinfo date,
    id bigint NOT NULL,
    codetiers bigint,
    date_maj timestamp with time zone,
    date_create timestamp with time zone,
    user_create character varying(25)
);
    DROP TABLE fac1.infotrs;
       fac1         postgres    false    6            �            1259    17058    infotrs_id_seq    SEQUENCE     u   CREATE SEQUENCE fac1.infotrs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE fac1.infotrs_id_seq;
       fac1       postgres    false    6    211            �           0    0    infotrs_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE fac1.infotrs_id_seq OWNED BY fac1.infotrs.id;
            fac1       postgres    false    227            �            1259    16664    prix_article    TABLE     8  CREATE TABLE fac1.prix_article (
    prix numeric(20,2),
    idarticle bigint,
    date_prix timestamp with time zone DEFAULT now(),
    active boolean DEFAULT true,
    id bigint NOT NULL,
    date_create timestamp with time zone,
    user_create character varying(25),
    date_maj timestamp with time zone
);
    DROP TABLE fac1.prix_article;
       fac1         postgres    false    6            �            1259    17066    prix_article_id_seq    SEQUENCE     z   CREATE SEQUENCE fac1.prix_article_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE fac1.prix_article_id_seq;
       fac1       postgres    false    212    6            �           0    0    prix_article_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE fac1.prix_article_id_seq OWNED BY fac1.prix_article.id;
            fac1       postgres    false    228            �            1259    16671    ref_categ_tiers    TABLE     �   CREATE TABLE fac1.ref_categ_tiers (
    libelle character varying(20),
    id bigint NOT NULL,
    user_create character varying(25),
    date_create timestamp with time zone,
    date_maj timestamp with time zone
);
 !   DROP TABLE fac1.ref_categ_tiers;
       fac1         postgres    false    6            �            1259    17074    ref_categ_tiers_id_seq    SEQUENCE     }   CREATE SEQUENCE fac1.ref_categ_tiers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE fac1.ref_categ_tiers_id_seq;
       fac1       postgres    false    6    213            �           0    0    ref_categ_tiers_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE fac1.ref_categ_tiers_id_seq OWNED BY fac1.ref_categ_tiers.id;
            fac1       postgres    false    229            �            1259    16674    ref_categorie    TABLE     �   CREATE TABLE fac1.ref_categorie (
    libelle character varying(50),
    id bigint NOT NULL,
    date_create timestamp with time zone,
    date_maj timestamp with time zone,
    user_create character varying(25)
);
    DROP TABLE fac1.ref_categorie;
       fac1         postgres    false    6            �            1259    17082    ref_categorie_id_seq    SEQUENCE     {   CREATE SEQUENCE fac1.ref_categorie_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE fac1.ref_categorie_id_seq;
       fac1       postgres    false    6    214            �           0    0    ref_categorie_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE fac1.ref_categorie_id_seq OWNED BY fac1.ref_categorie.id;
            fac1       postgres    false    230            �            1259    16677 
   ref_compte    TABLE       CREATE TABLE fac1.ref_compte (
    scfcod character varying(6) NOT NULL,
    libelle character varying(50),
    datecmp date,
    id bigint NOT NULL,
    user_create character varying(25),
    date_create timestamp with time zone,
    date_maj character varying(25)
);
    DROP TABLE fac1.ref_compte;
       fac1         postgres    false    6            �            1259    17090    ref_compte_id_seq    SEQUENCE     x   CREATE SEQUENCE fac1.ref_compte_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE fac1.ref_compte_id_seq;
       fac1       postgres    false    215    6            �           0    0    ref_compte_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE fac1.ref_compte_id_seq OWNED BY fac1.ref_compte.id;
            fac1       postgres    false    231            �            1259    16680    ref_type_taux    TABLE     �   CREATE TABLE fac1.ref_type_taux (
    libelle character varying(20),
    id bigint NOT NULL,
    date_maj timestamp with time zone,
    user_create character varying(25),
    date_create timestamp with time zone
);
    DROP TABLE fac1.ref_type_taux;
       fac1         postgres    false    6            �            1259    17098    ref_type_taux_id_seq    SEQUENCE     {   CREATE SEQUENCE fac1.ref_type_taux_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE fac1.ref_type_taux_id_seq;
       fac1       postgres    false    216    6            �           0    0    ref_type_taux_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE fac1.ref_type_taux_id_seq OWNED BY fac1.ref_type_taux.id;
            fac1       postgres    false    232            �            1259    16683    ref_type_tiers    TABLE     �   CREATE TABLE fac1.ref_type_tiers (
    tirlib character varying(40),
    id bigint NOT NULL,
    date_create timestamp with time zone,
    date_maj timestamp with time zone,
    user_create character varying(25)
);
     DROP TABLE fac1.ref_type_tiers;
       fac1         postgres    false    6            �            1259    17106    ref_type_tiers_id_seq    SEQUENCE     |   CREATE SEQUENCE fac1.ref_type_tiers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE fac1.ref_type_tiers_id_seq;
       fac1       postgres    false    6    217            �           0    0    ref_type_tiers_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE fac1.ref_type_tiers_id_seq OWNED BY fac1.ref_type_tiers.id;
            fac1       postgres    false    233            �            1259    16610    sequence_article    SEQUENCE     w   CREATE SEQUENCE fac1.sequence_article
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE fac1.sequence_article;
       fac1       postgres    false    6            �            1259    16686    taux    TABLE     �   CREATE TABLE fac1.taux (
    libelle character varying(20),
    mtntaxe numeric(10,2),
    id bigint NOT NULL,
    idttaux bigint,
    date_create timestamp with time zone,
    date_maj timestamp with time zone,
    user_create character varying(25)
);
    DROP TABLE fac1.taux;
       fac1         postgres    false    6            �            1259    17122    taux_id_seq    SEQUENCE     r   CREATE SEQUENCE fac1.taux_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
     DROP SEQUENCE fac1.taux_id_seq;
       fac1       postgres    false    6    218            �           0    0    taux_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE fac1.taux_id_seq OWNED BY fac1.taux.id;
            fac1       postgres    false    235            �            1259    16689    tiers    TABLE     �  CREATE TABLE fac1.tiers (
    trscod character varying(6) NOT NULL,
    trsnom character varying(80),
    trsnif character varying(20),
    trsnis integer,
    trsrc character varying(20),
    idcatiers bigint,
    date_create timestamp with time zone DEFAULT now() NOT NULL,
    user_create character varying(25),
    date_maj timestamp with time zone,
    id bigint NOT NULL,
    idtyptiers bigint,
    idcompte bigint
);
    DROP TABLE fac1.tiers;
       fac1         postgres    false    6            �            1259    17114    tiers_id_seq    SEQUENCE     s   CREATE SEQUENCE fac1.tiers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 !   DROP SEQUENCE fac1.tiers_id_seq;
       fac1       postgres    false    219    6            �           0    0    tiers_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE fac1.tiers_id_seq OWNED BY fac1.tiers.id;
            fac1       postgres    false    234            �
           2604    16977 
   article id    DEFAULT     d   ALTER TABLE ONLY fac1.article ALTER COLUMN id SET DEFAULT nextval('fac1.article_id_seq'::regclass);
 7   ALTER TABLE fac1.article ALTER COLUMN id DROP DEFAULT;
       fac1       postgres    false    220    199            �
           2604    16985    bl id    DEFAULT     Z   ALTER TABLE ONLY fac1.bl ALTER COLUMN id SET DEFAULT nextval('fac1.bl_id_seq'::regclass);
 2   ALTER TABLE fac1.bl ALTER COLUMN id DROP DEFAULT;
       fac1       postgres    false    221    200            �
           2604    17016    detail_bl id    DEFAULT     h   ALTER TABLE ONLY fac1.detail_bl ALTER COLUMN id SET DEFAULT nextval('fac1.detail_bl_id_seq'::regclass);
 9   ALTER TABLE fac1.detail_bl ALTER COLUMN id DROP DEFAULT;
       fac1       postgres    false    222    202            �
           2604    17024    detail_devis id    DEFAULT     n   ALTER TABLE ONLY fac1.detail_devis ALTER COLUMN id SET DEFAULT nextval('fac1.detail_devis_id_seq'::regclass);
 <   ALTER TABLE fac1.detail_devis ALTER COLUMN id DROP DEFAULT;
       fac1       postgres    false    223    204            �
           2604    17032    detail_facture id    DEFAULT     r   ALTER TABLE ONLY fac1.detail_facture ALTER COLUMN id SET DEFAULT nextval('fac1.detail_facture_id_seq'::regclass);
 >   ALTER TABLE fac1.detail_facture ALTER COLUMN id DROP DEFAULT;
       fac1       postgres    false    224    206            �
           2604    17043    devis id    DEFAULT     `   ALTER TABLE ONLY fac1.devis ALTER COLUMN id SET DEFAULT nextval('fac1.devis_id_seq'::regclass);
 5   ALTER TABLE fac1.devis ALTER COLUMN id DROP DEFAULT;
       fac1       postgres    false    225    208            �
           2604    17052 
   facture id    DEFAULT     d   ALTER TABLE ONLY fac1.facture ALTER COLUMN id SET DEFAULT nextval('fac1.facture_id_seq'::regclass);
 7   ALTER TABLE fac1.facture ALTER COLUMN id DROP DEFAULT;
       fac1       postgres    false    226    210            �
           2604    17060 
   infotrs id    DEFAULT     d   ALTER TABLE ONLY fac1.infotrs ALTER COLUMN id SET DEFAULT nextval('fac1.infotrs_id_seq'::regclass);
 7   ALTER TABLE fac1.infotrs ALTER COLUMN id DROP DEFAULT;
       fac1       postgres    false    227    211            �
           2604    17068    prix_article id    DEFAULT     n   ALTER TABLE ONLY fac1.prix_article ALTER COLUMN id SET DEFAULT nextval('fac1.prix_article_id_seq'::regclass);
 <   ALTER TABLE fac1.prix_article ALTER COLUMN id DROP DEFAULT;
       fac1       postgres    false    228    212            �
           2604    17076    ref_categ_tiers id    DEFAULT     t   ALTER TABLE ONLY fac1.ref_categ_tiers ALTER COLUMN id SET DEFAULT nextval('fac1.ref_categ_tiers_id_seq'::regclass);
 ?   ALTER TABLE fac1.ref_categ_tiers ALTER COLUMN id DROP DEFAULT;
       fac1       postgres    false    229    213            �
           2604    17084    ref_categorie id    DEFAULT     p   ALTER TABLE ONLY fac1.ref_categorie ALTER COLUMN id SET DEFAULT nextval('fac1.ref_categorie_id_seq'::regclass);
 =   ALTER TABLE fac1.ref_categorie ALTER COLUMN id DROP DEFAULT;
       fac1       postgres    false    230    214            �
           2604    17092    ref_compte id    DEFAULT     j   ALTER TABLE ONLY fac1.ref_compte ALTER COLUMN id SET DEFAULT nextval('fac1.ref_compte_id_seq'::regclass);
 :   ALTER TABLE fac1.ref_compte ALTER COLUMN id DROP DEFAULT;
       fac1       postgres    false    231    215            �
           2604    17100    ref_type_taux id    DEFAULT     p   ALTER TABLE ONLY fac1.ref_type_taux ALTER COLUMN id SET DEFAULT nextval('fac1.ref_type_taux_id_seq'::regclass);
 =   ALTER TABLE fac1.ref_type_taux ALTER COLUMN id DROP DEFAULT;
       fac1       postgres    false    232    216            �
           2604    17108    ref_type_tiers id    DEFAULT     r   ALTER TABLE ONLY fac1.ref_type_tiers ALTER COLUMN id SET DEFAULT nextval('fac1.ref_type_tiers_id_seq'::regclass);
 >   ALTER TABLE fac1.ref_type_tiers ALTER COLUMN id DROP DEFAULT;
       fac1       postgres    false    233    217            �
           2604    17124    taux id    DEFAULT     ^   ALTER TABLE ONLY fac1.taux ALTER COLUMN id SET DEFAULT nextval('fac1.taux_id_seq'::regclass);
 4   ALTER TABLE fac1.taux ALTER COLUMN id DROP DEFAULT;
       fac1       postgres    false    235    218                        2604    17116    tiers id    DEFAULT     `   ALTER TABLE ONLY fac1.tiers ALTER COLUMN id SET DEFAULT nextval('fac1.tiers_id_seq'::regclass);
 5   ALTER TABLE fac1.tiers ALTER COLUMN id DROP DEFAULT;
       fac1       postgres    false    234    219            �          0    16612    article 
   TABLE DATA               �   COPY fac1.article (type, reference, nomarticle, prixachat, tauxtaxe, unite, minqte, image, user_create, date_maj, date_create, id, idcateg, idcompte) FROM stdin;
    fac1       postgres    false    199   �       �          0    16617    bl 
   TABLE DATA               m   COPY fac1.bl (blnum, bldat, iddevis, idfacture, date_create, date_maj, user_create, id, idtiers) FROM stdin;
    fac1       postgres    false    200   ��       �          0    16625 	   detail_bl 
   TABLE DATA               f   COPY fac1.detail_bl (idarticle, duree, qte, blid, date_create, user_create, date_maj, id) FROM stdin;
    fac1       postgres    false    202   κ       �          0    16632    detail_devis 
   TABLE DATA               �   COPY fac1.detail_devis (idarticle, duree, qte, pu, mtn, remise, mtva, mttc, date_create, user_create, date_maj, id, idttv, idtr, iddevis) FROM stdin;
    fac1       postgres    false    204   �       �          0    16639    detail_facture 
   TABLE DATA               �   COPY fac1.detail_facture (idarticle, duree, qte, pu, mtn, remise, mtva, mttc, idfacture, date_create, user_create, date_maj, id, idttv, idtr) FROM stdin;
    fac1       postgres    false    206   o�       �          0    16649    devis 
   TABLE DATA               �   COPY fac1.devis (devdat, devmtn, devremise, devtva, devtmb, devttc, mrgcod, date_create, user_create, date_maj, devnum, id, codetiers) FROM stdin;
    fac1       postgres    false    208   ѻ       �          0    16656    facture 
   TABLE DATA               �   COPY fac1.facture (factdat, factmtn, factremise, facttva, facttmb, factttc, mrgcod, date_create, user_create, date_maj, id, codetiers, facnum) FROM stdin;
    fac1       postgres    false    210   2�       �          0    16661    infotrs 
   TABLE DATA               �   COPY fac1.infotrs (paycod, trsadr, trsvil, trstel, trsfax, trsweb, trseml, trsbnq, dateinfo, id, codetiers, date_maj, date_create, user_create) FROM stdin;
    fac1       postgres    false    211   ��       �          0    16664    prix_article 
   TABLE DATA               p   COPY fac1.prix_article (prix, idarticle, date_prix, active, id, date_create, user_create, date_maj) FROM stdin;
    fac1       postgres    false    212   �       �          0    16671    ref_categ_tiers 
   TABLE DATA               X   COPY fac1.ref_categ_tiers (libelle, id, user_create, date_create, date_maj) FROM stdin;
    fac1       postgres    false    213   Q�       �          0    16674    ref_categorie 
   TABLE DATA               V   COPY fac1.ref_categorie (libelle, id, date_create, date_maj, user_create) FROM stdin;
    fac1       postgres    false    214   ��       �          0    16677 
   ref_compte 
   TABLE DATA               d   COPY fac1.ref_compte (scfcod, libelle, datecmp, id, user_create, date_create, date_maj) FROM stdin;
    fac1       postgres    false    215   7�       �          0    16680    ref_type_taux 
   TABLE DATA               V   COPY fac1.ref_type_taux (libelle, id, date_maj, user_create, date_create) FROM stdin;
    fac1       postgres    false    216   ھ       �          0    16683    ref_type_tiers 
   TABLE DATA               V   COPY fac1.ref_type_tiers (tirlib, id, date_create, date_maj, user_create) FROM stdin;
    fac1       postgres    false    217   ,�       �          0    16686    taux 
   TABLE DATA               _   COPY fac1.taux (libelle, mtntaxe, id, idttaux, date_create, date_maj, user_create) FROM stdin;
    fac1       postgres    false    218   ��       �          0    16689    tiers 
   TABLE DATA               �   COPY fac1.tiers (trscod, trsnom, trsnif, trsnis, trsrc, idcatiers, date_create, user_create, date_maj, id, idtyptiers, idcompte) FROM stdin;
    fac1       postgres    false    219   �       �           0    0    article_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('fac1.article_id_seq', 1, true);
            fac1       postgres    false    220            �           0    0 	   bl_id_seq    SEQUENCE SET     5   SELECT pg_catalog.setval('fac1.bl_id_seq', 1, true);
            fac1       postgres    false    221            �           0    0    detail_bl_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('fac1.detail_bl_id_seq', 1, true);
            fac1       postgres    false    222            �           0    0    detail_bl_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('fac1.detail_bl_seq', 1, false);
            fac1       postgres    false    201            �           0    0    detail_devis_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('fac1.detail_devis_id_seq', 4, true);
            fac1       postgres    false    223            �           0    0    detail_devis_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('fac1.detail_devis_seq', 1, false);
            fac1       postgres    false    203            �           0    0    detail_facture_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('fac1.detail_facture_id_seq', 1, true);
            fac1       postgres    false    224            �           0    0    detail_facture_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('fac1.detail_facture_seq', 1, false);
            fac1       postgres    false    205            �           0    0 
   deviis_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('fac1.deviis_seq', 1, false);
            fac1       postgres    false    207                        0    0    devis_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('fac1.devis_id_seq', 1, true);
            fac1       postgres    false    225                       0    0    facture_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('fac1.facture_id_seq', 1, true);
            fac1       postgres    false    226                       0    0    facture_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('fac1.facture_seq', 1, false);
            fac1       postgres    false    209                       0    0    infotrs_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('fac1.infotrs_id_seq', 1, true);
            fac1       postgres    false    227                       0    0    prix_article_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('fac1.prix_article_id_seq', 1, true);
            fac1       postgres    false    228                       0    0    ref_categ_tiers_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('fac1.ref_categ_tiers_id_seq', 3, true);
            fac1       postgres    false    229                       0    0    ref_categorie_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('fac1.ref_categorie_id_seq', 4, true);
            fac1       postgres    false    230                       0    0    ref_compte_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('fac1.ref_compte_id_seq', 5, true);
            fac1       postgres    false    231                       0    0    ref_type_taux_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('fac1.ref_type_taux_id_seq', 2, true);
            fac1       postgres    false    232            	           0    0    ref_type_tiers_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('fac1.ref_type_tiers_id_seq', 2, true);
            fac1       postgres    false    233            
           0    0    sequence_article    SEQUENCE SET     <   SELECT pg_catalog.setval('fac1.sequence_article', 5, true);
            fac1       postgres    false    198                       0    0    taux_id_seq    SEQUENCE SET     7   SELECT pg_catalog.setval('fac1.taux_id_seq', 4, true);
            fac1       postgres    false    235                       0    0    tiers_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('fac1.tiers_id_seq', 1, true);
            fac1       postgres    false    234                       2606    16982    article article_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY fac1.article
    ADD CONSTRAINT article_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY fac1.article DROP CONSTRAINT article_pkey;
       fac1         postgres    false    199                       2606    16990 
   bl bl_pkey 
   CONSTRAINT     F   ALTER TABLE ONLY fac1.bl
    ADD CONSTRAINT bl_pkey PRIMARY KEY (id);
 2   ALTER TABLE ONLY fac1.bl DROP CONSTRAINT bl_pkey;
       fac1         postgres    false    200                       2606    17021    detail_bl detailbl_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY fac1.detail_bl
    ADD CONSTRAINT detailbl_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY fac1.detail_bl DROP CONSTRAINT detailbl_pkey;
       fac1         postgres    false    202                       2606    17029    detail_devis detaildevis_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY fac1.detail_devis
    ADD CONSTRAINT detaildevis_pkey PRIMARY KEY (id);
 E   ALTER TABLE ONLY fac1.detail_devis DROP CONSTRAINT detaildevis_pkey;
       fac1         postgres    false    204            
           2606    17040    detail_facture detailfact_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY fac1.detail_facture
    ADD CONSTRAINT detailfact_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY fac1.detail_facture DROP CONSTRAINT detailfact_pkey;
       fac1         postgres    false    206                       2606    17048    devis devis_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY fac1.devis
    ADD CONSTRAINT devis_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY fac1.devis DROP CONSTRAINT devis_pkey;
       fac1         postgres    false    208                       2606    17057    facture facture_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY fac1.facture
    ADD CONSTRAINT facture_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY fac1.facture DROP CONSTRAINT facture_pkey;
       fac1         postgres    false    210                       2606    17065    infotrs infotrs_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY fac1.infotrs
    ADD CONSTRAINT infotrs_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY fac1.infotrs DROP CONSTRAINT infotrs_pkey;
       fac1         postgres    false    211                       2606    17073    prix_article prixarticle_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY fac1.prix_article
    ADD CONSTRAINT prixarticle_pkey PRIMARY KEY (id);
 E   ALTER TABLE ONLY fac1.prix_article DROP CONSTRAINT prixarticle_pkey;
       fac1         postgres    false    212                       2606    17089     ref_categorie ref_categorie_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY fac1.ref_categorie
    ADD CONSTRAINT ref_categorie_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY fac1.ref_categorie DROP CONSTRAINT ref_categorie_pkey;
       fac1         postgres    false    214                       2606    17081 "   ref_categ_tiers refcategtiers_pkey 
   CONSTRAINT     ^   ALTER TABLE ONLY fac1.ref_categ_tiers
    ADD CONSTRAINT refcategtiers_pkey PRIMARY KEY (id);
 J   ALTER TABLE ONLY fac1.ref_categ_tiers DROP CONSTRAINT refcategtiers_pkey;
       fac1         postgres    false    213                       2606    17097    ref_compte refcompte_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY fac1.ref_compte
    ADD CONSTRAINT refcompte_pkey PRIMARY KEY (id);
 A   ALTER TABLE ONLY fac1.ref_compte DROP CONSTRAINT refcompte_pkey;
       fac1         postgres    false    215                       2606    17105    ref_type_taux reftypetaux_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY fac1.ref_type_taux
    ADD CONSTRAINT reftypetaux_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY fac1.ref_type_taux DROP CONSTRAINT reftypetaux_pkey;
       fac1         postgres    false    216                       2606    17113     ref_type_tiers reftypetiers_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY fac1.ref_type_tiers
    ADD CONSTRAINT reftypetiers_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY fac1.ref_type_tiers DROP CONSTRAINT reftypetiers_pkey;
       fac1         postgres    false    217                       2606    17129    taux taux_pkey 
   CONSTRAINT     J   ALTER TABLE ONLY fac1.taux
    ADD CONSTRAINT taux_pkey PRIMARY KEY (id);
 6   ALTER TABLE ONLY fac1.taux DROP CONSTRAINT taux_pkey;
       fac1         postgres    false    218                        2606    17121    tiers tiers_pkey 
   CONSTRAINT     L   ALTER TABLE ONLY fac1.tiers
    ADD CONSTRAINT tiers_pkey PRIMARY KEY (id);
 8   ALTER TABLE ONLY fac1.tiers DROP CONSTRAINT tiers_pkey;
       fac1         postgres    false    219            !           2606    17131    article article1_fk    FK CONSTRAINT     �   ALTER TABLE ONLY fac1.article
    ADD CONSTRAINT article1_fk FOREIGN KEY (idcateg) REFERENCES fac1.ref_categorie(id) MATCH FULL;
 ;   ALTER TABLE ONLY fac1.article DROP CONSTRAINT article1_fk;
       fac1       postgres    false    199    214    2838            "           2606    17136    article article2_fk    FK CONSTRAINT        ALTER TABLE ONLY fac1.article
    ADD CONSTRAINT article2_fk FOREIGN KEY (idcompte) REFERENCES fac1.ref_compte(id) MATCH FULL;
 ;   ALTER TABLE ONLY fac1.article DROP CONSTRAINT article2_fk;
       fac1       postgres    false    199    215    2840            #           2606    17288 	   bl bl_fk1    FK CONSTRAINT     o   ALTER TABLE ONLY fac1.bl
    ADD CONSTRAINT bl_fk1 FOREIGN KEY (iddevis) REFERENCES fac1.devis(id) MATCH FULL;
 1   ALTER TABLE ONLY fac1.bl DROP CONSTRAINT bl_fk1;
       fac1       postgres    false    200    2828    208            $           2606    17293 	   bl bl_fk2    FK CONSTRAINT     s   ALTER TABLE ONLY fac1.bl
    ADD CONSTRAINT bl_fk2 FOREIGN KEY (idfacture) REFERENCES fac1.facture(id) MATCH FULL;
 1   ALTER TABLE ONLY fac1.bl DROP CONSTRAINT bl_fk2;
       fac1       postgres    false    2830    200    210            %           2606    17265    detail_bl detailbl_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY fac1.detail_bl
    ADD CONSTRAINT detailbl_fk1 FOREIGN KEY (idarticle) REFERENCES fac1.article(id) MATCH FULL;
 >   ALTER TABLE ONLY fac1.detail_bl DROP CONSTRAINT detailbl_fk1;
       fac1       postgres    false    202    199    2818            &           2606    17275    detail_bl detailbl_fk2    FK CONSTRAINT     v   ALTER TABLE ONLY fac1.detail_bl
    ADD CONSTRAINT detailbl_fk2 FOREIGN KEY (blid) REFERENCES fac1.bl(id) MATCH FULL;
 >   ALTER TABLE ONLY fac1.detail_bl DROP CONSTRAINT detailbl_fk2;
       fac1       postgres    false    2820    202    200            '           2606    17237    detail_devis detaildevis_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY fac1.detail_devis
    ADD CONSTRAINT detaildevis_fk1 FOREIGN KEY (idarticle) REFERENCES fac1.article(id) MATCH FULL;
 D   ALTER TABLE ONLY fac1.detail_devis DROP CONSTRAINT detaildevis_fk1;
       fac1       postgres    false    204    2818    199            (           2606    17242    detail_devis detaildevis_fk2    FK CONSTRAINT        ALTER TABLE ONLY fac1.detail_devis
    ADD CONSTRAINT detaildevis_fk2 FOREIGN KEY (idttv) REFERENCES fac1.taux(id) MATCH FULL;
 D   ALTER TABLE ONLY fac1.detail_devis DROP CONSTRAINT detaildevis_fk2;
       fac1       postgres    false    2846    218    204            )           2606    17247    detail_devis detaildevis_fk3    FK CONSTRAINT     ~   ALTER TABLE ONLY fac1.detail_devis
    ADD CONSTRAINT detaildevis_fk3 FOREIGN KEY (idtr) REFERENCES fac1.taux(id) MATCH FULL;
 D   ALTER TABLE ONLY fac1.detail_devis DROP CONSTRAINT detaildevis_fk3;
       fac1       postgres    false    2846    204    218            *           2606    17252    detail_devis detaildevis_fk4    FK CONSTRAINT     �   ALTER TABLE ONLY fac1.detail_devis
    ADD CONSTRAINT detaildevis_fk4 FOREIGN KEY (iddevis) REFERENCES fac1.devis(id) MATCH FULL;
 D   ALTER TABLE ONLY fac1.detail_devis DROP CONSTRAINT detaildevis_fk4;
       fac1       postgres    false    208    204    2828            +           2606    17202     detail_facture detailfacture_fk1    FK CONSTRAINT     �   ALTER TABLE ONLY fac1.detail_facture
    ADD CONSTRAINT detailfacture_fk1 FOREIGN KEY (idarticle) REFERENCES fac1.article(id) MATCH FULL;
 H   ALTER TABLE ONLY fac1.detail_facture DROP CONSTRAINT detailfacture_fk1;
       fac1       postgres    false    206    2818    199            ,           2606    17207     detail_facture detailfacture_fk2    FK CONSTRAINT     �   ALTER TABLE ONLY fac1.detail_facture
    ADD CONSTRAINT detailfacture_fk2 FOREIGN KEY (idttv) REFERENCES fac1.taux(id) MATCH FULL;
 H   ALTER TABLE ONLY fac1.detail_facture DROP CONSTRAINT detailfacture_fk2;
       fac1       postgres    false    218    206    2846            -           2606    17212     detail_facture detailfacture_fk3    FK CONSTRAINT     �   ALTER TABLE ONLY fac1.detail_facture
    ADD CONSTRAINT detailfacture_fk3 FOREIGN KEY (idtr) REFERENCES fac1.taux(id) MATCH FULL;
 H   ALTER TABLE ONLY fac1.detail_facture DROP CONSTRAINT detailfacture_fk3;
       fac1       postgres    false    206    2846    218            .           2606    17217     detail_facture detailfacture_fk4    FK CONSTRAINT     �   ALTER TABLE ONLY fac1.detail_facture
    ADD CONSTRAINT detailfacture_fk4 FOREIGN KEY (idfacture) REFERENCES fac1.facture(id) MATCH FULL;
 H   ALTER TABLE ONLY fac1.detail_facture DROP CONSTRAINT detailfacture_fk4;
       fac1       postgres    false    2830    210    206            /           2606    17190    devis devis_fk1    FK CONSTRAINT     w   ALTER TABLE ONLY fac1.devis
    ADD CONSTRAINT devis_fk1 FOREIGN KEY (codetiers) REFERENCES fac1.tiers(id) MATCH FULL;
 7   ALTER TABLE ONLY fac1.devis DROP CONSTRAINT devis_fk1;
       fac1       postgres    false    2848    219    208            0           2606    17185    facture facture_fk1    FK CONSTRAINT     {   ALTER TABLE ONLY fac1.facture
    ADD CONSTRAINT facture_fk1 FOREIGN KEY (codetiers) REFERENCES fac1.tiers(id) MATCH FULL;
 ;   ALTER TABLE ONLY fac1.facture DROP CONSTRAINT facture_fk1;
       fac1       postgres    false    219    210    2848            1           2606    17175    infotrs infotrs_fk1    FK CONSTRAINT     {   ALTER TABLE ONLY fac1.infotrs
    ADD CONSTRAINT infotrs_fk1 FOREIGN KEY (codetiers) REFERENCES fac1.tiers(id) MATCH FULL;
 ;   ALTER TABLE ONLY fac1.infotrs DROP CONSTRAINT infotrs_fk1;
       fac1       postgres    false    2848    211    219            2           2606    17301    prix_article prix_article1_fk    FK CONSTRAINT     �   ALTER TABLE ONLY fac1.prix_article
    ADD CONSTRAINT prix_article1_fk FOREIGN KEY (idarticle) REFERENCES fac1.article(id) MATCH FULL;
 E   ALTER TABLE ONLY fac1.prix_article DROP CONSTRAINT prix_article1_fk;
       fac1       postgres    false    212    2818    199            3           2606    17165    taux taux1_fk    FK CONSTRAINT     {   ALTER TABLE ONLY fac1.taux
    ADD CONSTRAINT taux1_fk FOREIGN KEY (idttaux) REFERENCES fac1.ref_type_taux(id) MATCH FULL;
 5   ALTER TABLE ONLY fac1.taux DROP CONSTRAINT taux1_fk;
       fac1       postgres    false    218    216    2842            4           2606    17150    tiers tiers1_fk    FK CONSTRAINT     {   ALTER TABLE ONLY fac1.tiers
    ADD CONSTRAINT tiers1_fk FOREIGN KEY (idcompte) REFERENCES fac1.ref_compte(id) MATCH FULL;
 7   ALTER TABLE ONLY fac1.tiers DROP CONSTRAINT tiers1_fk;
       fac1       postgres    false    219    215    2840            5           2606    17155    tiers tiers2_fk    FK CONSTRAINT     �   ALTER TABLE ONLY fac1.tiers
    ADD CONSTRAINT tiers2_fk FOREIGN KEY (idtyptiers) REFERENCES fac1.ref_type_tiers(id) MATCH FULL;
 7   ALTER TABLE ONLY fac1.tiers DROP CONSTRAINT tiers2_fk;
       fac1       postgres    false    219    217    2844            6           2606    17160    tiers tiers3_fk    FK CONSTRAINT     �   ALTER TABLE ONLY fac1.tiers
    ADD CONSTRAINT tiers3_fk FOREIGN KEY (idcatiers) REFERENCES fac1.ref_categ_tiers(id) MATCH FULL;
 7   ALTER TABLE ONLY fac1.tiers DROP CONSTRAINT tiers3_fk;
       fac1       postgres    false    219    213    2836            �   ^   x��0 Cβ�ļ�T��R���Ғ�<N=N a����i
�%[�C�e�sf'��p��*X��6�@� h����� ���      �   7   x�s2000�72�4202�50�52�4BW���
��p
g'���q��qqq ���      �   6   x�3���44�30�4�4202�50�52R00�#mC�����\��\1z\\\ ��r      �   K   x�3���44�30�442��`��o`d7�0��t�u����H���3;175��!��	�!W� ��      �   R   x�3���44�30�442��`��o`d7�28������b�8�sSs8��t�u����H���h>W� s�      �   Q   x�3202�50�52�44200�30�4�P�Ff ��36�� E`���H���3;175���pC}#�A��\1z\\\ m�T      �   T   x�u�=� �g�)��Q�����3p�Q~�hڤiӦBx��\�K:�j9�2����mpN�$'Er������O�=���^�s      �   f   x�s�q�L�IO-R ��We�B��F�&��f�H���r�Ԃ���*N퐞�������˙\��id`d�k`�kd�	�����i��N�M������ d%(      �   5   x�3420�30�4�4202�50�52T00�#mC��Rى��98$�b���� ;��      �   M   x�s��L�+�4��N�M��4202�50�52T00�#mC�\n��Ey��ũ�E�Fd����X�yx%�1Y�c���� r +�      �   y   x��̱
�0��9y��b��N}
�k�C{�$�r����������<V��p�HI����&@��6xp�k��~a�����<Q"T��u��\"���i��Sҝd��HNSY�����k�ۜM:      �   �   x�314400�t��L�+Q8�@�$�(7�����@��X�ȐӐ3;175IH���
��9����A�\&@��f%���$��W���iD���f�^��b�1�f�C�\P��R�Y�l�		f��H-.I,���C6ŔhSb���� ��Z�      �   B   x�I�HU	s�4�4202�50�52T00�#mC������\A�W��&�d��q�e@� �!]      �   F   x�(�OK-.����K��4�4202�50�52T00�#m��ى��9\�E%�ɥ9��E�Fd����� G��      �   `   x�	sT0�T�4�3��4B##]c]#C+0�6�)������4l��%�f��0�4&ӌ��+SJ�K2��L�F�r� D�Q1z\\\ 
�9!      �   U   x�s6 CN� G�� G�`N#C�P����idlfjbjf��hhb� �!��������������iM�N�M��%	�\1z\\\ ���     