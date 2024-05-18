declare @month int 
set @month=3;

with c as (
select  genre as [Popular Genre],month(dateBorrowed) as [Month],count(*) as [Count], rank() over(partition by month(dateBorrowed) order by count(*) desc) as [Rank] from Loan
join Book on Book.bookId=Loan.bookId
group by genre,month(dateBorrowed)
)
select * from c where c.Month=@month and c.Rank=1;

create index dateBorrowed_bookId_index on Loan(dateBorrowed,bookId);
create index bookId_genre_index on Book(bookId,genre);
