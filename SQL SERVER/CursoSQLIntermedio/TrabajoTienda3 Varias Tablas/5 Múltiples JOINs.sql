Use Facturas

declare @MiCliente varchar(50) = 'Susana'

select * from Cliente as CL
inner join
Pedido as PE
on CL.dni = PE.dni
	inner join
	Encargo as EN
	on PE.pedID = EN.pedID
		inner join
		Producto as PR
		on EN.proID = PR.proID
where CL.nombre = @MiCliente
order by CL.dni

select CL.nombre,CL.edad,PE.fecha,EN.cantidad,PR.nombre,PR.marca from Cliente as CL
inner join
Pedido as PE
on CL.dni = PE.dni
	inner join
	Encargo as EN
	on PE.pedID = EN.pedID
		inner join
		Producto as PR
		on EN.proID = PR.proID
where CL.nombre = @MiCliente
order by CL.dni