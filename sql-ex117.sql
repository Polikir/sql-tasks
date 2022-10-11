with table1 as (select * ,
case
when True
then 'numguns'
end wh
from classes c1
cross join lateral 
(select max(5000*numguns) as val  from classes c2 where c1.country = c2.country) foo

union all

(select * ,
case
when True
then 'bore'
end wh
from classes c1
cross join lateral 
(select max(3000*bore) as val  from classes c2 where c1.country = c2.country) foo2)

union all 

select * ,
case
when True
then 'displacement'
end wh
from classes c1
cross join lateral 
(select max(displacement) as val  from classes c2 where c1.country = c2.country) foo3) 


select table1.country,wh as name,m_val as max_val from table1 
left join (select max(val) as m_val,country from table1
group by country) t2
on table1.country = t2.country
where val = m_val
group by table1.country,wh,m_val