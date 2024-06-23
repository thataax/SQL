create database oi;
use oi;

-- Junçoes
create table profssao  (
Cod_Prof int auto_increment primary key,
Nome_Profissao varchar (68) not null);

create table Cliente (
Cod_Cliente int not null auto_increment primary key,
Nome_Cliente varchar (68) not null,
Data_Nasc date,
Telefone varchar (15),
Cod_profissao int,
foreign key(Cod_profissao) references profssao(Cod_Prof));

desc Cliente;

insert into profssao (Nome_Profissao)
values ("\programador"),
("Analista de BD"),
("Suporte"),
("ADM de redes"),
("Desenvolvimento web");
select  * from  profssao;

insert into Cliente (Nome_Cliente, Data_Nasc, Telefone, Cod_profissao)
values ("Raquel Souza","1995-11-01","(11)11111-1111",1),
("Pedro Cantelli", "2000-01-30","(11)22222-2222",2),
("Lucas Gonçalves", "2003-09-21","(11)33333-3333",3),
("Camila Alves", "1985-11-04", "(11)44444-4444",null),
("Luisa Andrade", "1998-04-19" , "(11)55555-5555",null);
select  * from  Cliente;

-- inner join
select C.Nome_Cliente, P.Nome_Profissao from Cliente as C inner join profssao as P on C.Cod_profissao = P.Cod_Prof;

-- left outer join
-- ( a tabela á esquerda da expressão)
select * from Cliente as C left outer join profssao as P on C.Cod_profissao = P.Cod_Prof;

-- right outer join
-- ( a tabela á direita da expressão)
select * from Cliente as C right outer join profssao as P on C.Cod_profissao = P.Cod_Prof;

-- MYSQL
-- mostrar tudp, direita e esquerda
select * from Cliente as C left outer join profssao as P on C.Cod_profissao = P.Cod_Prof
union
select * from Cliente as C right outer join profssao as P on C.Cod_profissao = P.Cod_Prof;

-- tem que terminar
create table Pedido (
Nome_Pedido int not null,
Cod_Cliente int,
Total_Pedido decimal (10,2),
primary key (Num_Pedido, Cod_Cliente),
foreign key (Cod_Cliente) references Cliente(Cod_Cli));