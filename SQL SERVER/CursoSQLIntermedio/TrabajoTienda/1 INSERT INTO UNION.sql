Use Facturas

insert into Pedido
values
('29/02/2020','111111111B')

insert into Encargo
select
(select MAX(pedID) from Pedido) as pedID
,12 as proID
,2 as cantidad
,0 as descuento
union
select
(select MAX(pedID) from Pedido) as pedID
,2 as proID
,1 as cantidad
,0 as descuento
union
select
(select MAX(pedID) from Pedido) as pedID
,5 as proID
,3 as cantidad
,0 as descuento
union
select
(select MAX(pedID) from Pedido) as pedID
,17 as proID
,1 as cantidad
,5 as descuento

