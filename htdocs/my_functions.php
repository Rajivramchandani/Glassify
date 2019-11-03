create or replace func_cheapglasses() returns int
begin 
declare m int;
select id into m from products where price=min(price);
return m;
end

create or replace func_outofstock(in pid int) returns int
begin 
declare k int;
update table products set slug='NA' where id=pid;
return id;
end 

