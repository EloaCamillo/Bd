create database DevitProva;
use DevitProva;

create table Heroi(
HeroiId int primary key auto_increment,
Nome varchar(50) not null,
CodiNome varchar(50) not null,
Idade int(2) not null,
Planeta varchar(50),
FKPoderId int not null);

create table Poder(
PoderId int primary key auto_increment,
Descricao varchar(100),
NivelPoder int(3));

Alter table Heroi add constraint FKPoderHeroi foreign key (FKPoderId) references Poder (PoderId);
