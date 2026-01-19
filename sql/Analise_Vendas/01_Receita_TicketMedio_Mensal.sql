--Grafico 1
---Receita e ticket medio mes a mes
with tabelarest as (
select t1.product_id,t1.customer_id,
(t2.price + (t2.price*t1.discount)) as valor_real,
extract('month'from paid_date) as mes,
extract('year'from paid_date) as ano
from sales.funnel as t1 left join sales.products as t2 
on t1.product_id = t2.product_id
where paid_date is not null
order by paid_date
)
select 
	round(sum(valor_real)/ count(distinct customer_id),2) as ticket_medio,
	sum(valor_real) as Faturamento,
	mes,
	ano
from tabelarest
group by ano,mes	
