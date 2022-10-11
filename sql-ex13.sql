select  AVG(speed) as avg_speed  from  PC
left join Product
on PC.model = Product.model
where maker = 'A'