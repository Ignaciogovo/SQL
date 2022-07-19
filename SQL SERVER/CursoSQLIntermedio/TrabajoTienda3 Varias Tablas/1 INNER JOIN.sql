
Use Facturas

select * from Encargo as EN
inner join
Producto as PR
on EN.proID = PR.proID
order by EN.proID

select EN.*,PR.nombre,PR.modelo,PR.valoracion
from Encargo as EN
inner join
Producto as PR
on PR.proID = EN.proID
where EN.pedID = 15

---

declare @id smallint = 51

select PR.*, EN.pedID,EN.cantidad, (precio * EN.cantidad) as Ganancia
from Producto as PR
inner join
Encargo as EN
on PR.proID = EN.proID
where PR.proID = @id

select CONCAT_WS(';',UPPER('Total ganancias'),
	(select nombre from Producto where proID like @id))
select nombre, modelo, marca
	,sum(EN.cantidad) Productos
	,SUM((precio * EN.cantidad)) as GananciaTOtal
from Producto as PR
inner join
Encargo as EN
on PR.proID = EN.proID
where PR.proID = @id
group by nombre, marca, modelo

