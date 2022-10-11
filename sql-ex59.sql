select point,sum(price) as diff from (
	select point,sum(inc) as price from income_o
	group by point
	union 
	select point,-1*sum(out) as price from outcome_o
	group by point

) foo
group by point