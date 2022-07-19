Use Facturas

select * from Producto
where cantidad=10

select * from Producto
where cantidad<=10
order by cantidad

select * from Producto
where cantidad<>10
order by cantidad

select * from Producto
where cantidad between 5 and 10
order by cantidad

select @@ROWCOUNT

select * from Producto
where cantidad not between 5 and 10
order by cantidad


select @@ROWCOUNT

select * from Producto
where modelo is not null

