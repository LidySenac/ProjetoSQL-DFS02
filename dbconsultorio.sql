drop database dbconsultorio;

create database dbconsultorio;

use dbconsultorio;

create table tbMedicos(
idMedico int not null auto_increment,
nome varchar(100),
telefone varchar(9),
primary key(idMedico)
);

create table tbPacientes(
idPaciente int not null auto_increment,
nome varchar(100),
telefone char(9) unique,
convenio varchar(100),
primary key(idPaciente)
);

create table tbReceitaMedica(
idReceitaMedica int not null auto_increment,
descricao varchar(100),
primary key(idReceitaMedica)
);

create table tbConsulta(
idConsulta int not null auto_increment,
data datetime,
idMedico int not null,
idPaciente int not null,
idReceitaMedica int not null,
primary key(idConsulta),
foreign key(idMedico) references tbMedicos(idMedico),
foreign key(idPaciente) references tbPacientes(idPaciente),
foreign key(idReceitaMedica) references tbReceitaMedica(idReceitaMedica)
);

desc tbMedicos;
desc tbPacientes;
desc tbReceitaMedica;
desc tbConsulta;

-- Inserindo Registros --
insert into tbMedicos(nome, telefone) values('Divaldo Antunes','97523-4258');

insert into tbMedicos(nome, telefone) values('Antonia Alvaneide','98524-4059');

insert into tbMedicos(nome, telefone) values('Ana Rosa','92534-4150');

-- Tabela Pacientes --
insert into tbPacientes(nome, telefone, convenio) values('Henrique Oliveira','97021-4355','Porto Saude');

insert into tbPacientes(nome, telefone, convenio) values('Petala Viana','95022-4055','Amor e Saude');

insert into tbPacientes(nome, telefone, convenio) values('Carol Martins','92174-5540','Cartão de Todos');

insert into tbPacientes(nome, telefone, convenio) values('Carlos Eduardo','95031-5060','Amil');

insert into tbPacientes(nome, telefone, convenio) values('Hanna da Silva','96021-4159','Unimed');

-- Tabela Receita Medica --
insert into tbReceitaMedica(descricao) values('Fazer exercicio fisico diariamente');

insert into tbReceitaMedica(descricao) values('Tomar suco');

insert into tbReceitaMedica(descricao) values('Correr duas vezes na semana');

insert into tbReceitaMedica(descricao) values('Andar de bicicleta');

insert into tbReceitaMedica(descricao) values('Brincar');

-- Tabela Consultas --
insert into tbConsulta(data, idMedico, idPaciente, idReceitaMedica) values('2024/06/18',2,5,3);

insert into tbConsulta(data, idMedico, idPaciente, idReceitaMedica) values('2024/07/19',1,3,4);

insert into tbConsulta(data, idMedico, idPaciente, idReceitaMedica) values('2024/05/10',3,1,5);

insert into tbConsulta(data, idMedico, idPaciente, idReceitaMedica) values('2024/04/11',1,2,2);

insert into tbConsulta(data, idMedico, idPaciente, idReceitaMedica) values('2024/03/08',3,4,3);

-- Pesquisando os Registros --
select * from tbMedicos;
select * from tbPacientes;
select * from tbReceitaMedica;
select * from tbConsulta;

select med.nome as 'Medico',
 pac.nome as 'Paciente', 
 rec.descricao as 'Receita' from tbConsulta as con inner join tbMedicos as med
 on con.idmedico = med.idMedico inner join tbPacientes as pac
 on con.idPaciente = pac.idPaciente inner join tbReceitaMedica as rec
 on con.idReceitaMedica = rec.idReceitaMedica
 where med.nome like '%A';

 select pac.nome as 'Nome do Paciente', 
 med.nome as 'Nome do Medico' 
 from tbMedicos as med inner join tbPacientes as pac on med.idMedico = pac.idPaciente;

 -- select localtime(); --