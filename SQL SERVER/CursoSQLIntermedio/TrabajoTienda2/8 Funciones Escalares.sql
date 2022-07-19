
/**** Funciones de configuración ****/
select @@LANGUAGE Lenguaje, @@SERVERNAME Servidor, @@SERVICENAME Instancia, @@VERSION VersionGestor


/**** Funciones de fecha y hora ****/

select SYSDATETIME() FechaHoraInstanciaEquipoAP, SYSDATETIMEOFFSET() FechaHoraInstanciaEquipoAP
select CURRENT_TIMESTAMP FechaHoraInstanciaEquipoBP,GETDATE() FechaHoraInstanciaEquipoBP

---- Funciones que devuelven parte de fecha-hora -----
select DAY(SYSDATETIME()) Dia, MONTH(SYSDATETIME()) Mes, YEAR(SYSDATETIME()) Año

---- Funciones de operaciones de fecha-hora -----
select DATEDIFF(day,'01/01/2020','29/01/2020') DiferenciaEnDias
select DATEDIFF(HOUR,'01/01/2020','02/01/2020') DiferenciaEnHoras
select DATEDIFF(HOUR,'01/01/2020 12:00','02/01/2020') DiferenciaEnHoras
select DATEDIFF(Month,'01/01/2020','01/03/2020') DiferenciaEnMeses
select DATEDIFF(year,'01/01/2019','01/01/2020') DiferenciaEnAños

select DATEADD(YEAR,1,'31/01/2020') AñadeUnAño
select DATEADD(MONTH,1,'31/01/2020') AñadeUnMes  --<-- Ultimo día del mes siguiente
select DATEADD(HOUR,1,'31/01/2020 8:45') AñadeUnaHora
select DATEADD(HOUR,-1,'31/01/2020 8:45') RestaUnaHora

select CONVERT(varchar,DATEADD(YEAR,1,'31/01/2020'),103)

select ISDATE('01/01/2020')
select ISDATE('01/13/2020')

/**** Funciones matemáticas ****/

select PI(),ABS(-4),SQRT(144),sin(45),cos(45),tan(45) --<-- etc etc


/**** Funciones cadena de caracteres ****/

select CHARINDEX('Duro','Disco Duro') BuscaDesdePrincipio
select CHARINDEX('Duro','Disco Duro',9) BuscaDesdePosicionInt

select CONCAT('Disco','SSD') Concatena
select CONCAT_WS(' ','Disco','HDD') ConcatenaConSeparador

select LEFT('Fuente Alimentación',6) CortaporIZQ
select RIGHT('Fuente Alimentación',6) CortaporDER
select LEN('Fuente Alimentación') LongitudCad
select LOWER('Fuente Alimentación') Minus
select UPPER('Fuente Alimentación') Mayus
select LTRIM('   GOT SL') CortaEspaciosIZQ
select RTRIM('GOT SL      ') CortaEspaciosDER
select TRIM('    GOT SL     ') CortaEspaciosTOTAL

select PATINDEX('%TB%','Discos 550GB, Discos 1TB, Discos 2TB') BuscaPRIMERPatron

select REPLACE('Procesador AMD','AMD','Intel') Reemplazo
select REPLICATE('Papel Impresora',3) Replicar
select REVERSE('samsung')

select '-----        -----' "UFF!"
select '-----'+SPACE(8)+'-----' "MEJOR!"

SELECT STR(112.37, 6, 1)

SELECT STRING_AGG (CONVERT(nvarchar(max),Nombre), ',') AS csv 
FROM Producto

declare @Productos NVARCHAR(400) = 'microfono,cascos,smartphone,notebook,memoria usb'   
select value from STRING_SPLIT(@Productos, ',')  SeparacionPorComas

select STUFF('GOT SL',5,2,'SA') Cambio

select @@VERSION Todo,SUBSTRING(@@VERSION,11,10) Extraido

select TRANSLATE('Tarjeta Gráfica', 'aá', 'eé')
