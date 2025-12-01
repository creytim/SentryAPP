# 💻 Projeto: SentryApp - Implementação de Banco de Dados Relacional (3FN)

**Autor:** [Seu Nome Completo]

Este repositório contém o projeto SQL completo desenvolvido para a Experiência Prática IV. O modelo lógico foi desenvolvido e normalizado até a **Terceira Forma Normal (3FN)** para a gestão de vendas B2B (Sorveteria/Açaí), focando em inteligência de retenção de clientes e produtividade de vendedores.

---

### 1. Documentação e Normalização (Modelo Lógico 3FN)

O modelo final implementa 9 entidades e resolveu desafios de normalização, como a decomposição do Endereço (1FN) e a criação da tabela MOTIVO\_DEVOLUCAO (3FN) para eliminar redundâncias e garantir a integridade dos dados.

**Diagrama do Modelo Lógico Final (3FN):**
<img src="https://github.com/creytim/SentryAPP/blob/d35fa873a86b65d1554e2f8e8e14e82f6db0aa7f/SentryAPP%20-%203FN%20(4).jpg" width="90%">

### 2. Contexto do Projeto (Atividades I, II e III)

Os documentos a seguir contêm o histórico de concepção do projeto, desde a definição do minimundo até a normalização final:

* **Atividade I:** Diagrama Conceitual (MER)
    * [[Link para o Diagrama MER ou PDF da Atividade 1](https://github.com/creytim/SentryAPP/blob/d35fa873a86b65d1554e2f8e8e14e82f6db0aa7f/Modelagem%20de%20Banco%20de%20Dados%20-%20Experiencia%20Pratica%201%20-%20Documento%20Modelo.pdf)]
* **Atividade II/III:** Normalização e Esquema Lógico (3FN)
    * [[Link para o PDF da Normalização](https://github.com/creytim/SentryAPP/blob/d35fa873a86b65d1554e2f8e8e14e82f6db0aa7f/Modelagem%20de%20Banco%20de%20Dados%20-%20Experiencia%20Pratica%203%20-%20Documento%20Modelo.pdf)]

### 3. Estrutura do Banco de Dados

O modelo lógico final consiste em **9 tabelas**, organizadas nos módulos de Núcleo, Transacional, Controle e Qualidade:

| Módulo | Tabela | Chave Primária (PK) | Função Principal |
| :--- | :--- | :--- | :--- |
| **Núcleo** | **VENDEDOR, CLIENTE, PRODUTO** | ID\_VENDEDOR | Dados de cadastro e catálogo. |
| **Transacional** | **PEDIDO, ITEM\_PEDIDO** | ID\_PEDIDO | Registra a venda e detalha os itens. |
| **Controle** | **VISITA, ALERTA** | ID\_VISITA, ID\_ALERTA | Rastreia inatividade e monitora produtividade. |
| **Qualidade** | **MOTIVO\_DEVOLUCAO, TROCA\_DEVOLUCAO** | ID\_MOTIVO\_DEVOLUCAO | Armazena motivos padronizados e registra eventos de qualidade. |

---

### 4. Conteúdo do Repositório (Scripts)

| Arquivo | Linguagem | Conteúdo |
| :--- | :--- | :--- |
| **`schema.sql`** | DDL | Cria a estrutura do banco (`CREATE TABLE`) e define todas as chaves (PK e FK). |
| **`insert.sql`** | DML | Popula todas as 9 tabelas com dados de exemplo. |
| **`consultas.sql`** | DQL | Contém **4 consultas `SELECT` complexas** para inteligência de negócio. |
| **`manipulacao.sql`** | DML | Contém os comandos **3 `UPDATE`** e **3 `DELETE`** para manutenção de dados. |

---

### 5. Prova de Execução e Resultados Finais

Esta seção comprova que os comandos SQL rodaram com sucesso.

#### 5.1. Log de Execução DDL/DML (Criação e Inserção)

Comprova que a estrutura e os dados foram criados (série de mensagens "Query finished successfully" e "Rows affected").

![Log de Execução DDL e DML](https://raw.githubusercontent.com/creytim/SentryAPP/refs/heads/main/4.1%20e%204.3.png)

#### 5.2. Resultados das Consultas (Result Grid)

Comprova que as consultas de análise de dados funcionam. (Exemplo: Resultado da Consulta de Detalhe da Transação).

![Resultado da Consulta de Qualidade - Group By](https://raw.githubusercontent.com/creytim/SentryAPP/refs/heads/main/4.2.png)

#### 5.3. Execução da Manipulação (Updates e Deletes)

Comprova que os comandos `UPDATE` foram processados e, crucialmente, que o comando `DELETE FROM cliente` gerou o **erro de integridade referencial**.

![Log de Execução dos comandos UPDATE e DELETE](https://raw.githubusercontent.com/creytim/SentryAPP/refs/heads/main/4.1%20e%204.3.png)
