---Grafico 6
---Vendas por estado

select 
count(t1.paid_date) as Vendas,
t2.state as Estado
from sales.funnel as t1 left join 
sales.customers as t2 
on t1.customer_id =t2.customer_id
where paid_date is not null
group by state
order by vendas desc
