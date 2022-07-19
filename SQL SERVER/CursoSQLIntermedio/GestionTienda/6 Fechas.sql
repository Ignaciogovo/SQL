Use Facturas

select * from Producto
where fabricacion>= '01-01-2020'
order by fabricacion

select @@ROWCOUNT as "Total FEchas"

select * from Producto
where fabricacion< '01-01-2020'
	or fabricacion is null
order by fabricacion

select @@ROWCOUNT as "Total FEchas"

select * from Producto
where fabricacion>= '01/01/2020'
order by fabricacion

select @@ROWCOUNT as "Total FEchas"

select * from Producto
where fabricacion between '14/02/2020' and '15/04/2020'

select @@ROWCOUNT as "Total FEchas"

select * from Producto
where fabricacion between '14/02/2020' and '14/02/2020 23:59:45'
order by fabricacion

select @@ROWCOUNT as "Total FEchas"

select * from Producto
where fabricacion between '14/02/2020' and '14/02/2020 23:59:29.998'

select @@ROWCOUNT as "Total FEchas buscando limites"
