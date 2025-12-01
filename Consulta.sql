--!PROJETO: SentryApp - O nosso sistema de Vendas B2B
    -- AUTOR: Gean Clayton da Silva Montalvão!--
    
    -- 1. ALERTA DE INATIVIDADE E RISCO (Usa ALERTA, CLIENTE, VENDEDOR)
-- Identifica clientes com risco de churn (saída) e o vendedor responsável.
SELECT
    A.Data_Disparo,
    C.Nome_Fantasia AS Cliente_Em_Risco,
    V.Nome AS Vendedor_Responsavel,
    A.Tipo_Alerta
FROM
    alerta A
JOIN
    cliente C ON A.id_cliente = C.id_cliente
JOIN
    vendedor V ON A.id_vendedor = V.id_vendedor
WHERE
    A.status_alerta = 'Escalonado';


-- 2. CONTROLE DE QUALIDADE (Usa TROCA_DEVOLUCAO e MOTIVO_DEVOLUCAO)
-- Determina os motivos de devolução mais frequentes para o setor de qualidade.
SELECT
    M.descricao AS Motivo,
    COUNT(T.ID_TROCA_DEVOLUCAO) AS Total_Ocorrencias
FROM
    troca_devolucao T
JOIN
    motivo_devolucao M ON T.id_motivo_devolucao = M.id_motivo_devolucao
GROUP BY
    M.descricao
ORDER BY
    Total_Ocorrencias DESC;


-- 3. PRODUTIVIDADE E RASTREAMENTO (Usa VISITA e VENDEDOR)
-- Calcula a produtividade dos vendedores com base no número de visitas registradas.
SELECT
    V.Nome AS Vendedor,
    COUNT(VI.ID_VISITA) AS Total_Visitas
FROM
    vendedor V
JOIN
    visita VI ON V.id_vendedor = VI.id_vendedor
GROUP BY
    V.Nome
ORDER BY
    Total_Visitas DESC;