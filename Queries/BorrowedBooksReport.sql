create proc BorrowedBooksReport
@beginDate date,
@endDate date
as
select Book.bookId,Book.title,Concat(Borrower.firstName,' ',Borrower.lastName) as [borrower name], Loan.dateBorrowed from Loan
join Book on Book.bookId=Loan.bookId
join Borrower on Borrower.borrowId=Loan.borrowId
where dateBorrowed between @beginDate and @endDate


exec BorrowedBooksReport '1/1/2021','1/1/2023'