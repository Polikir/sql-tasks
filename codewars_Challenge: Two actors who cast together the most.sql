with tab1 as (select fa1.actor_id as act1,fa2.actor_id as act2,fa1.film_id from actor as a1
inner join film_actor as fa1 on a1.actor_id = fa1.actor_id
inner join film_actor as fa2 on fa1.film_id = fa2.film_id and fa1.actor_id < fa2.actor_id),

tab2 as (select act1,act2,count(*) as cnt from tab1
group by act1,act2
order by cnt desc
limit 1)

select 
case 
when tab2.act1 is not null
then concat(a3.first_name,' ',a3.last_name)
end first_actor,

case 
when tab2.act1 is not null
then concat(a4.first_name,' ',a4.last_name)
end second_actor, title


from tab2 
join actor as a3 on a3.actor_id = tab2.act1
join actor as a4 on a4.actor_id = tab2.act2
join tab1 on tab1.act1 = tab2.act1 and tab1.act2 = tab2.act2
left join film on tab1.film_id = film.film_id
