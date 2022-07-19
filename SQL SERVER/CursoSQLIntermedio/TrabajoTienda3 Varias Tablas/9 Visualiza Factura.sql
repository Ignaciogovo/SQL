/*
5)
- Insercion si hay nueva tienda
- Insercion si es nuevo cliente
- Insercion de la venta
- Visualización de la factura con funcion para calcular el precio con impuesto y descuentos si procede
- Creación del informe factura
- Guardado de la factura
*/
Use facturas

/*** Nueva Tienda ***/
--exec sp_insert_tiendas 'CableStore','Valle Silicio 1','B345','789 89 89 89','info@cablestore.com',18.5

/*** Nuevo Cliente ***/
--exec sp_insert_clientes '123A','Arya Stark','arya@got.es',23,'Braavos 4'


/***** Datos variables de la Factura *****/
/* Variables para cálculos*/
declare @num_fac bigint
declare @desc numeric
declare @impuesto numeric(5,4) --<-- Esta variable tendrá al menos 4 decimales
declare @sw_ultimo_prod bit

/* Variables solicitadas a usuario */
declare @id_tie int
declare @dni_cli varchar(10)
declare @fecha_fac smalldatetime

declare @id_producto int
declare @cantidad_prod smallint
declare @desc_prod numeric(3,1)

/* Valores que asigna usuario */
set @id_tie=1
set @dni_cli='B123'
set @fecha_fac=(select CURRENT_TIMESTAMP)

set @id_producto=18
set @cantidad_prod=1
set @desc_prod=0
set @sw_ultimo_prod=1 --<<-- 1 en el ultimo producto
/*****************************************/


/*** Venta ***/

/* Pedido */
exec sp_insert_pedidos @fecha_fac,@dni_cli

/* Producto */
exec sp_insert_encargos @id_producto, @cantidad_prod, @desc_prod



select 'SECCION TIENDA' as CabeceraTienda
select nombre,cif,direccion,telefono,email from Tienda
	where TieID=@id_tie

set @num_fac = (select case when MAX(FacID) is null then 1
							else MAX(FacID)+1 end as FacID from Facturas)

select Concat_WS(':','Número',(select @num_fac)) as "Datos Factura"
select Concat_WS(':','Fecha',CONVERT(varchar, (select @fecha_fac), 103)) as "Datos Factura"


select 'SECCION CLIENTE' as CabeceraCliente
select nombre,dni,direccion,email from Cliente
	where dni=@dni_cli



/** Visualizacion de la factura **/

set @impuesto=(select impuesto/100.0 from Tienda	
				where TieID=@id_tie)


select 'SECCION PRODUCTOS' as CuerpoFactura
select pr.proID,modelo, marca, precio
	,en.cantidad,en.descuento
	,dbo.ImporteConDescuento(precio,en.cantidad,en.descuento) as "Importe(Desc)"
	,(select @impuesto) as "%"
	,dbo.ImporteTotalProducto(precio,en.cantidad,en.descuento,@impuesto) as "Importe Total"
	
from Producto as pr
inner join
Encargo as en
on pr.proID= en.proID
where en.pedID = (select MAX(pedID) from Pedido)

select 'SECCION TOTAL PRODUCTOS' as CuerpoFactura
select count(distinct(pr.proID)) as Productos
	,'-' as "|"
	, COUNT(distinct(marca)) as Marcas
	,'-' as "|"
	,sum(en.cantidad) as Unidades
	,'-' as "|"
	,sum(dbo.ImporteConDescuento(precio,en.cantidad,en.descuento)) as SubTotal
	,'-' as "|"
	,sum(dbo.ImporteTotalProducto(precio,en.cantidad,en.descuento,@impuesto)) as TOTAL
	
from Producto as pr
inner join
Encargo as en
on pr.proID= en.proID
where en.pedID = (select MAX(pedID) from Pedido)


/*** Guardar Factura ***/


if (@sw_ultimo_prod=1)
begin
	insert into Facturas.dbo.Facturas
	select (select @fecha_fac) as fecha
		,sum(dbo.ImporteConDescuento(precio,en.cantidad,en.descuento)) as total_sin
		,sum(dbo.ImporteTotalProducto(precio,en.cantidad,en.descuento,@impuesto)) as total_factura	
	from Producto as pr
	inner join
	Encargo as en
	on pr.proID= en.proID
	where en.pedID = (select MAX(pedID) from Pedido)
end


