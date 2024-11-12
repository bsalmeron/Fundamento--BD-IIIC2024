

-- Creación de la tabla proyectos
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
UNION
Select empleado_id, fecha_inicio, fecha_fin 
from proyectos_historico) As ProyectosGeneral
inner join empleados 
on ProyectosGeneral.empleado_id = empleados.id
order by Inicio desc


Select  empleados.nombre, COUNT(ProyectosGeneral.empleado_id) 'CantidadProyectos'  from
(Select  empleado_id, fecha_inicio, NULL fecha_fin 
from proyectos
UNION  ALL
Select empleado_id, fecha_inicio, fecha_fin 
from proyectos_historico) As ProyectosGeneral
inner join empleados 
on ProyectosGeneral.empleado_id = empleados.id
Group by empleados.nombre



