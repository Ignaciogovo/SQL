Use Facturas

select * from Producto
where nombre='Tarjeta%'

select * from Producto
where nombre like 'Tarjeta%'

select * from Producto
where modelo like '%gaming%'

select * from Producto
where nombre like 'rat_n'

select * from Producto
where modelo like 'Extreme [1,2]%'

select * from Producto
where modelo like 'Extreme [2-4]%'

select * from Producto
where modelo like 'Extreme [^2]%'

select * from Producto
where nombre not like 'Tarjeta%'

