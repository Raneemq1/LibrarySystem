create function fn_OverDueAnalysis(@loanId int)
returns int
as 
begin
declare @dueDate date, @returnDate date,@diff int
select @dueDate=dueDate,@returnDate=dateReturned from Loan where Loan.loanId=@loanId;
if(@returnDate is not null and @returnDate>@dueDate)
begin 
set @diff=DATEDIFF(DAY,@dueDate,@returnDate);
end
else if(@returnDate is null and @dueDate<GetDate())
begin 
set @diff=DATEDIFF(DAY,@duedate,GetDate());
end
else 
begin 
set @diff=0
end
return @diff
end

select Borrower.borrowId,Concat(firstName,' ',lastName) as [borrower name],Book.bookId,title as [book title],dbo.fn_OverDueAnalysis(loanId) as 'Overdue Days' from Loan 
join Borrower on Borrower.borrowId=Loan.borrowId
join Book on Book.bookId=Loan.bookId
where dbo.fn_OverDueAnalysis(loanId)>=30;


