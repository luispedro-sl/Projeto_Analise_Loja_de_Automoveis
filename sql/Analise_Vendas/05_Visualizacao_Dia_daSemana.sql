---	Grafico 5
---Visualizações por dia da semana 

SELECT 
count(visit_id) as Acessos,
case 
	when extract('dow' from visit_page_date)=0 then 'Domingo'
	when extract('dow' from visit_page_date)=1 then 'Segunda-feira'
	when extract('dow' from visit_page_date)=2 then 'Terça-feira'
	when extract('dow' from visit_page_date)=3 then 'Quarta-feira'
	when extract('dow' from visit_page_date)=4 then 'Quinta-feira'
	when extract('dow' from visit_page_date)=5 then 'Sexta-feira'
	when extract('dow' from visit_page_date)=6 then 'Sabado'
end as Dia_da_Semana
FROM sales.funnel
group by Dia_da_Semana
