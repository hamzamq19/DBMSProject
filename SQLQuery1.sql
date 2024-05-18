CREATE TABLE Books(
	bookID int primary key identity(1,1),
	bookName varchar(255),
	ISBN varchar(255)
);
CREATE TABLE Author(
	authorID int identity(1,1),
	authorName varchar(255),
	bookID int,
	foreign key(bookID) references Books(bookID),
	primary key(authorID, bookID)
);
CREATE TABLE [Location](
	locationID int primary key identity(1,1),
	aisleNumber int,
	shelfNumber int,
	section varchar(5)
);
CREATE TABLE BookCopy(
	bookCopyID int primary key identity(1,1),
	bookID int,
	foreign key(bookID) references Books(bookID),
	locationID int,
	foreign key(locationID) references [Location](locationID)
);
CREATE TABLE Librarian(
	librarianID int primary key identity(1,1),
	librarianName varchar(255),
	librarianEmail varchar(255),
	librarianAddress varchar(255),
	librarianContact varchar(255),
	librarianUsername varchar(255),
	librarianPassword varchar(255),
	hiredate date
);
CREATE TABLE Member_Type(
	memberTypeID int primary key identity(1,1),
	maxBooks int,
	limitDuration int
);
CREATE TABLE Members(
	memberID int primary key identity(1,1),
	memberName varchar(255),
	memberAddress varchar(255),
	memberEmail varchar(255),
	memberContact varchar(255),
	memberTypeID int,
	foreign key(memberTypeID) references Member_Type(memberTypeID)
);
CREATE TABLE FinePolicy(
	finePolicyID int primary key identity(1,1),
	fineAmount money,
	dueDate date,
	memberTypeID int,
	foreign key(memberTypeID) references Member_Type(memberTypeID)
);
CREATE TABLE Book_Issue_Return(
	issueID int primary key identity(1,1),
	librarianID int,
	foreign key(librarianID) references Librarian(librarianID),
	bookID int,
	foreign key(bookID) references Books(bookID),
	bookCopyID int,
	foreign key(bookCopyID) references BookCopy(bookCopyID),
	memberID int,
	foreign key(memberID) references Members(memberID),
	issueDate date,
	dueDate date,
	returnDate date,
	finePolicyID int,
	foreign key(finePolicyID) references FinePolicy(finePolicyID),
	payDate date,
	status varchar(255)
);