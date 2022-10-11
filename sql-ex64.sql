select point,date, type_oper as operation,sum(price) as money_sum from (select * from (select date , point, inc as price,
case
when code is null
then 'inc'
else 'nothing'
end type_oper

 

from (select income.date,income.point,inc, outcome.code from income
left join outcome
on income.date = outcome.date and outcome.point = income.point) foo0) foo1
where type_oper<> 'nothing'

union all

select * from (select date , point, out as price,
case
when code is null
then 'out'
else 'nothing'
end type_oper

 

from (select outcome.date,outcome.point,out, income.code from outcome
left join income
on outcome.date = income.date and outcome.point = income.point) foo2) foo3

where type_oper<> 'nothing') foo4
group by date,point,type_oper
order by date
