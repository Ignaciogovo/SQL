/*

Variables

1) Utilizar variables en el informe de Marcas de Productos

*/

Use Facturas

declare @buscaProducto varchar(50)
declare @caja smallint
declare @valor tinyint
declare @ventasAnuales int

set @buscaProducto = 'Disco duro%'
set @caja=8
set @valor=6
set @ventasAnuales=7500


select marca,YEAR(fabricacion) as Año,SUM(precio*cantidad*@caja) as TotalMarcaAño
from Producto
where nombre not like @buscaProducto
	and valoracion>=@valor
group by marca,YEAR(fabricacion)
having SUM(precio*cantidad*@caja)>@ventasAnuales
order by marca,YEAR(fabricacion)


set @ventasAnuales=3500

select marca, COUNT(año) as años, SUM(TotalMarcaAño) as TotalMarca
from
(
		select marca,YEAR(fabricacion) as Año,SUM(precio*cantidad*@caja) as TotalMarcaAño
		from Producto
		where nombre not like @buscaProducto
			and valoracion>=@valor
		group by marca,YEAR(fabricacion)
		having SUM(precio*cantidad*@caja)>@ventasAnuales
		--order by marca,YEAR(fabricacion)
) as Tabla1
group by marca
order by años desc


