# POSTECH – BB | Tech Challenge – Fase 3

## Objetivo
Analisar churn bancário com SQL e Python e reproduzir as análises na AWS. Projeto acadêmico, sem dados internos do Banco do Brasil.

## Arquitetura
- CSV → Pandas → DuckDB → SQL/Python no Colab.
- CSV → Amazon S3 → AWS Glue Data Catalog → Amazon Athena → resultados agregados.
- Resultados Athena × DuckDB → reconciliação das 16 consultas.

## Indicadores
| Indicador | Valor |
|---|---:|
| Clientes | 10.000 |
| Churn | 2.037 |
| Retidos | 7.963 |
| Taxa de churn | 20,37% |
| Consultas reconciliadas (execução reportada) | 16/16 |

## Reprodução
1. Abra o [notebook de análise](https://colab.research.google.com/github/vitor-michelucci/postech-bb-tech-challenge-fase-3/blob/main/notebooks/01_analise_churn_colab.ipynb) e carregue o CSV original.
2. Siga o [roteiro AWS](aws/README.md) e execute os [scripts SQL](sql/).
3. Exporte os resultados originais do Athena e execute o [notebook de auditoria](https://colab.research.google.com/github/vitor-michelucci/postech-bb-tech-challenge-fase-3/blob/main/notebooks/02_auditoria_athena_duckdb.ipynb) com o CSV e o ZIP de resultados.
4. Confira os relatórios gerados. A execução reportada apresentou 100% de equivalência.

## Entregáveis acadêmicos
- [Apresentação executiva (PDF)](docs/apresentacao/Tech_Challenge_Fase3_Executiva.pdf)
- [Apresentação editável (PPTX)](docs/apresentacao/Tech_Challenge_Fase3_Executiva.pptx)
- Vídeo demonstrativo: pendente para conclusão pelo grupo.

## Navegação
- [Resultados e interpretações](results/README.md)
- [Tabelas agregadas](results/tables/)
- [Registros de auditoria](results/audit/)
- [Documentação e evidências](docs/README.md)
- [Implementação AWS](aws/README.md)

## Limitações
Análise exploratória bivariada, sem inferência causal. Período e moeda não informados; segmentos pequenos e testes sem ajuste por multiplicidade. Não usar associações como regras automáticas de decisão.

## Publicação
O repositório é público. Não inclui o CSV individual. Os CSVs publicados na etapa 8L-B foram reconstruídos a partir dos resultados reportados, não transferidos byte a byte dos arquivos originais; para reprodução automatizada, utilize as exportações originais do Athena. As 11 imagens de evidências foram localizadas no repositório.
