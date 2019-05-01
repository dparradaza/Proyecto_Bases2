/*==============================================================*/
/* DBMS name:      PostgreSQL 8                                 */
/* Created on:     1/06/2017 6:39:06 p. m.                      */
/*==============================================================*/


drop index ANIO_PK;

drop table ANIO;

drop index CARGO_PK;

drop table CARGO;

drop index RELATIONSHIP_3_FK;

drop index DETALLEFACTURA_PK;

drop table DETALLEFACTURA;

drop index DIAN_PK;

drop table DIAN;

drop index PRODUCTODISTRIBUCION_FK;

drop index PROVEEDORPRODUCTO_FK;

drop index DISTRIBUCION_PK;

drop table DISTRIBUCION;

drop index EMPLEADO_PK;

drop table EMPLEADO;

drop index RESOLUCIONDIAN_FK;

drop index EMPLEADO_VENDEDOR_FK;

drop index PROVEEDORFACTURA_FK;

drop index FACTURADETALLE_FK;

drop index FACTURA_PK;

drop table FACTURA;

drop index CARGOHISTORICO_FK;

drop index EMPLEADOCARGO_FK;

drop index HISTORICOCARGO_PK;

drop table HISTORICOCARGO;

drop index PRECIOHISTORICOUNIDAD_FK;

drop index RELATIONSHIP_15_FK;

drop index EMPLEADOPRECIO_FK;

drop index HISTORICOPRECIO_PK;

drop table HISTORICOPRECIO;

drop index RELATIONSHIP_11_FK;

drop index UNIDADESINVENTARIO_FK;

drop index INVENTARIO_PK;

drop table INVENTARIO;

drop index RELATIONSHIP_21_FK;

drop index NOMINATIPONOVEDAD_FK;

drop index NOMINA_PK;

drop table NOMINA;

drop index TIPODENOVEDAD_FK;

drop index NOVEDADHISTORICOC_FK;

drop index NOVEDAD_PK;

drop table NOVEDAD;

drop index LIMITEINFERIOR_FK;

drop index ANIOPARAMETRO_FK;

drop index PRODUCTOPARAMETRO_FK;

drop index PARAMETROVENTA_PK;

drop table PARAMETROVENTA;

drop index TIPODEPERSONA_FK;

drop index PERSONA_PK;

drop table PERSONA;

drop index UNIDADDEMEDIDAPROD_FK;

drop index TIPODELPRODUCTO_FK;

drop index PRODUCTO_PK;

drop table PRODUCTO;

drop index RELATIONSHIP_10_FK;

drop index TIPOFACTURA_PK;

drop table TIPOFACTURA;

drop index TIPONOVEDAD_PK;

drop table TIPONOVEDAD;

drop index TIPOPERSONA_PK;

drop table TIPOPERSONA;

drop index TIPOPRODUCTO_PK;

drop table TIPOPRODUCTO;

drop index LIMITESUPERIOR_FK;

drop index UNIDAD_PK;

drop table UNIDAD;

/*==============================================================*/
/* Table: ANIO                                                  */
/*==============================================================*/
create table ANIO (
   IDANIO               VARCHAR(15)          not null,
   DESANIO              VARCHAR(15)          null,
   constraint PK_ANIO primary key (IDANIO)
);

/*==============================================================*/
/* Index: ANIO_PK                                               */
/*==============================================================*/
create unique index ANIO_PK on ANIO (
IDANIO
);

/*==============================================================*/
/* Table: CARGO                                                 */
/*==============================================================*/
create table CARGO (
   IDCARGO              VARCHAR(15)          not null,
   NOMBRECARGO          VARCHAR(30)          null,
   constraint PK_CARGO primary key (IDCARGO)
);

/*==============================================================*/
/* Index: CARGO_PK                                              */
/*==============================================================*/
create unique index CARGO_PK on CARGO (
IDCARGO
);

/*==============================================================*/
/* Table: DETALLEFACTURA                                        */
/*==============================================================*/
create table DETALLEFACTURA (
   IDDETALLEF           VARCHAR(15)          not null,
   REFERENCIA           VARCHAR(15)          null,
   PERCIOTOT            NUMERIC(10,2)        null,
   CANTIDADPROD         NUMERIC(10,2)        null,
   constraint PK_DETALLEFACTURA primary key (IDDETALLEF)
);

/*==============================================================*/
/* Index: DETALLEFACTURA_PK                                     */
/*==============================================================*/
create unique index DETALLEFACTURA_PK on DETALLEFACTURA (
IDDETALLEF
);

/*==============================================================*/
/* Index: RELATIONSHIP_3_FK                                     */
/*==============================================================*/
create  index RELATIONSHIP_3_FK on DETALLEFACTURA (
REFERENCIA
);

/*==============================================================*/
/* Table: DIAN                                                  */
/*==============================================================*/
create table DIAN (
   RESOLUCION           VARCHAR(15)          not null,
   INICIO               NUMERIC(6,0)         null,
   FIN                  NUMERIC(6,0)         null,
   constraint PK_DIAN primary key (RESOLUCION)
);

/*==============================================================*/
/* Index: DIAN_PK                                               */
/*==============================================================*/
create unique index DIAN_PK on DIAN (
RESOLUCION
);

/*==============================================================*/
/* Table: DISTRIBUCION                                          */
/*==============================================================*/
create table DISTRIBUCION (
   IDDISTRIBUCION       VARCHAR(15)          not null,
   IDPERSONA            CHAR(10)             null,
   REFERENCIA           VARCHAR(15)          null,
   OBSERVACIONDIS       VARCHAR(30)          null,
   constraint PK_DISTRIBUCION primary key (IDDISTRIBUCION)
);

/*==============================================================*/
/* Index: DISTRIBUCION_PK                                       */
/*==============================================================*/
create unique index DISTRIBUCION_PK on DISTRIBUCION (
IDDISTRIBUCION
);

/*==============================================================*/
/* Index: PROVEEDORPRODUCTO_FK                                  */
/*==============================================================*/
create  index PROVEEDORPRODUCTO_FK on DISTRIBUCION (
IDPERSONA
);

/*==============================================================*/
/* Index: PRODUCTODISTRIBUCION_FK                               */
/*==============================================================*/
create  index PRODUCTODISTRIBUCION_FK on DISTRIBUCION (
REFERENCIA
);

/*==============================================================*/
/* Table: EMPLEADO                                              */
/*==============================================================*/
create table EMPLEADO (
   CEDULA               VARCHAR(25)          not null,
   NOMBRECOMPLETO       VARCHAR(45)          null,
   FECHANACIMIENTO      DATE                 null,
   TELEFONOEMPLEADO     VARCHAR(15)          null,
   DIRECCIONEMPLEADO    VARCHAR(20)          null,
   constraint PK_EMPLEADO primary key (CEDULA)
);

/*==============================================================*/
/* Index: EMPLEADO_PK                                           */
/*==============================================================*/
create unique index EMPLEADO_PK on EMPLEADO (
CEDULA
);

/*==============================================================*/
/* Table: FACTURA                                               */
/*==============================================================*/
create table FACTURA (
   IDFACTURA            VARCHAR(15)          not null,
   IDPERSONA            CHAR(10)             null,
   RESOLUCION           VARCHAR(15)          null,
   CEDULA               VARCHAR(25)          null,
   IDDETALLEF           VARCHAR(15)          null,
   FECHAFACTURA         DATE                 null,
   TOTAL                NUMERIC(8,2)         null,
   constraint PK_FACTURA primary key (IDFACTURA)
);

/*==============================================================*/
/* Index: FACTURA_PK                                            */
/*==============================================================*/
create unique index FACTURA_PK on FACTURA (
IDFACTURA
);

/*==============================================================*/
/* Index: FACTURADETALLE_FK                                     */
/*==============================================================*/
create  index FACTURADETALLE_FK on FACTURA (
IDDETALLEF
);

/*==============================================================*/
/* Index: PROVEEDORFACTURA_FK                                   */
/*==============================================================*/
create  index PROVEEDORFACTURA_FK on FACTURA (
IDPERSONA
);

/*==============================================================*/
/* Index: EMPLEADO_VENDEDOR_FK                                  */
/*==============================================================*/
create  index EMPLEADO_VENDEDOR_FK on FACTURA (
CEDULA
);

/*==============================================================*/
/* Index: RESOLUCIONDIAN_FK                                     */
/*==============================================================*/
create  index RESOLUCIONDIAN_FK on FACTURA (
RESOLUCION
);

/*==============================================================*/
/* Table: HISTORICOCARGO                                        */
/*==============================================================*/
create table HISTORICOCARGO (
   CONSECARGO           CHAR(10)             not null,
   IDCARGO              VARCHAR(15)          null,
   CEDULA               VARCHAR(25)          null,
   DESCRIPCIONHIS       VARCHAR(20)          null,
   FECHAINICIO          DATE                 null,
   FECHAFIN             DATE                 null,
   constraint PK_HISTORICOCARGO primary key (CONSECARGO)
);

/*==============================================================*/
/* Index: HISTORICOCARGO_PK                                     */
/*==============================================================*/
create unique index HISTORICOCARGO_PK on HISTORICOCARGO (
CONSECARGO
);

/*==============================================================*/
/* Index: EMPLEADOCARGO_FK                                      */
/*==============================================================*/
create  index EMPLEADOCARGO_FK on HISTORICOCARGO (
CEDULA
);

/*==============================================================*/
/* Index: CARGOHISTORICO_FK                                     */
/*==============================================================*/
create  index CARGOHISTORICO_FK on HISTORICOCARGO (
IDCARGO
);

/*==============================================================*/
/* Table: HISTORICOPRECIO                                       */
/*==============================================================*/
create table HISTORICOPRECIO (
   IDHISTORICO          VARCHAR(15)          not null,
   CEDULA               VARCHAR(25)          null,
   IDUNIDAD             VARCHAR(15)          null,
   REFERENCIA           VARCHAR(15)          null,
   DESCRIPCIONHIS       VARCHAR(20)          null,
   FECHAHIS             DATE                 null,
   PRECIO               NUMERIC(8,1)         null,
   constraint PK_HISTORICOPRECIO primary key (IDHISTORICO)
);

/*==============================================================*/
/* Index: HISTORICOPRECIO_PK                                    */
/*==============================================================*/
create unique index HISTORICOPRECIO_PK on HISTORICOPRECIO (
IDHISTORICO
);

/*==============================================================*/
/* Index: EMPLEADOPRECIO_FK                                     */
/*==============================================================*/
create  index EMPLEADOPRECIO_FK on HISTORICOPRECIO (
CEDULA
);

/*==============================================================*/
/* Index: RELATIONSHIP_15_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_15_FK on HISTORICOPRECIO (
REFERENCIA
);

/*==============================================================*/
/* Index: PRECIOHISTORICOUNIDAD_FK                              */
/*==============================================================*/
create  index PRECIOHISTORICOUNIDAD_FK on HISTORICOPRECIO (
IDUNIDAD
);

/*==============================================================*/
/* Table: INVENTARIO                                            */
/*==============================================================*/
create table INVENTARIO (
   CONSECUTIVOINVENTARIO VARCHAR(15)          not null,
   IDUNIDAD             VARCHAR(15)          null,
   IDFACTURA            VARCHAR(15)          null,
   FECHAHIS             DATE                 null,
   CANTIDAD             NUMERIC(6,2)         null,
   SALDO                NUMERIC(6,2)         null,
   constraint PK_INVENTARIO primary key (CONSECUTIVOINVENTARIO)
);

/*==============================================================*/
/* Index: INVENTARIO_PK                                         */
/*==============================================================*/
create unique index INVENTARIO_PK on INVENTARIO (
CONSECUTIVOINVENTARIO
);

/*==============================================================*/
/* Index: UNIDADESINVENTARIO_FK                                 */
/*==============================================================*/
create  index UNIDADESINVENTARIO_FK on INVENTARIO (
IDUNIDAD
);

/*==============================================================*/
/* Index: RELATIONSHIP_11_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_11_FK on INVENTARIO (
IDFACTURA
);

/*==============================================================*/
/* Table: NOMINA                                                */
/*==============================================================*/
create table NOMINA (
   IDNOMINA             VARCHAR(15)          not null,
   IDTIPONOVEDAD        VARCHAR(15)          null,
   CEDULA               VARCHAR(25)          null,
   SUELDO               NUMERIC(9,2)         null,
   DESCUENTOS           NUMERIC(9,3)         null,
   SUBSIDIOS            NUMERIC(9,3)         null,
   constraint PK_NOMINA primary key (IDNOMINA)
);

/*==============================================================*/
/* Index: NOMINA_PK                                             */
/*==============================================================*/
create unique index NOMINA_PK on NOMINA (
IDNOMINA
);

/*==============================================================*/
/* Index: NOMINATIPONOVEDAD_FK                                  */
/*==============================================================*/
create  index NOMINATIPONOVEDAD_FK on NOMINA (
IDTIPONOVEDAD
);

/*==============================================================*/
/* Index: RELATIONSHIP_21_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_21_FK on NOMINA (
CEDULA
);

/*==============================================================*/
/* Table: NOVEDAD                                               */
/*==============================================================*/
create table NOVEDAD (
   IDNOVEDAD            VARCHAR(15)          not null,
   CONSECARGO           CHAR(10)             null,
   IDTIPONOVEDAD        VARCHAR(15)          null,
   DESNOVEDAD           VARCHAR(40)          null,
   FECHANOVEDAD         DATE                 null,
   constraint PK_NOVEDAD primary key (IDNOVEDAD)
);

/*==============================================================*/
/* Index: NOVEDAD_PK                                            */
/*==============================================================*/
create unique index NOVEDAD_PK on NOVEDAD (
IDNOVEDAD
);

/*==============================================================*/
/* Index: NOVEDADHISTORICOC_FK                                  */
/*==============================================================*/
create  index NOVEDADHISTORICOC_FK on NOVEDAD (
CONSECARGO
);

/*==============================================================*/
/* Index: TIPODENOVEDAD_FK                                      */
/*==============================================================*/
create  index TIPODENOVEDAD_FK on NOVEDAD (
IDTIPONOVEDAD
);

/*==============================================================*/
/* Table: PARAMETROVENTA                                        */
/*==============================================================*/
create table PARAMETROVENTA (
   IDPARAMETRO          VARCHAR(15)          not null,
   IDANIO               VARCHAR(15)          null,
   IDUNIDAD             VARCHAR(15)          null,
   REFERENCIA           VARCHAR(15)          null,
   OBSPARAMETRO         VARCHAR(30)          null,
   NUMEROPARAMETRO      NUMERIC(10,2)        null,
   CANTPRARA            NUMERIC(10,2)        null,
   constraint PK_PARAMETROVENTA primary key (IDPARAMETRO)
);

/*==============================================================*/
/* Index: PARAMETROVENTA_PK                                     */
/*==============================================================*/
create unique index PARAMETROVENTA_PK on PARAMETROVENTA (
IDPARAMETRO
);

/*==============================================================*/
/* Index: PRODUCTOPARAMETRO_FK                                  */
/*==============================================================*/
create  index PRODUCTOPARAMETRO_FK on PARAMETROVENTA (
REFERENCIA
);

/*==============================================================*/
/* Index: ANIOPARAMETRO_FK                                      */
/*==============================================================*/
create  index ANIOPARAMETRO_FK on PARAMETROVENTA (
IDANIO
);

/*==============================================================*/
/* Index: LIMITEINFERIOR_FK                                     */
/*==============================================================*/
create  index LIMITEINFERIOR_FK on PARAMETROVENTA (
IDUNIDAD
);

/*==============================================================*/
/* Table: PERSONA                                               */
/*==============================================================*/
create table PERSONA (
   IDPERSONA            CHAR(10)             not null,
   IDTIPOPERSONA        VARCHAR(15)          null,
   TELEFONOPERSONA      VARCHAR(15)          null,
   DIRECCIONPERSONA     VARCHAR(20)          null,
   NOMBREPERSONA        VARCHAR(30)          null,
   constraint PK_PERSONA primary key (IDPERSONA)
);

/*==============================================================*/
/* Index: PERSONA_PK                                            */
/*==============================================================*/
create unique index PERSONA_PK on PERSONA (
IDPERSONA
);

/*==============================================================*/
/* Index: TIPODEPERSONA_FK                                      */
/*==============================================================*/
create  index TIPODEPERSONA_FK on PERSONA (
IDTIPOPERSONA
);

/*==============================================================*/
/* Table: PRODUCTO                                              */
/*==============================================================*/
create table PRODUCTO (
   REFERENCIA           VARCHAR(15)          not null,
   IDTIPOPRODUCTO       VARCHAR(15)          null,
   IDUNIDAD             VARCHAR(15)          null,
   NOMBREPROD           VARCHAR(40)          null,
   constraint PK_PRODUCTO primary key (REFERENCIA)
);

/*==============================================================*/
/* Index: PRODUCTO_PK                                           */
/*==============================================================*/
create unique index PRODUCTO_PK on PRODUCTO (
REFERENCIA
);

/*==============================================================*/
/* Index: TIPODELPRODUCTO_FK                                    */
/*==============================================================*/
create  index TIPODELPRODUCTO_FK on PRODUCTO (
IDTIPOPRODUCTO
);

/*==============================================================*/
/* Index: UNIDADDEMEDIDAPROD_FK                                 */
/*==============================================================*/
create  index UNIDADDEMEDIDAPROD_FK on PRODUCTO (
IDUNIDAD
);

/*==============================================================*/
/* Table: TIPOFACTURA                                           */
/*==============================================================*/
create table TIPOFACTURA (
   IDTIPOTRANSACCION    VARCHAR(15)          not null,
   IDFACTURA            VARCHAR(15)          null,
   TIPOTRANSACCION      VARCHAR(25)          null,
   constraint PK_TIPOFACTURA primary key (IDTIPOTRANSACCION)
);

/*==============================================================*/
/* Index: TIPOFACTURA_PK                                        */
/*==============================================================*/
create unique index TIPOFACTURA_PK on TIPOFACTURA (
IDTIPOTRANSACCION
);

/*==============================================================*/
/* Index: RELATIONSHIP_10_FK                                    */
/*==============================================================*/
create  index RELATIONSHIP_10_FK on TIPOFACTURA (
IDFACTURA
);

/*==============================================================*/
/* Table: TIPONOVEDAD                                           */
/*==============================================================*/
create table TIPONOVEDAD (
   IDTIPONOVEDAD        VARCHAR(15)          not null,
   DESTIPONOVEDAD       VARCHAR(25)          null,
   constraint PK_TIPONOVEDAD primary key (IDTIPONOVEDAD)
);

/*==============================================================*/
/* Index: TIPONOVEDAD_PK                                        */
/*==============================================================*/
create unique index TIPONOVEDAD_PK on TIPONOVEDAD (
IDTIPONOVEDAD
);

/*==============================================================*/
/* Table: TIPOPERSONA                                           */
/*==============================================================*/
create table TIPOPERSONA (
   IDTIPOPERSONA        VARCHAR(15)          not null,
   DESTIPOPERSONA       VARCHAR(25)          null,
   constraint PK_TIPOPERSONA primary key (IDTIPOPERSONA)
);

/*==============================================================*/
/* Index: TIPOPERSONA_PK                                        */
/*==============================================================*/
create unique index TIPOPERSONA_PK on TIPOPERSONA (
IDTIPOPERSONA
);

/*==============================================================*/
/* Table: TIPOPRODUCTO                                          */
/*==============================================================*/
create table TIPOPRODUCTO (
   IDTIPOPRODUCTO       VARCHAR(15)          not null,
   DESTIPOPRODUCTO      VARCHAR(40)          null,
   constraint PK_TIPOPRODUCTO primary key (IDTIPOPRODUCTO)
);

/*==============================================================*/
/* Index: TIPOPRODUCTO_PK                                       */
/*==============================================================*/
create unique index TIPOPRODUCTO_PK on TIPOPRODUCTO (
IDTIPOPRODUCTO
);

/*==============================================================*/
/* Table: UNIDAD                                                */
/*==============================================================*/
create table UNIDAD (
   IDUNIDAD             VARCHAR(15)          not null,
   IDPARAMETRO          VARCHAR(15)          null,
   FORMATOUNIDAD        VARCHAR(25)          null,
   constraint PK_UNIDAD primary key (IDUNIDAD)
);

/*==============================================================*/
/* Index: UNIDAD_PK                                             */
/*==============================================================*/
create unique index UNIDAD_PK on UNIDAD (
IDUNIDAD
);

/*==============================================================*/
/* Index: LIMITESUPERIOR_FK                                     */
/*==============================================================*/
create  index LIMITESUPERIOR_FK on UNIDAD (
IDPARAMETRO
);

alter table DETALLEFACTURA
   add constraint FK_DETALLEF_RELATIONS_PRODUCTO foreign key (REFERENCIA)
      references PRODUCTO (REFERENCIA)
      on delete restrict on update restrict;

alter table DISTRIBUCION
   add constraint FK_DISTRIBU_PRODUCTOD_PRODUCTO foreign key (REFERENCIA)
      references PRODUCTO (REFERENCIA)
      on delete restrict on update restrict;

alter table DISTRIBUCION
   add constraint FK_DISTRIBU_PROVEEDOR_PERSONA foreign key (IDPERSONA)
      references PERSONA (IDPERSONA)
      on delete restrict on update restrict;

alter table FACTURA
   add constraint FK_FACTURA_EMPLEADO__EMPLEADO foreign key (CEDULA)
      references EMPLEADO (CEDULA)
      on delete restrict on update restrict;

alter table FACTURA
   add constraint FK_FACTURA_FACTURADE_DETALLEF foreign key (IDDETALLEF)
      references DETALLEFACTURA (IDDETALLEF)
      on delete restrict on update restrict;

alter table FACTURA
   add constraint FK_FACTURA_PROVEEDOR_PERSONA foreign key (IDPERSONA)
      references PERSONA (IDPERSONA)
      on delete restrict on update restrict;

alter table FACTURA
   add constraint FK_FACTURA_RESOLUCIO_DIAN foreign key (RESOLUCION)
      references DIAN (RESOLUCION)
      on delete restrict on update restrict;

alter table HISTORICOCARGO
   add constraint FK_HISTORIC_CARGOHIST_CARGO foreign key (IDCARGO)
      references CARGO (IDCARGO)
      on delete restrict on update restrict;

alter table HISTORICOCARGO
   add constraint FK_HISTORIC_EMPLEADOC_EMPLEADO foreign key (CEDULA)
      references EMPLEADO (CEDULA)
      on delete restrict on update restrict;

alter table HISTORICOPRECIO
   add constraint FK_HISTORIC_EMPLEADOP_EMPLEADO foreign key (CEDULA)
      references EMPLEADO (CEDULA)
      on delete restrict on update restrict;

alter table HISTORICOPRECIO
   add constraint FK_HISTORIC_PRECIOHIS_UNIDAD foreign key (IDUNIDAD)
      references UNIDAD (IDUNIDAD)
      on delete restrict on update restrict;

alter table HISTORICOPRECIO
   add constraint FK_HISTORIC_RELATIONS_PRODUCTO foreign key (REFERENCIA)
      references PRODUCTO (REFERENCIA)
      on delete restrict on update restrict;

alter table INVENTARIO
   add constraint FK_INVENTAR_RELATIONS_FACTURA foreign key (IDFACTURA)
      references FACTURA (IDFACTURA)
      on delete restrict on update restrict;

alter table INVENTARIO
   add constraint FK_INVENTAR_UNIDADESI_UNIDAD foreign key (IDUNIDAD)
      references UNIDAD (IDUNIDAD)
      on delete restrict on update restrict;

alter table NOMINA
   add constraint FK_NOMINA_NOMINATIP_TIPONOVE foreign key (IDTIPONOVEDAD)
      references TIPONOVEDAD (IDTIPONOVEDAD)
      on delete restrict on update restrict;

alter table NOMINA
   add constraint FK_NOMINA_RELATIONS_EMPLEADO foreign key (CEDULA)
      references EMPLEADO (CEDULA)
      on delete restrict on update restrict;

alter table NOVEDAD
   add constraint FK_NOVEDAD_NOVEDADHI_HISTORIC foreign key (CONSECARGO)
      references HISTORICOCARGO (CONSECARGO)
      on delete restrict on update restrict;

alter table NOVEDAD
   add constraint FK_NOVEDAD_TIPODENOV_TIPONOVE foreign key (IDTIPONOVEDAD)
      references TIPONOVEDAD (IDTIPONOVEDAD)
      on delete restrict on update restrict;

alter table PARAMETROVENTA
   add constraint FK_PARAMETR_ANIOPARAM_ANIO foreign key (IDANIO)
      references ANIO (IDANIO)
      on delete restrict on update restrict;

alter table PARAMETROVENTA
   add constraint FK_PARAMETR_LIMITEINF_UNIDAD foreign key (IDUNIDAD)
      references UNIDAD (IDUNIDAD)
      on delete restrict on update restrict;

alter table PARAMETROVENTA
   add constraint FK_PARAMETR_PRODUCTOP_PRODUCTO foreign key (REFERENCIA)
      references PRODUCTO (REFERENCIA)
      on delete restrict on update restrict;

alter table PERSONA
   add constraint FK_PERSONA_TIPODEPER_TIPOPERS foreign key (IDTIPOPERSONA)
      references TIPOPERSONA (IDTIPOPERSONA)
      on delete restrict on update restrict;

alter table PRODUCTO
   add constraint FK_PRODUCTO_TIPODELPR_TIPOPROD foreign key (IDTIPOPRODUCTO)
      references TIPOPRODUCTO (IDTIPOPRODUCTO)
      on delete restrict on update restrict;

alter table PRODUCTO
   add constraint FK_PRODUCTO_UNIDADDEM_UNIDAD foreign key (IDUNIDAD)
      references UNIDAD (IDUNIDAD)
      on delete restrict on update restrict;

alter table TIPOFACTURA
   add constraint FK_TIPOFACT_RELATIONS_FACTURA foreign key (IDFACTURA)
      references FACTURA (IDFACTURA)
      on delete restrict on update restrict;

alter table UNIDAD
   add constraint FK_UNIDAD_LIMITESUP_PARAMETR foreign key (IDPARAMETRO)
      references PARAMETROVENTA (IDPARAMETRO)
      on delete restrict on update restrict;

