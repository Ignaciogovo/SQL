Use Facturas

select marca,nombre
	,SUM(precio) as TotalPrecio
	,COUNT(*) as NumeroProductos
	,AVG(precio) as MediaPrecio
from Producto
where marca in ('Samsung','Intel','HP','ElGato')
group by marca,nombre
having COUNT(*)>1
order by marca

select marca as Marca
		,MIN(precio) as MinPrecio
		,MAX(precio) as MaxPrecio
from Producto
group by marca
having MIN(precio)>100 and MAX(precio)<800
