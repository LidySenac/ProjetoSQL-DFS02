-- Apagando bd 
drop database dblivraria;

-- criando bd
create database dblivraria;

-- Acessando bd
use dblivraria;
 
create table tbGenero(
idGenero int not null auto_increment,
descricao varchar(100),
primary key(idGenero)
);
 
create table tbAutor(
idAutor int not null auto_increment,
nome varchar(100),
email varchar(100),
primary key(idAutor)
);
 
create table tbCliente(
idCliente int not null auto_increment,
nome varchar(100),
telefone char(9),
primary key(idCliente)
);
 
create table tbLivro(
idLivro int not null auto_increment,
titulo varchar(100),
preco decimal(9,2),
estoque int,
idGenero int not null,
primary key(idLivro),
foreign key(idGenero) references tbGenero(idGenero)
);
 
create table tbVenda(
idVenda int not null auto_increment,
data date,
total decimal(9,2),
idCliente int not null,
primary key(idVenda),
foreign key(idCliente) references tbCliente(idCliente)
);
 
create table tbItensDaVenda(
idLivro int not null,
idVenda int not null,
quantidade int,
subtotal decimal(9,2),
foreign key(idLivro) references tbLivro(idLivro),
foreign key(idVenda) references tbVenda(idVenda)
);
 
create table tbEscreve(
idLivro int not null,
idAutor int not null,
foreign key(idLivro) references tbLivro(idLivro),
foreign key(idAutor) references tbAutor(idAutor)
);
 
desc tbGenero;

desc tbAutor;

desc tbCliente;

desc tbLivro;

desc tbVenda;

desc tbItensDaVenda;

desc tbEscreve;

-- cadastrando os registros nas tabelas --

-- TbGenero --

insert into tbGenero(descricao) values('Acao');

insert into tbGenero(descricao) values('Ficcao');

insert into tbGenero(descricao) values('Aventura');

insert into tbGenero(descricao) values('Terror');

insert into tbGenero(descricao) values('Comedia');

insert into tbGenero(descricao) values('Romance');

insert into tbGenero(descricao) values('Documentario');

-- TbAutor --	

insert into tbAutor(nome,email) values('Agatha Christie','agatha.christie@gmail.com');

insert into tbAutor(nome,email) values('Neil Gaiman','neil.gaiman@gmail.com');

insert into tbAutor(nome,email) values('Ceil Friedman','ceil.friedman@gmail.com');

insert into tbAutor(nome,email) values('Lewis Carroll','lewis.carroll@gmail.com');

insert into tbAutor(nome,email) values('Elizabeth Rudnick','elizabeth.rudnick@gmail.com');

insert into tbAutor(nome,email) values('J. M. Barrie','JM.barrie@gmail.com');

insert into tbAutor(nome,email) values('Kristin Cast, P. C. Cast','kristin@gmail.com');

-- TbCliente --	

insert into tbCliente(nome,telefone) values('Catia','94037-3812');

insert into tbCliente(nome,telefone) values('Gaby','94768-2011');

insert into tbCliente(nome,telefone) values('Beatriz','95078-1023');

-- Generos aleatorios --

insert into tbLivro(titulo,preco,estoque,idGenero) values('O voto de Lenobia',27.90,10,5);

insert into tbLivro(titulo,preco,estoque,idGenero) values('Coraline',52.42,15,3);

insert into tbLivro(titulo,preco,estoque,idGenero) values('Peter Pan',39.24,11,2);

insert into tbLivro(titulo,preco,estoque,idGenero) values('Assassinato no Expresso do Oriente',19.90,20,1);

-- TbVendas --

insert into tbVenda(data,total,idCliente) values('2024-05-16',150.50,2);

insert into tbVenda(data,total,idCliente) values('2024-07-06',140.94,3);

insert into tbVenda(data,total,idCliente) values('2024-06-01', 40.00,1);

-- TbItensVenda --

insert into tbItensDaVenda(idVenda,idlivro,quantidade,subtotal) values(2,3,5,150.00);

insert into tbItensDaVenda(idVenda,idlivro,quantidade,subtotal) values(3,1,2,27.90);

insert into tbItensDaVenda(idVenda,idlivro,quantidade,subtotal) values(1,2,1,55.90);

-- TbEscreve --

insert into tbEscreve(idLivro,idAutor) values(3,3);

insert into tbEscreve(idLivro,idAutor) values(2,2);

insert into tbEscreve(idLivro,idAutor) values(1,7);

-- Pesquisar os campos das tabelas --
select * from tbGenero;
select * from tbAutor;
select * from tbCliente;
select * from tbLivro;
select * from tbVenda;
select * from tbItensDaVenda;
select * from tbEscreve;

-- Alterando os Registros das Tabelas --

-- tbCliente --
update tbCliente set nome = 'Annie Benjamyn' where idCliente=2;


update tbCliente set nome = 'Ariel Oliveira', telefone = '94037-3927' where idCliente=1;
select * from tbCliente;

-- tbLivro --
update tbLivro set titulo = 'O voto de Lenobia', preco = 70.00, estoque = 10, idGenero =4 where idLivro = 1;

update tbLivro set titulo = 'As Aventuras de Ariel ', preco = 10.00, estoque = 1, idGenero =5 where idLivro = 4;
select * from tbLivro;

-- Apagando o Registro da Tabela --

-- delete from tbItensDaVenda where idVenda=2;

-- delete from tbVenda where idCliente=3;

-- delete from tbCliente where idCliente=3;

select * from tbVenda;
select * from tbCliente;
select * from tbItensDaVenda;

-- Tipos de Registros --
-- Caracter = 'Senac' como campos de caracter(varchar, char, text)
-- Numérico - 10 ou 10.50 campos (inteiro ou real)
-- Data = 'ano/mês/dia'campos(date)
-- Hora = 'hora:minuto:segundo' campos(time)
-- Booleano = true ou false (não precisa colocar em apóstolo)