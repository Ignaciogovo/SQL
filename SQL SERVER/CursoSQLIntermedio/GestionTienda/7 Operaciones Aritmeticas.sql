Use Facturas

select top 10 nombre, modelo, marca, precio, cantidad
from Producto
order by precio desc

select top 10 nombre, modelo, marca, precio-cantidad as NOESNADA
from Producto
order by precio desc

select top 10 nombre, modelo, marca, precio,cantidad,precio*cantidad as PrecioLote
from Producto
order by PrecioLote desc


select * from 
(
	select nombre,modelo,marca,valoracion,precio
				,(valoracion/precio)*10 as "Relacion Calidad-precio"
	from Producto
	--order by "Relacion Calidad-precio" desc
) as SeleccionPrevia
where "Relacion Calidad-precio">1.0
order by  "Relacion Calidad-precio" desc

---
select *,edad%2 from Cliente
where edad%2 = 0

select *,edad%2 from Cliente
where edad%2 <> 0