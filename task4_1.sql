begin isolation level SERIALIZABLE;
SET TRANSACTION SNAPSHOT '00000003-0000016F-1';
select count(*) from sales_order where total = 30000;
insert into sales_order values (nextval('sales_order_order_id_seq'), now(), 1, now(), 20000);
select count(*) from sales_order where total = 30000;
end;

begin isolation level REPEATABLE READ;
SET TRANSACTION SNAPSHOT '00000003-00000177-1';
select count(*) from sales_order where total = 30000;
insert into sales_order values (nextval('sales_order_order_id_seq'), now(), 1, now(), 20000);
select count(*) from sales_order where total = 30000;
end;