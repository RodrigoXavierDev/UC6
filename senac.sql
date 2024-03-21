create database senac;
use senac;

create table senac (
	cnpj char(14) primary key,
	nome nvarchar(64),
	idade int,
	email nvarchar(64) unique 
);

create table curso (
	id_curso int identity(1,1) primary key,
	nome varchar(128),
	duracao int,
	descricacao nvarchar(256),
	area varchar(128)
);
create table uc (
	id_uc int identity(1,1) primary key,
	nome nvarchar,
	descricacao nvarchar(256),
	carga_horaria int 
);
create table aluno (
	id_aluno int identity(1,1)  primary key,
	nome nvarchar(128),
	data_nascimento date,
	telefone char(13),
	email nvarchar(128)
);
create table a_psg (
	pgm_gratuidade nvarchar(128)
);

create table a_pagante (
	forma_pagamnto nvarchar(16),
	status_pagamento nvarchar(16)
);


