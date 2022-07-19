
-- Hay que crear una tabla para guardar valores de fecha.
--CREATE TABLE Auditoria(UltimaActualizacion datetime2)
--INSERT INTO Auditoria VALUES(SYSDATETIME())
DECLARE @UltimaActualizacion datetime2;
DECLARE @Nregistros int;
DECLARE @Encabezado VARCHAR(MAX),
        @Cuerpo NVARCHAR(MAX),       
        @Pie VARCHAR(MAX)
SET @Nregistros = 0
SET @UltimaActualizacion = (SELECT TOP 1 UltimaActualizacion FROM dbo.Auditoria)


--  Con esta consulta obtenemos el numero de eventos superiores a la ultima actualizacion
SET @Nregistros= (SELECT COUNT (event_time) 
                  FROM sys.fn_get_audit_file('C:\Auditoria\*.sqlaudit', default, default)
                  WHERE DATEADD(hh, DATEDIFF(hh, GETUTCDATE(), CURRENT_TIMESTAMP), event_time ) > @UltimaActualizacion)
 PRINT @Nregistros
-- Si el numero de registros es mayor que 0 creamos un script que nos envia los ultimos registros de seguridad
 IF @Nregistros > 0 
 	BEGIN
	
			 SET @Encabezado = '<html><head>' + '<style>'
			+ 'td {border: solid black;border-width: 1px;padding-left:5px;padding-right:5px;padding-top:1px;padding-bottom:1px;font: 12px arial} '
			+ '</style>' + '</head>' + '<body>' + 'Informe de eventos de seguridad'
			+ CONVERT(VARCHAR(50), GETDATE(), 106) 
			+ ' <br> <table cellpadding=0 cellspacing=0 border=0>' 
			+ '<tr> <td bgcolor=#E6E6FA><b>Hora del Evento</b></td>'
			+ '<td bgcolor=#E6E6FA><b>Sentencia </b></td>'

			SET @Cuerpo = CAST ((SELECT td = DATEADD(hh, DATEDIFF(hh, GETUTCDATE(), CURRENT_TIMESTAMP), event_time), '', 
										td =statement, ''
								 FROM sys.fn_get_audit_file('C:\Auditoria\*.sqlaudit', default, default)
								 WHERE DATEADD(hh, DATEDIFF(hh, GETUTCDATE(), CURRENT_TIMESTAMP), event_time ) > @UltimaActualizacion FOR XML PATH('tr'), TYPE
							   ) AS NVARCHAR(MAX))   

    
			SET @Pie = '</table></body></html>' ;
			SELECT  @Cuerpo = @Encabezado + ISNULL(@Cuerpo, '') + @Pie

		 -- Actualizar tabla de Auditoria
			USE master
			UPDATE dbo.Auditoria
			SET UltimaActualizacion = SYSDATETIME ()

		-- Enviar Correo

		   EXEC  msdb.dbo.sp_send_dbmail 
				 @profile_name='PerfilDBA',
				 @recipients='direccion-correo',
				 @subject='Informe de eventos de seguridad',
				 @Body=@Cuerpo ,
				 @Body_format = 'HTML' ;

  END

