--Fill factor:
--Permite dejar un espacio en cada página reservado para los updates y asi permite tener los datos ordenados mejorando el rendimiento para las tablas que se actualizan con mucha frecuencia
--valores --> de 10 a 100
	alter TABLE nombre_tabla SET (fillfactor = 70);

--	Si es una tabla que no se actualiza nunca --> fill factor de 100
--	Si se actualiza con frecuencia --> 50/60/70
	
	
--Conocer las opciones de una tabla:
-------------------
-- Table Options --
-------------------

SELECT pc.relname as objectname,
       pc.reloptions as objectoptions
  FROM pg_class AS pc INNER JOIN pg_namespace AS pns ON pns.oid = pc.relnamespace
 WHERE pns.nspname ='public'
   AND pc.relname = 'tasks';

 