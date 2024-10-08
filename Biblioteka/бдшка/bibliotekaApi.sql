USE [BibliotekaAPI]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 08.10.2024 8:24:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Books]    Script Date: 08.10.2024 8:24:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Author] [nvarchar](max) NOT NULL,
	[PublicationYear] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[AvailableCopies] [int] NOT NULL,
	[Genre_id] [int] NULL,
	[Readers_id] [int] NULL,
 CONSTRAINT [PK_Books] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genres]    Script Date: 08.10.2024 8:24:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genres](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Genres] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Readers]    Script Date: 08.10.2024 8:24:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Readers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[ContactDetails] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Readers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rental]    Script Date: 08.10.2024 8:24:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rental](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RentalDate] [datetime2](7) NOT NULL,
	[DueDate] [datetime2](7) NOT NULL,
	[ReturnDate] [datetime2](7) NULL,
	[reader_id] [int] NULL,
	[books_id] [int] NULL,
	[status_rental] [nvarchar](max) NULL,
 CONSTRAINT [PK_Rental] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20241001055211_first', N'8.0.8')
GO
SET IDENTITY_INSERT [dbo].[Books] ON 

INSERT [dbo].[Books] ([Id], [Title], [Author], [PublicationYear], [Description], [AvailableCopies], [Genre_id], [Readers_id]) VALUES (1, N'gf', N'gf', 4324, N'gf', 43, 1, 2)
INSERT [dbo].[Books] ([Id], [Title], [Author], [PublicationYear], [Description], [AvailableCopies], [Genre_id], [Readers_id]) VALUES (2, N'gf', N'hg', 667, N'kju', 46, 1, 3)
SET IDENTITY_INSERT [dbo].[Books] OFF
GO
SET IDENTITY_INSERT [dbo].[Genres] ON 

INSERT [dbo].[Genres] ([Id], [Name]) VALUES (1, N'gf')
SET IDENTITY_INSERT [dbo].[Genres] OFF
GO
SET IDENTITY_INSERT [dbo].[Readers] ON 

INSERT [dbo].[Readers] ([Id], [FirstName], [LastName], [ContactDetails]) VALUES (2, N'h', N'jh', N'5')
INSERT [dbo].[Readers] ([Id], [FirstName], [LastName], [ContactDetails]) VALUES (3, N'gf', N'hg', N'8')
SET IDENTITY_INSERT [dbo].[Readers] OFF
GO
SET IDENTITY_INSERT [dbo].[Rental] ON 

INSERT [dbo].[Rental] ([Id], [RentalDate], [DueDate], [ReturnDate], [reader_id], [books_id], [status_rental]) VALUES (5, CAST(N'2024-10-01T07:04:07.2190000' AS DateTime2), CAST(N'2024-10-01T07:04:07.2190000' AS DateTime2), CAST(N'2024-10-01T07:04:07.2190000' AS DateTime2), 2, 2, N'да')
INSERT [dbo].[Rental] ([Id], [RentalDate], [DueDate], [ReturnDate], [reader_id], [books_id], [status_rental]) VALUES (6, CAST(N'2004-12-30T00:00:00.0000000' AS DateTime2), CAST(N'2004-12-30T00:00:00.0000000' AS DateTime2), CAST(N'2004-12-30T00:00:00.0000000' AS DateTime2), 3, 2, N'нет')
SET IDENTITY_INSERT [dbo].[Rental] OFF
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Genres] FOREIGN KEY([Genre_id])
REFERENCES [dbo].[Genres] ([Id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Genres]
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Readers] FOREIGN KEY([Readers_id])
REFERENCES [dbo].[Readers] ([Id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Readers]
GO
ALTER TABLE [dbo].[Rental]  WITH CHECK ADD  CONSTRAINT [FK_Rental_Books] FOREIGN KEY([books_id])
REFERENCES [dbo].[Books] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Rental] CHECK CONSTRAINT [FK_Rental_Books]
GO
ALTER TABLE [dbo].[Rental]  WITH CHECK ADD  CONSTRAINT [FK_Rental_Readers] FOREIGN KEY([reader_id])
REFERENCES [dbo].[Readers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Rental] CHECK CONSTRAINT [FK_Rental_Readers]
GO
