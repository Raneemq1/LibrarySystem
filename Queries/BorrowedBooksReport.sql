alter proc BorrowedBooksReport
@beginDate date,
@endDate date
as
select Book.bookId,Book.title,Concat(Borrower.firstName,' ',Borrower.lastName) as [borrower name], Loan.dateBorrowed from Loan
join Borrower on Borrower.borrowId=Loan.borrowId
join Book on Book.bookId=Loan.bookId
where dateBorrowed between @beginDate and @endDate

exec BorrowedBooksReport '1/1/2021','1/1/2023'

create index dateBorrowed_borrowId_bookId_index on Loan(dateBorrowed,borrowId,bookId)