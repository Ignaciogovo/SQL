
Use Facturas

declare @nombre varchar(50) = 'Monitor%'

select PR.*, EN.pedID,EN.cantidad, (precio * EN.cantidad) as Ganancia
from Producto as PR
inner join
Encargo as EN
on PR.proID = EN.proID
where nombre like @nombre

select PR.*, EN.pedID,EN.cantidad, (precio * EN.cantidad) as Ganancia
from Producto as PR
left join
Encargo as EN
on PR.proID = EN.proID
where nombre like @nombre

select PR.*, EN.pedID,EN.cantidad, (precio * EN.cantidad) as Ganancia
from Producto as PR
right join
Encargo as EN
on PR.proID = EN.proID
where nombre like @nombre