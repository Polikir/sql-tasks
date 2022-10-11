select country,cast(AVG(cast(0.5*(power(bore,3)) as numeric(6,2))) as numeric(6,2)) as weight from (select country,bore,name from ships
left join classes on ships.class = classes.class 
union
select country,bore,ship from classes join outcomes on class = ship 			) as foo
group by country
