

Use Facturas

select * from Cliente as CL
inner join
Pedido as PE
on CL.dni = PE.dni
order by CL.dni

select * from Cliente as CL
full outer join
Pedido as PE
on CL.dni = PE.dni
order by CL.dni

select * from Cliente as CL
full outer join
Pedido as PE
on CL.dni = PE.dni
where CL.dni is null
	or PE.dni is null
order by CL.dni

