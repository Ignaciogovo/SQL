Use Facturas

declare @Ellimite smallint, @Elcomienzo smallint

declare @productoA varchar(25) = 'Disco%'
declare @productoB varchar(25) = 'Impresora%'

declare @marca1 varchar(25) = 'Intel',
		@marca2 varchar(25) = 'AOC',
		@marca3 varchar(25) = 'Seagate'

set @Elcomienzo=8
set @Ellimite=20

--goto salta

select * from Producto
where cantidad=@Ellimite

select * from Producto
where cantidad>@Ellimite

select * from Producto
where cantidad!>@Ellimite


select * from Producto
where cantidad!<@Ellimite

select * from Producto
where cantidad between @Elcomienzo and @Ellimite
order by cantidad

--salta:

----------------------------

select * from Producto
where nombre like @productoA


select * from Producto
where nombre like @productoB

select * from Producto
where marca in (@marca1,@marca2,@marca3)
order by marca

