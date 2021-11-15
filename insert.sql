use project;
insert into manager (id,first_name,last_name,wage,gender,street_name,street_num,city,work_start,phone_number)
values
(1,'Niv','Ben Avraham',10000,'male','rishonim',47,'BeneAtarot','2012-12-03',0504721252),
('2', 'Ido', 'Shtern', '12000', 'male', 'azor', 21,'Hulon', '2012-12-01',0545521929),
('3', 'Stav', 'Atias', 15000, 'male', 'rishon', 43,'Lezion','2011-01-01',0525256077),
('4', 'Tom', 'Caspi', 9000, 'male', 'Tel aviv', 23,'Yafo', '2015-02-01',0546790110);


insert into barber_shop (id,manager_id,street_name,street_num,open_day,open_hours,phone_number)
values 
(1,1,'Even Gavirol',1,'2012-12-03','8:00-20:00',039721252),
(2,2,'Rotschild',2,'2012-12-01','8:00-20:00',0397224443),
(3,3,'Ehad Haam',3,'2012-01-01','8:00-20:00',0397219116),
(4,4,'Alenbi',4,'2015-02-01','8:00-20:00',039711161);

insert into price_menu (barber_shop_id,haircut_style,haircut_price)
values
(1,'Kare',60),(1,'Moak',50),(1,'Painting',150),(1,'Kozim',65),(1,'fan',80),
(2,'Kare',60),(2,'Moak',50),(2,'Painting',150),(2,'Kozim',65),(2,'fan',80),
(3,'Kare',60),(3,'Moak',50),(3,'Painting',150),(3,'Kozim',65),(3,'fan',80),
(4,'Kare',60),(4,'Moak',50),(4,'Painting',150),(4,'Kozim',65),(4,'fan',80);

insert into staff (id,barber_shop_id,first_name,last_name,wage,gender,backup_id,phone_number)
values 
(11,1,'Batel','Biton',8000,'female',12,0501235843),
(12,1,'Shir','Ziv',7500,'female',11,053238980),
(13,1,'Hefer','Tal',7000,'male',14,050505320),
(14,1,'Ron','Shay',6000,'male',13,053234323),
(15,1,'Brano','Taganya',6500,'male',16,0532351288),
(16,1,'Gal','Gadot',9000,'female',15,053238723),

(21,2,'Gila','Harel',8000,'female',22,059384093),
(22,2,'Tali','Moshe',5000,'female',21,058349203),
(23,2,'Shuki','Zikri',7000,'male',24,0507621485),
(24,2,'Lee','Rom',8500,'female',23,0542875123),
(25,2,'Miki','Kam',5500,'female',26,0522992123),
(26,2,'Oren','Josipovich',6500,'male',25,0512387873),

(31,3,'Aviv','Cohen',7500,'male',32,0523209584),
(32,3,'Chen','Kadosh',9000,'female',31,0592134855),
(33,3,'Tom','Amar',5500,'male',34,0582948752),
(34,3,'Guy','Shoval',6500,'male',33,0502398567),
(35,3,'Ben','El',6000,'male',36,0502398557),
(36,3,'Ninet','Tayeb',7000,'female',35,0502888567),

(41,4,'Shani','Maman',7500,'female',42,0554657219),
(42,4,'Gil','Levi',8500,'male',41,0535748290),
(43,4,'Tomer','Feldman',9000,'male',44,0530032958),
(44,4,'Liel','Menashe',4500,'female',43,0537892133),
(45,4,'Miki','Buganim',9500,'male',44,0530032778),
(46,4,'Noa','Kirel',9000,'female',44,0540032958);

insert into barber (id,barber_shop_id,speciality,firstday_at_work)
values
(13,1,'male','2012-01-04'), (14,1,'female','2012-04-03'),
(15,1,'male','2012-01-04'), (16,1,'female','2012-04-03'),
(23,1,'male','2012-10-05'), (24,1,'female','2012-02-07'), 
(25,1,'male','2012-10-05'), (26,1,'female','2012-02-07'), 
(33,1,'male','2012-07-09'),(34,1,'female','2012-12-01'), 
(35,1,'male','2012-07-09'),(36,1,'female','2012-12-01'), 
(43,1,'male','2012-09-08'),(44,1,'female','2012-10-01'),
(45,1,'male','2012-09-08'),(46,1,'female','2012-10-01');
 
insert into receptionist (id,barber_shop_id)
values
(11,1),(12,1),
(21,1),(22,1),
(31,1),(32,1),
(41,1),(42,1);

insert into customers (id,first_name,last_name,gender,phone_number)
values
(101,'Lior','Solomon','female',0545556677),
(102,'Mor','Benavraham','female',0545553377),
(103,'Stavit','Tias','female',0523334488),
(104,'maya','Nis','female',0507299935),
(105,'Shira','Benzvi','female',0506263924),
(106,'Shoshi','Cohen','female',0504212398),
(107,'Itzik','Dor','male',0501234243),
(108,'Dani','Perel','male',0526996358),
(109,'Toni','Vespa','male',0504821282),
(110,'Jhoni','Cash','male',0582125397),
(111,'Ali','Bentov','male',0532196781),
(112,'Imri','Roash','male',0546247599),
(113,'Yonit','Levi','female',0582222121),
(114,'Ilana','Dayan','female',0528943123),
(115,'Sholamit','Malka','female',0503481904),
(116,'Gogi',null,null,null),
(117,'Hamer','Tanker','male',0589721252),
(118,'Efi','Nave','male',039733521),
(119,null,null,null,0501116197),
(120,'Jimi','Page','male',0506006382);


INSERT INTO reservation (meet_date,barber_shop_id,barber_id,receptionist_id,customers_id,haircut_style,meet_hour)
VALUES
('2020-01-01',1,14,11,101,'fan','08:40:00'),
('2020-01-01',1,16,11,103,'painting','09:40:00'),
('2020-01-01',1,13,12,104,'painting','16:20:00'),
('2020-01-01',1,14,11,102,'fan','09:00:00'),
('2020-01-01',1,14,12,105,'kare','17:00:00'),
('2020-01-02',2,14,11,109,'kare','09:20:00'),
('2020-01-02',2,15,12,110,'kare','17:35:00'),
('2020-01-02',2,15,12,118,'kozim','17:35:00'),

('2020-02-03',2,26,21,106,'fan','08:40:00'),
('2020-02-03',2,23,21,107,'kozim','09:40:00'),
('2020-02-04',2,25,22,108,'moak','16:20:00'),
('2020-02-03',2,23,21,109,'kare','09:00:00'),
('2020-02-04',2,25,22,110,'kare','17:00:00'),
('2020-02-03',2,24,22,114,'painting','12:20:00'),
('2020-02-01',2,26,21,113,'kare','18:00:00'),
('2020-02-01',2,24,22,115,'fan','11:00:00'),

('2020-03-01',3,33,31,111,'moak','08:40:00'),
('2020-03-01',3,33,31,112,'kozim','09:40:00'),
('2020-03-01',3,34,32,113,'painting','16:20:00'),
('2020-03-01',3,36,31,114,'fan','09:00:00'),
('2020-03-15',3,34,32,115,'kare','17:00:00'),
('2020-03-21',3,35,32,120,'kozim','17:20:00'),
('2020-03-11',3,35,32,117,'moak','17:00:00'),

('2020-04-01',4,43,41,116,'moak','08:40:00'),
('2020-04-01',4,43,41,117,'moak','09:40:00'),
('2020-04-01',4,45,42,118,'kare','16:20:00'),
('2020-04-01',4,44,41,119,'fan','09:00:00'),
('2020-04-01',4,45,42,120,'kozim','17:30:00'),
('2020-04-01',4,46,41,102,'painting','13:30:00'),
('2020-04-01',4,46,42,103,'fan','10:30:00');
