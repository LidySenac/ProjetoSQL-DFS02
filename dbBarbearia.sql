-- Apagando bd --
drop database dbbarbearia;

-- Criando bd --
create database dbBarbearia;

-- Acessando bd --
use dbBarbearia;

-- Criando a Tabela --
create table tbProdutos(
codProd int not null auto_increment,
descricao varchar(100),
marca varchar(50),
preco decimal(9,2),
primary key(codProd)
);

-- cadastrando os registros nas tabelas --
insert into tbProdutos(descricao,marca,preco) values('Shampoo','Nivea', 30.00);

insert into tbProdutos(descricao,marca,preco) values('Sabonete','Pheno', 50.00);

insert into tbProdutos(descricao,marca,preco) values('Creme de Barbear','Gillete', 20.00);

insert into tbProdutos(descricao,marca,preco) values('Gel de Cabelo','Salome', 25.00);

-- Pesquisar os campos das tabelas --
select * from tbProdutos;

-- Apagando o Registro da Tabela --
delete from tbProdutos where codProd = 1;
select * from tbProdutos;

-- Colocando Alias 'as' para nomear as tabelas -- 
-- select codProd as 'Código', descricao as 'Descrição',
-- marca as 'Marca', preco as 'Preço' from tbProdutos;
-- modificar acentuação na coluna desejada.

-- Colunas virtuais 
--select codprod,descricao,marca,preco,'promoção' as 'promo' from tbprodutos;

--select codprod,descricao,'promoção' as 'promo',marca,preco from tbprodutos;

--select codProd as 'Código',descricao as 'Descrição',marca as 'Marca','sim' as 'vendido',preco as 'Preço' from tbprodutos;

-- utilizando calculos no Sql -- 
-- update tbProdutos set preco = preco * 1.10 where codProd = 3; 

-- select preco * 0.90 as 'Desconto' from tbprodutos;

update tbProdutos set preco = preco * 0.20 where codProd = 1;
	select * from tbProdutos;