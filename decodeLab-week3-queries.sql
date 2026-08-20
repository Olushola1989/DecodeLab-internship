select * from `dataset for data analytics decolab_cleaned - sql` limit 10;
rename table `dataset for data analytics decolab_cleaned - sql` to orders;
select count(*) from orders;

select orderid, product, quantity, unitprice, totalprice from orders limit 10;

select orderid, product, quantity, unitprice, totalprice from orders where product = 'chair';

select orderid, product, quantity, unitprice, totalprice from orders where product = 'chair' order by totalprice desc;

select product, count(*) as totalorders from orders group by product;

select product, count(*) as totalorders, round(sum(totalprice), 2) as totalrevenue, round(avg(totalprice), 2) as avgorder from orders group by product order by totalrevenue desc;

select product, count(*) as totalorders, round(sum(totalprice), 2) as totalrevenue from orders group by product having sum(totalprice) > 180000 order by totalrevenue desc;