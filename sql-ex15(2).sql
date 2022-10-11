select hd from PC
group by hd
having count(*) > 1
