--!PROJETO: SentryApp - O nosso sistema de Vendas B2B
    -- AUTOR: Gean Clayton da Silva Montalvão!--
    
-- TABELA VENDEDOR ---

CREATE TABLE vendedor (
    id_vendedor INTEGER   PRIMARY KEY AUTOINCREMENT,
    nome        TEXT      NOT NULL,
    telefone    TEXT (15) NOT NULL,
    email       TEXT      NOT NULL
);
-- -TABELA CLIENTE--

CREATE TABLE cliente (
    id_cliente      INTEGER PRIMARY KEY AUTOINCREMENT,
    cnpj            TEXT    NOT NULL,
    nome_fantasia   TEXT    NOT NULL,
    endereco_rua    TEXT    NOT NULL,
    endereco_numero TEXT    NOT NULL,
    endereco_bairro TEXT    NOT NULL,
    endereco_cidade TEXT    NOT NULL,
    endereco_estado TEXT    NOT NULL,
    endereco_cep    TEXT    NOT NULL,
    whatsapp        TEXT    NOT NULL,
    email           TEXT    NOT NULL,
    id_vendedor     INTEGER,
    FOREIGN KEY (
        id_vendedor
    )
    REFERENCES vendedor (id_vendedor) 
);-- -TABELA PRODUTO---

CREATE TABLE produto (
    id_produto     INTEGER         PRIMARY KEY AUTOINCREMENT,
    nome_produto   TEXT            NOT NULL,
    preco_unitario DECIMAL (10, 2) NOT NULL,
    unidade_medida TEXT            NOT NULL
);-- -TABELA PEDIDO---

CREATE TABLE pedido (
    id_pedido          INTEGER         PRIMARY KEY AUTOINCREMENT,
    data_pedido        TEXT            NOT NULL,
    status_pedido      TEXT            NOT NULL,
    condicao_pagamento TEXT            NOT NULL,
    valor_total        DECIMAL (10, 2) NOT NULL,
    id_cliente         INTEGER,
    id_vendedor        INTEGER,
    FOREIGN KEY (
        id_cliente
    )
    REFERENCES cliente (id_cliente),
    FOREIGN KEY (
        id_vendedor
    )
    REFERENCES vendedor (id_vendedor) 
);-- -TABELA ITEM PEDIDO---

CREATE TABLE item_pedido (
    id_item_pedido      INTEGER         PRIMARY KEY AUTOINCREMENT,
    quantidade          INTEGER         NOT NULL,
    preco_venda_momento DECIMAL (10, 2),
    id_pedido           INTEGER,
    id_produto          INTEGER,
    FOREIGN KEY (
        id_pedido
    )
    REFERENCES pedido (id_pedido),
    FOREIGN KEY (
        id_produto
    )
    REFERENCES produto (id_produto) 
);-- -MOTIVO DEVOLIÇÃO---

CREATE TABLE motivo_devolucao (
    id_motivo_devolucao INTEGER PRIMARY KEY AUTOINCREMENT,-- No modelo lógico, este campo foi chamado de Motivo_Devolucao.
    /* Aqui, ele foi padronizado para 'descricao' para clareza e atomicidade. */descricao           TEXT    NOT NULL
);-- -TABELA TROCA DEVOLUÇÃO---

CREATE TABLE troca_devolucao (
    id_troca_devolucao   INTEGER PRIMARY KEY AUTOINCREMENT,
    data_solicitacao     DATE    NOT NULL,-- FORMATO ISO: YYYY-MM-DD
    status_processamento TEXT    NOT NULL,
    id_motivo_devolucao  INTEGER,
    id_pedido            INTEGER,
    id_produto           INTEGER,
    id_vendedor          INTEGER,
    FOREIGN KEY (
        id_motivo_devolucao
    )
    REFERENCES motivo_devolucao (id_motivo_devolucao),
    FOREIGN KEY (
        id_pedido
    )
    REFERENCES pedido (id_pedido),
    FOREIGN KEY (
        id_produto
    )
    REFERENCES produto (id_produto),
    FOREIGN KEY (
        id_vendedor
    )
    REFERENCES vendedor (id_vendedor) 
);-- -TABELA VISITA--

CREATE TABLE visita (
    id_visita          INTEGER         PRIMARY KEY AUTOINCREMENT,
    data_hora_checkin  DATETIME        NOT NULL,-- Formato ISO: YYYY-MM-DD HH:MM:SS
    data_hora_checkout DATETIME        NOT NULL,-- Formato ISO: YYYY-MM-DD HH:MM:SS
    latitude           DECIMAL (10, 8) NOT NULL,
    longitude          DECIMAL (10, 8) NOT NULL,
    id_vendedor        INTEGER,
    id_cliente         INTEGER,
    FOREIGN KEY (
        id_vendedor
    )
    REFERENCES vendedor (id_vendedor),
    FOREIGN KEY (
        id_cliente
    )
    REFERENCES cliente (id_cliente) 
);-- -TABELA ALERTA---

CREATE TABLE alerta (
    id_alerta     INTEGER PRIMARY KEY AUTOINCREMENT,
    data_disparo  DATE    NOT NULL,-- Formato ISO: YYYY-MM-DD
    tipo_alerta   TEXT    NOT NULL,
    status_alerta TEXT    NOT NULL,
    id_vendedor   INTEGER,
    id_cliente    INTEGER,
    FOREIGN KEY (
        id_vendedor
    )
    REFERENCES vendedor (id_vendedor),
    FOREIGN KEY (
        id_cliente
    )
    REFERENCES cliente (id_cliente) 
);
