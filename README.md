
# Estudo de Caso: Análise de Vendas, Produtos e Perfil de Clientes de uma Franquia de Lojas de Automóveis

Este repositório apresenta um **estudo de caso de análise de dados de vendas e perfil de clientes** de uma franquia de lojas de automóveis.  
O objetivo é **identificar oportunidades estratégicas de investimento**, incluindo **estados com maior potencial de crescimento**, **produtos mais rentáveis** e **melhores dias e horários para veiculação de anúncios**, com base em dados históricos de vendas e comportamento dos clientes.

---

## 1. Objetivo

Identificar e lapidar a **persona dos clientes**, compreendendo de forma aprofundada **quais perfis, regiões e produtos apresentam melhor desempenho comercial**.

A análise se concentra nos seguintes pontos:

- **Faixa salarial e status profissional dos clientes**
- **Top 5 marcas mais vendidas no mês**, incluindo **faturamento total** e **ticket médio mensal**
- **Leads gerados e taxa de conversão**

Com base nos **padrões de vendas das lojas** e nos **dados comportamentais dos usuários**, o estudo busca gerar **insights estratégicos** para decisões de marketing, expansão e alocação de investimentos.

---

## 2. Dataset

O dataset foi obtido a partir de uma **fonte pública no Kaggle**, simulando dados reais do setor automotivo.

Principais conjuntos de dados:

- Dados de clientes (perfil socioeconômico e profissional)
- Dados de vendas (marca, valor, data, loja e estado)
- Dados de leads e conversões
- Dados de acesso e interação com campanhas digitais

**Formatos:** `.csv`

---

## 3. Métricas Analisadas

As principais métricas analisadas foram:

- `TotalVendas` — número total de vendas realizadas  
- `FaturamentoTotal` — soma do valor das vendas  
- `TicketMedio` — faturamento total dividido pelo número de vendas  
- `LeadsGerados` — total de leads captados  
- `TaxaConversao` — vendas realizadas / leads gerados  
- `VendasPorMarca` — desempenho por fabricante  
- `VendasPorEstado` — desempenho geográfico  

---

## 4. ETL com PostgreSQL

O processo de **ETL (Extract, Transform, Load)** foi realizado utilizando **PostgreSQL**, desde a ingestão dos arquivos `.csv` até a criação das tabelas analíticas finais.

### Etapas do ETL

- Importação dos dados brutos via `COPY`
- Padronização de datas e valores monetários (`CAST`, `TO_DATE`)
- Normalização de categorias (status profissional, faixas salariais, marcas)
- Criação de métricas derivadas:
  - `ticket_medio`
  - `taxa_conversao`
  - `faturamento_mensal`
- Junção entre tabelas de clientes, vendas e leads

### Exemplo de Query

```sql
CREATE TABLE vendas_tratadas AS
SELECT
  CAST(cliente_id AS TEXT) AS cliente_id,
  DATE(data_venda) AS data_venda,
  estado,
  marca,
  valor_venda,
  status_profissional,
  faixa_salarial
FROM vendas_raw
WHERE valor_venda IS NOT NULL
````
## 5. Principais Insights

Com base na análise dos dados de atividade física e sono, os principais insights foram:

| Tipo de Conteúdo          | Melhor Dia           | Melhor Horário  |
|---------------------------|-------------------|----------------|
| Post Rápido / Story       | Sábado e Domingo  | 18:00 - 20:00  |
| Post Longo / Carrossel    | Domingo e Segunda | 16:00 - 19:00  |
| Vídeo (Reels / Shorts)    | Domingo           | 16:00 - 19:00  |

**Observações:**
- Sábado e Domingo apresentam maior atividade intensa dos usuários, ideal para posts rápidos.  
- Domingo e Segunda são melhores para conteúdo mais longo e vídeos, aproveitando o menor sedentarismo no período da tarde.  
- Os horários de maior atividade geral ficam entre **16h e 20h**, sendo ideais para publicações.  

---

## 6. Problemas Encontrados e Soluções

Durante o processo de ETL e análise, os seguintes problemas foram identificados:

1. **Inconsistência de formatos de data**
   - Solução: padronização com funções de data no BigQuery (`DATE()`, `CAST`) e ajustes em planilhas quando necessário.

2. **Duplicatas após JOIN**
   - Solução: remoção via deduplicação em BigQuery e ferramentas de limpeza.

3. **Registros com campos primários ausentes (Id ou Data)**
   - Solução: exclusão desses registros, pois não eram confiáveis para análise.

Essas ações garantiram a **qualidade e consistência dos dados** para os insights finais.


![Dashboard ](GraficoPosts.png)
