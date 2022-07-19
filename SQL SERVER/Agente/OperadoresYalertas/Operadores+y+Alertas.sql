USE [msdb]
GO
--Step #1: Crear un operador:
EXEC msdb.dbo.sp_add_operator @name=N'DBA', 
		@enabled=1, 
		@weekday_pager_start_time=80000, 
		@weekday_pager_end_time=180000, 
		@saturday_pager_start_time=90000, 
		@saturday_pager_end_time=180000, 
		@sunday_pager_start_time=90000, 
		@sunday_pager_end_time=180000, 
		@pager_days=62, 
		@email_address=N'direccion-correo-desea', --<< replace this one with a valid email address.
		@category_name=N'[Uncategorized]'
GO

--Step #2: Cree todas las alertas importantes (asegurate de buscar y reemplazar operator_name con el que creó en el paso anterior):
EXEC msdb.dbo.sp_add_alert @name=N'Miscellaneous User Error',
@message_id=0,
@severity=16,
@enabled=1,
@delay_between_responses=60,
@include_event_description_in=1,
@job_id=N'00000000-0000-0000-0000-000000000000';
GO
EXEC msdb.dbo.sp_add_notification @alert_name=N'Miscellaneous User Error', @operator_name=N'DBA', @notification_method = 7;
GO
EXEC msdb.dbo.sp_add_alert @name=N'Insufficient Resources',
@message_id=0,
@severity=17,
@enabled=1,
@delay_between_responses=60,
@include_event_description_in=1,
@job_id=N'00000000-0000-0000-0000-000000000000';
GO
EXEC msdb.dbo.sp_add_notification @alert_name=N'Insufficient Resources', @operator_name=N'DBA', @notification_method = 7;
GO
EXEC msdb.dbo.sp_add_alert @name=N'Nonfatal Internal Error',
@message_id=0,
@severity=18,
@enabled=1,
@delay_between_responses=60,
@include_event_description_in=1,
@job_id=N'00000000-0000-0000-0000-000000000000';
GO
EXEC msdb.dbo.sp_add_notification @alert_name=N'Nonfatal Internal Error', @operator_name=N'DBA', @notification_method = 7;
GO
EXEC msdb.dbo.sp_add_alert @name=N'Fatal Error In Resource',
@message_id=0,
@severity=19,
@enabled=1,
@delay_between_responses=60,
@include_event_description_in=1,
@job_id=N'00000000-0000-0000-0000-000000000000';
GO
EXEC msdb.dbo.sp_add_notification @alert_name=N'Fatal Error In Resource', @operator_name=N'DBA', @notification_method = 7;
GO
EXEC msdb.dbo.sp_add_alert @name=N'Fatal Error In Current Process',
@message_id=0,
@severity=20,
@enabled=1,
@delay_between_responses=60,
@include_event_description_in=1,
@job_id=N'00000000-0000-0000-0000-000000000000';
GO
EXEC msdb.dbo.sp_add_notification @alert_name=N'Fatal Error In Current Process', @operator_name=N'DBA', @notification_method = 7;
GO
EXEC msdb.dbo.sp_add_alert @name=N'Fatal Error In Database Processes',
@message_id=0,
@severity=21,
@enabled=1,
@delay_between_responses=60,
@include_event_description_in=1,
@job_id=N'00000000-0000-0000-0000-000000000000';
GO
EXEC msdb.dbo.sp_add_notification @alert_name=N'Fatal Error In Database Processes', @operator_name=N'DBA', @notification_method = 7;
GO
EXEC msdb.dbo.sp_add_alert @name=N'Fatal Error: Table Integrity Suspect',
@message_id=0,
@severity=22,
@enabled=1,
@delay_between_responses=60,
@include_event_description_in=1,
@job_id=N'00000000-0000-0000-0000-000000000000';
GO
EXEC msdb.dbo.sp_add_notification @alert_name=N'Fatal Error: Table Integrity Suspect', @operator_name=N'DBA', @notification_method = 7;
GO
EXEC msdb.dbo.sp_add_alert @name=N'Fatal Error: Database Integrety Suspect',
@message_id=0,
@severity=23,
@enabled=1,
@delay_between_responses=60,
@include_event_description_in=1,
@job_id=N'00000000-0000-0000-0000-000000000000';
GO
EXEC msdb.dbo.sp_add_notification @alert_name=N'Fatal Error: Database Integrety Suspect', @operator_name=N'DBA', @notification_method = 7;
GO
EXEC msdb.dbo.sp_add_alert @name=N'Fatal Error: Hardware Error',
@message_id=0,
@severity=24,
@enabled=1,
@delay_between_responses=60,
@include_event_description_in=1,
@job_id=N'00000000-0000-0000-0000-000000000000';
GO
EXEC msdb.dbo.sp_add_notification @alert_name=N'Fatal Error: Hardware Error', @operator_name=N'DBA', @notification_method = 7;
GO
EXEC msdb.dbo.sp_add_alert @name=N'Fatal Error (other)',
@message_id=0,
@severity=25,
@enabled=1,
@delay_between_responses=60,
@include_event_description_in=1,
@job_id=N'00000000-0000-0000-0000-000000000000';
GO
EXEC msdb.dbo.sp_add_notification @alert_name=N'Fatal Error (other)', @operator_name=N'DBA', @notification_method = 7;
GO
/*
El mensaje de error 823 generalmente indica que hay un problema con el sistema de almacenamiento subyacente o el hardware o un controlador que se encuentra en la ruta de la solicitud de E/S.
Puede encontrar este error cuando hay inconsistencias en el sistema de archivos o si el archivo de la base de datos está dañado.
SQL Server utiliza las API de Windows [p. ej. ReadFile, WriteFile, ReadFileScatter, WriteFileGather] para realizar las operaciones de E/S.
Después de realizar estas operaciones de E/S, SQL Server busca cualquier condición de error asociada con estas llamadas a la API.
Si estas llamadas API fallan con un error del sistema operativo, SQL Server informa el error 823.
http://support.microsoft.com/kb/2015755
*/
EXEC msdb.dbo.sp_add_alert @name=N'Error Number 823',
@message_id=823,
 @severity=0,
 @enabled=1,
 @delay_between_responses=60,
 @include_event_description_in=1,
 @job_id=N'00000000-0000-0000-0000-000000000000'
GO
EXEC msdb.dbo.sp_add_notification @alert_name=N'Error Number 823', @operator_name=N'DBA', @notification_method = 7;
GO
/*
El mensaje de error 824 generalmente indica que hay un problema con el sistema de almacenamiento subyacente o el hardware o un controlador que se encuentra en la ruta de la solicitud de E/S.
Puede encontrar este error cuando hay inconsistencias en el sistema de archivos o si el archivo de la base de datos está dañado.
Puede haber situaciones en las que la llamada a la API de Windows realmente tenga éxito, pero los datos transferidos por la operación de E/S podrían haber encontrado un problema de coherencia lógica.
Estos problemas de coherencia lógica se notifican mediante el error 824.
http://support.microsoft.com/kb/2015756
*/
EXEC msdb.dbo.sp_add_alert @name=N'Error Number 824',
 @message_id=824,
 @severity=0,
 @enabled=1,
 @delay_between_responses=60,
 @include_event_description_in=1,
 @job_id=N'00000000-0000-0000-0000-000000000000'
GO
EXEC msdb.dbo.sp_add_notification @alert_name=N'Error Number 824', @operator_name=N'DBA', @notification_method = 7;
GO
/*
Cuando SQL Server detecta un error de E/S (mensaje 823 o 824), volverá a intentar la operación hasta cuatro veces antes de fallar en la operación de lectura o escritura.
La causa de este problema es similar a la causa como si se produjera el error Msg 823 o 824. El mensaje en ERRORLOG contiene el contexto adecuado, incluido el error original, para solucionar la posible causa.http://support.microsoft.com/kb/2015757
*/
EXEC msdb.dbo.sp_add_alert @name=N'Error Number 825',
 @message_id=825,
 @severity=0,
 @enabled=1,
 @delay_between_responses=60,
 @include_event_description_in=1,
 @job_id=N'00000000-0000-0000-0000-000000000000'
GO
EXEC msdb.dbo.sp_add_notification @alert_name=N'Error Number 825', @operator_name=N'DBA', @notification_method = 7;
GO


