begin isolation level REPEATABLE READ;
select count(*) from sales_order where total = 30000;
insert into sales_order values (nextval('sales_order_order_id_seq'), now(), 1, now(), 20000);
end;