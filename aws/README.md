# Implementação AWS — pendente
1. Criar conta, proteger usuário raiz com MFA, configurar acesso de menor privilégio e alertas de orçamento (alertas não são limite rígido).
2. Definir região e bucket privado com bloqueio de acesso público e criptografia.
3. Enviar CSV para data/raw/; manter resultados do Athena em prefixo separado.
4. Configurar Athena engine 3, catálogo AwsDataCatalog e localização dos resultados.
5. Executar sql/01_create_database.sql e sql/02_create_table.sql após substituir <NOME_DO_BUCKET>.
6. Executar cada instrução de sql/05_validation_queries.sql separadamente; depois consultas 03 e 04.
7. Comparar resultados com Colab, registrar evidências sem dados individuais ou segredos.
8. Revisar custos e remover recursos desnecessários após entrega.

Banco: bank_churn_db. Tabela: customers. Nenhum recurso AWS foi criado até esta etapa.
