-- Apagando bd --
drop database dbAtividade;

-- Criando bd --
create database dbAtividade;

-- Acessando bd --
use dbAtividade;

-- Criando Tabela --
create table tbArtistas(
codArt int not null,
nome varchar(100) not null unique,
primary key(codArt)
);

create table tbGravadoras(
codGrav int not null,
nome varchar(50) not null unique,
primary key(codGrav)
);

create table tbCategorias(
codCat int not null,
nome varchar(50) not null unique,
primary key(codCat)
);

create table tbEstados(
siglaEST char(2) not null,
nome varchar(50) not null unique,
primary key(siglaEST)
);

create table tbFuncionarios(
codFunc int not null,
nome varchar(50) not null,
endFunc varchar(100) not null,
sala decimal(9,2) not null default 0 check(sala >= 0),
sexo char(1) not null default 'F' check(sexo in('F','M')),
primary key(codFunc)
);

create table tbCidades(
codCid int not null,
siglaEST char(2) not null,
nome varchar(50) not null,
primary key(codCid),
foreign key(siglaEST) references tbEstados(siglaEST)
);

create table tbClientes (
codCli int not null,
codCid int not null,
nome varchar(50) not null,
endCli varchar(100) not null,
renda decimal(9,2) not null default 0 check(renda >= 0),
sexo char(1) not null default 'F' check(sexo in('F','M')),
primary key(codCli),
foreign key(codCid) references tbCidades(codCid)
);

create table tbConjuge (
codConj int not null,
codCli int not null,
nome varchar(50) not null,
renda decimal(9,2) not null default 0 check(renda >= 0),
sexo char(1) not null default 'F' check(sexo in('F','M')),
primary key(codConj),
foreign key(codCli) references tbClientes(codCli)
);

create table tbDependentes(
codDep int not null,
codFunc int not null,
nome varchar(100) not null,
sexo char(1) not null default 'F' check(sexo in('F','M')),
primary key(codDep),
foreign key(codFunc) references tbFuncionarios(codFunc)
);

create table tbTitulos(
codTiTu int not null,
codCat int not null,
codGrav int not null,
nome varchar(50) not null unique,
valor decimal(9,2) not null check(valor > 0),
quantidade int not null check(quantidade >= 0),
primary key(codTiTu),
foreign key(codCat) references tbCategorias(codCat),
foreign key(codGrav) references tbGravadoras(codGrav)
);

create table tbPedidos(
codPed int not null,
codCli int not null,
codFunc int not null,
data datetime not null,
valor decimal(9,2) not null default 0 check(valor >= 0),
primary key(codPed),
foreign key(codCli) references tbClientes(codCli),
foreign key(codFunc) references tbFuncionarios(codFunc)
);

create table tbTitulosDoPedidos(
codNum int not null,
codPed int not null,
codTiTu int not null,
quantidade int not null check(quantidade >= 1),
valor decimal(9,2) not null check(valor > 0),
foreign key(codPed) references tbPedidos(codPed),
foreign key(codTiTu) references tbTitulos(codTiTu)
);

create table tbTitulosDoArtistas(
codTiTu int not null,
codArt int not null,
foreign key(codTiTu) references tbTitulos(codTiTu),
foreign key(codArt) references tbArtistas(codArt)
);

desc tbArtistas; 
desc tbGravadoras;
desc tbCategorias;
desc tbEstados;
desc tbFuncionarios;
desc tbCidades;
desc tbClientes;
desc tbConjuge;
desc tbDependentes;
desc tbTitulos;
desc tbPedidos;
desc tbTitulosDoPedidos;
desc tbTitulosDoArtistas;

-- Inserindo Registros --
-- Tabela Artista --
insert into tbArtistas(codArt,nome) values(1,'Marisa Monte');

insert into tbArtistas(codArt,nome) values(2,'Gilberto Gil');

insert into tbArtistas(codArt,nome) values(3,'Caetano Veloso');

insert into tbArtistas(codArt,nome) values(4,'Milton Nascimento');

insert into tbArtistas(codArt,nome) values(5,'Legião Urbana');

insert into tbArtistas(codArt,nome) values(6,'The Beatles');

insert into tbArtistas(codArt,nome) values(7,'Rita Lee');

-- Tabela Gravadoras --
insert into tbGravadoras(codGrav,nome) values(1,'Polygram');

insert into tbGravadoras(codGrav,nome) values(2,'EMI');

insert into tbGravadoras(codGrav,nome) values(3,'Som Livre');

insert into tbGravadoras(codGrav,nome) values(4,'Som Music');

-- Tabela Categorias --
insert into tbCategorias(codCat,nome) values(1,'MPB');

insert into tbCategorias(codCat,nome) values(2,'Trilha Sonora');

insert into tbCategorias(codCat,nome) values(3,'Rock Internacional');

insert into tbCategorias(codCat,nome) values(4,'Rock Nacional');

-- Tabela Estados --
insert into tbEstados(siglaEST,nome) values('SP','Sao Paulo');

insert into tbEstados(siglaEST,nome) values('MG','Minas Gerais');

insert into tbEstados(siglaEST,nome) values('RJ','Rio De Janeiro');

insert into tbEstados(siglaEST,nome) values('ES','Espirito Santo');

-- Tabela Funcionários --
insert into tbFuncionarios(codFunc,nome,endFunc,sala,sexo) values(1,'Vania Gabriela Pereira','Rua A',2500.00,'F');

insert into tbFuncionarios(codFunc,nome,endFunc,sala,sexo) values(2,'Norberto Pereira Da Silva','Rua B',300.00,'M');

insert into tbFuncionarios(codFunc,nome,endFunc,sala,sexo) values(3,'Olavo Linhares','Rua C',580.00,'M');

insert into tbFuncionarios(codFunc,nome,endFunc,sala,sexo) values(4,'Paula Da Silva','Rua D',3000.00,'F');

insert into tbFuncionarios(codFunc,nome,endFunc,sala,sexo) values(5,'Rolando Rocha','Rua E',2000.00,'M');

-- Tabela Cidades --
insert into tbCidades(codCid,siglaEST,nome) values(1,'SP','Sao Paulo');

insert into tbCidades(codCid,siglaEST,nome) values(2,'SP','Sorocaba');

insert into tbCidades(codCid,siglaEST,nome) values(3,'SP','Jundiai');

insert into tbCidades(codCid,siglaEST,nome) values(4,'SP','Americana');

insert into tbCidades(codCid,siglaEST,nome) values(5,'SP','Araraquara');

insert into tbCidades(codCid,siglaEST,nome) values(6,'MG','Ouro Preto');

insert into tbCidades(codCid,siglaEST,nome) values(7,'ES','Cachoeira Do Itapemirim');

-- Tabela Cliente -- 
insert into tbClientes(codCli,codCid,nome,endCli,renda,sexo) values(1,1,'Jose Nogueira','Rua A',1500.00,'M');

insert into tbClientes(codCli,codCid,nome,endCli,renda,sexo) values(2,1,'Angelo Pereira','Rua B',2000.00,'M');

insert into tbClientes(codCli,codCid,nome,endCli,renda,sexo) values(3,1,'Alem Mar Paranhos','Rua C',1500.00,'M');

insert into tbClientes(codCli,codCid,nome,endCli,renda,sexo) values(4,1,'Catarina Souza','Rua D',892.00,'F');

insert into tbClientes(codCli,codCid,nome,endCli,renda,sexo) values(5,1,'Vagner Costa','Rua E',950.00,'M');

insert into tbClientes(codCli,codCid,nome,endCli,renda,sexo) values(6,2,'Antenor Da Costa','Rua F',1582.00,'M');

insert into tbClientes(codCli,codCid,nome,endCli,renda,sexo) values(7,2,'Maria amelia De Souza','Rua G',1152.00,'F');

insert into tbClientes(codCli,codCid,nome,endCli,renda,sexo) values(8,2,'Paulo Roberto Silva','Rua H',3250.00,'M');

insert into tbClientes(codCli,codCid,nome,endCli,renda,sexo) values(9,3,'Fatima Souza','Rua I',1632.00,'F');

insert into tbClientes(codCli,codCid,nome,endCli,renda,sexo) values(10,3,'Joel Da Rocha','Rua J',2000.00,'M');

-- Tabela Conjuge --
insert into tbConjuge(codConj,codCli,nome,renda,sexo) values(1,1,'Carla Nogueira',2500.00,'F');

insert into tbConjuge(codConj,codCli,nome,renda,sexo) values(2,2,'Emilia Pereira',5500.00,'F');

insert into tbConjuge(codConj,codCli,nome,renda,sexo) values(3,6,'Altiva Da Costa',3000.00,'F');

insert into tbConjuge(codConj,codCli,nome,renda,sexo) values(4,7,'Carlos De Souza',3250.00,'M');

-- Tabela Dependentes --
insert into tbDependentes(codDep,codFunc,nome,sexo) values(1,1,'Ana Pereira','F');

insert into tbDependentes(codDep,codFunc,nome,sexo) values(2,1,'Roberto Pereira','M');

insert into tbDependentes(codDep,codFunc,nome,sexo) values(3,1,'Celso Pereira','M');

insert into tbDependentes(codDep,codFunc,nome,sexo) values(4,3,'Brisa Linhares','F');

insert into tbDependentes(codDep,codFunc,nome,sexo) values(5,3,'Mari Sol Linhares','F');

insert into tbDependentes(codDep,codFunc,nome,sexo) values(6,4,'Sonia Da Silva','F');

-- Tabela Titulos --
insert into tbTitulos(codTiTu,codCat,codGrav,nome,valor,quantidade) values(1,1,1,'Tribalistas',30.00,1500);

insert into tbTitulos(codTiTu,codCat,codGrav,nome,valor,quantidade) values(2,1,2,'Tropicalia',50.00,500);

insert into tbTitulos(codTiTu,codCat,codGrav,nome,valor,quantidade) values(3,1,1,'Aquele Abraco',50.00,600);

insert into tbTitulos(codTiTu,codCat,codGrav,nome,valor,quantidade) values(4,1,2,'Refazenda',60.00,1000);

insert into tbTitulos(codTiTu,codCat,codGrav,nome,valor,quantidade) values(5,1,3,'Totalmente Demais',50.00,2000);

insert into tbTitulos(codTiTu,codCat,codGrav,nome,valor,quantidade) values(6,1,3,'Travessia',5.00,500);

insert into tbTitulos(codTiTu,codCat,codGrav,nome,valor,quantidade) values(7,1,2,'Courage',30.00,200);

insert into tbTitulos(codTiTu,codCat,codGrav,nome,valor,quantidade) values(8,4,3,'Legiao Urbana',20.00,100);

insert into tbTitulos(codTiTu,codCat,codGrav,nome,valor,quantidade) values(9,3,2,'The Beatles',30.00,300);

insert into tbTitulos(codTiTu,codCat,codGrav,nome,valor,quantidade) values(10,4,1,'Rita Lee',30.00,500);	

-- Tabela Pedidos --
insert into tbPedidos(codPed,codCli,codFunc,data,valor) values(1,1,2,'2002/05/02',1500.00);

insert into tbPedidos(codPed,codCli,codFunc,data,valor) values(2,3,4,'2002/05/02',50.00);

insert into tbPedidos(codPed,codCli,codFunc,data,valor) values(3,4,5,'2002/06/02',100.00);

insert into tbPedidos(codPed,codCli,codFunc,data,valor) values(4,1,4,'2003/02/02',200.00);

insert into tbPedidos(codPed,codCli,codFunc,data,valor) values(5,7,5,'2003/03/02',300.00);

insert into tbPedidos(codPed,codCli,codFunc,data,valor) values(6,4,4,'2003/03/02',100.00);

insert into tbPedidos(codPed,codCli,codFunc,data,valor) values(7,5,5,'2003/03/02',50.00);

insert into tbPedidos(codPed,codCli,codFunc,data,valor) values(8,7,2,'2003/03/02',50.00);

insert into tbPedidos(codPed,codCli,codFunc,data,valor) values(9,2,2,'2003/03/03',2000.00);

insert into tbPedidos(codPed,codCli,codFunc,data,valor) values(10,7,1,'2003/03/02',3000.00);

-- Tabela Titulos Do Pedidos --
insert into tbTitulosDoPedidos(codNum,codPed,codTiTu,quantidade,valor) values(1,1,1,2,30.00);

insert into tbTitulosDoPedidos(codNum,codPed,codTiTu,quantidade,valor) values(2,1,2,3,20.00);

insert into tbTitulosDoPedidos(codNum,codPed,codTiTu,quantidade,valor) values(3,2,1,1,50.00);	

insert into tbTitulosDoPedidos(codNum,codPed,codTiTu,quantidade,valor) values(4,2,2,3,30.00);

insert into tbTitulosDoPedidos(codNum,codPed,codTiTu,quantidade,valor) values(5,3,1,2,40.00);

insert into tbTitulosDoPedidos(codNum,codPed,codTiTu,quantidade,valor) values(6,4,2,3,20.00);

insert into tbTitulosDoPedidos(codNum,codPed,codTiTu,quantidade,valor) values(7,5,1,2,25.00);

insert into tbTitulosDoPedidos(codNum,codPed,codTiTu,quantidade,valor) values(8,6,2,3,30.00);

insert into tbTitulosDoPedidos(codNum,codPed,codTiTu,quantidade,valor) values(9,6,3,1,35.00);

insert into tbTitulosDoPedidos(codNum,codPed,codTiTu,quantidade,valor) values(10,7,4,2,55.00);

insert into tbTitulosDoPedidos(codNum,codPed,codTiTu,quantidade,valor) values(11,8,1,4,60.00);

insert into tbTitulosDoPedidos(codNum,codPed,codTiTu,quantidade,valor) values(12,9,2,3,15.00);

insert into tbTitulosDoPedidos(codNum,codPed,codTiTu,quantidade,valor) values(13,10,7,2,15.00);

-- Tabela Titulos Do Artistas --
insert into tbTitulosDoArtistas(codTiTu,codArt) values(1,1);

insert into tbTitulosDoArtistas(codTiTu,codArt) values(2,2);

insert into tbTitulosDoArtistas(codTiTu,codArt) values(3,2);

insert into tbTitulosDoArtistas(codTiTu,codArt) values(4,2);

insert into tbTitulosDoArtistas(codTiTu,codArt) values(5,3);

insert into tbTitulosDoArtistas(codTiTu,codArt) values(6,4);

insert into tbTitulosDoArtistas(codTiTu,codArt) values(7,4);

insert into tbTitulosDoArtistas(codTiTu,codArt) values(8,5);

insert into tbTitulosDoArtistas(codTiTu,codArt) values(9,6);

insert into tbTitulosDoArtistas(codTiTu,codArt) values(10,7);	

select * from tbArtistas; 
select * from tbGravadoras;
select * from tbCategorias;
select * from tbEstados;
select * from tbFuncionarios;
select * from tbCidades;
select * from tbClientes;
select * from tbConjuge;
select * from tbDependentes;
select * from tbTitulos;
select * from tbPedidos;
select * from tbTitulosDoPedidos;
select * from tbTitulosDoArtistas;

-- Questões das Páginas 88 a 89 --

-- 1. Selecione o nome dos CDs e o nome da gravadora de cada CD.
select TiTu.nome as 'Nome dos CDs',
Grav.nome as 'Nome da Gravadora' from tbGravadoras as Grav inner join tbTitulos as Titu on Grav.codGrav = Titu.codTiTu;

-- 2. Selecione o nome dos CDs e o nome da categoria de cada CD.
select Titu.nome as 'Nome dos CDs',
Cat.nome as 'Nome das Categorias' from tbCategorias as Cat inner join tbTitulos as Titu on Cat.codCat = Titu.codTiTu;

-- 3. Selecione o nome dos CDs, o nome das gravadoras de cada CD e o nome da categoria de cada CD.
select Titu.nome as 'Nome dos CDs',
Grav.nome as 'Nome da Gravadora',
Cat.nome as 'Nome da Categorias' from tbTitulos as Titu inner join tbGravadoras as Grav on Titu.codGrav = Grav.codGrav inner join tbCategorias as Cat on Titu.codCat = Cat.codCat;

-- 4. Selecione o nome dos clientes e os títulos dos CDs vendidos em cada pedido que o cliente fez.
select Cli.nome as 'Nome dos Clientes',
Titu.nome as 'Nome dos Pedidos' from tbClientes as Cli inner join tbPedidos as Ped on Cli.codCli = Ped.codCli inner join tbTitulosDoPedidos as TituPed on Ped.codPed = TituPed.codPed inner join tbTitulos as Titu on TituPed.codTitu = Titu.codTiTu;

-- 5. Selecione o nome do funcionário, número, data e valor dos pedidos que este funcionário registrou, além do nome do cliente que está fazendo o pedido.
select Fun.nome
-- 6. Selecione o nome dos funcionários e o nome de todos os dependentes de cada funcionário.

-- 7. Selecione o nome dos clientes e o nome dos cônjuges de cada cliente.

-- 9. Selecione o nome de todos os clientes. Se estes possuem cônjuges, mostrar os nomes de seus cônjuges também.
