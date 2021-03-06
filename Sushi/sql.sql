USE [master]
GO
/****** Object:  Database [Sushi]    Script Date: 11/02/2018 16:58:16 ******/
CREATE DATABASE [Sushi] ON  PRIMARY 
( NAME = N'Sushi', FILENAME = N'c:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\Sushi.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Sushi_log', FILENAME = N'c:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\Sushi_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Sushi] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Sushi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Sushi] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Sushi] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Sushi] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Sushi] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Sushi] SET ARITHABORT OFF
GO
ALTER DATABASE [Sushi] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Sushi] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Sushi] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Sushi] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Sushi] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Sushi] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Sushi] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Sushi] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Sushi] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Sushi] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Sushi] SET  DISABLE_BROKER
GO
ALTER DATABASE [Sushi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Sushi] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Sushi] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Sushi] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Sushi] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Sushi] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Sushi] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Sushi] SET  READ_WRITE
GO
ALTER DATABASE [Sushi] SET RECOVERY SIMPLE
GO
ALTER DATABASE [Sushi] SET  MULTI_USER
GO
ALTER DATABASE [Sushi] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Sushi] SET DB_CHAINING OFF
GO
USE [Sushi]
GO
/****** Object:  Table [dbo].[sushiMeal]    Script Date: 11/02/2018 16:58:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sushiMeal](
	[id] [int] NOT NULL,
	[name] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[photo] [nvarchar](50) NULL,
	[day_created] [date] NULL,
	[short_description] [nvarchar](max) NULL,
 CONSTRAINT [PK_sushiMeal] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[sushiMeal] ([id], [name], [description], [photo], [day_created], [short_description]) VALUES (0, N'Sushi0', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy <br>nibh euismod tincidunt ut laoreet dolore gna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortisnisl ut aliquip ex ea commodo consequat. <br>Claritas est etiam processus dynamicus, qui sequiturmutationem consuetudium lectorum. Mirum est notare quam littera gothica', N'sushi/sushi0.jpg', CAST(0xD73E0B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy <br>nibh euismod tincidunt ut laoreet dolore gna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortisnisl ut aliquip ex ea commodo consequat. <br>Claritas est etiam processus dynamicus, qui sequiturmutationem consuetudium lectorum. Mirum est notare quam littera gothica')
INSERT [dbo].[sushiMeal] ([id], [name], [description], [photo], [day_created], [short_description]) VALUES (1, N'24 types of sushi rolls', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy <br>nibh euismod tincidunt ut laoreet dolore gna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortisnisl ut aliquip ex ea commodo consequat. <br>Claritas est etiam processus dynamicus, qui sequiturmutationem consuetudium lectorum. Mirum est notare quam littera gothica', N'sushi/sushi1.jpg', CAST(0xE43E0B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy <br>nibh euismod tincidunt ut laoreet dolore gna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortisnisl ut aliquip ex ea commodo consequat. <br>Claritas est etiam processus dynamicus, qui sequiturmutationem consuetudium lectorum. Mirum est notare quam littera gothica')
INSERT [dbo].[sushiMeal] ([id], [name], [description], [photo], [day_created], [short_description]) VALUES (2, N'Sushi2', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy <br>nibh euismod tincidunt ut laoreet dolore gna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortisnisl ut aliquip ex ea commodo consequat. <br>Claritas est etiam processus dynamicus, qui sequiturmutationem consuetudium lectorum. Mirum est notare quam littera gothica', N'sushi/sushi2.jpg', CAST(0xD73E0B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy <br>nibh euismod tincidunt ut laoreet dolore gna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortisnisl ut aliquip ex ea commodo consequat. <br>Claritas est etiam processus dynamicus, qui sequiturmutationem consuetudium lectorum. Mirum est notare quam littera gothica')
INSERT [dbo].[sushiMeal] ([id], [name], [description], [photo], [day_created], [short_description]) VALUES (3, N'Sushi3', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy <br>nibh euismod tincidunt ut laoreet dolore gna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortisnisl ut aliquip ex ea commodo consequat. <br>Claritas est etiam processus dynamicus, qui sequiturmutationem consuetudium lectorum. Mirum est notare quam littera gothica', N'sushi/sushi3.jpg', CAST(0xE43E0B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy <br>nibh euismod tincidunt ut laoreet dolore gna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortisnisl ut aliquip ex ea commodo consequat. <br>Claritas est etiam processus dynamicus, qui sequiturmutationem consuetudium lectorum. Mirum est notare quam littera gothica')
INSERT [dbo].[sushiMeal] ([id], [name], [description], [photo], [day_created], [short_description]) VALUES (4, N'Sushi4', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy <br>nibh euismod tincidunt ut laoreet dolore gna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortisnisl ut aliquip ex ea commodo consequat. <br>Claritas est etiam processus dynamicus, qui sequiturmutationem consuetudium lectorum. Mirum est notare quam littera gothica', N'sushi/sushi4.jpg', CAST(0xD73E0B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy <br>nibh euismod tincidunt ut laoreet dolore gna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortisnisl ut aliquip ex ea commodo consequat. <br>Claritas est etiam processus dynamicus, qui sequiturmutationem consuetudium lectorum. Mirum est notare quam littera gothica')
INSERT [dbo].[sushiMeal] ([id], [name], [description], [photo], [day_created], [short_description]) VALUES (5, N'Sushi5', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy <br>nibh euismod tincidunt ut laoreet dolore gna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortisnisl ut aliquip ex ea commodo consequat. <br>Claritas est etiam processus dynamicus, qui sequiturmutationem consuetudium lectorum. Mirum est notare quam littera gothica', N'sushi/sushi5.jpg', CAST(0xE43E0B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy <br>nibh euismod tincidunt ut laoreet dolore gna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortisnisl ut aliquip ex ea commodo consequat. <br>Claritas est etiam processus dynamicus, qui sequiturmutationem consuetudium lectorum. Mirum est notare quam littera gothica')
INSERT [dbo].[sushiMeal] ([id], [name], [description], [photo], [day_created], [short_description]) VALUES (6, N'Sushi6', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy <br>nibh euismod tincidunt ut laoreet dolore gna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortisnisl ut aliquip ex ea commodo consequat. <br>Claritas est etiam processus dynamicus, qui sequiturmutationem consuetudium lectorum. Mirum est notare quam littera gothica', N'sushi/sushi6.jpg', CAST(0xD73E0B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy <br>nibh euismod tincidunt ut laoreet dolore gna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortisnisl ut aliquip ex ea commodo consequat. <br>Claritas est etiam processus dynamicus, qui sequiturmutationem consuetudium lectorum. Mirum est notare quam littera gothica')
INSERT [dbo].[sushiMeal] ([id], [name], [description], [photo], [day_created], [short_description]) VALUES (7, N'Sushi7', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy <br>nibh euismod tincidunt ut laoreet dolore gna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortisnisl ut aliquip ex ea commodo consequat. <br>Claritas est etiam processus dynamicus, qui sequiturmutationem consuetudium lectorum. Mirum est notare quam littera gothica', N'sushi/sushi7.jpg', CAST(0xE43E0B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy <br>nibh euismod tincidunt ut laoreet dolore gna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortisnisl ut aliquip ex ea commodo consequat. <br>Claritas est etiam processus dynamicus, qui sequiturmutationem consuetudium lectorum. Mirum est notare quam littera gothica')
INSERT [dbo].[sushiMeal] ([id], [name], [description], [photo], [day_created], [short_description]) VALUES (8, N'Sushi8', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy <br>nibh euismod tincidunt ut laoreet dolore gna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortisnisl ut aliquip ex ea commodo consequat. <br>Claritas est etiam processus dynamicus, qui sequiturmutationem consuetudium lectorum. Mirum est notare quam littera gothica', N'sushi/sushi8.jpg', CAST(0xD73E0B00 AS Date), N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy <br>nibh euismod tincidunt ut laoreet dolore gna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortisnisl ut aliquip ex ea commodo consequat. <br>Claritas est etiam processus dynamicus, qui sequiturmutationem consuetudium lectorum. Mirum est notare quam littera gothica')
/****** Object:  Table [dbo].[sushiInfo]    Script Date: 11/02/2018 16:58:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sushiInfo](
	[id] [int] NOT NULL,
	[address] [nvarchar](max) NULL,
	[tel] [nvarchar](50) NULL,
	[email] [nvarchar](max) NULL,
	[photoPath] [nvarchar](50) NULL,
	[schedule] [nvarchar](max) NULL,
 CONSTRAINT [PK_sushiInfo] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[sushiInfo] ([id], [address], [tel], [email], [photoPath], [schedule]) VALUES (0, N'The Sushi Restaurant<br>New York, NY, USA', N'       123456', N'Email:  your-email@your-email.com', N'map/GGMap.png', N'Monday Closed<br>Tuesday 12 - 22<br>Wednesday 12 - 22<br>Thursday 12 - 22<br>Friday 11 - 23<br>Saturday 11 - 23<br>Sunday 11 - 22<br>')
/****** Object:  Table [dbo].[menu]    Script Date: 11/02/2018 16:58:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[menu](
	[id] [int] NOT NULL,
	[name] [nvarchar](max) NULL,
	[description] [nvarchar](max) NULL,
	[shortDescription] [nvarchar](max) NULL,
	[price] [nvarchar](50) NULL,
	[day_created] [date] NULL,
 CONSTRAINT [PK_menu] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[menu] ([id], [name], [description], [shortDescription], [price], [day_created]) VALUES (1, N'Menu 1', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy <br>nibh euismod tincidunt ut laoreet dolore gna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortisnisl ut aliquip ex ea commodo consequat. <br>Claritas est etiam processus dynamicus, qui sequiturmutationem consuetudium lectorum. Mirum est notare quam littera gothica', N'Claritas est etiam processus', N'15.00', CAST(0xE53E0B00 AS Date))
INSERT [dbo].[menu] ([id], [name], [description], [shortDescription], [price], [day_created]) VALUES (2, N'Menu 2', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy <br>nibh euismod tincidunt ut laoreet dolore gna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortisnisl ut aliquip ex ea commodo consequat. <br>Claritas est etiam processus dynamicus, qui sequiturmutationem consuetudium lectorum. Mirum est notare quam littera gothica', N'Duis autem vel eum iriure dolor.', N'20.00', CAST(0xE53E0B00 AS Date))
INSERT [dbo].[menu] ([id], [name], [description], [shortDescription], [price], [day_created]) VALUES (3, N'Menu 3', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy <br>nibh euismod tincidunt ut laoreet dolore gna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortisnisl ut aliquip ex ea commodo consequat. <br>Claritas est etiam processus dynamicus, qui sequiturmutationem consuetudium lectorum. Mirum est notare quam littera gothica', N'Eodem modo typi, qui nunc nobis videntur.', N'25.00', CAST(0xE53E0B00 AS Date))
INSERT [dbo].[menu] ([id], [name], [description], [shortDescription], [price], [day_created]) VALUES (4, N'Menu 4', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy <br>nibh euismod tincidunt ut laoreet dolore gna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortisnisl ut aliquip ex ea commodo consequat. <br>Claritas est etiam processus dynamicus, qui sequiturmutationem consuetudium lectorum. Mirum est notare quam littera gothica', N'Claritas est etiam processus', N'30.00', CAST(0xD03E0B00 AS Date))
INSERT [dbo].[menu] ([id], [name], [description], [shortDescription], [price], [day_created]) VALUES (5, N'Menu 5', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy <br>nibh euismod tincidunt ut laoreet dolore gna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortisnisl ut aliquip ex ea commodo consequat. <br>Claritas est etiam processus dynamicus, qui sequiturmutationem consuetudium lectorum. Mirum est notare quam littera gothica', N'Duis autem vel eum iriure dolor.', N'30.00', CAST(0xDF3E0B00 AS Date))
INSERT [dbo].[menu] ([id], [name], [description], [shortDescription], [price], [day_created]) VALUES (6, N'Menu 6', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy <br>nibh euismod tincidunt ut laoreet dolore gna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortisnisl ut aliquip ex ea commodo consequat. <br>Claritas est etiam processus dynamicus, qui sequiturmutationem consuetudium lectorum. Mirum est notare quam littera gothica', N'Eodem modo typi, qui nunc nobis videntur.', N'40.00', CAST(0xE53E0B00 AS Date))
INSERT [dbo].[menu] ([id], [name], [description], [shortDescription], [price], [day_created]) VALUES (7, N'Menu 7', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy <br>nibh euismod tincidunt ut laoreet dolore gna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortisnisl ut aliquip ex ea commodo consequat. <br>Claritas est etiam processus dynamicus, qui sequiturmutationem consuetudium lectorum. Mirum est notare quam littera gothica', N'Claritas est etiam processus', N'30.00', CAST(0xE53E0B00 AS Date))
INSERT [dbo].[menu] ([id], [name], [description], [shortDescription], [price], [day_created]) VALUES (8, N'Menu 8', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy <br>nibh euismod tincidunt ut laoreet dolore gna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortisnisl ut aliquip ex ea commodo consequat. <br>Claritas est etiam processus dynamicus, qui sequiturmutationem consuetudium lectorum. Mirum est notare quam littera gothica', N'Duis autem vel eum iriure dolor.', N'30.00', CAST(0xE53E0B00 AS Date))
INSERT [dbo].[menu] ([id], [name], [description], [shortDescription], [price], [day_created]) VALUES (9, N'Menu 9', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy <br>nibh euismod tincidunt ut laoreet dolore gna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortisnisl ut aliquip ex ea commodo consequat. <br>Claritas est etiam processus dynamicus, qui sequiturmutationem consuetudium lectorum. Mirum est notare quam littera gothica', N'Eodem modo typi, qui nunc nobis videntur.', N'30.00', CAST(0xE53E0B00 AS Date))
INSERT [dbo].[menu] ([id], [name], [description], [shortDescription], [price], [day_created]) VALUES (10, N'Menu 10', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy <br>nibh euismod tincidunt ut laoreet dolore gna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortisnisl ut aliquip ex ea commodo consequat. <br>Claritas est etiam processus dynamicus, qui sequiturmutationem consuetudium lectorum. Mirum est notare quam littera gothica', N'Claritas est etiam processus', N'30.00', CAST(0xE53E0B00 AS Date))
