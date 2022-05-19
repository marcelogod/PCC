create database itiplace;

use itiplace;

create table if not exists consumidor(
consumidor_Id int primary key,
consumidor_Login varchar(255),
consumidor_Senha varchar(255),
consumidor_Nome varchar(255),
consumidor_CPF varchar(255),
consumidor_Email varchar(255),
consumidor_Telefone int,
consumidor_Nascimento date
);

create table if not exists endereco_consumidor(
endereco_Id int primary key,
consumidor_Id int,
CEP int,
cidade varchar(255),
bairro varchar(255),
rua varchar(255),
numero varchar(255),
complemento varchar(255),
pontoDeReferencia varchar(255),

foreign key (consumidor_Id) references consumidor(consumidor_Id)
);

create table if not exists carrinho(
carrinho_Id int primary key,
consumidor_Id int,
carrinho_total float,

foreign key(consumidor_Id) references consumidor(consumidor_Id)
);

create table if not exists fornecedor(
fornecedor_Id int primary key,
fornecedor_Login varchar(255),
fornecedor_Senha varchar(255),
fornecedor_NomeFantasia varchar(255),
fornecedor_Cnpj varchar(255),
fornecedor_Email varchar(255),
fornecedor_Telefone int,
fornecedor_Horario_Abre time,
fornecedor_Horario_Fecha time
);

create table if not exists endereco_fornecedor(
endereco_Id int primary key,
fornecedor_Id int,
CEP int,
cidade varchar(255),
bairro varchar(255),
rua varchar(255),
numero varchar(255),
complemento varchar(255),
pontoDeReferencia varchar(255),

foreign key (fornecedor_Id) references fornecedor(fornecedor_Id)
);

create table if not exists produto_fornecedor(
codigo_de_Barra int primary key,
fornecedor_Id int,
produto_Nome varchar(255),
produto_Descricao varchar(255),
produto_Preco_Custo float,
produto_Preco_Venda float,
produto_Preco_Margem float,
produto_quantidade int,
produto_distribuidora varchar(255),
produto_disponibildade boolean,

foreign key(fornecedor_id) references fornecedor(fornecedor_Id)
);

create table if not exists produto_Carrinho(
produto_Carrinho_Id int primary key,
produto_fornecedor_Codigo_de_Barra int,
carrinho_Id int,

foreign key(produto_fornecedor_Codigo_de_Barra) references produto_fornecedor(codigo_de_Barra),
foreign key(carrinho_Id) references carrinho(carrinho_Id)
);