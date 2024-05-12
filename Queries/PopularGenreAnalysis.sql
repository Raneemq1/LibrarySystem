declare @month int 
set @month=3

select top 1 Book.genre as 'Popular Genre',@month as [Month], count(*) as [Count] from Book 
join Loan on Loan.bookId=Book.bookId 
where month(Loan.dateBorrowed)=@month 
group by Book.genre 
order by count(*) desc;

with c as (
select  genre as [Popular Genre],month(dateBorrowed) as [Month],count(*) as [Count], rank() over(partition by month(dateBorrowed) order by count(*) desc) as [Rank] from Loan
join Book on Book.bookId=Loan.bookId
group by genre,month(dateBorrowed)
)

select * from c where c.Month=@month and c.Rank=1


