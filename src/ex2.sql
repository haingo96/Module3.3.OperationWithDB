use quanlybanhang;

insert into customer
values (null, 'Minh Quan', 10);
insert into customer
values (null, 'Ngoc Anh', 20);
insert into customer
values (null, 'Hong Ha', 50);

insert into `order`
values (null, 1, 20060321, null);
insert into `order`
values (null, 2, 20060323, null);
insert into `order`
values (null, 1, 20060316, null);

insert into product
values (null, 'May Giat', 3);
insert into product
values (null, 'Tu Lanh', 5);
insert into product
values (null, 'Dieu Hoa', 7);
insert into product
values (null, 'Quat', 1);
insert into product
values (null, 'Bep Dien', 2);

insert into orderdetail
values (1, 1, 3);
insert into orderdetail
values (1, 3, 7);
insert into orderdetail
values (1, 4, 2);
insert into orderdetail
values (2, 1, 1);
insert into orderdetail
values (3, 1, 8);
insert into orderdetail
values (2, 5, 4);
insert into orderdetail
values (2, 3, 3);

select oID, oDate, oTotalPrice from `order`;

select customer.cID, customer.cName, o2.pID, p.pName, p.pPrice, o2.odQTY
from customer
join `order` o on customer.cID = o.cID
right join orderdetail o2 on o.oID = o2.oID
left join product p on p.pID = o2.pID
order by cID;

select *
from customer
left join `order` o on customer.cID = o.cID
where o.oID IS NULL;

select `order`.oID, `order`.oDate, orderTotalPrice
from `order`
left join (select orderdetail.oID as order_detail_oID, sum(orderdetail.odQTY * p.pPrice) as orderTotalPrice
      from orderdetail
               join product p on orderdetail.pID = p.pID
      group by orderdetail.oID) as total_price
on `order`.oID = order_detail_oID;

# select orderdetail.oID, sum(orderdetail.odQTY * p.pPrice)
# from orderdetail
# join product p on orderdetail.pID = p.pID
# group by orderdetail.oID;

update `order`
join (
         select orderdetail.oID as order_detail_oID, sum(orderdetail.odQTY * p.pPrice) as orderTotalPrice
         from orderdetail
                  join product p on orderdetail.pID = p.pID
         group by orderdetail.oID
     ) as total_price
on `order`.oID = order_detail_oID
set `order`.oTotalPrice = orderTotalPrice;

update `order`
set oTotalPrice = null;

select oID, odQTY
from orderdetail
group by oID, odQTY
having orderdetail.odQTY > 1;