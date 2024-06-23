create database lojas;

use lojas;

create table vendedores(

cod_vendedor int auto_increment not null primary key,
nome varchar(50) not null,
categoria char(1));

create table vendas(

cod_vendas int auto_increment not null primary key,
valor decimal(10,2),
cod_vendedor int,
foreign key(cod_vendedor) references vendedores(cod_vendedor));

insert into vendedores(nome,categoria) values 
('maria','a'),
('josé','b'),
('joão','b');

insert into vendas(valor,cod_vendedor) values
(4000,1),
(2000,2),
(3000,3),
(1000,1),
(2000,2),
(2000,3);

select * from vendedores;
select * from vendas;
select vendas.cod_vendas,vendas.valor, vendedores.nome from vendas, vendedores where vendas.cod_vendedor = vendedores.cod_vendedor;

