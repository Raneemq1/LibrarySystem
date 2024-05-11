create function fn_CalculateOverdueFees(@loanId int) 
returns  int 
as 
begin
declare @fee int
declare @dueDate date
declare @returnDate date
select @duedate=dueDate,@returnDate=dateReturned from Loan where loanId=@loanId

if(@returnDate is not null and @returnDate>@dueDate)
begin 
set @fee=DATEDIFF(DAY,@dueDate,@returnDate);
end
else if(@returnDate is null and @dueDate<GetDate())
begin 
set @fee=DATEDIFF(DAY,@duedate,GetDate());;
end
else 
begin 
set @fee=0
end
if(@fee>30)
begin 
set @fee=(@fee-30)*2+30;
end
return @fee
end

select top 10 dbo.fn_CalculateOverdueFees(loanId) as 'Fees', * from Loan;