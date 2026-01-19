--1 Análise de Genero
/*Devido a falta de dados em relação ao genero,
utilizei a Morfologia (área da gramática que estuda a estrutura das palavras e suas flexões),
para determinar certos nomes,posteriormente,
aplicando técnicas de amostragem para aproximar a representação da população (Clientes)
*/
with tabela1 as (
select 
	t1.first_name,
	t1.customer_id,
CASE
    /* ========= FEMININO ========= */
    WHEN UPPER(TRIM(t1.first_name)) LIKE '%ANA'
      OR UPPER(TRIM(t1.first_name)) LIKE '%ELA'
      OR UPPER(TRIM(t1.first_name)) LIKE '%INA'
      OR UPPER(TRIM(t1.first_name)) LIKE '%ISA'
      OR UPPER(TRIM(t1.first_name)) LIKE '%IA'
      OR UPPER(TRIM(t1.first_name)) LIKE '%A'
    THEN 'Feminino'

    /* ========= MASCULINO ========= */
    WHEN UPPER(TRIM(t1.first_name)) LIKE '%EL'
      OR UPPER(TRIM(t1.first_name)) LIKE '%ER'
      OR UPPER(TRIM(t1.first_name)) LIKE '%AN'
      OR UPPER(TRIM(t1.first_name)) LIKE '%ON'
      OR UPPER(TRIM(t1.first_name)) LIKE '%US'
      OR UPPER(TRIM(t1.first_name)) LIKE '%OR'
      OR UPPER(TRIM(t1.first_name)) LIKE '%OM'
      OR UPPER(TRIM(t1.first_name)) LIKE '%AO'
      OR UPPER(TRIM(t1.first_name)) LIKE '%O'
    THEN 'Masculino'

    ELSE 'Desconhecido'
END AS Genero
from sales.customers as t1 left join sales.funnel as t2
on t1.customer_id=t2.customer_id
where paid_date is not null
)
select 
count(*) as Quantidade,
genero
from tabela1
group by genero
