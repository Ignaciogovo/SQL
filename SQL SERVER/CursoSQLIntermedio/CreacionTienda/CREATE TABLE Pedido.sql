use Facturas

create table Pedido
(
	pedID int identity(1,1) not null,
	fecha smalldatetime ,
	dni varchar(10) not null,

	constraint pk_pedido primary key
	(
		pedID ASC
	),

	constraint fk_pedido_cliente foreign key (dni)
		references Cliente(dni)
)

