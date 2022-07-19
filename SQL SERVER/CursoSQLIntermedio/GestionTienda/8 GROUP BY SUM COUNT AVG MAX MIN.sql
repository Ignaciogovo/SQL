Use Facturas

select marca,nombre
	,SUM(precio) as TotalPrecio
	,COUNT(*) as NumeroProductos
	,AVG(precio) as MediaPrecio
from Producto
where marca in ('Samsung','Intel','HP','ElGato')
group by marca,nombre

order by marca

select AVG(edad) as Media
	,MAX(edad) as Mayor
	,MIN(edad) as Menor

from Cliente