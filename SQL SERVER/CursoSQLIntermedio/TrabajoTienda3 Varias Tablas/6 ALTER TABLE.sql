Use Facturas

ALTER TABLE Seg_Cliente
ADD id int identity (1, 1) not null
constraint pk_Seg_Cliente primary key
(
	id
)