use library;
with c as (select borrowId as [borrowId],count(*) as [countVal] from Loan group by borrowId)
select c.borrowId,rank() over (order by c.countVal desc) as 'rank' from c;