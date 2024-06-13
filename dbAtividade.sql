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

create table tbTitulosDoPedido(
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

--desc tbArtistas; 
--desc tbGravadoras;
--desc tbCategorias;
--desc tbFuncionarios;
--desc tbCidades;
--desc tbClientes;
--desc tbConjuge;
--desc tbDependentes;
--desc tbTitulos;
--desc tbPedidos;
--desc tbTitulosDoPedido;
--desc tbTitulosDoArtistas;

-- Inserindo Registros --
-- Tabela Artista --
insert into tbArtistas(nome) values('Marisa')