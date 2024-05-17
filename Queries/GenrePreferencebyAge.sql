alter function fn_MaxCountForInterval(@interval int)
returns int 
as
begin 
declare @max int 
select @max=max(counts) from (
select  (Year(GetDate())-Year(dateOfBirth))/10 as [interval], count(genre) as [counts] from Loan 
join Borrower on Borrower.borrowId=Loan.borrowId
join Book on Book.bookId=Loan.bookId  
group by genre,(Year(GetDate())-Year(dateOfBirth))/10
)as subquery where subquery.interval=@interval;
return @max;
end;

alter function fn_IntervalString(@interval int)
returns varchar(10)
as 
begin 
declare @intervalString varchar(10)
set @intervalString='('+cast(@interval*10-9 as varchar(10))+','+cast (@interval*10 as varchar(10))+')';
return @intervalString
end

select genre as [genre], dbo.fn_IntervalString((Year(GetDate())-Year(dateOfBirth))/10) as [interval], count(genre) as [counts] from Loan 
join Borrower on Borrower.borrowId=Loan.borrowId
join Book on Book.bookId=Loan.bookId  
group by genre,(Year(GetDate())-Year(dateOfBirth))/10
having count(genre)=dbo.fn_MaxCountForInterval((Year(GetDate())-Year(dateOfBirth))/10)




