-- Apagando bd
drop database dbExercicio;

-- Criando bd
create database dbExercicio;

-- Acessando bd
use dbExercicio

-- Tabela da Saúde --
create table tbMedico(
idMedico int not null auto_increment,
nmMedico varchar(45) not null,
telefonemedico varchar(9),
primary key(idMedico)
);

create table tbPaciente(
idPaciente int not null auto_increment,
nmPacient varchar(45),
telefonePaciente varchar(9),
convenio varchar(45),
primary key(idPaciente)
);

create table tbReceitaMedica(
idReceitaMedica int not null auto_increment,
descricao varchar(500),
primary key(idReceitaMedica)
);

create table tbConsulta(
idConsulta int not null auto_increment,
consulta datetime,
idMedico int not null,
idPaciente int not null,
idReceitaMedica int not null,
primary key(idConsulta),
foreign key(idMedico) references tbMedico(idMedico),
foreign key(idPaciente) references tbPaciente(idPaciente),
foreign key(idReceitaMedica) references tbReceitaMedica(idReceitaMedica)
);