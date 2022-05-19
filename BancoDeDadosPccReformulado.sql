create database itiplace;

use itiplace;

create table if not exists consumidor(
consumidor_Id int primary key,
consumidor_Login varchar(255),
consumidor_Senha varchar(255),
consumidor_Nome varchar(255),
consumidor_CPF varchar(255),
consumidor_Email varchar(255),
consumidor_Telefone varchar(255),
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
fornecedor_Telefone varchar(255),
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

create table if not exists produto(
codigo_de_Barra varchar(255) primary key,
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
carrinho_Id int,
fornecedor_Id int,
produto_Codigo_de_Barra varchar(255),
quantidade int,

foreign key(produto_Codigo_de_Barra) references produto(codigo_de_Barra),
foreign key(carrinho_Id) references carrinho(carrinho_Id),
foreign key(fornecedor_Id) references fornecedor(fornecedor_Id)
);

insert into consumidor values (
1,
'Chiocheti',
'Lopes',
'Gabriel Chiocheti Lopes',
'45077217840',
'gabrielchiocheti@gmail.com',
19993216566,
'2000-06-17');

insert into carrinho values(
1,
1,
0
);

insert into fornecedor values(
1000,
'Marcelo',
'Corsini',
'CorsiniCompani',
'281381546000186',
'corsini@gmail.com',
'123456789',
'08:00:00',
'20:00:00'
);

insert into produto values (
'78989645024',
1000,
'Gelo 5kg',
'Gelo de 5Kilos',
9.99,
11.99,
20,
30,
'Sub-Zero',
true
);

insert into produto_carrinho values(
1,
1,
1000,
'78989645024',
1
);
