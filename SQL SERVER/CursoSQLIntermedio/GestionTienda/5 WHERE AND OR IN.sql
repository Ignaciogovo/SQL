Use Facturas

select * from Producto
where nombre like 'Disco duro'

select @@ROWCOUNT as "TOTAL DD"

select * from Producto
where valoracion>7

select @@ROWCOUNT as "TOTAL M7"

select * from Producto
where nombre like 'Disco duro'
	and valoracion>7

select @@ROWCOUNT as "TOTAL DD M7"

select * from Producto
where nombre like 'Disco duro'
	or nombre like 'Monitor'

select @@ROWCOUNT as "TOTAL DD MON"

select * from Producto
where (nombre like 'Disco duro'
	or nombre like 'Monitor')
	and valoracion >7 

select @@ROWCOUNT as "TOTAL DD MON M7"

--------------------------

select * from Producto
where marca in ('Intel','Samsung','HP')
	and precio>200

select @@ROWCOUNT as "MARCAS"


