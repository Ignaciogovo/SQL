/*

Informe de Marcas de los Productos

1) Exponer un listado de las marcas, las fechas de fabricaci�n agrupadas por a�os y el total de ventas anual de los productos.

Evitar los datos de los televisores y los productos que han suspendido en valoraci�n.

Filtrar las mas exitosas seg�n hayan tenido mas de 7000 euros en ventas en productos de cada a�o. (Es un filtro de la agrupacion previa)

Info 1: Se realiza la suposici�n de que se han vendido 10 cajas de cada producto.

Info 2: El modificador que nos indica el a�o de un smalldatetime es YEAR()



2) A continuaci�n, en otro listado, ordenar las marcas de mayor a menor numero de a�os con esas ventas

Info 3: La clausula ORDER BY no es v�lida en subconsultas

*/

Use Facturas

select marca,YEAR(fabricacion) as A�o,SUM(precio*cantidad*10) as TotalMarcaA�o
from Producto
where nombre not like 'Televisi_n%'
	and valoracion>=5
group by marca,YEAR(fabricacion)
having SUM(precio*cantidad*10)>7000
order by marca,YEAR(fabricacion)


select marca, COUNT(a�o) as a�os, SUM(TotalMarcaA�o) as TotalMarca
from
(
		select marca,YEAR(fabricacion) as A�o,SUM(precio*cantidad*10) as TotalMarcaA�o
		from Producto
		where nombre not like 'Televisi_n%'
			and valoracion>=5
		group by marca,YEAR(fabricacion)
		having SUM(precio*cantidad*10)>7000
		--order by marca,YEAR(fabricacion)
) as Tabla1
group by marca
order by a�os desc