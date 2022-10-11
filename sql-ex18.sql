select distinct maker,price from Product
right join 

(select * from Printer
where price = any (select min(price) from Printer
left join Product
on Printer.model = Product.model
where color = 'y') and color = 'y') foo
on Product.model = foo.model