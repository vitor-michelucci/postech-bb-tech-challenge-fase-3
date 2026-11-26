-- POSTECH - BB - Tech Challenge - Fase 3
-- Athena engine 3. Execute uma instrução por vez no console.
-- Substitua <NOME_DO_BUCKET> antes de executar. Prefixo exclusivo para o CSV.
CREATE EXTERNAL TABLE IF NOT EXISTS bank_churn_db.customers (
    customer_id BIGINT,
    credit_score INT,
    country STRING,
    gender STRING,
    age INT,
    tenure INT,
    balance DOUBLE,
    products_number INT,
    credit_card INT,
    active_member INT,
    estimated_salary DOUBLE,
    churn INT
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
STORED AS TEXTFILE
LOCATION 's3://<NOME_DO_BUCKET>/data/raw/'
TBLPROPERTIES ('skip.header.line.count' = '1');
