CREATE DATABASE BD2023
COLLATE SQL_Latin1_General_CP1_CI_AI
GO

USE p8g7
GO

CREATE TABLE Medicamentos_FARMACIAS (
    [NIF]			[int]           NOT NULL	PRIMARY KEY,
    [Nome]          [varchar](256)	NOT NULL,
    [Morada]	  	[varchar](1024)	NOT NULL,
	[Telefone] 		[int]			NOT NULL	UNIQUE
);

CREATE TABLE Medicamentos_FARMACEUTICA (
    [NumRegistro]	[int]			NOT NULL	PRIMARY KEY,
    [Nome]          [varchar](256)	NOT NULL,
	[Telefone] 		[int]			NOT NULL	UNIQUE,
    [Endereco]      [varchar](1014)	NOT NULL
);

CREATE TABLE Medicamentos_FARMACO (
	[NomeNaEmpresa]	[varchar](256)	NOT NULL	PRIMARY KEY,
	[NomeComercial] [varchar](256)	NOT NULL	UNIQUE,
	[Formula]		[varchar](1024)	NOT NULL,
	[NIFFarmacia]	[int]			NOT NULL	REFERENCES Medicamentos_FARMACIAS([NIF]),
	[NumRegistroF]	[int]			NOT NULL	REFERENCES Medicamentos_FARMACEUTICA([NumRegistro])
);

//  Nome na Empresa ou Comercial???

CREATE TABLE Medicamentos_PRESCRICAO (
	[NumPrescricao]	[int]			NOT NULL	IDENTITY	PRIMARY KEY,
	[Data]			[date]			NOT NULL,
	[Farmaco]		[varchar](256)	NOT NULL	REFERENCES Medicamentos_FARMACO([NomeNaEmpresa])
);

CREATE TABLE Medicamentos_ESPECIALIDADE (
    [ID]			[int]			NOT NULL	IDENTITY	PRIMARY KEY,
	[Nome]			[varchar](256)	NOT NULL	UNIQUE
);

CREATE TABLE Medicamentos_PACIENTE (
    [NumUtente]		[int]			NOT NULL	IDENTITY	PRIMARY KEY,
	[Nome]			[varchar](256)	NOT NULL,
	[Endereco]		[varchar](1024)	NOT NULL,
	[DataNasci]		[date]			NOT NULL
);

CREATE TABLE Medicamentos_MEDICO (
    [NumID]			[int]			NOT NULL	IDENTITY	PRIMARY KEY,
	[Nome]			[varchar](256)	NOT NULL,
	[Especialidade]	[int]			NOT NULL	REFERENCES Medicamentos_ESPECIALIDADE([ID])
);

CREATE TABLE Medicamentos_Consulta (
    [NumConsulta]	[int]			NOT NULL	IDENTITY	PRIMARY KEY,
	[Data]			[date]			NOT NULL,
	[IDMedico]		[int]			NOT NULL	REFERENCES Medicamentos_MEDICO([NumID]),
	[IDPaciente]	[int]			NOT NULL	REFERENCES Medicamentos_PACIENTE([NumUtente]),
	[IDPrescricao]	[int]			NOT NULL	REFERENCES Medicamentos_PRESCRICAO([NumPrescricao])
);

go
