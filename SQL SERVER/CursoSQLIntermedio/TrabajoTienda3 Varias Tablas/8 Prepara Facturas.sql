/******* Realización de una factura *******/

/*
Composición de la factura:

SECCION TIENDA
<Nombre de la tienda> <CIF> <Dirección> <Telefono> <Email>

Número: <Numero de factura>
Fecha: <Fecha_factura>

SECCION CLIENTE
<Nombre del cliente>
<Dni>
<Dirección>
<email>

SECCION PRODUCTOS
<IdProd1> <modelo> <marca> <cantidad> <precio> <descuento> <importe_con_descuento> <impuesto> <Importe_total_producto>
<IdProd2> <modelo> <marca> <cantidad> <precio> <descuento> <importe_con_descuento> <impuesto> <Importe_total_producto>
...
<IdProdN> <modelo> <marca> <cantidad> <precio> <descuento> <importe_con_descuento> <impuesto> <Importe_total_producto>

SECCION TOTAL PRODUCTOS
<Numero_Productos>	<unidades>	<Total_Precio>		<Total_descuentos>				<Total_factura>
*/

Use Facturas
/*
1) 
- Tenemos que tener almacenado los datos de una o varias Tiendas. Supone la creacion de una tabla
- Se podría hacer en otra tabla, pero en este caso junto a los datos de la tienda , guardamos el impuesto.
*/

create table Tienda(
	TieID smallint identity(1,1) not null,
	nombre varchar(20) not null,
	direccion varchar(30) not null,
	cif varchar(10) not null,
	telefono varchar(12),
	email varchar(30),
	impuesto numeric(3,1),
	constraint PK_Tienda primary key 
	(
		TieID asc
	)
)
go

create procedure sp_insert_tiendas(	
	@nombre varchar(20),
	@direccion varchar(30),
	@cif varchar(10),
	@telefono varchar(12),
	@email varchar(30),
	@impuesto numeric(3,1)
)
as
begin
	insert into Tienda
	values
	(@nombre,@direccion,@cif,@telefono,@email,@impuesto)
end
go

/*
2)
- Como hay que especificar el numero de factura, necesitamos otra tabla donde se almacenen
- Cada vez que se añada una factura podremos basarnos en la ultima almacenada
*/

create table Facturas(
	FacID bigint identity(1,1) not null,
	fecha datetime not null,
	total_sin numeric(18,2),
	total_factura numeric(18,2),
	constraint PK_Facturas primary key
	(
		FacID asc
	)
)

/*
3)
- Si el cliente no existe aún, hay que darle de alta: procedimiento para insertar cliente
*/


create procedure sp_insert_clientes(
	@dni varchar(10),
	@nombre varchar(40),
	@email varchar(25),
	@edad tinyint,
	@direccion varchar(40)
)
as
begin
	insert into Cliente
	values
	(@dni,@nombre,@email,@edad,@direccion)
end
go

/*
4)
- Pedidos del cliente: Tenemos los procedimientos de insercion de pedido y encargo
*/

/*
5)
- Cálculo de los importes: 
- Función Importe con Descuento
*/

-- (precio*cantidad)*descuento/100

Use Facturas
go
create function dbo.ImporteConDescuento(
	@precio numeric(6,2),
	@cantidad smallint,
	@desc numeric(3,1)
)
returns numeric(18,2)
as
begin
	declare @resultado numeric(18,2),@temp numeric(6,2)

	select @temp=@precio*@cantidad
	select @resultado=@temp-(@temp*(@desc/100.0))

	return @resultado
end
go
/*
- Función Importe Total de Producto
*/

Use Facturas
go
create function dbo.ImporteTotalProducto(
	@precio numeric(6,2),
	@cantidad smallint,
	@desc numeric(3,1),
	@impuesto numeric(5,4)
)
returns numeric(18,2)
as
begin
	declare @resultado numeric(18,2),@temp numeric(18,2)

	select @temp=dbo.ImporteConDescuento(@precio,@cantidad,@desc)
	select @resultado=@temp+(@temp*@impuesto)

	return @resultado
end
go

