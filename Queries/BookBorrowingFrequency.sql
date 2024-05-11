create function fn_BookBorrowingFrequency(@bookId int)
returns int
as 
begin 
declare @count int 
select @count=count(*) from Loan where Loan.bookId=@bookId;
return @count
end

select top 10 *,dbo.fn_BookBorrowingFrequency(bookId) as 'Counter' from Book