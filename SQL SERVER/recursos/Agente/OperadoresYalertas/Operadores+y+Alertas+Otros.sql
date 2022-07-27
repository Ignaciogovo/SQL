USE [msdb]
GO
/****** Object:  Alert [Alerta de unidad de disco Inexistente]    Script Date: 02/08/2018 3:11:43 ******/
EXEC msdb.dbo.sp_add_alert @name=N'Alerta de unidad de disco Inexistente', 
		@message_id=0, 
		@severity=16, 
		@enabled=1, 
		@delay_between_responses=60, 
		@include_event_description_in=1, 
		@category_name=N'[Uncategorized]', 
		@job_id=N'00000000-0000-0000-0000-000000000000'
GO
/****** Object:  Alert [CHequear Espacio Disponible Log Transacciones]    Script Date: 02/08/2018 3:12:03 ******/
EXEC msdb.dbo.sp_add_alert @name=N'CHequear Espacio Disponible Log Transacciones', 
		@message_id=0, 
		@severity=0, 
		@enabled=1, 
		@delay_between_responses=0, 
		@include_event_description_in=1, 
		@category_name=N'[Uncategorized]', 
		@performance_condition=N'Databases|Percent Log Used|BDVentas|>|90', 
		@job_id=N'00000000-0000-0000-0000-000000000000'
GO
EXEC msdb.dbo.sp_add_alert @name=N'CPU SQL 90', 
		@message_id=0, 
		@severity=0, 
		@enabled=1, 
		@delay_between_responses=60, 
		@include_event_description_in=1, 
		@category_name=N'[Uncategorized]', 
		@wmi_namespace=N'\\.\ROOT\CIMV2', 
		@wmi_query=N' SELECT * FROM __InstanceModificationEvent WITHIN 60 WHERE TargetInstance ISA "Win32_Processor" AND TargetInstance.LoadPercentage > 90', 
		@job_id=N'00000000-0000-0000-0000-000000000000'

