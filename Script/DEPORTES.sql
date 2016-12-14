/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     12/14/2016 1:57:19 PM                        */
/*==============================================================*/


drop table if exists FUTBOL_NACIONAL;

drop table if exists IMAGENES;

drop table if exists NOTICIAS;

drop table if exists TABLA_DE_POSICIONES;

drop table if exists VIDEOS;

/*==============================================================*/
/* Table: FUTBOL_NACIONAL                                       */
/*==============================================================*/
create table FUTBOL_NACIONAL
(
   ID_DEPORTE           int not null,
   NOMBRE_DEPORTE       char(100) not null,
   DESCRIPCION_DEPORTES varchar(500),
   primary key (ID_DEPORTE)
);

/*==============================================================*/
/* Table: IMAGENES                                              */
/*==============================================================*/
create table IMAGENES
(
   ID_IMAGENES          int not null,
   ID_DEPORTE           int,
   DESCRIPCION_IMAGEN   char(250) not null,
   FECHA_IMAGEN         date not null,
   IMAGEN_FUT           longblob not null,
   primary key (ID_IMAGENES)
);

/*==============================================================*/
/* Table: NOTICIAS                                              */
/*==============================================================*/
create table NOTICIAS
(
   ID_NOTICIAS          int not null,
   ID_DEPORTE           int,
   TITULO_NOTICIA       char(256) not null,
   INFORMACION          varchar(500000) not null,
   AUTOR_NOTICIA        varchar(150),
   FECHA_NOTICIA        date not null,
   HORA_NOTICIA         time not null,
   primary key (ID_NOTICIAS)
);

/*==============================================================*/
/* Table: TABLA_DE_POSICIONES                                   */
/*==============================================================*/
create table TABLA_DE_POSICIONES
(
   ID_DEPORTE           int,
   ID_EQUIPO            int,
   NOMBRE_EQUIPO        char(256),
   PUNTOS               int
);

/*==============================================================*/
/* Table: VIDEOS                                                */
/*==============================================================*/
create table VIDEOS
(
   ID_ENTRENADOR        int not null,
   ID_DEPORTE           int,
   NOMBRE_VIDEO         char(100) not null,
   VIDEO                char(150) not null,
   primary key (ID_ENTRENADOR)
);

alter table IMAGENES add constraint FK_FUTBOLNACIONAL_IMAGENS foreign key (ID_DEPORTE)
      references FUTBOL_NACIONAL (ID_DEPORTE) on delete restrict on update restrict;

alter table NOTICIAS add constraint FK_DEPORTES_NOTICIAS foreign key (ID_DEPORTE)
      references FUTBOL_NACIONAL (ID_DEPORTE) on delete restrict on update restrict;

alter table TABLA_DE_POSICIONES add constraint FK_FUTNACIONAL_TABLA foreign key (ID_DEPORTE)
      references FUTBOL_NACIONAL (ID_DEPORTE) on delete restrict on update restrict;

alter table VIDEOS add constraint FK_FUTBOLNACIONAL_VIDEOS foreign key (ID_DEPORTE)
      references FUTBOL_NACIONAL (ID_DEPORTE) on delete restrict on update restrict;

