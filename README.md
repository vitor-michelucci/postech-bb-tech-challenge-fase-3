# POSTECH – BB | Tech Challenge – Fase 3

## Objetivo
Analisar churn bancário com SQL e Python e reproduzir as análises na AWS (Amazon S3 e Athena). Projeto acadêmico, sem dados de clientes do Banco do Brasil.

## Arquitetura
CSV → Pandas → DuckDB → SQL e Python (Colab) → validação local.
CSV → S3 → Athena / AWS Glue Data Catalog → SQL → reconciliação (pendente).

## Execução local
Abra [o notebook no Colab](https://colab.research.google.com/github/vitor-michelucci/postech-bb-tech-challenge-fase-3/blob/main/notebooks/01_analise_churn_colab.ipynb), execute todas as células em ordem e selecione o CSV original quando solicitado. A auditoria deve terminar sem erros. O notebook registra versões das bibliotecas ao final. O CSV não é distribuído neste repositório.

## Resultados de referência
10.000 clientes, 2.037 churn, 7.963 retidos, taxa de 20,37%. Consulte [resultados](results/README.md) e o notebook para as dez perguntas, gráficos e testes estatísticos.

## SQL e AWS
Os cinco scripts em [sql/](sql/) criam banco e tabela externa, respondem às perguntas e verificam a integridade. Consulte [aws/README.md](aws/README.md). Publicação dos scripts concluída; execução na AWS e reconciliação ainda pendentes.

## Estrutura
- notebooks/: análise completa e auditoria.
- sql/: DDL, consultas analíticas, complementares e validação.
- data/: dicionário e instruções do dataset.
- results/: síntese e futuras tabelas e gráficos agregados.
- aws/: roteiro e registro da implementação.
- docs/: evidências, apresentação e vídeo (pendentes).

## Limitações
Análise exploratória bivariada, sem inferência causal. Período e moeda não informados; segmentos pequenos e testes sem ajuste por multiplicidade. Recomendações são hipóteses a investigar, não regras automáticas de decisão.

## Segurança
Não publicar dados individuais, credenciais, chaves ou informações internas. O repositório é público.
