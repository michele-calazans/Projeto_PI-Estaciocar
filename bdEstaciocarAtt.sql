-- Criando a base de dados
create database bdEstaciocar;

-- Chamando a base de dados
use bdEstaciocar;


-- *Criando as tabelas
create table tbUsuario(
cod_usuario int not null auto_increment primary key,
nome_usuario varchar(20) not null,
senha_usuario varchar(15) not null,
email_usuario varchar(30) not null,
-- Criando uma coluna do tipo Enum e atribuindo os valores de tipos de usuários
tipo_usuario enum('Administrador', 'Cliente'),
-- Definindo campo como data e horário atuais 
data_cadastro datetime default now() not null not null
);

create table tbEstacionamento(
cod_estacionamento int not null auto_increment primary key,
nome_estacionamento varchar(30) not null,
logradouro_estacionamento varchar (35) not null,
bairro_estacionamento varchar(35) not null,
numero_estacionamento varchar (5) not null,
cep_estacionamento varchar(9) not null,
cidade_estacionamento varchar(20) not null,
estado_estacionamento varchar(13) not null,
cod_usuario int not null,
foreign key (cod_usuario) references tbUsuario (cod_usuario),
-- Definindo campo como data e horário atuais 
data_cadastro datetime default now() not null not null
);

create table tbTelefone_estacionamento(
cod_telefone int primary key auto_increment,
num_telefone varchar(15) not null,
cod_estacionamento int,
foreign key (cod_estacionamento) references tbEstacionamento(cod_estacionamento),
-- Definindo campo como data e horário atuais 
data_cadastro datetime default now() not null not null
);

create table tbVaga(
cod_vaga int not null auto_increment primary key,
descricao_vaga varchar(5) not null,
-- Criando uma coluna do tipo Enum e atribuindo os valores de tipos de vagas
tipo_vaga enum('Idoso', 'Deficiente', 'Comum') not null,
cod_estacionamento int not null,
foreign key (cod_estacionamento) references tbEstacionamento (cod_estacionamento),
-- Definindo campo como data e horário atuais 
data_cadastro datetime default now() not null not null
);

create table tbStatusVaga(
cod_status_vaga int not null auto_increment primary key,
tipo_status int not null,
data_hora_status timestamp default current_timestamp() not null,
cod_vaga int not null,
foreign key (cod_vaga) references tbVaga (cod_vaga)
);
-- Fim - Criando as tabelas


-- *Insert de todas as tabelas

-- Tabela Usuário
insert into tbusuario (nome_usuario, senha_usuario, email_usuario, tipo_usuario) 
values ('vitor_santos', '921654321', 'vit_rocha@gmail.com','Administrador'),
	   ('mary_santos', '12345612901', 'mary_santos@gmail.com', 'Cliente'),
       ('camila_silva', '123456129', 'camila@gmail.com.br', 'Cliente'),
       ('mi_calazans', '12345', 'michele@gmail.com', 'Cliente');
-- Tabela Usuário

-- Tabela Estacionamento 
insert into tbEstacionamento (nome_estacionamento, logradouro_estacionamento, bairro_estacionamento, numero_estacionamento, 
cep_estacionamento, cidade_estacionamento,estado_estacionamento, cod_usuario)
values ('Estacionamento Val Passos', 'Rua Guaianazes' , 'Centro', '212', '02413-440', 'São Paulo', 'São Paulo',  2),
	   ('Du Valle Estacionamento', ' Rua Dona Eloá do Valle Quadros' , 'Conj. Hab. Santa Etelvina II', '50', '02425-130', 'São Paulo', 'São Paulo', 4);
-- Tabela Estacionamento 

-- Tabela Vaga
insert into tbVaga (descricao_vaga, tipo_vaga, cod_estacionamento)
values ('A1', 'Deficiente', 1), ('A2', 'Comum', 1), ('A3', 'Comum', 1), ('A4', 'Comum', 1),
	   ('A5', 'Comum', 1), ('A6', 'Comum', 1), ('A6', 'Comum', 1), ('A1', 'Idoso', 1),
       ('A1', 'Deficiente', 2), ('A2', 'Comum', 2), ('A3', 'Comum', 2), ('A4', 'Comum', 2),
	   ('A5', 'Comum', 2), ('A6', 'Comum', 2), ('A6', 'Comum', 2), ('A1', 'Idoso', 2),
       ('B1', 'Deficiente', 2), ('B2', 'Comum', 2), ('B3', 'Comum', 2), ('B4', 'Comum', 2),
	   ('B5', 'Comum', 2), ('B6', 'Comum', 2), ('B6', 'Comum', 2), ('B1', 'Idoso', 2);
-- Tabela Vaga

-- Tabela StatusVaga
insert into tbStatusVaga (tipo_status, cod_vaga)
values (1, 1), (2, 2), (1, 3), (1, 4), (1, 5),
       (1, 6), (2, 7), (2, 8), (1, 9), (2, 10),
       (2, 11), (2, 12);
-- Tabela StatusVaga

-- Tabela TelefoneEstacionamento
insert into tbTelefone_estacionamento (num_telefone, cod_estacionamento) 
values ('(11) 94848-2838', 2),
('(11) 91525-3838', 1),
('(11) 93526-0192', 1),
('(11) 95668-8758', 2),
('(11) 91346-5094', 2);
-- Tabela TelefoneEstacionamento

--  *Select de todas as tabelas
select * from tbusuario;
select * from tbestacionamento;
select * from tbVaga;
select * from tbStatusVaga;
select * from tbTelefone_estacionamento;
--  *Select de todas as tabelas


-- Em caso de errros - Utilidades:

-- Linha de código para renomear a tabela
-- rename table StatusVaga to tbStatusVaga;

-- Inserindo mais coluna em uma atbela existente
-- alter table tbestacionamento add cep_estacionamento varchar(9) not null;
-- alter table tbestacionamento add estado_estacionamento varchar(10) not null;

-- Aumentando o tamanho de um varchar
-- alter table tbEstacionamento modify logradouro_estacionamento varchar(35);
-- alter table tbEstacionamento modify bairro_estacionamento varchar(35);

-- Consultando as colunas do tipo Enum
show columns
from tbUsuario
like 'tipo_usuario';

show columns 
from tbVaga
like 'tipo_vaga';
