--!PROJETO: SentryApp - O nosso sistema de Vendas B2B
    -- AUTOR: Gean Clayton da Silva Montalvão!--
    
-- UPDATE ---

UPDATE produto
   SET unidade_medida = 'caixa'
 WHERE id_produto = 1;-- Aumenta o preço de todos os sorvetes de 1 Litro em 5%.

UPDATE produto
   SET preco_unitario = preco_unitario * 1.05
 WHERE unidade_medida = 'Litro';-- Atualizar status: Muda o status do pedido 1002 (que estava 'Pendente') para 'Faturado'.

UPDATE pedido
   SET status_pedido = 'Faturado'
 WHERE id_pedido = 1002;

SELECT *
  FROM produto;

SELECT *
  FROM pedido;-- DELETE--
-- Remover Alerta Obsoleto: Remove o registro do alerta (ID 1), pois ele já foi escalonado e resolvido.
DELETE FROM alerta
      WHERE id_alerta = 1 AND
            status_alerta = 'Escalonado';

SELECT *
  FROM alerta;-- Limpar Eventos Antigos: Remove o registro de visita (ID 1) após a data de 2025-11-28.

DELETE FROM visita
      WHERE id_visita = 1 AND
            data_hora_checkin < '2025-11-29 00:00:00';

SELECT *
  FROM visita;-- Remover Cliente sem Pedido: Remove o Cliente ID 2 (Distribuidora Ponto Certo), assumindo que ele não gerou pedidos.
-- (ESSE COMANDO VAI FALHAR POR CAUSA DA FK, E ISSO É BOM)
DELETE FROM cliente
      WHERE id_cliente = 2;

SELECT *
  FROM cliente;
