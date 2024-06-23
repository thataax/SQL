create database if not exists procedimentos;

use procedimentos;

create table editora(
id int not null auto_increment primary key,
nome varchar(30));

/*
sintaxe;
DELIMITER $$
create PROCEDURE nome_procedimento (parâmetros)
begin
CORPO DO PROCEDIMENTO
END $$
DELIMITER ; 

O mysql tem como delimitador o; (ponto e virgula), ou seja ,ao te-lo em meio a um codigo , o mysql entende que ali, o comando está encerrado e nao há necessidade de continudade.*/

delimiter $$
drop procedure if exists uspInserir $$
create procedure uspInserir (nome_editora varchar(30))
main:begin

if (nome_editora='') then 
select 'o campo nome não pode estar vazio' as msg,
'erro ao cadastro' as msg;
leave main;

end if;

insert into editora (`nome_editora`) values (nome_editora);
end $$

delimiter ;