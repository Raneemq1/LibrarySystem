use library; 

with C as (select Loan.borrowId as [id],count(*) as [countVal] from Loan where dateReturned is null group by Loan.borrowId having count(*)>=2)
select Borrower.* from Borrower, C where Borrower.borrowId=C.id;
