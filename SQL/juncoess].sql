create database if not exists juncoes;
use juncoes;

create table Profissao(
cod_prof int auto_increment primary key,
nome_profissao varchar (69) not null);

create table Cliente(
cod_cli int not null auto_increment primary key,
nome_cliente varchar (60) not null,
data_nascimento date,
telefone char (10),
cod_profissao int,
foreign key (cod_profissao) references profissao (cod_prof));


insert into profissao (nome_profissao)
values ('programador'),
('analise de BD'),
('suporte'), 
('administrador de redes'),
('desenvolvedor web');

insert into cliente (nome_cliente, data_nascimento, telefone, cod_profissao)
values ('joao pereira','1982-06-06', '99234-5678', 1),
('José Manuel', '1975-08-01','92135-8271',2),
('Maria Mercedes','1985-10-01','98541-2587',3),
('Lucas Gonçalves','2002-01-16','94747-1500',null),
('Pedro Cantelli','2000-01-30','94500-1900',null);

select * from Profissao;
select * from Cliente;
-- 16-08


-- INNER JOIN São incluidas somente as linhas que satifazem a condição do join
select c.nome_cliente, p.nome_profissao from Cliente as c inner join Profissao as p -- (AS - indica nome genérico da tabela)
on c.cod_profissao = p.cod_prof;


-- LEFT OUTER JOIN - inclui todas as linhas da tabela do 1° nome de tabela
-- (a tabela à esquerda da expressão)
select * from Cliente as c
left outer join Profissao as p
on c.cod_profissao = p.cod_prof;

-- RIGH OUTER JOIN - inclui todas as linhas da tabela do 2° nome de tabela 
-- (a tabela à direita da expressão)
select * from Cliente as c 
right outer join Profissao as p 
on c.cod_profissao = p.cod_prof;

-- SQL SERVER
select * from Cliente 
full outer join Profissao 
on Cliente.Profissao=Profissao.cod_prof; 

-- MYSQL 
select * from Cliente as c 
left join Profissao as p 
on c.cod_profissao = p.cod_prof
union 
select * from Cliente as c 
right join Profissao as p 
on c.cod_profissao = p.cod_prof;

create table Pedido (
num_pedido int not null, 
cod_cliente int,
total_pedido decimal (10,2),
primary key (num_pedido, cod_cliente),
foreign key (cod_cliente) references Cliente(cod_cli));

insert into Pedido (num_pedido, cod_cliente, total_pedido)
values (203,1,800),
(204,2,900),
(203,3,1200);

