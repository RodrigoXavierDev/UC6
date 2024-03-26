create database senac_rodrigo;
use senac_rodrigo;

create table endereco (
	id_endereco int identity(1,1) primary key,
	logradouro varchar(128) not null,
	numero varchar(8),
	complemento varchar(64),
	cidade varchar(64) not null,
	estado varchar(64) not null,
	cep char(8) not null
);

create table senac (
	cnpj char(14) primary key,
	nome nvarchar(64) unique not null,
	email nvarchar(64) unique not null,
    id_curso int,
    id_endereco int,
    foreign key (id_curso) references curso(id_curso),
	foreign key (id_endereco) references endereco(id_endereco)
);

create table curso (
	id_curso int identity(1,1) primary key,
    data_inicio date not null,
    dat_fim date not null,
	nome varchar(128) not null,
	duracao int not null,
    carga_horaria varchar (16) not null,
	descricacao nvarchar(256),
	area varchar(128) not null,
    total_alunos int,
    vaga int,
    preco int,
    id_aluno int,
    id_professor int,
    foreign key (id_aluno) references aluno(id_aluno),
    foreign key (id_professor) references professor(id_professor)
);

create table curso_livre(
	id_curso int,
	foreign key (id_curso) references curso(id_curso)
);

create table curso_tecnico (
	id_curso int,
	foreign key (id_curso) references curso(id_curso)
);

create table idioma (
    id_curso int,
    nivel_fluencia nvarchar(32),
    id_idioma int identity(1,1) primary key,
    foreign key (id_curso) references curso(id_curso),
);

create table italiano (
    id_idioma int
    foreign key (id_idioma) references idioma(id_idioma)
);

create table frances (
    id_idioma int
    foreign key (id_idioma) references idioma(id_idioma)
);

create table ingles (
    id_idioma int
    foreign key (id_idioma) references idioma(id_idioma)
);

create table espanhol (
    id_idioma int
    foreign key (id_idioma) references idioma(id_idioma)
);

create table alemao (
    id_idioma int
    foreign key (id_idioma) references idioma(id_idioma)
);

create table uc (
	id_uc int identity(1,1) primary key,
	nome nvarchar not null,
	duracao int not null,
	descricacao nvarchar(256),
	carga_horaria nvarchar(128) 
);

create table aluno (
	id_aluno int identity(1,1)  primary key,
    genero varchar(16),
	id_endereco int,
	nome nvarchar(128) not null,
	data_nascimento date not null,
	telefone char(13) not null,
	email nvarchar(128) unique not null,
	foreign key (id_endereco) references endereco(id_endereco)
);

create table a_psg (
	pgm_gratuidade nvarchar(128),
	id_aluno int
	foreign key (id_aluno) references aluno(id_aluno)
);

create table a_pagante (
	forma_pagamnto nvarchar(16) not null,
	status_pagamento nvarchar (16) not null,
	id_aluno int
	foreign key (id_aluno) references aluno(id_aluno)
);

create table a_aprendiz (
	empresa_contratante nvarchar(128) not null,
	id_aluno int
	foreign key (id_aluno) references aluno(id_aluno)
);

create table funcionario (
	id_funcionario int identity(1,1) primary key,
    data_contratacao date not null,
    genero varchar(16),
	nome varchar(128) not null,
	data_nascimento date not null,
	salario int not null,
	telefone char(13) not null,
	email varchar(64) unique not null,
	cargo varchar(32),
	id_endereco int,
	foreign key (id_endereco) references endereco(id_endereco)
);

create table pedagogo (
	formacao_academica nvarchar(32) not null,
	especializacao nvarchar(32) not null,
	id_funcionario int,
	foreign key (id_funcionario) references funcionario(id_funcionario)
);

create table professor (
    id_professor int identity(1,1) primary key,
	especialidade nvarchar(32),
	carga_horaria int,
	id_funcionario int,
	foreign key (id_funcionario) references funcionario(id_funcionario)
);

create table porteiro (
	turno_trabalho nvarchar(16),
	id_funcionario int,
	foreign key (id_funcionario) references funcionario(id_funcionario)
);

create table atendente (
	cargo_atendente nvarchar(16),
	turno_trabalho nvarchar(16),
	id_funcionario int,
	foreign key (id_funcionario) references funcionario(id_funcionario)
);

create table asg (
	setor nvarchar(16),
	id_funcionario int,
	foreign key (id_funcionario) references funcionario(id_funcionario)
);

create table turma(
	id_turma int identity(1,1) primary key,
	id_curso int,
	id_funcionario int,
	sala varchar(16),
	data_inicio date,
	data_fim date,
	foreign key (id_curso) references curso(id_curso),
	foreign key (id_funcionario) references funcionario(id_funcionario)
);

-- inserindo endereços
insert into endereco (logradouro, numero, complemento, cidade, estado, cep) values ('rua nova', 34, 'casa branca', 'natal', 'rn', '88888888')
insert into endereco (logradouro, numero, complemento, cidade, estado, cep) values ('rua velha', 43, 'casa preta', 'natal', 'rn', '78787878')

-- inserindo senac's
insert into senac (cnpj, nome, email, id_curso, id_endereco) values ('83473630000100', 'zona norte', 'zonanorte@senac.com.br', 1)
insert into senac (cnpj, nome, email, id_curso, id_endereco) values ('63585847000103', 'zona sul', 'zonasul@senac.com.br', 2)

-- inserindo curso
insert into curso (data_inicio, date_fim, nome, duracao, carga_horaria, descricacao, area, total_alunos, vaga, preco) values ('20240326', '20250326', 'tecnico em desenvolvedor de software', 900, '4h por dia', 'curso novo na area de informatica', 'informatica', 50, 45, 0)
insert into curso (data_inicio, date_fim, nome, duracao, carga_horaria, descricacao, area, total_alunos, vaga, preco) values ('2023-07-05', '2024-05-05', 'enfermagem', 1200, '4h por dia', 'curso novo na area de saude', 'saude', 40, 33, 9960)
insert into curso (data_inicio, date_fim, nome, duracao, carga_horaria, descricacao, area, total_alunos, vaga, preco) values ('2024-03-26', '2027-03-26', 'italiano', 3600, '4h por dia', 'curso de idiomas de italiano', 30, 30, 5000)
insert into curso (data_inicio, date_fim, nome, duracao, carga_horaria, descricacao, area, total_alunos, vaga, preco) values ('2024-03-26', '2027-03-26', 'frances', 3600, '4h por dia', 'curso de idiomas de frances', 30, 27, 5000)
insert into curso (data_inicio, date_fim, nome, duracao, carga_horaria, descricacao, area, total_alunos, vaga, preco) values ('2024-03-26', '2027-03-26', 'ingles', 3600, '4h por dia', 'curso de idiomas de ingles', 30, 25, 5000)
insert into curso (data_inicio, date_fim, nome, duracao, carga_horaria, descricacao, area, total_alunos, vaga, preco) values ('2024-03-26', '2027-03-26', 'espanhol', 3600, '4h por dia', 'curso de idiomas de espanhol', 30, 29, 5000)
insert into curso (data_inicio, date_fim, nome, duracao, carga_horaria, descricacao, area, total_alunos, vaga, preco) values ('2024-03-26', '2027-03-26', 'alemao', 3600, '4h por dia', 'curso de idiomas de alemao', 30, 28, 5000)

-- inserindo curso livre
insert into curso_livre (id_curso) values (2)

--inserindo curso tecnico
insert into curso_tecnico (id_curso) values (1)

--inserindo idioma
insert into idioma (id_curso, nivel_fluencia) values (3, 'junior')
insert into idioma (id_curso, nivel_fluencia) values (4, 'express')
insert into idioma (id_curso, nivel_fluencia) values (5, 'express')
insert into idioma (id_curso, nivel_fluencia) values (6, 'teens')
insert into idioma (id_curso, nivel_fluencia) values (7, 'teens')

--inserindo curso italiano
insert into italiano (id_idioma) values (1)

--inserindo curso ingles
insert into ingles (id_idioma) values (3)

--inserindo curso frances
insert into frances (id_idioma) values (2)


insert into espanhol (id_idioma) values (4)

--inserindo curso alemao
insert into alemao (id_idioma) values (5)

--inserindo unidade curricular
insert into uc (nome, duracao, descricacao, carga_horaria) values ('programação orientada a objetos', 148, 'aluno vai aprender a programar objetos em typescript', '4 horas por dia')

