create trigger tr_bookStatusChanged 
on Book 
after update 
as 
begin 
declare @oldStatus varchar(10)
declare @newStatus varchar(10)
declare @bookId int

select @oldStatus=currentStatus from deleted
select @bookId=bookId,@newStatus=currentStatus from inserted 
if(@oldStatus<>@newStatus)
begin 
insert into AuditLog values (@bookId,@newStatus,GetDate());
end
end;

create table AuditLog
(auditId int identity(1,1) primary key,
bookId int,
statusChanges varchar(10),
dateChanged date);


update Book 
set currentStatus='Borrowed' where bookId=2

select top 2 * from Book;
select * from AuditLog;