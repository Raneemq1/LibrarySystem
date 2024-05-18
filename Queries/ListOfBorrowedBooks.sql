use library;
declare @borrowId int 
set @borrowId=3

select Book.* from Book join Loan on Loan.bookId=Book.bookId where Loan.borrowId=@borrowId;

create index borrowId_bookId_index on Loan(borrowId)include(bookId)

