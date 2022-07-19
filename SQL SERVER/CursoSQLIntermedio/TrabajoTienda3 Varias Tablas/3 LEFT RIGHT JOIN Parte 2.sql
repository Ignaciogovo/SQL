
Use Facturas

select * from Cliente as CL
inner join
Pedido as PE
on CL.dni = PE.dni
order by CL.dni

select * from Cliente as CL
left join
Pedido as PE
on CL.dni = PE.dni
order by CL.dni


select * from Cliente as CL
right join
Pedido as PE
on CL.dni = PE.dni
order by CL.dni

select 'LEFT JOIN: Clientes sin pedidos' as Comentario
select * from Cliente as CL
left join
Pedido as PE
on CL.dni = PE.dni
where PE.dni is null
order by CL.dni

select 'RIGHT JOIN: Hemos forzado un pedido sin cliente' as Comentario
select * from Cliente as CL
right join
Pedido as PE
on CL.dni = PE.dni
where CL.dni is null
order by CL.dni

/*
alter table Pedido
NOCHECK CONSTRAINT fk_pedido_cliente

insert into Pedido
values
('01/01/2001','012345R')

alter table Pedido
CHECK CONSTRAINT fk_pedido_cliente
*/

