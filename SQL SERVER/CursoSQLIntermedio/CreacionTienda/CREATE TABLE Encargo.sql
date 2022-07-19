use Facturas

create table Encargo
(
	pedID int not null,
	proID int not null,
	cantidad smallint not null,
	descuento numeric(3,1) ,

	constraint CK_cantidad_encargo_mayor_cero check
	(
		cantidad>0
	),

	constraint CK_descuento_no_negativo check
	(
		descuento>=0
	),

	constraint fk_encargo_pedido foreign key(pedID)
		references Pedido(pedID)
	,
	constraint fk_encargo_producto foreign key (proID)
		references Producto(proID)
	,
	constraint UQ_PedidoUnico unique
		(pedID,proID)

)