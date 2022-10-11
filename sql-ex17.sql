select distinct type,laptop.model,speed from laptop 
left join product on laptop.model = product.model
where speed < all (select speed from pc)

