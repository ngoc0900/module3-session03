create database qlbh;
use qlbh;
create table category(
id int primary key auto_increment,
category_name varchar(50) not null unique,
category_status bit(1) default 1
);
create table product(
id int primary key auto_increment,
product_name varchar(50) not null unique,
price float check (price > 0),
sale_price float check ( sale_price > 0),
check (price >sale_price),
category_id int not null,
foreign key (category_id) references category(id)
);

insert into category(category_name,category_status) values 
('mũ',0),
('quần',1);
update category set category_name = 'áo', category_status = 1 where id = 1;
select * from category;
insert into product(product_name,price,sale_price,category_id) values
('áo chống nắng',100,50,1),
('quần bò',600,290,2),
('áo sơ mi',150,100,1);
select*from product;
update product set price = price *2 where category_id = 1;
delete from product where price < 500;
select * from product order by price asc;
select * from product where product_name like '%ao%';
select * from product where price > 100;
select * from product where price between 100 and 500;
select * from product order by price desc limit 5;


