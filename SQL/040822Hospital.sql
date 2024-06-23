create database hospital;
use hospital;

create table pacientes(
id_pac int not null auto_increment primary key,
nome varchar(50),
rg int(10) not null,
datanasc date,
celular char(11));

create table medicos(
id_med int not null auto_increment primary key,
nome varchar(50),
tipo char(1),
RM char(6),
celular char (11));

create table consultas(
id_cons int not null auto_increment primary key,
id_pac int,
id_med int,
data_cons date,
hora_cons datetime,
valor_cons decimal(10,2),
foreign key(id_pac) references pacientes(id_pac),
foreign key(id_med) references medicos(id_med));

insert into pacientes (nome, rg, datanasc, celular) values
('rayssa', 834589013,'2004-04-15', '12345678910'),
('pedro', 285638364,'2005-02-02', '12902389347'),
('victor', 285392301,'2005-08-27', '40028922123'),
('jose', 123456789,'2006-06-06', '00000000000'),
('cornelius', 098765431,'1982-08-01', '10293847560');

insert into medicos (nome,tipo,RM,celular) 
values ('roberto','a','456789','12345678900'),
('fatima', 's','098435','65432134524'),
('roberval','h','920568','81275784589'),
('luis','b','657892','11345678456'),
('felipe','j','728678','13457896789');

alter table consultas modify hora_cons time;

insert into consultas(id_pac, id_med, data_cons, hora_cons, valor_cons) values 
(1, 3, '2008-09-20', '13:30', 30.80),
(4, 1, '2023-02-24', '12:30', 300.00),
(2, 5, '1980-06-09', '15:45', 99.99);

select * from consultas;

select * from medicos;

select * from pacientes;

select consultas.data_cons, consultas.hora_cons, medicos.nome, medicos.tipo, pacientes.nome from consultas,medicos,pacientes where consultas.id_pac = pacientes.id_pac and consultas.id_med = medicos.id_med;