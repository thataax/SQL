create database if not exists cinema;
use cinema;

create table categoria(
id_categoria int not null auto_increment primary key,
nome varchar(50));

create table diretor(
id_diretor int not null auto_increment primary key,
nome varchar(50));

create table filme(
id_filme int not null auto_increment primary key,
nome varchar(50),
data_lanc date,
id_cat int,
foreign key (id_cat) references categoria(id_categoria),
id_dire int,
foreign key (id_dire) references diretor(id_diretor));

insert into categoria(nome) values
('drama'),
('romance'),
('animação'),
('ação'),
('terror'),
('comédia');

insert into diretor(nome) values
('Steven Spielberg'),
('Carlos Saldanha'),
('Francis Lawrence'),
('Marc Webb'),
('Peter Jackson'),
('David Yates');

insert into filme(nome,data_lanc,id_cat, id_dire) values
('RIO 2','2014-03-27',3,2),
('Jogos Vorazes','2013-11-15',4,3),
('O espetacular homem aranha 2','2014-05-01',4,4),
('A lista de schinder','1993-12-31',1,1),
('Cavalo de guerra','2012-01-06',1,1),
('Tubarão','1975-12-25',5,1);

select * from filme;

select filme.nome from filme where filme.id_dire = 1;

select filme.nome, filme.data_lanc, diretor.nome, categoria.nome from filme 
inner join diretor on filme.id_dire = diretor.id_diretor
inner join categoria on filme.id_cat = categoria.id_categoria;

select * from filme as F right outer join diretor as D on F.id_dire = D.id_diretor
union
select * from filme as F left outer join categoria as C on F.id_cat = C.id_categoria;

select F.nome, D.nome from filme as F right outer join diretor as D on F.id_dire = D.id_diretor;

select F.nome, C.nome from filme as F right outer join categoria as C on F.id_cat = C.id_categoria;