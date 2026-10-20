-- ATIVIDADE 1
-- 1 Junte os pedidos com seus respectivos produtos
SELECT p.*, pr.* FROM pedido p join produto pr ON p.id_produto = pr.id;

-- 2 Junte os clientes com seus respectivos pedidos
SELECT cliente.*, pedido.* FROM cliente join pedido ON cliente.id = pedido.id_cliente;

-- 3 Mostre somente os pedidos junto com o cliente número 1
SELECT cliente.*, pedido.* FROM cliente join pedido ON cliente.id = pedido.id_cliente WHERE cliente.id = 1;

-- 4 Mostre somente os ultimos 2 pedidos e seus respectivos produtos
SELECT p.*, pr.* FROM pedido p JOIN produto pr ON p.id_produto = pr.id ORDER BY p.id DESC LIMIT 2;

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