--!PROJETO: SentryApp - O nosso sistema de Vendas B2B
    -- AUTOR: Gean Clayton da Silva Montalvão!--
    
-- TABELA VENDEDOR ---

INSERT INTO vendedor (id_vendedor, nome, telefone, email)
VALUES
(1, 'João Santos', '71988881234', 'joao.santos@vendas.com'),
(2, 'Matheus Lobato', '77998125961', 'matheuslobato@vendas.com');

-- TABELA CLIENTE ---

INSERT INTO cliente (id_cliente, cnpj, nome_fantasia, endereco_rua, endereco_numero, endereco_bairro, endereco_cidade, endereco_estado, endereco_cep, whatsapp, email, id_vendedor)
VALUES
(1, '45123456000190', 'Mercado Central', 'Rua A', '100', 'Centro', 'Salvador', 'BA', '40000000', '71998881111', 'central@mercado.com', 1),
(2, '30988765000122', 'Distribuidora Ponto Certo','Rua das Palmeiras', '45', 'Vila Nova', 'Vitória da Conquista', 'BA', '45000050','77988446622', 'vendas@pontocerto.com', 2),
(3, '55781234000109', 'Empório do Vale','Travessa 3', '12', 'São José', 'Ilhéus', 'BA', '45650000','73998112233', 'contato@emporiovale.com', 2),
(4, '66990123000188', 'Comercial Boa Esperança','Rua Principal', '330', 'Centro', 'Barreiras', 'BA', '47802000','77999553322', 'boaesperanca@comercial.com', 1);

-- TABELA PRODUTOS ---

INSERT INTO produto (id_produto, nome_produto, preco_unitario, unidade_medida)
VALUES
(1, 'Sorvete Chocolate Premium', 35.00, 'Litro'),
(2, 'Picole de Morango Grande', 4.50, 'Unidade'),
(3, 'Acai Copo 500ml', 12.00, 'Unidade'),
(4, 'Sorvete Baunilha Simples', 18.90, 'Litro'),
(5, 'Picole de Coco Cremoso', 5.50, 'Unidade'),
(6, 'Mix de Frutas Secas', 22.00, 'Pacote'),
(7, 'Leite Condensado 1Kg', 15.00, 'Pacote'),
(8, 'Barra de Chocolate Topping', 8.00, 'Unidade'),
(9, 'Calda de Morango 250ml', 6.50, 'Frasco'),
(10, 'Mini Picole Kit 10un', 18.00, 'Kit'),
(11, 'Sorvete Flocos 2L', 55.00, 'Balde'),
(12, 'Creme de Cupuacu 1L', 28.00, 'Litro');

-- TABELA PEDIDO --

INSERT INTO pedido (id_pedido, data_pedido, status_pedido, condicao_pagamento, valor_total, id_cliente, id_vendedor) 
VALUES
(1001, '2025-11-20', 'Faturado', 'Boleto 30d', 115.00, 1, 1),
(1002, '2025-11-25', 'Pendente', 'Cartao', 60.00, 3, 2),
(1003, '2025-08-15', 'Concluido', 'PIX', 18.90, 4, 1), 
(1004, '2025-11-29', 'Concluido', 'Cartao', 70.00, 4, 2);

-- TABELA ITEM PEDIDO --

INSERT INTO item_pedido (id_item_pedido, quantidade, preco_venda_momento, id_pedido, id_produto) 
VALUES
(1, 2, 35.00, 1001, 1),  -- 2 Sorvetes Chocolate Premium no Pedido 1001
(2, 10, 4.50, 1001, 2),  -- 10 Picolés de Morango no Pedido 1001
(3, 5, 12.00, 1002, 3),  -- 5 Açaí Copo 500ml no Pedido 1002
(4, 1, 18.90, 1003, 4),  -- 1 Sorvete Baunilha no Pedido 1003
(5, 2, 35.00, 1004, 1);  -- 2 Sorvetes Chocolate Premium no Pedido 1004

-- TABELA MOTIVO_--

INSERT INTO motivo_devolucao (id_motivo_devolucao, descricao)
 VALUES
(1, 'Produto com defeito'),
(2, 'Produto incorreto (erro de separação)'),
(3, 'Desistência / Arrependimento');

-- TABELA TROCA DEVOLUÇÃO --

INSERT INTO troca_devolucao (id_troca_devolucao, data_solicitacao, status_processamento, id_motivo_devolucao, id_pedido, id_produto, id_vendedor) VALUES
(1, '2025-11-21', 'Em Análise', 1, 1001, 1, 1);

-- TABELA VISITA --

INSERT INTO visita (id_visita, data_hora_checkin, data_hora_checkout, latitude, longitude, id_vendedor, id_cliente) VALUES
(1, '2025-11-28 09:00:00', '2025-11-28 09:30:00', -12.9703, -38.5110, 1, 1);

-- TABELA ALERTA --

INSERT INTO alerta (id_alerta, data_disparo, tipo_alerta, status_alerta, id_vendedor, id_cliente) VALUES
(1, '2025-11-30', 'Vermelho', 'Escalonado', 1, 4);


