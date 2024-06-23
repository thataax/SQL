create database bdescola;
use bdescola;

create table tbaluno(
codaluno int not null auto_increment primary key,
nome varchar(40) not null,
datanasc date not null,
rg char(12),
naturalidade char(2) not null);

create table tbcurso(
codcurso int not null auto_increment primary key,
nome varchar(25) not null,
cargahor int(4) not null,
valor decimal(10,2) not null);

create table tbturma(
codturma int not null auto_increment primary key,
nome char(3) not null,
codcurso int,
foreign key (codcurso) references tbcurso(codcurso),
horario time);

create table matricula(
codmatri int not null auto_increment primary key,
datamatri date not null,
codaluno int,
codturma int,
foreign key (codaluno) references tbaluno(codaluno),
foreign key (codturma) references tbturma(codturma));

insert into tbaluno(nome,datanasc,rg,naturalidade) values
('Paulo Santos', '2000-03-10', '82.292.122-0', 'SP'),
('Maria da Gloria', '1999-10-03', '45.233.123-0', 'SP'),
('Perla Nogueira Silva', '1998-01-11', '23.533.211-9', 'SP'),
('Gilson Barros Silva', '1995-09-11', '34.221.111-x', 'PE'),
('Mariana Barbosa Santos', '2001-07-01', '54.222.122-9', 'RJ');

insert into tbcurso(nome,cargahor,valor) values
('inglês', 2000, 356.00),
('francês', 2000, 450.00),
('alemão', 3000, 478.00),
('espanhol', 3000, 600.00);

insert into tbturma(nome,codcurso,horario) values
('1IA', 1, '12:00:00'),
('1IB', 1, '18:00:00'),
('1FA', 2, '19:00:00'),
('1FB', 3, '15:00:00'),
('1AA', 3, '18:00:00'),
('1AB', 3, '19:00:00'),
('1EA', 4, '19:00:00');

insert into matricula(datamatri,codaluno,codturma) values
('2015-03-10',1,1),
('2014-04-05',2,1),
('2012-03-05',3,2),
('2016-03-03',1,3),
('2015-07-05',4,2),
('2015-05-07',4,3),
('2015-06-06',5,1),
('2015-05-05',5,3);

select * from tbcurso where tbcurso.valor = (select min(valor) from tbcurso); -- 1.
select * from tbcurso where tbcurso.valor = (select max(valor) from tbcurso); -- 2.
select nome,horario from tbturma where tbturma.horario = (select min(horario) from tbturma); -- 3.
select * from tbcurso where tbcurso.valor > (select avg(valor) from tbcurso); -- 4.
select * from matricula where matricula.datamatri = (select max(datamatri) from matricula); -- 5.

insert into tbaluno(nome,datanasc,rg,naturalidade) values -- 6.
('Victor Augusto Viana Fernandes', '2005-08-27', '40.028.922-0', 'SP');

insert into matricula(datamatri,codaluno,codturma)values -- 7.
('2022-09-22', 6, 5);

select * from matricula;
select * from tbcurso where tbcurso.codcurso = (select codcurso from tbturma where tbturma.codturma = (select codturma from matricula where codaluno = 6)); -- 8.

