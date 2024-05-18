use library;

create view dbo.vm_BorrowingFrequency
with schemabinding as 
select borrowId as [borrowId],count_big(*) as [countVal] from dbo.Loan group by borrowId;

create unique clustered index borrowId_index on vm_BorrowingFrequency(borrowId);

select borrowId,rank() over (order by countVal desc) as 'rank' from vm_BorrowingFrequency;



