/****** Object:  Table [dbo].[Order]    Script Date: 10/04/2010 10:02:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderId] [int] IDENTITY(1,1) NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[Username] [nvarchar](256) NULL,
	[FirstName] [nvarchar](160) NULL,
	[LastName] [nvarchar](160) NULL,
	[Address] [nvarchar](70) NULL,
	[City] [nvarchar](40) NULL,
	[State] [nvarchar](40) NULL,
	[PostalCode] [nvarchar](10) NULL,
	[Country] [nvarchar](40) NULL,
	[Phone] [nvarchar](24) NULL,
	[Email] [nvarchar](160) NULL,
	[Total] [numeric](10, 2) NOT NULL,
 CONSTRAINT [PK__Invoice__D796AAB51A14E395] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
GO
CREATE NONCLUSTERED INDEX [IPK_Invoice] ON [dbo].[Order] 
(
	[OrderId] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF)
GO
/****** Object:  Table [dbo].[Genre]    Script Date: 10/04/2010 10:02:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genre](
	[GenreId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](120) NULL,
PRIMARY KEY CLUSTERED 
(
	[GenreId] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
GO
CREATE NONCLUSTERED INDEX [IPK_Genre] ON [dbo].[Genre] 
(
	[GenreId] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF)
GO
SET IDENTITY_INSERT [dbo].[Genre] ON
INSERT [dbo].[Genre] ([GenreId], [Name]) VALUES (1, N'Action')
INSERT [dbo].[Genre] ([GenreId], [Name]) VALUES (2, N'Adventure')
INSERT [dbo].[Genre] ([GenreId], [Name]) VALUES (3, N'Comedy')
INSERT [dbo].[Genre] ([GenreId], [Name]) VALUES (4, N'Horror')
INSERT [dbo].[Genre] ([GenreId], [Name]) VALUES (5, N'Biography')
INSERT [dbo].[Genre] ([GenreId], [Name]) VALUES (6, N'Musical')
INSERT [dbo].[Genre] ([GenreId], [Name]) VALUES (7, N'Sport')
INSERT [dbo].[Genre] ([GenreId], [Name]) VALUES (8, N'Crime')
SET IDENTITY_INSERT [dbo].[Genre] OFF
/****** Object:  Table [dbo].[Director]    Script Date: 10/04/2010 10:02:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Director](
	[DirectorId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](120) NULL,
PRIMARY KEY CLUSTERED 
(
	[DirectorId] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
GO
CREATE NONCLUSTERED INDEX [IPK_Director] ON [dbo].[Director] 
(
	[DirectorId] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF)
GO
SET IDENTITY_INSERT [dbo].[Director] ON
INSERT [dbo].[Director] ([DirectorId], [Name]) VALUES (1, N'Steven Spielberg')
INSERT [dbo].[Director] ([DirectorId], [Name]) VALUES (2, N'Martin Scorsese')
INSERT [dbo].[Director] ([DirectorId], [Name]) VALUES (3, N'Taika Waititi')
INSERT [dbo].[Director] ([DirectorId], [Name]) VALUES (4, N'Ridley Scott')
INSERT [dbo].[Director] ([DirectorId], [Name]) VALUES (5, N'Christopher Nolan')
INSERT [dbo].[Director] ([DirectorId], [Name]) VALUES (6, N'James Cameron')
INSERT [dbo].[Director] ([DirectorId], [Name]) VALUES (7, N'Todd Phillips')
INSERT [dbo].[Director] ([DirectorId], [Name]) VALUES (8, N'Peter Jackson')
INSERT [dbo].[Director] ([DirectorId], [Name]) VALUES (9, N'Ron Howard')
INSERT [dbo].[Director] ([DirectorId], [Name]) VALUES (10, N'David Fincher')
INSERT [dbo].[Director] ([DirectorId], [Name]) VALUES (11, N'Damien Chazelle')



SET IDENTITY_INSERT [dbo].[Director] OFF
/****** Object:  Table [dbo].[Movie]    Script Date: 10/04/2010 10:02:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movie](
	[MovieId] [int] IDENTITY(1,1) NOT NULL,
	[GenreId] [int] NOT NULL,
	[DirectorId] [int] NOT NULL,
	[Title] [nvarchar](160) NOT NULL,
	[Price] [numeric](10, 2) NOT NULL,
	[MovieArtUrl] [nvarchar](1024) NULL,
 CONSTRAINT [PK__Movie__97B4BE370AD2A005] PRIMARY KEY CLUSTERED 
(
	[MovieId] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
GO
CREATE NONCLUSTERED INDEX [IFK_Director_Movie] ON [dbo].[Movie] 
(
	[DirectorId] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF)
GO
CREATE NONCLUSTERED INDEX [IPK_ProductItem] ON [dbo].[Movie] 
(
	[MovieId] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF)
GO
SET IDENTITY_INSERT [dbo].[Movie] ON
INSERT [dbo].[Movie] ([MovieId], [GenreId], [DirectorId], [Title], [Price], [MovieArtUrl]) VALUES (1, 1, 1, N'Jurassic Park', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Movie] ([MovieId], [GenreId], [DirectorId], [Title], [Price], [MovieArtUrl]) VALUES (2, 5, 1, N'Lincoln', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Movie] ([MovieId], [GenreId], [DirectorId], [Title], [Price], [MovieArtUrl]) VALUES (3, 1, 2, N'The Departed', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Movie] ([MovieId], [GenreId], [DirectorId], [Title], [Price], [MovieArtUrl]) VALUES (4, 5, 2, N'The Wolf of Wall Street', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Movie] ([MovieId], [GenreId], [DirectorId], [Title], [Price], [MovieArtUrl]) VALUES (5, 2, 3, N'Thor', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Movie] ([MovieId], [GenreId], [DirectorId], [Title], [Price], [MovieArtUrl]) VALUES (6, 3, 3, N'Moana', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Movie] ([MovieId], [GenreId], [DirectorId], [Title], [Price], [MovieArtUrl]) VALUES (7, 1, 4, N'Gladiator', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Movie] ([MovieId], [GenreId], [DirectorId], [Title], [Price], [MovieArtUrl]) VALUES (8, 2, 4, N'The Martian', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Movie] ([MovieId], [GenreId], [DirectorId], [Title], [Price], [MovieArtUrl]) VALUES (9, 4, 4, N'Alien', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Movie] ([MovieId], [GenreId], [DirectorId], [Title], [Price], [MovieArtUrl]) VALUES (10, 1, 5, N'The Dark Knight', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Movie] ([MovieId], [GenreId], [DirectorId], [Title], [Price], [MovieArtUrl]) VALUES (11, 2, 5, N'Interstellar', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Movie] ([MovieId], [GenreId], [DirectorId], [Title], [Price], [MovieArtUrl]) VALUES (12, 8, 5, N'The Prestige', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Movie] ([MovieId], [GenreId], [DirectorId], [Title], [Price], [MovieArtUrl]) VALUES (13, 2, 6, N'Avatar', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Movie] ([MovieId], [GenreId], [DirectorId], [Title], [Price], [MovieArtUrl]) VALUES (14, 1, 10, N'Gone Girl', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Movie] ([MovieId], [GenreId], [DirectorId], [Title], [Price], [MovieArtUrl]) VALUES (15, 6, 7, N'The Hangover', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Movie] ([MovieId], [GenreId], [DirectorId], [Title], [Price], [MovieArtUrl]) VALUES (16, 2, 8, N'The Hobbit: An Unexpected Journey', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Movie] ([MovieId], [GenreId], [DirectorId], [Title], [Price], [MovieArtUrl]) VALUES (17, 7, 9, N'Rush', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Movie] ([MovieId], [GenreId], [DirectorId], [Title], [Price], [MovieArtUrl]) VALUES (18, 8, 9, N'Da Vinci Code', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Movie] ([MovieId], [GenreId], [DirectorId], [Title], [Price], [MovieArtUrl]) VALUES (19, 5, 10, N'The Social Network', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')
INSERT [dbo].[Movie] ([MovieId], [GenreId], [DirectorId], [Title], [Price], [MovieArtUrl]) VALUES (20, 6, 11, N'LA LA Land', CAST(8.99 AS Numeric(10, 2)), N'/Content/Images/placeholder.gif')



SET IDENTITY_INSERT [dbo].[Movie] OFF
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 10/04/2010 10:02:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[OrderDetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[MovieId] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
	[UnitPrice] [numeric](10, 2) NOT NULL,
 CONSTRAINT [PK__InvoiceL__0D760AD91DE57479] PRIMARY KEY CLUSTERED 
(
	[OrderDetailId] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
GO
CREATE NONCLUSTERED INDEX [IFK_Invoice_InvoiceLine] ON [dbo].[OrderDetail] 
(
	[OrderId] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF)
GO
CREATE NONCLUSTERED INDEX [IPK_InvoiceLine] ON [dbo].[OrderDetail] 
(
	[OrderDetailId] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF)
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 10/04/2010 10:02:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[RecordId] [int] IDENTITY(1,1) NOT NULL,
	[CartId] [varchar](50) NOT NULL,
	[MovieId] [int] NOT NULL,
	[Count] [int] NOT NULL,
	[DateCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_Cart] PRIMARY KEY CLUSTERED 
(
	[RecordId] ASC
)WITH (STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF)
)
GO
/****** Object:  Default [DF_Movie_MovieArtUrl]    Script Date: 10/04/2010 10:02:15 ******/
ALTER TABLE [dbo].[Movie] ADD  CONSTRAINT [DF_Movie_MovieArtUrl]  DEFAULT (N'/Content/Images/placeholder.gif') FOR [MovieArtUrl]
GO
/****** Object:  ForeignKey [FK__Movie__DirectorId__276EDEB3]    Script Date: 10/04/2010 10:02:15 ******/
ALTER TABLE [dbo].[Movie]  WITH CHECK ADD  CONSTRAINT [FK__Movie__DirectorId__276EDEB3] FOREIGN KEY([DirectorId])
REFERENCES [dbo].[Director] ([DirectorId])
GO
ALTER TABLE [dbo].[Movie] CHECK CONSTRAINT [FK__Movie__DirectorId__276EDEB3]
GO
/****** Object:  ForeignKey [FK_Movie_Genre]    Script Date: 10/04/2010 10:02:15 ******/
ALTER TABLE [dbo].[Movie]  WITH CHECK ADD  CONSTRAINT [FK_Movie_Genre] FOREIGN KEY([GenreId])
REFERENCES [dbo].[Genre] ([GenreId])
GO
ALTER TABLE [dbo].[Movie] CHECK CONSTRAINT [FK_Movie_Genre]
GO
/****** Object:  ForeignKey [FK__InvoiceLi__Invoi__2F10007B]    Script Date: 10/04/2010 10:02:15 ******/
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK__InvoiceLi__Invoi__2F10007B] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([OrderId])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK__InvoiceLi__Invoi__2F10007B]
GO
/****** Object:  ForeignKey [FK_InvoiceLine_Movie]    Script Date: 10/04/2010 10:02:15 ******/
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_InvoiceLine_Movie] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movie] ([MovieId])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_InvoiceLine_Movie]
GO
/****** Object:  ForeignKey [FK_Cart_Movie]    Script Date: 10/04/2010 10:02:15 ******/
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Movie] FOREIGN KEY([MovieId])
REFERENCES [dbo].[Movie] ([MovieId])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Movie]
GO
