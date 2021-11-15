CREATE SCHEMA Project;
USE Project;
-- manager --
CREATE TABLE manager	 
(id 	 INT NOT NULL,
first_Name  VARCHAR(20),
last_Name  VARCHAR(20),
wage  INT,
gender ENUM('male','female'),
street_name varchar(20),
street_num int,
city varchar(20),
work_start date,
phone_number int,
PRIMARY KEY (id))
ENGINE=INNODB;

-- barber_shop --
CREATE TABLE barber_shop 
(id		INT NOT NULL,
manager_id int ,
street_name    VARCHAR(20) NOT NULL,
street_num    int NOT NULL,
open_day date,
open_hours varchar(30),
phone_number int,
PRIMARY KEY (id),
FOREIGN KEY(manager_id) REFERENCES manager(id)) 
ENGINE=INNODB;

-- staff --
CREATE TABLE staff	 
(id 	 INT NOT NULL,
barber_shop_id int,
first_Name  VARCHAR(20),
last_Name  VARCHAR(20),
wage  INT,
gender ENUM('male','female'),
backup_id int,
phone_number int,
PRIMARY KEY (id),
FOREIGN KEY(barber_shop_id) REFERENCES barber_shop(id))
ENGINE=INNODB;

-- barber --
CREATE TABLE barber	 
(id 	 INT NOT NULL,
barber_shop_id int,
speciality ENUM('male','female'),
firstday_at_work date,
PRIMARY KEY (id),
FOREIGN KEY(barber_shop_id) REFERENCES barber_shop(id),
foreign key (id) references staff(id))
ENGINE=INNODB;

-- receptionist --
CREATE TABLE receptionist	 
(id 	 INT NOT NULL,
barber_shop_id int,
PRIMARY KEY (id),
FOREIGN KEY(barber_shop_id) REFERENCES barber_shop(id),
foreign key (id) references staff(id))
ENGINE=INNODB;

-- price_menu ==
CREATE TABLE price_menu	 
(barber_shop_id 	 int NOT NULL,
haircut_style varchar(30) not null,
haircut_price int not null,
PRIMARY KEY (barber_shop_id,haircut_style,haircut_price),
foreign key (barber_shop_id) references barber_shop(id))
ENGINE=INNODB;

-- customers ==
CREATE TABLE customers	 
(id 	 int NOT NULL,
first_name varchar(30),
last_name varchar(30),
gender ENUM('male','female'),
phone_number int,
PRIMARY KEY (id))
ENGINE=INNODB;

-- reservation ==
CREATE TABLE reservation	 
(meet_date date NOT NULL,
barber_shop_id int not null,
barber_id int not null,
receptionist_id int not null,
customers_id int not null,
haircut_style varchar(30),
meet_hour time not null,
PRIMARY KEY (meet_date,barber_shop_id,barber_id,receptionist_id,customers_id,meet_hour),
FOREIGN KEY(barber_shop_id) REFERENCES barber_shop(id),
foreign key (barber_id) references barber(id),
foreign key (receptionist_id) references receptionist(id),
foreign key (customers_id) references customers(id))
ENGINE=INNODB;

