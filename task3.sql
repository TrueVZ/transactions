begin isolation level SERIALIZABLE;
select count(*) from sales_order where total = 20000;
insert into sales_order values (nextval('sales_order_order_id_seq'), now(), 1, now(), 30000);
select count(*) from sales_order where total = 20000;
end;