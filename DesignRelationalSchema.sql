create table Book
(bookId int identity(1,1) primary key,
title varchar(255),
author varchar(255),
isbn varchar(13),
publishDate date,
genre varchar(255),
shelfLocation varchar(255),
currentStatus varchar(9) check (currentStatus in ('Available','Borrowed' )));

create table Borrower 
(borrowId int identity(1,1) primary key,
firstName varchar(255),
lastName varchar(255),
email varchar(255),
dateOfBirth date,
dateOfMembership date);


create table Loan
(loanId int identity(1,1) primary key,
bookId int,
borrowId int,
dateBorrowed date,
dueDate date,
dateReturned date null,
foreign key (bookId) references Book(bookId),
foreign key (borrowId) references Borrower(borrowId));
