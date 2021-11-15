
-- select --
-- Most 'kare' --
select s.first_name, s.last_name , s.barber_shop_id ,max(k.times) 'times'
from (select r.barber_id , count(*) 'times'
	  from reservation r
	  where r.haircut_style = 'kare'
	  group by r.barber_id) k, barber b , staff s 
where b.id = s.id 
and k.barber_id = s.id;

-- % painting -- 
select r1.painting_times / count(*) *100 '% painting'
from (select count(*) 'painting_times'
	  from reservation r
      where r.haircut_style = 'painting'
	  group by r.haircut_style) r1 , reservation r2;
      

   -- most backup --                 
  select s.id, s.first_name ,s.last_name , m.first_name 'manager' , b.id 'barbershop' , max(a.times) 'Backups'                  
  from (select s.id , count(*) 'times'
		from staff s  
		group by s.backup_id) a, staff s , manager m , barber_shop b
  where m.id = b.manager_id
  and b.id = s.barber_shop_id;
  
  -- new customer -- 
select s.id, s.first_Name, s.last_Name, s.gender, count(r.customers_id) "num_of_cut"
from reservation r
inner join staff s on r.barber_id = s.id 
inner join customers c on r.customers_id = c.id 
and c.gender = "female"
group by barber_id
having count(r.barber_id) > 2
order by num_of_cut desc
limit 1;

-- clients in shops --
select barber_shop.id,barber_shop.street_name,count(*) "number of customers"
from customers ,barber_shop ,reservation
where reservation.barber_shop_id=barber_shop.id 
and reservation.customers_id=customers.id  
group by  barber_shop.id;

-- avg money staff --
select id, first_Name, last_Name, wage
from staff
where wage < (select avg(wage)
               from staff)
order by wage; 

-- profit --
select sum(a.price) 'Total profit'
from(select  r.barber_id 'id' , r.haircut_style , p.haircut_price 'price'
	from reservation r , price_menu p
	where r.haircut_style = p.haircut_style
	group by r.barber_id , r.customers_id) a ;

-- best customer --
select c.id , c.first_name, c.last_name
from customers c
where exists (select  r.customers_id 'id' , count(*) 
			  from reservation r 
              where c.id = r.customers_id
              group by r.customers_id
              having count(*) > 1);
-- campaign --
select s.id, s.first_Name, s.last_Name, s.gender, count(r.customers_id) "num_of_reception"
from reservation r, staff s, customers c
where r.receptionist_id = s.id 
and r.customers_id = c.id 
and c.gender = "male"
group by receptionist_id
having count(*) >= 2
order by num_of_reception desc;

-- customer name--
select c.first_name , c.last_name , r.haircut_style
from reservation r , customers c
where c.id = r.customers_id
and r.haircut_style = 'moak'
and r.meet_date = '2020-03-01'
and c.first_name like 'A%';

-- painting cut -- 
select s.id , s.first_name , s.last_name , s.barber_shop_id
from staff s
where s.id not in (select r.barber_id
					from reservation r
                    where r.haircut_style = 'painting');


-- update money for exprience barber -- 
select staff.id, staff.first_Name, staff.last_Name, barber.firstday_at_work, staff.wage
from barber, staff 
where firstday_at_work=(select min(firstday_at_work) from barber) 
and barber.id = staff.id;

-- update --
update staff, barber
set staff.wage = staff.wage * 1.1
where firstday_at_work=(select min(firstday_at_work) from barber) 
and barber.id = staff.id;


-- best barber update money -
update staff
set wage = wage + 250
where id = (select r.barber_id 
	          from reservation r
              group by r.barber_id
              order by count(*) desc
              limit 1);
--  delete --
delete from reservation
where customers_id = (select id
					from customers
                    where phone_number is null);

-- Adding backup_id as Fk to staff(id) -- 
alter table staff
add constraint fk_backup FOREIGN KEY(backup_id) REFERENCES staff(id)
on delete restrict;