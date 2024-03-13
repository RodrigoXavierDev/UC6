create database biblioteca;
use biblioteca;

create table cliente(
	cod_cliente int primary key,
	nome nvarchar(64),
	telefone_1 char(13),
	telefone_2 char(13),
	rua nvarchar(64),
	bairro nvarchar(64),
	cidade nvarchar(64),
	estado nvarchar(64)
);

create table pessoa_fisica(
	cod_cliente int primary key,
	foreign key (cod_cliente) references cliente(cod_cliente),
	rg nchar(6),
	cpf nchar(11)
);
create table pessoa_juridica(
	cod_cliente int primary key,
	foreign key (cod_cliente) references cliente(cod_cliente),
	cnpj nchar(14),
	ie char(9)
);
create table pedido(
	cod_pedido int primary key,
	cod_cliente int,
	foreign key (cod_cliente) references cliente(cod_cliente),
	data date,
	valor_pedido int
);
create table editora(
	cod_editora int primary key,
	telefone_1 nchar(13),
	telefone nchar(13),
	nome_conatato nvarchar(64),
	email nvarchar(64)
);
create table livro(
	cod_livro int primary key,
	cod_editora int,
	foreign key (cod_editora) references editora(cod_editora),
	valor int,
	ano_publicacao date,
	titulo nvarchar(64),
	autor nvarchar(64),
);
create table item_pedido(
	cod_pedido int,
	cod_livro int,
	foreign key (cod_pedido) references pedido(cod_pedido),
	foreign key (cod_livro) references livro(cod_livro),
	qntd_pedido int,
	valor_pedido int
);
create table estoque(
	 cod_editora int,
	 cod_livro int,
	 qntd_estoque int,
	 foreign key (cod_editora) references editora(cod_editora),
	 foreign key (cod_livro) references livro(cod_livro)
);
INSERT INTO cliente (cod_cliente, nome, telefone_1, telefone_2, rua, bairro, cidade, estado)
VALUES
(1, 'João Silva', '1234567890', '0987654321', 'Rua das Flores', 'Centro', 'São Paulo', 'SP'),
(2, 'Maria Santos', '9876543210', '0123456789', 'Avenida dos Girassóis', 'Jardins', 'Rio de Janeiro', 'RJ');

INSERT INTO pessoa_fisica (cod_cliente, rg, cpf)
VALUES
(1, '123456', '98765432100'),
(2, '654321', '01234567890');

INSERT INTO pessoa_juridica (cod_cliente, cnpj, ie)
VALUES
(1, '12345678901234', '987654321'),
(2, '98765432109876', '543210987');

INSERT INTO pedido (cod_pedido, cod_cliente, data, valor_pedido)
VALUES
(1, 1, '2024-03-13', 100),
(2, 2, '2024-03-14', 150);

INSERT INTO editora (cod_editora, telefone_1, telefone, nome_conatato, email)
VALUES
(1, '1111111111', '2222222222', 'Editora ABC', 'contato@editoraabc.com'),
(2, '3333333333', '4444444444', 'Editora XYZ', 'contato@editoraxyz.com');

INSERT INTO livro (cod_livro, cod_editora, valor, ano_publicacao, titulo, autor)
VALUES
(1, 1, 50, '2022-01-01', 'Aventuras de João', 'José da Silva'),
(2, 2, 60, '2021-01-01', 'História de Maria', 'Maria Santos');

INSERT INTO item_pedido (cod_pedido, cod_livro, qntd_pedido, valor_pedido)
VALUES
(1, 1, 2, 100),
(2, 2, 3, 180);

INSERT INTO estoque (cod_editora, cod_livro, qntd_estoque)
VALUES
(1, 1, 50),
(2, 2, 30);
