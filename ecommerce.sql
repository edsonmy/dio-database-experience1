-- CREATE DATABASE Ecommerce;
-- USE Ecommerce;


-- CLIENTE
CREATE TABLE Cliente(
	idCliente INT auto_increment PRIMARY KEY,
    Nome VARCHAR(45) NOT NULL,
    Endereco VARCHAR(45),
	TipoCliente CHAR(1) NOT NULL,
	Identificacao VARCHAR(18) NOT NULL,
    CONSTRAINT unique_cliente_identificacao UNIQUE (Identificacao)
    );

DESC Cliente;

-- PRODUTO
CREATE TABLE Produto(
	idProduto INT auto_increment PRIMARY KEY,
    Categoria VARCHAR(45),
    Descricao VARCHAR(45)  NOT NULL,
	Valor FLOAT DEFAULT 0.00
);

DESC Produto;

-- PEDIDO
CREATE TABLE Pedido(
	idPedido INT auto_increment PRIMARY KEY,
    StatusPedido VARCHAR(45) NOT NULL,
    Frete FLOAT DEFAULT 0.00,
    Descricao VARCHAR(45),
    idCliente INT NOT NULL,
    CONSTRAINT fk_pedido_cliente FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

DESC Pedido;

-- PEDIDO DE PRODUTO
CREATE TABLE PedidoProduto(
	idPedido INT NOT NULL,
    idProduto INT NOT NULL,
    Quantidade FLOAT DEFAULT 1,
    CONSTRAINT fk_pedidoproduto_pedido FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido),
    CONSTRAINT fk_pedidoproduto_produto FOREIGN KEY (idProduto) REFERENCES Produto(idProduto)
);

DESC PedidoProduto;

-- drop table entrega;
-- drop table pedido;
-- drop table produto;
-- drop table cliente;

-- ENTREGA
CREATE TABLE Entrega(
	idEntrega INT auto_increment PRIMARY KEY,
    StatusEntrega VARCHAR(45) NOT NULL,
    CodigoRastreio VARCHAR(45),
    DataEntrega DATE,
	idPedido INT NOT NULL,
	CONSTRAINT fk_pedido FOREIGN KEY (idPedido) REFERENCES Pedido(idPedido)
);

DESC Entrega;

-- PAGAMENTO
CREATE TABLE Pagamento(
	idPagamento INT auto_increment PRIMARY KEY,
    idCliente INT NOT NULL,
    Descricao VARCHAR(45) NOT NULL,
    Numero CHAR(16) NOT NULL,
	Validade CHAR(5) NOT NULL, 
    CONSTRAINT fk_pagamento_cliente FOREIGN KEY (idCliente) REFERENCES Cliente(idCliente)
);

DESC Pagamento;

-- FORNECEDOR
CREATE TABLE Fornecedor(
	idFornecedor INT auto_increment PRIMARY KEY,
    RazaoSocial VARCHAR(45) NOT NULL,
    Identificacao VARCHAR(18) NOT NULL,
    TipoPessoa CHAR(1) NOT NULL,
    CONSTRAINT unique_fornecedor_identificacao UNIQUE (Identificacao)
);

DESC Fornecedor;

-- FORNECEDOR PRODUTO
CREATE TABLE FornecedorProduto(
	idFornecedor INT NOT NULL,
    idProduto INT NOT NULL,
    CONSTRAINT fk_fornecedorproduto_fornecedor FOREIGN KEY (idFornecedor) REFERENCES Fornecedor(idFornecedor),
    CONSTRAINT fk_fornecedorproduto_produto FOREIGN KEY (idProduto) REFERENCES Produto(idProduto)
);


-- TERCEIRO
CREATE TABLE Terceiro(
	idTerceiro INT auto_increment PRIMARY KEY,
    RazaoSocial VARCHAR(45) NOT NULL,
    Identificacao VARCHAR(18) NOT NULL,
    TipoPessoa CHAR(1) NOT NULL,
    CONSTRAINT unique_terceiro_identificacao UNIQUE (Identificacao)
);

DESC Terceiro;

-- ESTOQUE
CREATE TABLE Estoque(
	idEstoque INT auto_increment PRIMARY KEY,
    Local VARCHAR(45)
);

DESC Estoque;

-- ESTOQUE/PRODUTO
CREATE TABLE EstoqueProduto(
    idEstoque INT NOT NULL,
	idProduto INT NOT NULL,
    Quantidade FLOAT DEFAULT 0.00,
    CONSTRAINT fk_estoqueproduto_estoque FOREIGN KEY (idEstoque) REFERENCES Estoque(idEstoque),
    CONSTRAINT fk_estoqueproduto_produto FOREIGN KEY (idProduto) REFERENCES Produto(idProduto)
);

DESC EstoqueProduto;




