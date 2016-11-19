CREATE DATABASE GameSite;
CREATE TABLE dbo.Member(
   MemberID INT NOT NULL,
   Fname VARCHAR (20) NOT NULL,
   Lname VARCHAR (20) NOT NULL,
   Username VARCHAR (20) NOT NULL,
   DateCreated DATE,
   PRIMARY KEY( MemberID )
);
CREATE TABLE dbo.Game(
   GameID INT NOT NULL,
   GDescription VARCHAR (50) ,
   Consoles VARCHAR (30) ,
   DatePublished DATE,
   PRIMARY KEY( GameID )
);
CREATE TABLE dbo.GameLine(
   LinkID INT NOT NULL,
   MemberID INT NOT NULL,
   GameID INT NOT NULL,
   DateCreated DATE,
   PRIMARY KEY( LinkID )
);
ALTER TABLE dbo.GameLine
   ADD FOREIGN KEY (MemberID) REFERENCES dbo.Member (MemberID);

   ALTER TABLE dbo.GameLine
   ADD FOREIGN KEY (GameID) REFERENCES dbo.Game (GameID);