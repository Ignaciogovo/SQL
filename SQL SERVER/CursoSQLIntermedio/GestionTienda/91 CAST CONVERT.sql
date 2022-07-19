Use Facturas

select nombre+'-----'+email as "Nombre y email"
	,CAST(edad as varchar)+' años' as Edad

from Cliente

select CAST(edad as varchar) as EdadConCast
	,CONVERT(varchar, edad) as EdadConConvert
from Cliente

select top 3 CAST(fabricacion as varchar) as FechaCast
from Producto

select top 3 CONVERT(varchar, fabricacion, 101) as FechaConvert
from Producto


select top 3 CONVERT(varchar, fabricacion, 102) as FechaConvert
from Producto

select top 3 CONVERT(varchar, fabricacion, 103) as FechaConvert
from Producto

select top 3 CONVERT(varchar, fabricacion, 104) as FechaConvert
from Producto

select top 3 CONVERT(varchar, fabricacion, 105) as FechaConvert
from Producto

select top 3 CONVERT(varchar, fabricacion, 109) as FechaConvert
from Producto


select top 3 CONVERT(varchar, fabricacion, 120) as FechaConvert
from Producto

-----------------------------


select * from 
(
	select nombre,modelo,marca,valoracion,precio
				,cast( (valoracion/precio)*10 as numeric(4,2) ) as "Relacion Calidad-precio"
	from Producto
	--order by "Relacion Calidad-precio" desc
) as SeleccionPrevia
where "Relacion Calidad-precio">1.0
order by  "Relacion Calidad-precio" desc


