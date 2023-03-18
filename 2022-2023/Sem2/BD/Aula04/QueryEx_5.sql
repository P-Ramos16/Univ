CREATE DATABASE BD2023
COLLATE SQL_Latin1_General_CP1_CI_AI
GO

USE p8g7
GO

CREATE TABLE Conferencias_INSTITUICAO (
    [Codigo]		[int]           NOT NULL	PRIMARY KEY,
    [Nome]          [varchar](256)	NOT NULL,
    [Morada]	  	[varchar](1024)	NOT NULL,
	[IDComprovat]	[int]			NOT NULL	UNIQUE
);

CREATE TABLE Conferencias_CONFERENCIA (
    [IDConferencia]	[int]			NOT NULL	IDENTITY	PRIMARY KEY
);

CREATE TABLE Conferencias_AUTOR (
    [CodigoAutor]	[int]			NOT NULL	IDENTITY	PRIMARY KEY
);

CREATE TABLE Conferencias_ARTIGO (
	[NumRegistro]	[int]			NOT NULL	IDENTITY	PRIMARY KEY,
	[Titulo]		[varchar](512)	NOT NULL,
	[Autor]			[int]			NOT NULL	REFERENCES Conferencias_AUTOR([CodigoAutor]),
	[Conferencia]	[int]			NOT NULL	REFERENCES Conferencias_CONFERENCIA([IDConferencia])
);

CREATE TABLE Conferencias_ESTUDANTE (
    [IDEstud]		[int]			NOT NULL	IDENTITY	PRIMARY KEY,
	[ComprInst]		[int]			NOT NULL	REFERENCES	Conferencias_INSTITUICAO([IDComprovat])
);

CREATE TABLE Conferencias_NAOESTUDANTE (
    [IDNaoEstud]	[int]			NOT NULL	IDENTITY	PRIMARY KEY,
	[RefBancaria]	[int]			NOT NULL	UNIQUE
);

CREATE TABLE Conferencias_PARTICIPANTE (
    [CodParti]		[int]			NOT NULL	IDENTITY	PRIMARY KEY,
	[DataInscricao]	[date]			NOT NULL,
	[IDEstudan]		[int]			UNIQUE		REFERENCES Conferencias_ESTUDANTE([IDEstud]),
	[IDNaoEstudan]	[int]			UNIQUE		REFERENCES Conferencias_NAOESTUDANTE([IDNaoEstud]),
	CHECK ([IDNaoEstudan] = null OR [IDEstudan] = null)
);

CREATE TABLE Conferencias_PESSOA (
    [Codigo]		[int]			NOT NULL	IDENTITY	PRIMARY KEY,
	[Nome]			[varchar](256)	NOT NULL,
	[Morada]		[varchar](512)	NOT NULL,
	[Email]			[varchar](128)	NOT NULL	UNIQUE,
	[IDAutor]		[int]			UNIQUE		REFERENCES Conferencias_AUTOR([CodigoAutor]),
	[IDPartici]		[int]			UNIQUE		REFERENCES Conferencias_PARTICIPANTE([CodParti]),
	[CodIntituicao]	[int]			NOT NULL	REFERENCES Conferencias_INSTITUICAO([Codigo]),
	CHECK ([IDPartici] = null OR [IDAutor] = null)
);

CREATE TABLE Conferencias_INSCRICOES (
	[IDInscricao]	[int]			NOT NULL	IDENTITY	PRIMARY KEY,
	[IDPessoa]		[int]			NOT NULL	REFERENCES Conferencias_PESSOA([Codigo]),
	[IDConferencia]	[int]			NOT NULL	REFERENCES Conferencias_CONFERENCIA([IDConferencia])
);
go