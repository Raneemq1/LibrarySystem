alter proc OVerdueBorrowers
as 
create table #OverdueBorrowers(BorrowId int);

insert into #OverdueBorrowers(BorrowId) select borrowId from Loan 
where (dueDate<dateReturned) or (dateReturned is null and (getdate()>dueDate))

select distinct B.BorrowId,L.dueDate,L.dateReturned from #OverdueBorrowers B
join Loan L on L.borrowId=B.BorrowId;

drop table #OverdueBorrowers


OVerdueBorrowers


