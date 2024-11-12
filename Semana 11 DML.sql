

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
VALUES (1, '2023-01-01','2024-01-01'),
       (2, '2023-03-01', '2025-01-01'),
       (3, '2023-06-01','2026-01-01');
GO




Select empleados.nombre, fecha_inicio 'Inicio', fecha_fin 'Finalizacion' from
(Select empleado_id, fecha_inicio, NULL fecha_fin 
from proyectos
UNION
Select empleado_id, fecha_inicio, fecha_fin 
from proyectos_historico) As ProyectosGeneral
inner join empleados 
on ProyectosGeneral.empleado_id = empleados.id
order by Inicio desc

