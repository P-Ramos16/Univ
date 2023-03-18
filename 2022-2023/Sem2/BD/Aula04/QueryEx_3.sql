CREATE DATABASE BD2023
COLLATE SQL_Latin1_General_CP1_CI_AI
GO

USE p8g7
GO

CREATE TABLE Stocks_ARMAZEM (
    [Codigo]		[int]			NOT NULL	PRIMARY KEY,
    [Morada]	    [varchar](1014)	NOT NULL
);

CREATE TABLE Stocks_PRODUTO (
    [Codigo]		[int]           NOT NULL	IDENTITY	PRIMARY KEY,
    [Preco]         [decimal](10,2)	NOT NULL,
    [Iva]		 	[int]			NOT NULL,
	[CodigoArmazem] [int]			NOT NULL	REFERENCES Stocks_ARMAZEM(Codigo)
);

CREATE TABLE Stocks_CONDPAGAMENTO (
	[Codigo]		[int]			NOT NULL	IDENTITY	PRIMARY KEY,
	[Prazo]		 	[date]			NOT NULL,
	[Tipo]			[int]			NOT NULL
);

CREATE TABLE Stocks_TIPOFORNECEDOR (
	[Codigo]		[int]			NOT NULL	IDENTITY	PRIMARY KEY,
	[Nome]		 	[varchar](128)	NOT NULL
);

CREATE TABLE Stocks_FORNECEDOR (
	[Codigo]		[int]			NOT NULL	IDENTITY	PRIMARY KEY,
	[Morada]	 	[date]			NOT NULL,
	[NIF]			[int]			NOT NULL,
	[FAX]			[int]			NOT NULL,
	[Nome]			[varchar](128)	NOT NULL,
	[CondPagamento]	[int]			NOT NULL	REFERENCES Stocks_CONDPAGAMENTO([Codigo]),
	[CodFornecedor]	[int]			NOT NULL	REFERENCES Stocks_TIPOFORNECEDOR([Codigo])
);


CREATE TABLE Stocks_ENCOMENDA (
	[NumEncomenda]	[int]			NOT NULL	IDENTITY	PRIMARY KEY,
	[Data]	 		[date]			NOT NULL,
	[CodFornecedor]	[int]			NOT NULL	REFERENCES Stocks_FORNECEDOR([Codigo]),
	[CodProduto]	[int]			NOT NULL	REFERENCES Stocks_PRODUTO([Codigo]),
);