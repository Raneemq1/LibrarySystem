use library;
select author,count(*) as 'frerquency',rank() over( order by count(*) desc) as 'rank' from Book 
join Loan on Loan.bookId=Book.bookId
group by author;