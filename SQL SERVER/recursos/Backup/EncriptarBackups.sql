--Prerrequisitos para Cifrado de Copias de Seguridad de SQL Server
/*
Antes de realizar un cifrado de copia de seguridad verifique si hay una Clave Maestra de Servicio 
y una Clave Maestra de Base de Datos en la base de datos maestra. Como una Clave Maestra de Servicio 
es generada automáticamente durante la instalación de SQL Server, debería ya estar contenida 
en la base de datos maestra. La presencia de SMK y DMK es revisada consultando 
la vista de catálogo master.sys.symmetric_keys y buscando la fila ##MS_DatabaseMasterKey## en los resultados:*/

-- Buscamos si encontramos una un cifrado de la copia de seguridad
SELECT * FROM master.sys.symmetric_keys 
--Si la fila ##MS_DatabaseMasterKey## no existe, use la siguiente consulta para crearla:



--DROP MASTER KEY
--DROP  CERTIFICATE CERTIFICADOSEGURIDAD
CREATE MASTER KEY ENCRYPTION BY PASSWORD='Abc1234'
--A continuación, necesitamos crear un certificado:
USE master
GO
CREATE CERTIFICATE CERTIFICADOSEGURIDAD
WITH SUBJECT = 'CERTIFICADO DE SEGURIDAD';
GO
-- Comprobamos que el certificado esta creado
Select * from sys.certificates
/*
Para respaldar un certificado y las claves maestras use las siguientes consultas:
Respaldar la Clave Maestra de Servicio:*/

-- Backup the Service Master Key
USE master
GO
BACKUP SERVICE MASTER KEY
TO FILE = 'C:\SEGURIDADSQL\SQL2019_CMS.key'
ENCRYPTION BY PASSWORD = 'Abc1234';

GO

--Respaldar la Clave Maestra de Base de Datos:
BACKUP MASTER KEY
TO FILE = 'C:\SEGURIDADSQL\SQL2019_CMB.key'
ENCRYPTION BY PASSWORD = 'Abc1234';
GO

--Respaldar el Certificado:
BACKUP CERTIFICATE CERTIFICADOSEGURIDAD
TO FILE = 'C:\SEGURIDADSQL\SQL2019_CERTIFICADODERESPALDO.cer'
WITH PRIVATE KEY
        (	        
		     FILE = 'C:\SEGURIDADSQL\SQL2016_LC.key'
            , ENCRYPTION BY PASSWORD = 'Abc1234'
        );
GO





-- Restaurar master key
RESTORE MASTER KEY FROM 
    FILE = 'C:\SEGURIDADSQL\SQL2019_CMB.key' 
    DECRYPTION BY PASSWORD = 'Abc1234'  
    ENCRYPTION BY PASSWORD = 'Abc1234'  
    [ FORCE ]
go
	
-- Restaurar service master key:
RESTORE SERVICE MASTER KEY FROM FILE = 'C:\SEGURIDADSQL\SQL2019_CMS.key'   
    DECRYPTION BY PASSWORD = 'password' [FORCE]
	







--USE [TestDB]
--GO
--CREATE DATABASE ENCRYPTION KEY
--WITH ALGORITHM = AES_256
--ENCRYPTION BY SERVER CERTIFICATE CERTIFICADOSEGURIDAD;

--ALTER DATABASE [TestDB]
--SET ENCRYPTION ON;
--GO