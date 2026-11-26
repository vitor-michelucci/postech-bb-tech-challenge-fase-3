-- POSTECH - BB - Tech Challenge - Fase 3
-- Athena engine 3. Execute uma instrução por vez no console.
-- Testes inferenciais permanecem no notebook Python.

-- query_04_contingencia
SELECT
    gender AS genero,
    SUM(CASE WHEN churn = 0 THEN 1 ELSE 0 END) AS retidos,
    SUM(CASE WHEN churn = 1 THEN 1 ELSE 0 END) AS churn
FROM bank_churn_db.customers
GROUP BY gender
ORDER BY gender;

-- query_05_complementar
WITH clientes_faixa AS (
    SELECT
        churn,
        CASE
            WHEN age < 30 THEN 'Até 29 anos'
            WHEN age < 40 THEN '30 a 39 anos'
            WHEN age < 50 THEN '40 a 49 anos'
            WHEN age < 60 THEN '50 a 59 anos'
            ELSE '60 anos ou mais'
        END AS faixa_etaria
    FROM bank_churn_db.customers
)

SELECT
    faixa_etaria,
    COUNT(*) AS total_clientes,
    SUM(churn) AS clientes_churn,
    ROUND(100.0 * AVG(churn), 2) AS taxa_churn_pct,
    ROUND(
        100.0 * SUM(churn) /
        (SELECT SUM(churn) FROM bank_churn_db.customers),
        2
    ) AS participacao_churn_pct
FROM clientes_faixa
GROUP BY faixa_etaria
ORDER BY clientes_churn DESC;

-- query_06c
WITH clientes_saldo AS (
    SELECT
        churn,
        CASE
            WHEN balance = 0 THEN 'Saldo zero'
            ELSE 'Saldo positivo'
        END AS situacao_saldo
    FROM bank_churn_db.customers
)

SELECT
    situacao_saldo,
    COUNT(*) AS total_clientes,
    SUM(churn) AS clientes_churn,
    ROUND(100.0 * AVG(churn), 2) AS taxa_churn_pct
FROM clientes_saldo
GROUP BY situacao_saldo
ORDER BY taxa_churn_pct;

-- query_08_complementar
SELECT
    products_number AS quantidade_produtos,
    CASE
        WHEN active_member = 1 THEN 'Ativo'
        ELSE 'Inativo'
    END AS situacao_atividade,
    COUNT(*) AS total_clientes,
    SUM(churn) AS clientes_churn,
    ROUND(100.0 * AVG(churn), 2) AS taxa_churn_pct
FROM bank_churn_db.customers
GROUP BY products_number, active_member
ORDER BY products_number, active_member;

-- query_09a
WITH ranked AS (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY churn ORDER BY credit_score, customer_id) AS rn,
        COUNT(*) OVER (PARTITION BY churn) AS n
    FROM bank_churn_db.customers
    WHERE credit_score IS NOT NULL
)
SELECT
    CASE
        WHEN churn = 0 THEN 'Retidos'
        ELSE 'Churn'
    END AS situacao,
    COUNT(*) AS total_clientes,
    ROUND(AVG(credit_score), 2) AS score_medio,
    ROUND(AVG(CASE WHEN rn IN ((n + 1) / 2, (n + 2) / 2) THEN CAST(credit_score AS DOUBLE) END), 2) AS score_mediano,
    ROUND(STDDEV_SAMP(credit_score), 2) AS desvio_padrao
FROM ranked
GROUP BY churn
ORDER BY churn;
