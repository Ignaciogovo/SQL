/*Excelente, una vez que tenemos probado nuestro server y cuenta SMTP, procederemos a enviar correos por medio de T-SQL.
Importante estar siempre dentro de la base msdb.*/
USE msdb
GO
EXEC sp_send_dbmail @profile_name='PerfilDBA',
@recipients='denisenrique@hotmail.com',
@subject='Prueba de Envio de Correo por SQL Server',
@body='Este es el cuerpo del correo de prueba felicidades Database Mail funciona correctamente.'


/*Podemos revisar la bitácora de correos enviados, y bitácora de eventos en las siguientes tablas:*/

SELECT * FROM sysmail_mailitems
GO
SELECT * FROM sysmail_log

