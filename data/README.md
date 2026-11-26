# Dataset
Arquivo original: Bank Customer Churn Prediction.csv. Utilize o arquivo fornecido para o desafio; a origem pública e licença não foram verificadas. Não inclua o CSV no GitHub. Esperados: 10.000 registros, 12 colunas, IDs únicos, zero nulos.

| Variável | Tipo Athena | Descrição |
|---|---|---|
| customer_id | BIGINT | Identificador |
| credit_score | INT | Score de crédito |
| country | STRING | País |
| gender | STRING | Gênero |
| age | INT | Idade |
| tenure | INT | Tempo de relacionamento |
| balance | DOUBLE | Saldo |
| products_number | INT | Número de produtos |
| credit_card | INT | Indicador de cartão (0/1) |
| active_member | INT | Indicador de atividade (0/1) |
| estimated_salary | DOUBLE | Salário estimado |
| churn | INT | Saída (1), retenção (0) |

Moeda e período de observação não informados. Não inferir unidade temporal do relacionamento sem documentação da fonte.
