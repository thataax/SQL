create database exemplo;
use exemplo;

create table aluno(
cod int auto_increment primary key,
nome varchar(20),
idade int,
melhor_amigo varchar(20),
sexo char(1));

insert into aluno(nome,idade,melhor_amigo,sexo) values
('Leonel', 16, 'josé','M'),
('Victor', 17, 'Rayssa','M');

select * from aluno; -- seleciona todos os dados da tabela, para verificar o funcionamento --

-- Uso de procedimento
delimiter //
create procedure mostrar_aluno (IN m_a varchar(20), IN novo_amigo varchar(20), IN ma_id int)
begin
update aluno set melhor_amigo = novo_amigo where cod = ma_id;
select * from aluno where melhor_amigo = m_a;

end;
//

call mostrar_aluno("josé","Vinicius",0); // -- Chamar o procedimento --

-- outro procedimento --
 create procedure veraluno (varaluno int)
 select concat('o aluno é', nome) as preco from aluno where cod = varaluno;

 call veraluno(1);
