# TODO para a Aula04 visto que aposto q não vou ter tempo para esta drena later

## DB
'''
CREATE DATABASE Aula4;
'''

### Rent_A_Car
'''
CREATE SCHEMA Rent_A_Car
'''

> Aqui usasse PRIMARY KEY no Numero ou no fim? ( PRIMARY KEY(Numero) )

'''
CREATE TABLE ALUGUER (
	Numero		INT		PRIMARY KEY,
	Data		DATE,
	Duracao		DATE,
	NIF_Cliente	INT		REFERENCES CLIENTE(NIF),
	Matricula_Veic	VARCHAR(8)	REFERENCES VEICULO(Matricula),
	Num_Balcao	INT		REFERENCES BALCAO(Numero)
);

CREATE TABLE VEICULO (
	Matricula	VARCHAR(8)	PRIMARY KEY,
	Ano		INT,
	Marca		VARCHAR(15),
	Codigo_Tipo	INT		REFERENCES TIPO_VEICULO(Codigo)	
);

multiple references?

CREATE TABLE TIPO_VEICULO (
	Codigo 		INT		PRIMARY KEY,
	ArCondicionado 	BOOLEAN,
	Designacao	VARCHAR(31),
	Similaridades	INT		REFERENCES TIPO_VEICULO(Codigo)
	Tamanho_Veiculo	INT  
);

CREATE TABLE LIGEIRO (
	ID_Tamanho	INT		PRIMARY KEY 		REFERENCES TIPO_VEICULO(Codigo),
	NumLugares	INT,
	Portas		INT,
	Combustivel	INT
);

CREATE TABLE PESADO (
        ID_Tamanho      INT             PRIMARY KEY 		REFERENCES TIPO_VEICULO(Codigo),
        Peso		INT,
        Passageiros     BOOLEAN		DEFAULT 0 
);

CREATE TABLE CLIENTE (
        NIF		INT             PRIMARY KEY             UNIQUE,
        Nome            VARCHAR(15),
        Endereco  	VARCHAR(31),
	Num_Carta 	INT		UNIQUE
);

CREATE TABLE BALCAO (
        Numero	        INT             PRIMARY KEY             UNIQUE,
        Nome            VARCHAR(15),
        Endereco        VARCHAR(31)
);

'''

### Stocks - Encomendas

'''
CREATE SCHEMA Stocks
'''

> ver decimal() values

'''
CREATE TABLE PRODUTO (
        Codigo          INT             PRIMARY KEY,
        Preco	        DECIMAL(10, 2),
        Iva 	        INT,
        Codigo_Armazem  INT             REFERENCES ARMAZEM(Codigo)
);

CREATE TABLE ARMAZEM (
        Codigo          INT             PRIMARY KEY,
        Morada		VARCHAR(31)
);

CREATE TABLE ENCOMENDA (
        Num_Encomenda   INT             PRIMARY KEY,
        Data	        DATE,
        Cod_Fornecedor  INT		REFERENCES FORNECEDOR(Codigo),
        Cod_Produto 	INT             REFERENCES PRODUTO(Codigo)
);
'''

