/*script para uso no mysql */

CREATE DATABASE agrocruz_db;

USE agrocruz_db;

CREATE TABLE tarefas (
	id INT AUTO_INCREMENT PRIMARY_KEY,
	tarefa VARCHAR(1000) NOT NULL
	data DATE NOT NULL
	realizada ENUM('SIM', 'NAO') NOT NULL
);

CREATE TABLE usuario (
	id INT AUTO_INCREMENT PRIMARY KEY,
	login VARCHAR(20) NOT NULL UNIQUE,
	senha VARCHAR(20) NOT NULL
);

-- Tabela de fornecedores deve vir antes por causa da chave estrangeira
CREATE TABLE fornecedores (
	id INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL
);

CREATE TABLE cadastro_produto (
	id INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR(100) NOT NULL,
	fornecedor INT NOT NULL,
	ativo VARCHAR(100) NOT NULL,
	FOREIGN KEY (fornecedor) REFERENCES fornecedores(id)
);

CREATE TABLE cotacoes (
	id INT AUTO_INCREMENT PRIMARY KEY,
	data DATE NOT NULL,
	produto INT NOT NULL,
	valor DECIMAL(10,2) NOT NULL,
	forma_pagamento ENUM('A PRAZO', 'A VISTA') NOT NULL,
	FOREIGN KEY (produto) REFERENCES cadastro_produto(id)
);

insert into fornecedores (nome) VALUES("Nortox");
insert into cadastro_produto (nome, fornecedor, ativo) values("Imazetapir 212",1,"Imazetapir");
insert into cadastro_produto (nome, fornecedor, ativo) values("Metribuzim",1,"Metribuzim");
insert into cadastro_produto (nome, fornecedor, ativo) values("S-Metolacloro",1,"S-Metolacloro");
insert into cadastro_produto (nome, fornecedor, ativo) values("Cipermetrina",1,"Cipermetrina");
insert into cadastro_produto (nome, fornecedor, ativo) values("Metsulfurom",1,"Metsulfurom");

insert into cadastro_produto (nome, fornecedor, ativo) values("Imazetapir WG",2,"Imazetapir");
insert into cadastro_produto (nome, fornecedor, ativo) values("2.4-d",2,"2.4-d");
insert into cadastro_produto (nome, fornecedor, ativo) values("Gligfosato 48%",2,"Gligfosato 48%");
insert into cadastro_produto (nome, fornecedor, ativo) values("Glufosinato",2,"Glufosinato");
insert into cadastro_produto (nome, fornecedor, ativo) values("Metsulfurom",2,"Metsulfurom");
insert into cadastro_produto (nome, fornecedor, ativo) values("Firponil",2,"Fipronil");

insert into cotacoes (data, produto, valor, forma_pagamento) values('2025-07-03', 1, 54.00, 'A VISTA');
insert into cotacoes (data, produto, valor, forma_pagamento) values('2025-07-03', 1, 60.97, 'A PRAZO');
insert into cotacoes (data, produto, valor, forma_pagamento) values('2025-07-03', 2, 60.00, 'A VISTA');
insert into cotacoes (data, produto, valor, forma_pagamento) values('2025-07-03', 2, 67.74, 'A PRAZO');
insert into cotacoes (data, produto, valor, forma_pagamento) values('2025-07-03', 3, 40.00, 'A VISTA');
insert into cotacoes (data, produto, valor, forma_pagamento) values('2025-07-03', 3, 45.16, 'A PRAZO');
insert into cotacoes (data, produto, valor, forma_pagamento) values('2025-07-03', 4, 29.50, 'A VISTA');
insert into cotacoes (data, produto, valor, forma_pagamento) values('2025-07-03', 4, 33.31, 'A PRAZO');
insert into cotacoes (data, produto, valor, forma_pagamento) values('2025-07-03', 5, 285.00, 'A VISTA');
insert into cotacoes (data, produto, valor, forma_pagamento) values('2025-07-03', 5, 321.77, 'A PRAZO');
insert into cotacoes (data, produto, valor, forma_pagamento) values('2025-07-03', 6, 155.00, 'A PRAZO');
insert into cotacoes (data, produto, valor, forma_pagamento) values('2025-07-03', 7, 20.50, 'A PRAZO');
insert into cotacoes (data, produto, valor, forma_pagamento) values('2025-07-03', 8, 24.50, 'A PRAZO');
insert into cotacoes (data, produto, valor, forma_pagamento) values('2025-07-03', 9, 18.50, 'A PRAZO');
insert into cotacoes (data, produto, valor, forma_pagamento) values('2025-07-03', 10, 360.00, 'A PRAZO');
insert into cotacoes (data, produto, valor, forma_pagamento) values('2025-07-03', 11, 103.00, 'A PRAZO');

SELECT 
    cp.id,
    cp.nome AS produto,
    f.nome AS fornecedor,
    cp.ativo
FROM cadastro_produto cp
JOIN fornecedores f ON cp.fornecedor = f.id;

-- Buscar todas as cotações com nome do produto e nome do fornecedor
SELECT 
    c.id,
    c.data,
    cp.nome AS produto,
	cp.ativo,
    f.nome AS fornecedor,
    c.valor,
    c.forma_pagamento
FROM cotacoes c
JOIN cadastro_produto cp ON c.produto = cp.id
JOIN fornecedores f ON cp.fornecedor = f.id;

-- Atualizar valor e forma de pagamento de uma cotação específica
UPDATE cotacoes 
SET valor = 180.00, forma_pagamento = 'A VISTA'
WHERE id = 1;

-- Deletar uma cotação pelo ID
DELETE FROM cotacoes 
WHERE id = 1;
