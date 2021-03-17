-- User
Create table Users (
	username varchar (30) Primary Key NOT NULL,
	password varchar (30) NOT NULL,
	fullName varchar(50) NOT NULL,
	addressNum varchar(100),
	street varchar (30),
	district varchar (30),
	city varchar (30),
	phone varchar(20),
	email varchar(50),
);

-- Furniture
create table Furniture (
	ID int IDENTITY(1,1) primary key,
	title varchar(30) NOT NULL,
	price float NOT NULL,
	inventory int NOT NULL,
	descriptions text,
	coverImage varchar(100)
);

Create table dbo.Product (
	ID int NOT NULL,
	username varchar(30) NOT NULL,
	primary key(ID, username),
	foreign key (ID) references Furniture (ID)
        on delete cascade
        on update cascade,
    foreign key (username) references Users(username)
        on delete cascade
        on update cascade
);

insert into Furniture (title, price, inventory) values ('table', 1.1, 2);

select * from Furniture;