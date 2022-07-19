

/*
 El objetivo es ver que marcas y clientes aun no tienen pedidos

 1) Seleccionar los distintos clientes (el dni) que no tiene pedidos  

 2) Seleccionar las distintas marcas que si tienen pedidos, por tanto si tienen encargos

 3) Seleccionar las distintas marcas que no están en el listado anterior (por tanto no tienen encargos). Evitar las marcas sin nombre. 
 
 4) Añadir a esa selección el mayor identificador de producto por marca. 
 Contar las filas de modo que nos resuma 'X marcas sin Encargos'

 Info: Función de contabilización de registros afectados y función de concatenacion con carácter separador

*/

Use Facturas

select distinct dni from Cliente
	where dni not in (select distinct dni from Pedido)

select distinct marca from Producto
	where proID in
		( select distinct proID from Encargo)
		and marca is not null

select distinct marca,MAX(proID) maximoID
from Producto
	where marca not in(
			select distinct marca from Producto
			where proID in
				( select distinct proID from Encargo)
				and marca is not null
			)
group by marca
select concat_ws(' ',@@ROWCOUNT,'marcas sin Encargo')





