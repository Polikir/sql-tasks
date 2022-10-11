select ships.class,name, country from Classes
join ships
on Classes.class = ships.class
where numguns >= 10
