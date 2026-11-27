# Implementação AWS

## Ambiente implementado
- Região: us-east-2 (Ohio).
- Amazon S3: bucket privado, bloqueio de acesso público, criptografia SSE-S3.
- Prefixos: data/ (CSV) e athena-results/ (resultados).
- Athena: workgroup primary, catálogo AwsDataCatalog.
- Banco: bank_churn_db; tabela externa: customers.
- Orçamento configurado: US$ 1 (alerta, não limite rígido).

## Reprodução
1. Configure conta, MFA, permissões mínimas e orçamento.
2. Crie bucket privado e os dois prefixos.
3. Envie o CSV original para data/.
4. Configure a localização de resultados do Athena em athena-results/.
5. Execute os scripts 01 e 02 em [sql/](../sql/), adaptando o nome do bucket e a localização ao ambiente.
6. Execute as instruções de validação do script 05 e as consultas dos scripts 03 e 04 separadamente.
7. Exporte os 16 resultados e execute o notebook de reconciliação.

## Validação reportada
10.000 registros e clientes distintos, 2.037 churn, 7.963 retidos, 20,37% de churn. Sem nulos, IDs duplicados ou valores binários inválidos. As 16 consultas apresentaram equivalência com DuckDB na execução reportada.

## Encerramento
Revise custos e remova recursos desnecessários após a entrega. Não publique credenciais ou dados individuais. Consulte o [índice de evidências](../docs/README.md).
