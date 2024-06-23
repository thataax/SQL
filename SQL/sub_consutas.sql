create database sub_consutas;
use sub_consutas;

create table consutas(
cod_pai int auto_increment primary key,
nome_pai varchar(50),
idade_pai int);

create table consu(
cod_filho int auto_increment primary key,
cod_pai int,
foreign key (cod_pai) references consutas (cod_pai),
nome_filho varchar(50),
sexo_filho int);

alter table consu modify sexo_filho char(1);

insert into consutas(nome_pai, idade_pai)
values ('Daniel de Souza Leão Sobrinho', 62) ,
('João Carlos da Silva', 38),
('Fernando de Oliveira', 36), 
('Jairo de Oliveira Leão', 32);

select * from consutas;

insert into consu(cod_pai,nome_filho, sexo_filho)
values (1,'Renata de Oliveira Leão','F'),
(1,'Fernado de Oliveira Leão','M'),
(1,'Roberta de Oliveira Leão','F'),
(1,'Jairo de Oliveira Leão','M'),
(2,'Giovanna da Silva','F'),
(3,'Lucas Ribeiro Oliveira','M'),
(3,'Helder Ribeiro Oliveira','M');

select * from consu;

select nome_pai as nome_do_pai_mais_velho, max(idade_pai) as idade from consutas; 

select * from consutas where idade_pai = (select max(idade_pai) from consutas);

select * from consutas where idade_pai in (select max(idade_pai) from consutas);

select * from consutas where idade_pai <> (select max(idade_pai) from consutas);

select * from consutas where cod_pai not in (select cod_pai from consu);

select * from consutas where exists (select cod_pai from consu where consu.cod_pai = consutas.cod_pai);

select *, (select count(cod_pai) from consu where consu.cod_pai = consutas.cod_pai) as Qtd_filho from consutas;

-- ATIVIDADES 

-- ola vitor A)
	select * from consutas where idade_pai = (select min(idade_pai) from consutas);

-- leonel otario B)
	select * from consutas where in (select cod_pai from consu where sexo_filho = "F");









