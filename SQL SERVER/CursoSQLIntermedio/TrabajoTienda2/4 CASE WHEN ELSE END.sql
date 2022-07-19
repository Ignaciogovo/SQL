Use Facturas

select COUNT(*) from  Cliente
where direccion like '%calle%'

select COUNT(*) from  Cliente
where direccion like '%avenida%'


select COUNT(*) from  Cliente
where direccion not like '%calle%' and
	direccion not like '%avenida%'

select COUNT(*) from  Cliente
where direccion is null


select TipoDireccion,COUNT(nombre) Clientes 
from
(

	select nombre,
			case when direccion like '%calle%' then 'calle'
				when direccion like '%avenida%' then 'avenida'
				else 'otra'
			end as TipoDireccion
	from Cliente
) as T
group by TipoDireccion

---------------------------

select marca,'Tiene '+cast(COUNT(nombre) as varchar)+' productos '+Tipo as Resumen
from
(
		select nombre, marca, precio,
			case
				when precio<30 then 'economicos'
				when precio between 30 and 100 then 'medios'
				when precio>100 then 'de gama alta'
				else 'No deberia salir, error'
			end Tipo
		from Producto
		where marca is not null
) as T
group by Tipo,marca
order by marca


		




