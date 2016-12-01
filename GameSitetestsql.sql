
CREATE DATABASE GameProfile;
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE GameProfile.[dbo].[Members](
	[MemberID] [int] IDENTITY (100, 1) NOT NULL,
	[LName] [varchar](50) NOT NULL,
	[FName] [varchar](50) NOT NULL,
	[DateCreated] [date] NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Email] [nvarchar](15) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_Member] PRIMARY KEY CLUSTERED 
(
	[MemberID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/* Object: Table GameProfile.[dbo].[GameLine] */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE GameProfile.[dbo].[GameLine](
	[GameLineID] [int] IDENTITY (10, 1) NOT NULL,
	[MemberID] [int] NOT NULL,
	[GameID] [int] NOT NULL,
 CONSTRAINT [PK_GameLine] PRIMARY KEY CLUSTERED 
(
	[GameLineID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/* Object: Table GameProfile.[dbo].[Games] */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE GameProfile.[dbo].[Games](
	[GameID] [int] IDENTITY (10, 1) NOT NULL,
	[GameName] [varchar](50) NOT NULL,
	[NumberOfUsers] [int] NOT NULL DEFAULT 0,
	[GameDesc] [varchar](300) NOT NULL,
	[DatePublished] [date] NOT NULL,
 CONSTRAINT [PK_Deparments] PRIMARY KEY CLUSTERED 
(
	[GameID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO






ALTER TABLE GameProfile.[dbo].GameLine
ADD CONSTRAINT FK_GameLine_GameID FOREIGN KEY (GameID) REFERENCES Games(GameID)

ALTER TABLE GameProfile.[dbo].GameLine
ADD CONSTRAINT FK_GameLine_MemberID FOREIGN KEY (MemberID) REFERENCES Members(MemberID)

--Games
INSERT INTO GameProfile.[dbo].Games(GameName, GameDesc, DatePublished)
VALUES ('Persona 3', 'This is a persona 3 description', '1994-10-10')

--Members
INSERT INTO GameProfile.[dbo].Members(Lname,FName,DateCreated,Username,Email, Password)
VALUES ('Robert','Siemens',GETDATE(),'Ricter','fake@gmail.com', '123');

--Gameline
INSERT INTO GameProfile.[dbo].GameLine(GameID, MemberID)
VALUES (10, 100 )