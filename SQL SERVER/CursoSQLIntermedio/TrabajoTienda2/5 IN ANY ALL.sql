Use Facturas

declare @dnicompra as varchar(10)
set @dnicompra = '333334444I'

select * from Pedido
where dni like @dnicompra

select * from Encargo
where pedID not in (
			select pedID from Pedido
			where dni like @dnicompra
				)

select * from Encargo
where pedID > ANY (
				select pedID from Pedido
				where dni like @dnicompra
					)

select * from Encargo
where pedID < ALL (
				select pedID from Pedido
				where dni like @dnicompra
					)