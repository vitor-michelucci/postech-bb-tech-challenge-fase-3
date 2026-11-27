# Resultados e interpretação

Base: 10.000 clientes, 2.037 churn, 7.963 retidos (20,37%).

| Questão | Resultado principal |
|---|---|
| 1 | 10.000 clientes distintos |
| 2 | Churn geral de 20,37% |
| 3 | Alemanha 32,44%; Espanha 16,67%; França 16,15% |
| 4 | Feminino 25,07%; masculino 16,46%; qui-quadrado p≈1,72e-26, V de Cramer≈0,107 |
| 5 | 50–59 anos: maior taxa (56,04%); 40–49: maior volume (806) |
| 6 | Saldo médio churn 91.108,54 versus 72.745,30 dos retidos; associação não monotônica |
| 7 | Um produto 27,71%; dois 7,58%; três 82,71%; quatro 100% (60 clientes) |
| 8 | Inativos 26,85%; ativos 14,27% |
| 9 | Faixas de score: associação não significativa a 5% (p≈0,130); correlação contínua muito pequena |
| 10 | Salário médio churn 101.465,68 versus 99.738,39; teste Welch p≈0,229 |

## Implicações
Investigar motivos de saída na Alemanha, nos grupos de 40–59 anos e entre clientes inativos com um produto. Avaliar a composição dos pequenos grupos com três e quatro produtos antes de generalizar. Não usar gênero como regra discriminatória. Associações não demonstram causalidade.

## Auditoria
A execução reportada do notebook de auditoria apresentou 16/16 consultas equivalentes e nenhuma divergência. Os [CSV publicados](tables/) e [registros de auditoria](audit/) são reconstruções dos resultados reportados; não constituem cópias byte a byte das exportações originais. Utilize os arquivos originais para repetir a auditoria automatizada.

## Limitações
Sem período de observação ou moeda especificados. Testes exploratórios sem ajuste de multiplicidade; grupos pequenos exigem cautela.
