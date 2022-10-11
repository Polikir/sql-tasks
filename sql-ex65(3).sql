with tab1 as (select distinct maker,type,
case 
when type = 'PC'
then 1
when type = 'Laptop'
then 2
when type = 'Printer'
then 3
end ord_pr
/* row_number() over(partition by maker order by type) as r_n */
from Product

order by maker,ord_pr),

tab2 as 

(select row_number() over(partition by maker order by ord_pr) as r_n, maker,type from tab1)

select  row_number() over() as num,
case 
when r_n = 1
then maker
else ''
end n_m,type 
from tab2