select distinct p1.model,p2.model,p1.speed,p1.ram from pc as p1
join pc as p2
on (p1.ram = p2.ram) and (p1.speed = p2.speed)
where p1.model>p2.model