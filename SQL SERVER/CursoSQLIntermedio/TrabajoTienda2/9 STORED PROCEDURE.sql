

create proc sp_select_prod
(
	@marca varchar(25)
)
as

select * from Producto
	where marca like @marca
	order by precio desc


sp_select_prod 'AMD'

exec sp_select_prod 'Samsung'