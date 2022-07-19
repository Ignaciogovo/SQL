use Facturas


create table Producto(
	proID int identity(1,1) not null,
	nombre varchar(25) not null,
	precio numeric(18,2),
	modelo varchar(25),
	cantidad smallint not null,
	marca varchar(15),
	fabricacion smalldatetime ,
	valoracion numeric(2,1),

	constraint PK_Producto primary key 
	(
		proID asc
	),

	constraint UQ_ProductoUnico unique
	(
		nombre, modelo, marca
	),

	constraint CK_precio_no_negativo check
	(
		precio>=0
	),

	constraint CK_cantidad_mayor_cero check
	(
		cantidad>0
	),

	constraint CK_valor_no_negativo check
	(
		valoracion >0
	)
)