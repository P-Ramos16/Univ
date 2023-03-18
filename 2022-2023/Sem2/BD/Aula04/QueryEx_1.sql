CREATE DATABASE BD2023
COLLATE SQL_Latin1_General_CP1_CI_AI
GO

USE p8g7
GO

CREATE TABLE RentACar_CLIENTE (
    [NIF]			[int]           NOT NULL	PRIMARY KEY,
    [Nome]          [varchar](256)	NOT NULL,
    [Endereco]  	[varchar](1024)	NOT NULL,
	[NumCarta] 		[int]			NOT NULL	UNIQUE
);

CREATE TABLE RentACar_BALCAO (
    [Numero]		[int]			NOT NULL	PRIMARY KEY,
    [Nome]          [varchar](256)	NOT NULL,
    [Endereco]      [varchar](1014)	NOT NULL
);

CREATE TABLE RentACar_TIPOVEICULO (
	[Codigo] 		[int]			NOT NULL	IDENTITY	PRIMARY KEY,
	[ArCond] 		[bit]			NOT NULL,
	[Designacao]	[varchar](128)	NOT NULL,
	[TamanhoVeic]	[int]			NOT NULL
);

CREATE TABLE RentACar_SIMILARIDADE (
	[Codigo1]		[int]			NOT NULL	REFERENCES RentACar_TIPOVEICULO([Codigo]),
	[Codigo2]		[int]			NOT NULL	REFERENCES RentACar_TIPOVEICULO([Codigo]),

	PRIMARY KEY ([Codigo1], [Codigo2])
);

CREATE TABLE RentACar_LIGEIRO (
	[IDTamanho]		[int]			NOT NULL	IDENTITY	PRIMARY KEY 	REFERENCES RentACar_TIPOVEICULO([Codigo]),
	[NumLugares]	[int]			NOT NULL,
	[Portas]		[int]			NOT NULL,
	[Combustivel]	[int]			NOT NULL
);

CREATE TABLE RentACar_PESADO (
    [IDTamanho]		[int]			NOT NULL	IDENTITY	PRIMARY KEY 	REFERENCES RentACar_TIPOVEICULO([Codigo]),
	[Peso]			[int]			NOT NULL,
    [Passageiros]	[bit]			NOT NULL	DEFAULT 0
);

CREATE TABLE RentACar_VEICULO (
	[Matricula]		[varchar](16)	NOT NULL	PRIMARY KEY,
	[Ano]			[int]			NOT NULL,
	[Marca]			[varchar](32)	NOT NULL,
	[CodigoTipo]	[int]			NOT NULL	REFERENCES RentACar_TIPOVEICULO([Codigo])	
);


CREATE TABLE RentACar_ALUGUER (
	[Numero]		[int]			NOT NULL	IDENTITY	PRIMARY KEY,
	[Data]			[date]			NOT NULL,
	[Duracao]		[date]			NOT NULL,
	[NIFCliente]	[int]			NOT NULL	REFERENCES RentACar_CLIENTE(NIF),
	[MatriculaVeic]	[varchar](16)	NOT NULL	REFERENCES RentACar_VEICULO([Matricula]),
	[NumBalcao]		[int]			NOT NULL	REFERENCES RentACar_BALCAO([Numero])
);

go