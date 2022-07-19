/*

Informe de Marcas de los Productos

1) Exponer un listado de las marcas, las fechas de fabricación agrupadas por años y el total de ventas anual de los productos.

Evitar los datos de los televisores y los productos que han suspendido en valoración.

Filtrar las mas exitosas según hayan tenido mas de 7000 euros en ventas en productos de cada año. (Es un filtro de la agrupacion previa)

Info 1: Se realiza la suposición de que se han vendido 10 cajas de cada producto.

Info 2: El modificador que nos indica el año de un smalldatetime es YEAR()



2) A continuación, en otro listado, ordenar las marcas de mayor a menor numero de años con esas ventas

Info 3: La clausula ORDER BY no es válida en subconsultas

*/

Use Facturas

select marca,YEAR(fabricacion) as Año,SUM(precio*cantidad*10) as TotalMarcaAño
from Producto
where nombre not like 'Televisi_n%'
	and valoracion>=5
group by marca,YEAR(fabricacion)
having SUM(precio*cantidad*10)>7000
order by marca,YEAR(fabricacion)


select marca, COUNT(año) as años, SUM(TotalMarcaAño) as TotalMarca
from
(
		select marca,YEAR(fabricacion) as Año,SUM(precio*cantidad*10) as TotalMarcaAño
		from Producto
		where nombre not like 'Televisi_n%'
			and valoracion>=5
		group by marca,YEAR(fabricacion)
		having SUM(precio*cantidad*10)>7000
		--order by marca,YEAR(fabricacion)
) as Tabla1
group by marca
order by años desc