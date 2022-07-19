
/*
 Crear dos procedimientos almacenados que permitan dos inserciones: 

 1) sp_insert_pedidos Inserción en pedido
 2) sp_insert_encargos Inserción en encargo (dando el id de pedido del insert anterior, será el mayor)	

 BEGIN END si estan permitidas en Procedimientos
*/




create procedure sp_insert_pedidos(
	@fecha smalldatetime,
	@dni varchar(10)
)
as
begin
	insert into Pedido
	values
	(@fecha,@dni)
end
go

create proc sp_insert_encargos(
	@producto int,
	@cantidad smallint,
	@descuento numeric(3,1)
)
as
begin
	insert into Encargo
	values
	(
	(select MAX(pedId) from Pedido),@producto,@cantidad,@descuento
	)
end





