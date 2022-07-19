/*

Conocer a los clientes:

1) Realiza un listado de clientes (sin el DNI) que tengan alguno de estos dominios en su mail:
	"sumail", "masmail" o "mejormail"; A continuación filtra por los que vivan en calles (no en plazas, avenidas, etc)

2) Muestra el dato de la edad media de todos los clientes de la tabla que tengan edad en su registro.

	Info 1: la funcion de media de enteros hará media entera, lo cual puede que no sea una media exacta. Recuerda el CAST.

*/

Use Facturas

select nombre, email, edad, direccion
from Cliente
where (email like '%sumail%' or email like '%masmail%' or email like '%mejormail%')
			and direccion like 'Calle%'



select cast(edad as numeric(3,1) )  as Media
from Cliente
where edad is not null

select AVG( cast(edad as numeric(3,1) )  ) as Media
from Cliente
where edad is not null
