DECLARE @Encabezado VARCHAR(MAX),
        @Cuerpo NVARCHAR(MAX),       
        @Pie VARCHAR(MAX)

SET @Encabezado = '<html><head>' + '<style>'
    + ' {border: solid black;border-width: 1px;padding-left:5px;padding-right:5px;padding-top:1px;padding-bottom:1px;font: 11px arial} '
    + '</style>' + '</head>' + '<body>' + 'Listado de columnas generadas en HTML '
    + CONVERT(VARCHAR(50), GETDATE(), 106) 
    + ' <br> <table cellpadding=0 cellspacing=0 border=0>' 
    + '<tr> <td bgcolor=#E6E6FA><b>nombreColumna</b></td>'
    + '<td bgcolor=#E6E6FA><b>nombreColumna </b></td>'
    + '<td bgcolor=#E6E6FA><b>nombreColumna </b></td>'
	+ '<td bgcolor=#E6E6FA><b>nombreColumna </b></td>'
    + '<td bgcolor=#E6E6FA><b>nombreColumna </b></td>'
    + '<td bgcolor=#E6E6FA><b>nombreColumna </b></td>'
    + '<td bgcolor=#E6E6FA><b>nombreColumna</b></td>'
    

SET @Cuerpo = ( 
                  SELECT nombreColumna td,nombreColumna td,nombreColumna td,nombreColumna td,nombreColumna td,nombreColumna td,nombreColumna td
				  FROM tabla
				  FOR XML RAW('tr'),elements
                
            )


SET @Pie = '</table></body></html>' ;

SELECT  @Cuerpo = @Encabezado + ISNULL(@Cuerpo, '') + @Pie

--PRINT @Cuerpo

EXEC msdb.dbo.sp_send_dbmail 
  @profile_name='PerfilDBA',
  @recipients='direccion-correo-desea',
  @subject='Listado de Columna en HTML',
  @Body=@Cuerpo ,
  @Body_format = 'HTML' ;