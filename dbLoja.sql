-- Apagando bd se existir
drop database dbLoja;

-- criando banco de dados
create database dbLoja;

-- acessando bd
use dbLoja;

-- visualização banco de dados
show database;

-- criando as tabelas no bd
create table tbUsuarios(
codUsu int,
nome varchar(50),
senha varchar(20)
);

create table tbFuncionarios(
codFunc int,
nome varchar(100),
email varchar(100),
cpf char(14),
telCel char(10)
);

-- visualizando as tabelas criadas
show tables;

-- visualizando as estruturas das tabelas
describe tbUsuarios;
desc tbFuncionarios;

-- inserindo registros nas tabelas
insert into tbUsuarios(codUsu,nome,senha)
	values(1,'lidian.oliveira','deximbranco');

insert into tbFuncionarios(codFunc,nome,email,cpf,telCel)
	values(10,'Lidian Paredes de Oliveira','jinx.oliveira@gmail.com','478.856.875-85','98523-8547');

-- visualizando os registros nos campos das tabelas
select * from tbUsuarios;
select * from tbFuncionarios; 