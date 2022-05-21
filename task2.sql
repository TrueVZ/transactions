create table product(
    product_id bigserial primary key,
    description varchar(30)
);

create table sales_order(
    order_id bigserial primary key,
    order_date date,
    customer_id integer,
    ship_date date,
    total float
);

create table item(
    order_id integer,
    item_id bigserial primary key,
    product_id integer,
    actual_price float,
    quantity integer,
    total float
);

BEGIN;
insert into sales_order values
    (1, now(), 1, now(), 1000);
insert into item values
     (1, 1, 1, 100.0, 5, 500.0),
     (1, 2, 2, 50.0, 10, 500.0);
rollback;
select * from sales_order;
END;

BEGIN;
insert into sales_order values (nextval('sales_order_order_id_seq'), now(), 1, now(), 1000);
savepoint add_item;
insert into item values (1, nextval('item_item_id_seq'), 1, 100.0, 5, 500.0);
savepoint add_item;
insert into item values (1, nextval('item_item_id_seq'), 2, 50.0, 10, 500.0);
rollback to savepoint add_item;
select * from sales_order;
select * from item;
insert into item values (1, nextval('item_item_id_seq'), 2, 50.0, 10, 500.0);
END;

begin;
update sales_order set total = total * 2 where total = 1000;
end;
-- Из-за того что по дефолту в постреге уровень транзакции Read Commited, это значит что во время выполнения транзакции видит данные которые закомители, даже те которые завершились после начало самой транзакции

begin isolation level REPEATABLE READ;
select count(*) from sales_order where total = 20000;
insert into sales_order values (nextval('sales_order_order_id_seq'), now(), 1, now(), 30000);
select count(*) from sales_order where total = 30000;
end;

-- Нет потому что при repeatable read мы получаем данные которые были зафиксированы до начало транзакции


