# Aula 8 de Banco de Dados

## Descrição
Atribuir queries específicas no banco de dados ddldml:

```sql
-- Script de criação (DDL) e população (DML) com mais dados
drop database if exists gestao_pedidos;
create database gestao_pedidos;
use gestao_pedidos;
create table produto(
    id int not null primary key auto_increment,
    nome varchar(100) not null
);
create table telefone(
    id int not null primary key auto_increment,
    id_cliente int not null,
    numero varchar(100) not null unique,
    tipo enum('Residencial', 'Comercial', 'Celular') not null
);
create table cliente(
    id int not null primary key auto_increment,
    nome varchar(100) not null,
    cep varchar(11) not null,
    numero varchar(10),
    complemento varchar(100)
);
create table pedido(
    id int not null primary key auto_increment,
    id_cliente int not null,
    id_produto int not null,
    quantidade int not null,
    valor_unitario decimal(10,2) not null,
    subtotal decimal(10,2) default (valor_unitario * quantidade)
);

alter table telefone add constraint fk_telefones foreign key (id_cliente) references cliente(id);
alter table pedido add constraint fk_faz foreign key (id_cliente) references cliente(id);
alter table pedido add constraint fk_possui foreign key (id_produto) references produto(id);

use gestao_pedidos;
insert into cliente(nome, complemento, numero, cep) values
("Ana Maria Silva",null,"21","13905-522"),
("Valentina Oliveira","Ap:19 Bloco:2","12","13903-333"),
("Enzo Martins","Ap: 19"," 195B","13903-235");
insert into cliente(nome, cep, numero, complemento) values
("Timoteo Matos","13905-714","27","Ap44 bl01"),
("Xeila Teixeira de Souza","13907-100",null,"Fundos"),
("Raul Bispo Filho","13907-100","100",null),
("Hugo Souza","13904-906","9090","Fundos"),
("Brito Bispo Martim","13904-906","1313",null),
("Hugo Silva Alves","13904-452","1010",null),
("Valter Martins","13904-071","1245",null),
("Antonio Martins","13905-520","2345",null),
("Zelia Oliveira","13901-329","13",null),
("Evandro Martins de Oliveira","13905-682","17","BL12 AP44");

insert into telefone(id_cliente,numero,tipo) values
(1,"19 99987-8789","Celular"),
(1,"19 99980-4848","Celular"),
(2,"19 98450-1212","Residencial"),
(3,"19 99988-2121","Celular"),
(3,"19 99777-2222","Residencial"),
(3,"19 99900-1010","Comercial");
insert into telefone(id_cliente,tipo,numero) values
(4, "celular", "19-90952-7709"),
(4, "residencial", "19-86960-6613"),
(5, "celular", "19-59052-5910"),
(5, "residencial", "19-70278-3889"),
(6, "celular", "19-95184-7473"),
(7, "celular", "19-18092-0669"),
(8, "celular", "19-19025-8194"),
(9, "celular", "19-54195-3946"),
(9, "residencial", "19-09467-9337"),
(10, "celular", "19-85553-5217"),
(11, "celular", "19-76827-0808"),
(12, "celular", "19-03094-9372"),
(12, "residencial", "19-87797-0571"),
(12, "comercial", "19-06019-6601"),
(13, "celular", "19-53922-8414");

insert into produto(nome) values
("Impressora laser"),
("Impressora deskjet"),
("Impressora matricial"),
("Impressora mobile"),
("Impressora termica"),
("Impressora fotografica"),
("Impressora multifuncional"),
("Impressora sublimatica"),
("Impressora de etiquetas"),
("Impressora 3D"),
("Impressora tanque de tinta"),
("Impressora jato de tinta"),
("Impressora LED"),
("Impressora portatil");

insert into pedido(id_cliente,id_produto,quantidade,valor_unitario) values
(1, 1, 1, 899.90),
(1, 7, 2, 749.90),
(1, 12, 1, 649.90),
(2, 2, 1, 599.90),
(2, 6, 1, 3499.90),
(3, 3, 2, 799.90),
(3, 9, 1, 1299.90),
(3, 11, 1, 1199.90),
(4, 4, 1, 999.90),
(4, 5, 3, 449.90),
(5, 8, 1, 899.90),
(5, 10, 2, 1299.90),
(6, 13, 1, 1599.90),
(6, 14, 2, 499.90),
(7, 1, 1, 899.90),
(7, 6, 1, 3499.90),
(8, 7, 2, 749.90),
(8, 12, 1, 649.90),
(9, 2, 1, 599.90),
(9, 9, 1, 1299.90),
(9, 5, 2, 449.90),
(10, 3, 1, 799.90),
(10, 11, 1, 1199.90),
(11, 4, 2, 999.90),
(11, 10, 1, 1299.90),
(12, 8, 1, 899.90),
(12, 13, 1, 1599.90),
(12, 14, 1, 499.90),
(13, 1, 1, 899.90),
(13, 6, 1, 3499.90),
(13, 12, 2, 649.90);

select * from cliente;
select * from telefone;
select * from produto;
select * from pedido;
```

## Atividade 1
```sql
-- ATIVIDADE 1
-- 1 Junte os pedidos com seus respectivos produtos
SELECT p.*, pr.* FROM pedido p join produto pr ON p.id_produto = pr.id;

-- 2 Junte os clientes com seus respectivos pedidos
SELECT cliente.*, pedido.* FROM cliente join pedido ON cliente.id = pedido.id_cliente;

-- 3 Mostre somente os pedidos junto com o cliente número 1
SELECT cliente.*, pedido.* FROM cliente join pedido ON cliente.id = pedido.id_cliente WHERE cliente.id = 1;

-- 4 Mostre somente os ultimos 2 pedidos e seus respectivos produtos
SELECT p.*, pr.* FROM pedido p JOIN produto pr ON p.id_produto = pr.id ORDER BY p.id DESC LIMIT 2;
```

## Atividade 2
```sql
-- ATIVIDADE 2
-- 1 Listando produtos
SELECT id, nome FROM produto ORDER BY nome;

-- 2 Produtos mais recentes
SELECT * FROM produto ORDER BY id desc LIMIT 5;

-- 3 Maiores pedidos
SELECT id, unidade, valor_unitario FROM pedido ORDER BY valor_unitario desc;

-- 4 Primeiros pedidos
SELECT * FROM pedido ORDER BY id desc LIMIT 10;

-- 5 Pedidos com nomes dos clientes
SELECT p.id, c.nome, p.quantidade, p.valor_unitario from pedido p join cliente c ON p.id_cliente = c.id;

-- 6 Pedidos com nome do produto
SELECT p.id, pr.nome, p.quantidade, p.valor_unitario, p.subtotal from pedido p join produto pr ON p.id_produto = pr.id;

-- 7 Pedidos completos
SELECT p.id, c.nome, pr.nome, p.quantidade, p.valor_unitario from pedido p JOIN cliente c, produto pr ON p.id_cliente = c.id;

-- 8 Os 5 pedidos de maior valor
SELECT c.nome, pr.nome, p.subtotal FROM pedido p JOIN cliente c, produto pr ON p.id_cliente = c.id ORDER BY p.subtotal desc LIMIT 5;

-- 9 Quantidade de clientes
SELECT COUNT(id) FROM cliente;

-- 10 Quantidade de produtos
SELECT COUNT(id) FROM produto;

-- 11 Quantidade de pedidos por cliente
SELECT c.nome, COUNT(p.id) FROM cliente c JOIN pedido p ON c.id = p.cliente_id;

-- 12 Quantidade de pedidos por produto
SELECT pr.nome COUNT(p.id_produto) FROM produto pr JOIN pedido p ON pr.id = p.id_produto ORDER BY pr.nome;

-- 13 Valor total dos pedidos
SELECT SUM(subtotal) FROM pedido;

-- 14 Quantidade média por pedido
SELECT AVG(quantidade) FROM pedido;

-- 15 Total vendido por produto
SELECT pr.nome, SUM(p.subtotal) FROM produto pr JOIN pedido p ON pr.id = p.id_produto ORDER BY p.subtotal;
```