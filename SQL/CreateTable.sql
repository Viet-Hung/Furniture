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
	ID varchar(20) primary key NOT NULL,
	title varchar(30) NOT NULL,
	price float NOT NULL,
	inventory int NOT NULL,
	descriptions text,
	coverImage varchar(100)
);

CREATE SEQUENCE CountBy1  
START WITH 1 INCREMENT BY 1 ;  
GO

CREATE TRIGGER IncreaseNumber
ON Furniture
INSTEAD OF INSERT AS
DECLARE @ID varchar(20),
	@NextID INT,
	@title varchar(30),
	@price float,
	@inventory int,
	@descriptions text,
	@coverImage varchar(100)
SELECT @NextID = NEXT VALUE FOR CountBy1,
	@ID = 'Item_',
	@title = title,
	@price = price,
	@inventory = inventory,
	@descriptions = descriptions,
	@coverImage = coverImage
FROM INSERTED
INSERT INTO Furniture VALUES (
	@ID + RIGHT('000' + CAST(@NextID AS VARCHAR(3)), 3),
	@title,
	@price,
	@inventory,
	@descriptions,
	@coverImage
);

Create table dbo.Product (
	ID varchar(20) NOT NULL,
	username varchar(30) NOT NULL,
	primary key(ID, username),
	foreign key (ID) references Furniture (ID)
        on delete cascade
        on update cascade,
    foreign key (username) references Users(username)
        on delete cascade
        on update cascade
);