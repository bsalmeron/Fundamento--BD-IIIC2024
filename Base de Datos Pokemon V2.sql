-- Creación de la Base de Datos
CREATE DATABASE Pokedex;
GO

USE Pokedex;
GO

-- 1. Tabla Pokemon
CREATE TABLE Pokemon (
    PokemonID INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(50),
    Numero INT,
    TipoPrincipalID INT,
    TipoSecundarioID INT NULL,
    Altura DECIMAL(3, 1),
    Peso DECIMAL(4, 1), 
    CONSTRAINT FK_TipoPrincipal FOREIGN KEY (TipoPrincipalID) REFERENCES Tipo(TipoID),
    CONSTRAINT FK_TipoSecundario FOREIGN KEY (TipoSecundarioID) REFERENCES Tipo(TipoID)
);

INSERT INTO Pokemon (Nombre, Numero, TipoPrincipalID, TipoSecundarioID, Altura, Peso) VALUES
('Bulbasaur', 1, 1, 2, 0.7, 6.9),
('Ivysaur', 2, 1, 2, 1.0, 13.0),
('Venusaur', 3, 1, 2, 2.0, 100.0),
('Charmander', 4, 10, NULL, 0.6, 8.5),
('Charmeleon', 5, 10, NULL, 1.1, 19.0),
('Charizard', 6, 10, 3, 1.7, 90.5),
('Squirtle', 7, 11, NULL, 0.5, 9.0),
('Wartortle', 8, 11, NULL, 1.0, 22.5),
('Blastoise', 9, 11, NULL, 1.6, 85.5),
('Pikachu', 25, 12, NULL, 0.4, 6.0);
GO

select * from tipo
-- 2. Tabla Tipo
CREATE TABLE Tipo (
    TipoID INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(50)
);

INSERT INTO Tipo (Nombre) VALUES 
('Planta'), ('Veneno'), ('Volador'), 
('Fuego'), ('Agua'), ('Eléctrico'), 
('Hielo'), ('Lucha'), ('Psíquico'), 
('Roca');
GO

-- 3. Tabla Habilidad
CREATE TABLE Habilidad (
    HabilidadID INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(50),
    Descripcion VARCHAR(255)
);

INSERT INTO Habilidad (Nombre, Descripcion) VALUES
('Espesura', 'Aumenta ataques de tipo Planta en situaciones críticas'),
('Mar llamas', 'Aumenta ataques de tipo Fuego en situaciones críticas'),
('Torrente', 'Aumenta ataques de tipo Agua en situaciones críticas'),
('Electricidad estática', 'Puede paralizar al rival al contacto'),
('Desgaste', 'Reduce el poder del rival al contacto'),
('Impulso', 'Aumenta la velocidad con el tiempo'),
('Absorbe agua', 'Recupera HP al recibir ataques de agua'),
('Absorbe electricidad', 'Recupera HP al recibir ataques eléctricos'),
('Cuerpo llama', 'Puede quemar al rival al contacto'),
('Intimidación', 'Reduce el ataque del rival al entrar en combate');
GO

-- 4. Tabla PokemonHabilidad
CREATE TABLE PokemonHabilidad (
    PokemonHabilidadID INT PRIMARY KEY IDENTITY(1,1),
    PokemonID INT FOREIGN KEY REFERENCES Pokemon(PokemonID),
    HabilidadID INT FOREIGN KEY REFERENCES Habilidad(HabilidadID)
);

INSERT INTO PokemonHabilidad (PokemonID, HabilidadID) VALUES
(1, 1), (2, 1), (3, 1),
(4, 2), (5, 2), (6, 2),
(7, 3), (8, 3), (9, 3),
(10, 4);
GO

-- 5. Tabla Entrenador
CREATE TABLE Entrenador (
    EntrenadorID INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(50),
    Ciudad VARCHAR(50),
    Nivel INT
);

INSERT INTO Entrenador (Nombre, Ciudad, Nivel) VALUES
('Ash', 'Pueblo Paleta', 10),
('Misty', 'Ciudad Celeste', 8),
('Brock', 'Ciudad Plateada', 12),
('Erika', 'Ciudad Azulona', 14),
('Lt. Surge', 'Ciudad Carmín', 16),
('Sabrina', 'Ciudad Azafrán', 18),
('Koga', 'Ciudad Fucsia', 20),
('Blaine', 'Isla Canela', 22),
('Giovanni', 'Ciudad Verde', 25),
('Lorelei', 'Alto Mando', 30);
GO

-- 6. Tabla Batalla
CREATE TABLE Batalla (
    BatallaID INT PRIMARY KEY IDENTITY(1,1),
    Entrenador1ID INT FOREIGN KEY REFERENCES Entrenador(EntrenadorID),
    Entrenador2ID INT FOREIGN KEY REFERENCES Entrenador(EntrenadorID),
    Fecha DATE,
    GanadorID INT
);

INSERT INTO Batalla (Entrenador1ID, Entrenador2ID, Fecha, GanadorID) VALUES
(1, 2, '2024-01-01', 1),
(2, 3, '2024-01-02', 2),
(4, 1, '2024-01-03', 4),
(3, 5, '2024-01-04', 5),
(6, 1, '2024-01-05', 6),
(7, 8, '2024-01-06', 8),
(9, 1, '2024-01-07', 1),
(10, 3, '2024-01-08', 10),
(2, 7, '2024-01-09', 7),
(5, 4, '2024-01-10', 5);
GO

-- 7. Tabla Objeto
CREATE TABLE Objeto (
    ObjetoID INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(50),
    Descripcion VARCHAR(255)
);

INSERT INTO Objeto (Nombre, Descripcion) VALUES
('Poción', 'Recupera 20 HP'),
('Super Poción', 'Recupera 50 HP'),
('Hiper Poción', 'Recupera 200 HP'),
('Antídoto', 'Cura envenenamiento'),
('Antiquemar', 'Cura quemaduras'),
('Antiparalizador', 'Cura parálisis'),
('Restaura Todo', 'Cura todas las alteraciones de estado'),
('Poké Ball', 'Atrapa Pokémon salvajes'),
('Super Ball', 'Tiene mayor eficacia que la Poké Ball'),
('Ultra Ball', 'Tiene mayor eficacia que la Super Ball');
GO

-- 8. Tabla EntrenadorPokemon
CREATE TABLE EntrenadorPokemon (
    EntrenadorPokemonID INT PRIMARY KEY IDENTITY(1,1),
    EntrenadorID INT FOREIGN KEY REFERENCES Entrenador(EntrenadorID),
    PokemonID INT FOREIGN KEY REFERENCES Pokemon(PokemonID)
);

INSERT INTO EntrenadorPokemon (EntrenadorID, PokemonID) VALUES
(1, 1), (1, 4), (1, 7),
(2, 9), (2, 10),
(3, 3), (3, 6),
(4, 2), (5, 8),
(6, 5), (7, 7), (8, 1), (9, 2), (10, 3);
GO

-- 9. Tabla Movimiento
CREATE TABLE Movimiento (
    MovimientoID INT PRIMARY KEY IDENTITY(1,1),
    Nombre VARCHAR(50),
    TipoID INT FOREIGN KEY REFERENCES Tipo(TipoID),
    Potencia INT,
    Precision INT
);

INSERT INTO Movimiento (Nombre, TipoID, Potencia, Precision) VALUES
('Placaje', 1, 40, 100),
('Látigo', 1, 20, 100),
('Ascuas', 4, 40, 100),
('Hidrobomba', 5, 110, 80),
('Impactrueno', 6, 40, 100),
('Rayo Hielo', 7, 90, 100),
('Puño Fuego', 4, 75, 100),
('Confusión', 9, 50, 100),
('Psicorrayo', 9, 65, 100),
('Excavar', 10, 80, 100);
GO

-- 10. Tabla PokemonMovimiento
CREATE TABLE PokemonMovimiento (
    PokemonMovimientoID INT PRIMARY KEY IDENTITY(1,1),
    PokemonID INT FOREIGN KEY REFERENCES Pokemon(PokemonID),
    MovimientoID INT FOREIGN KEY REFERENCES Movimiento(MovimientoID)
);

INSERT INTO PokemonMovimiento (PokemonID, MovimientoID) VALUES
(1, 1), (1, 2), (2, 3),
(3, 4), (4, 5), (5, 6),
(6, 7), (7, 8), (8, 9),
(9, 10), (10, 1);
GO