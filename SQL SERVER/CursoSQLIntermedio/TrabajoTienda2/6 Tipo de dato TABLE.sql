Use Facturas

declare @MiTabla TABLE
(
	dni varchar(10) not null,
	nombre varchar(40) not null,
	email varchar(35) NULL,
	edad tinyint null,
	direccion varchar(40) null
)


--delete From Cliente
--output deleted.* into @MiTabla
--where dni like '123456789A'

--select 'Registros que se han eliminado: ' Resultado
--select * from @MiTabla

update Cliente
set email='tony@unmailmas.com'
output inserted.* into @MiTabla
where dni like '333333333C'

select 'Registros que se han actualizado: ' Resultado
select * from @MiTabla

select * from Cliente
where dni like '333333333C'

