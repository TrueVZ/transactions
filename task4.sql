begin transaction isolation level SERIALIZABLE;
select count(*) from sales_order where total = 20000;
insert into sales_order values (nextval('sales_order_order_id_seq'), now(), 1, now(), 30000);
SELECT pg_export_snapshot();
select count(*) from sales_order where total = 20000;
end;


SELECT pg_export_snapshot();

SET TRANSACTION SNAPSHOT '00000004-0000006E-2';


begin transaction isolation level REPEATABLE READ;
select count(*) from sales_order where total = 20000;
insert into sales_order values (nextval('sales_order_order_id_seq'), now(), 1, now(), 30000);
SELECT pg_export_snapshot();
select count(*) from sales_order where total = 20000;
end;