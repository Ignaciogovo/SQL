Use Facturas

-- Jon Nieve: Eliminar unn producto de su último pedido

select * from Pedido 
where dni like 'B123'

select MAX(pedId) from Pedido 
where dni like 'B123'

select * from Encargo
where pedID= (select MAX(pedId) from Pedido 
				where dni like 'B123')

select * from Producto 
where proID in (2,
				5,
				12,
				17)

select * from Encargo
where pedID= (select MAX(pedId) from Pedido 
				where dni like 'B123')
					and proID=17

delete Encargo
where pedID= (select MAX(pedId) from Pedido 
				where dni like 'B123')
					and proID=17

select @@ROWCOUNT as Elminaciones

select * from Encargo



