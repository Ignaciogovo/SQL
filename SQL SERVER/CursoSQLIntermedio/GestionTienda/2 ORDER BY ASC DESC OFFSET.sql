Use Facturas

select * from Cliente
order by nombre desc

select * from Cliente
order by edad desc

select * from Cliente
order by edad, nombre desc


select top 15 * from Cliente
order by edad desc, nombre desc

select * from Cliente
order by edad desc offset 5 rows

select * from Cliente
order by edad desc
	offset 0 rows
	fetch next 8 rows only
