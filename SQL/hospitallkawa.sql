create database hospital2;
use hospital2;

create table pacientes (
id_pacientes int auto_increment not null primary key,
nome  varchar(50),
RG char(10),
datanasc date,
celular char (11));

insert into pacientes(nome,RG,datanasc,celular)
values ('Cleyton',1234567891,'2002-10-21',1123456789),
('Joelson',1097654322,'1918-04-12',11876543231),
('Josivan',4567834568,'1948-03-11',11722899542),
('Malquivan',1122334455,'1935-02-22',11223344556),
('Papaleguas',9988776655,'2022-08-04',11663237809);


desc pacientes;

create table medico (
id_medicos int auto_increment primary key,
nome varchar(50),
especialidade varchar (15),
RM char(5),
celular char(11));


create table consultas (
id_consulta int auto_increment not null primary key,
id_med int,
id_pac int,
foreign key (id_pac)  references pacientes(id_pacientes),
foreign key (id_med)  references medico(id_medicos),
dataconsul date,
horaconsul time,
valorconsul decimal(10,2));
 insert into medico(nome, especialidade, RM, celular)
 values('matias', 'psicologo', 34567, 12345678912),
 ('rayssa', 'anestecista', 77777, 98765432198),
 ('paulo', 'fono', 99999, 12345638912),
 ('carlos', 'pediatra', 98765, 12345978992),
 ('bruno', 'enfermeira', 34517, 12345666912);