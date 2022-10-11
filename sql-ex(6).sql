select distinct maker,speed from Product
inner join 
Laptop
on Product.model = Laptop.model
where hd >= 10