Create proc AddBorrowers 
@fName varchar(255),
@lName varchar(255),
@email varchar(255)=null,
@dateOfBirth date,
@error varchar(255) output,
@id int output
as 
if @email is null 
begin
set @error='email not exsit'
set @id=null
end
else 
begin
insert into Borrower values(@fName,@lName,@email,@dateOfBirth,GETDATE())
set @id= SCOPE_IDENTITY()
set @error=null
end

declare @idVal int
declare @errorVal varchar(255)
exec AddBorrowers @fName='Raneem',@lName='Alqadi',@dateOfBirth='7/13/2000' ,@id=@idVal output,@error=@errorVal output
select @idVal as 'IdVal',@errorVal as 'Error Msg'