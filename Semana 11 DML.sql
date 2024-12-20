

-- Creaci�n de la tabla proyectos
CREATE TABLE proyectos_historico (
    id INT PRIMARY KEY IDENTITY,
    empleado_id INT,
    fecha_inicio DATE,
	fecha_fin DATE,
    FOREIGN KEY (empleado_id) REFERENCES empleados(id)
);
GO

INSERT INTO proyectos_historico (empleado_id, fecha_inicio,fecha_fin)
VALUES (1, '2025-11-01','2027-12-01')
        
GO

select * from proyectos_historico



Select empleados.nombre, fecha_inicio 'Inicio', fecha_fin 'Finalizacion' from
(Select empleado_id, fecha_inicio, NULL fecha_fin 
from proyectos
UNION ALL
Select empleado_id, fecha_inicio, fecha_fin 
from proyectos_historico) As ProyectosGeneral
inner join empleados 
on ProyectosGeneral.empleado_id = empleados.id
order by Inicio desc


Select  empleados.nombre, COUNT(ProyectosGeneral.empleado_id) 'CantidadProyectos'  from
(Select  empleado_id, fecha_inicio, NULL fecha_fin 
from proyectos
UNION ALL   
Select empleado_id, fecha_inicio, fecha_fin 
from proyectos_historico) As ProyectosGeneral
inner join empleados 
on ProyectosGeneral.empleado_id = empleados.id
Group by empleados.nombre

--Subconsultas 

Select * from empleados
where salario > (select AVG(salario) from empleados)

 Select AVG(salario) from 
 (Select salario from empleados where departamento_id=1) AS salarios


Select nombre from empleados 
where departamento_id IN (Select id from departamentos
where nombre='Ventas')

select e.nombre from empleados e
INNER JOIN departamentos d
on e.departamento_id= d.id
where d.nombre='Ventas'

--Exists

Select * from empleados
where exists (select 1 from departamentos where 
id= empleados.departamento_id)

--CASE 

Select   nombre, 
Case 
When salario>70000 Then 'Alto' 
When salario>40000 Then 'Medio'
Else  'Bajo'
END AS Categoria 
From empleados


-- Fecha 

Select GETDATE(),  DATEADD(HOUR,-6, GETDATE())

--DATEADD
Select * from empleados
Where fecha_ingreso > DATEADD(MONTH,-6, GETDATE())

--DATEDIFF

SELECT nombre, DATEDIFF(MONTH, fecha_ingreso, GETDATE()) AS dias_trabajados
FROM empleados;--SELECT INTOSELECT * INTO RespaldoEmpleadosFrom empleadosSELECT e.nombre, e.salario, d.nombre AS departamento
INTO empleados_departamentos
FROM empleados e
JOIN departamentos d ON e.departamento_id = d.id; 
--NULL y Funciones de NULL

  SELECT nombre, ISNULL(salario, 0) AS salario FROM empleados; 