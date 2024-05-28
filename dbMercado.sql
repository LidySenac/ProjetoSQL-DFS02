-- Apagando bd --
drop database dbmercado;

-- Criando bd --
create database dbMercado;

-- Acessando bd --
use dbMercado;

-- Criando Tabela --
create table tbFuncionarios(
codFunc int not null auto_increment,
nome varchar(100),
email varchar(100),
telefone char(10),
logradouro varchar(100),
numero char(10),
cep char(9),
bairro varchar(100),
cidade varchar(100),
estado char(2),
primary key(codFunc)
);

-- Cadastrando os Registros (5 inserts) --
insert into tbFuncionarios (nome,email,telefone,logradouro,numero,cep,bairro,cidade,estado)
	values('Ariel','haru.oliveira@gmail.com','94038-2050','Rua dr.Antonio','34','03587080','Moema','Sao Paulo','SP');

insert into tbFuncionarios (nome,email,telefone,logradouro,numero,cep,bairro,cidade,estado) 
	values('Iago','iago.nascimento@hotmail.com','93860-7010','Rua Giovanni Fattori','9','03583090','JD.Marilia','Sao Paulo','SP');

insert into tbFuncionarios (nome,email,telefone,logradouro,numero,cep,bairro,cidade,estado) 
	values('Cesar','cesar.moliveira@gmail.com','92870-9020','Rua Jasmin','90','08345020','Patriarca','Sao Paulo','SP');

insert into tbFuncionarios (nome,email,telefone,logradouro,numero,cep,bairro,cidade,estado) 
	values('Gabrielly','gaby.maria@gmail.com','94035-6012','Rua da Felicidade','100','03583070','Maravilhas','Desconhecido','DSC');

insert into tbFuncionarios (nome,email,telefone,logradouro,numero,cep,bairro,cidade,estado) 
	values('Petala','petala.viana@hotmail.com','97060-3524','Rua das Flores','150','03585080','Jardins','Sao Paulo','SP');

insert into tbFuncionarios (nome,email,telefone,logradouro,numero,cep,bairro,cidade,estado) 
	values('Arthur','art.dark@gmail.com','94567-1010','Rua da Noite','170','03584081','Estrela','Submundo','SB');

-- Pesquisar os campos das tabelas --
select * from tbFuncionarios;

-- Alterando Os Registros (3 Updates)--
update tbFuncionarios set nome ='Amanda' where codFunc=1;

update tbFuncionarios set numero ='10' where codFunc=2;

update tbFuncionarios set nome ='Catia' where codFunc=4;
	select * from tbFuncionarios;

-- Colunas Virtuais (3 Tipos de select)--
select codFunc,nome,email,telefone,logradouro,numero,cep,bairro,cidade,estado,'1.460' as 'salario' from tbFuncionarios;

select codFunc as 'Codigo',nome as 'Nome',email as 'E-mail',telefone as 'Telefone',logradouro as 'Logradouro',numero as 'Numero',cep as 'CEP',bairro as 'Bairro',cidade as 'Cidade',estado as 'Estado' from tbFuncionarios;

select numero * 70 as 'numero' from tbFuncionarios;
select * from tbFuncionarios;

-- Deletando uma Linha da Tabela (1 Delete)--
delete from tbFuncionarios where codFunc = 6;
	select * from tbFuncionarios;

-- Exemplos --
-- Tipos de Busca (select) --
select * from tbFuncionarios; -- Buscando Tabelas --

select telefone, email from tbFuncionarios; -- Buscando coluna especifica da tabela --

-- clausula where / operadores (> maior, < menor, >= maior igual, <= menor igual, <> diferente, IN, AND, OR) --
select * from tbFuncionarios where nome

select distinct tipo from tbFuncionarios; -- tipos sem repetição --

select distinct tipo from tbFuncionarios;

select * from 