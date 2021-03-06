USE [master]
GO
/****** Object:  Database [Church]    Script Date: 11/09/2018 17:29:10 ******/
CREATE DATABASE [Church] ON  PRIMARY 
( NAME = N'Church', FILENAME = N'c:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\Church.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Church_log', FILENAME = N'c:\Program Files (x86)\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\Church_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Church] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Church].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Church] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [Church] SET ANSI_NULLS OFF
GO
ALTER DATABASE [Church] SET ANSI_PADDING OFF
GO
ALTER DATABASE [Church] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [Church] SET ARITHABORT OFF
GO
ALTER DATABASE [Church] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [Church] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [Church] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [Church] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [Church] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [Church] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [Church] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [Church] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [Church] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [Church] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [Church] SET  DISABLE_BROKER
GO
ALTER DATABASE [Church] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [Church] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [Church] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [Church] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [Church] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [Church] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [Church] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [Church] SET  READ_WRITE
GO
ALTER DATABASE [Church] SET RECOVERY SIMPLE
GO
ALTER DATABASE [Church] SET  MULTI_USER
GO
ALTER DATABASE [Church] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [Church] SET DB_CHAINING OFF
GO
USE [Church]
GO
/****** Object:  Table [dbo].[Services]    Script Date: 11/09/2018 17:29:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Services](
	[id] [int] NOT NULL,
	[name] [text] NULL,
	[description] [text] NULL,
	[schedule] [date] NULL,
 CONSTRAINT [PK_Services] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Services] ([id], [name], [description], [schedule]) VALUES (1, N'Sunday Prayer', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt', CAST(0xDD3A0B00 AS Date))
INSERT [dbo].[Services] ([id], [name], [description], [schedule]) VALUES (2, N'Sunday Prayer', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt', CAST(0xE43A0B00 AS Date))
INSERT [dbo].[Services] ([id], [name], [description], [schedule]) VALUES (3, N'Mid-week Prayer', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt', CAST(0xE73A0B00 AS Date))
INSERT [dbo].[Services] ([id], [name], [description], [schedule]) VALUES (4, N'Sunday Prayer', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt', CAST(0xE73A0B00 AS Date))
INSERT [dbo].[Services] ([id], [name], [description], [schedule]) VALUES (5, N'Sunday Prayer', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt', CAST(0xE73A0B00 AS Date))
INSERT [dbo].[Services] ([id], [name], [description], [schedule]) VALUES (6, N'Sunday Prayer', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt', CAST(0xE73A0B00 AS Date))
INSERT [dbo].[Services] ([id], [name], [description], [schedule]) VALUES (7, N'Sunday Prayer', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt', CAST(0xE73A0B00 AS Date))
/****** Object:  Table [dbo].[Prayers]    Script Date: 11/09/2018 17:29:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prayers](
	[id] [int] NOT NULL,
	[prayerTitle] [nvarchar](max) NULL,
	[prayerDes] [nvarchar](max) NULL,
	[prayerPhoto] [nvarchar](max) NULL,
 CONSTRAINT [PK_Prayers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Prayers] ([id], [prayerTitle], [prayerDes], [prayerPhoto]) VALUES (1, N'Healing Prayer1', N'Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius.', N'prayers/prayer2.jpg')
INSERT [dbo].[Prayers] ([id], [prayerTitle], [prayerDes], [prayerPhoto]) VALUES (2, N'Healing Prayer2', N'Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius.', N'prayers/prayer3.jpg')
INSERT [dbo].[Prayers] ([id], [prayerTitle], [prayerDes], [prayerPhoto]) VALUES (3, N'Healing Prayer3', N'Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius.', N'prayers/prayer4.jpg')
INSERT [dbo].[Prayers] ([id], [prayerTitle], [prayerDes], [prayerPhoto]) VALUES (4, N'Healing Prayer4', N'Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius.', N'prayers/prayer5.jpg')
INSERT [dbo].[Prayers] ([id], [prayerTitle], [prayerDes], [prayerPhoto]) VALUES (5, N'Healing Prayer5', N'Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius.', N'prayers/prayer6.jpg')
INSERT [dbo].[Prayers] ([id], [prayerTitle], [prayerDes], [prayerPhoto]) VALUES (6, N'Healing Prayer6', N'Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius.', N'prayers/prayer7.jpg')
INSERT [dbo].[Prayers] ([id], [prayerTitle], [prayerDes], [prayerPhoto]) VALUES (7, N'Healing Prayer7', N'Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius.', N'prayers/prayer8.jpg')
INSERT [dbo].[Prayers] ([id], [prayerTitle], [prayerDes], [prayerPhoto]) VALUES (8, N'Healing Prayer8', N'Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius.', N'prayers/prayer9.jpg')
INSERT [dbo].[Prayers] ([id], [prayerTitle], [prayerDes], [prayerPhoto]) VALUES (9, N'Healing Prayer9', N'Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Typi non habent claritatem insitam; est usus legentis in iis qui facit eorum claritatem. Investigationes demonstraverunt lectores legere me lius quod ii legunt saepius.', N'prayers/prayer10.jpg')
/****** Object:  Table [dbo].[Info]    Script Date: 11/09/2018 17:29:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info](
	[id] [int] NOT NULL,
	[address] [nvarchar](max) NULL,
	[tel] [nvarchar](50) NULL,
	[email] [nvarchar](max) NULL,
	[photoPath] [nvarchar](50) NULL,
	[city] [nvarchar](max) NULL,
	[country] [nvarchar](max) NULL,
 CONSTRAINT [PK_Info] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Info] ([id], [address], [tel], [email], [photoPath], [city], [country]) VALUES (1, N' 221B Baker Street', N'      123456', N'your-email@your-email.com', N'contact/GGMap.PNG', N'Aarhus', N'Denmark')
/****** Object:  Table [dbo].[HomePage]    Script Date: 11/09/2018 17:29:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HomePage](
	[id] [int] NOT NULL,
	[bannerPhoto] [nvarchar](max) NULL,
	[introImage] [nvarchar](max) NULL,
	[introTitle] [text] NULL,
	[introDes] [text] NULL,
	[aboutTitle] [text] NULL,
	[aboutDes] [text] NULL,
	[aboutImage] [nvarchar](max) NULL,
	[authorName] [nvarchar](max) NULL,
	[authorImage] [nvarchar](max) NULL,
 CONSTRAINT [PK_homePage] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[HomePage] ([id], [bannerPhoto], [introImage], [introTitle], [introDes], [aboutTitle], [aboutDes], [aboutImage], [authorName], [authorImage]) VALUES (1, N'general/banner.PNG', N'home/introImage.jpg', N'Welcome to Your Local Community Church', N'Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zril delenit augue duis dolore te feugait nulla facilisi.', N'About Our Church', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim ad minim veniam, quis nostrud exerci tation ullamcorper suscipit lobortis nisl ut aliquip ex ea commodo consequat. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis at vero eros et accumsan et iusto odio dignissim qui blandit praesent luptatum zzril delenit augue duis dolore te feugait nulla facilisi. Nam liber tempor cum soluta nobis eleifend option congue nihil imperdiet doming id quod mazim placerat facer possim assum. Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis', N'home/aboutImage.jpg', N'Pastor Russell', N'home/authorImage.jpg')
INSERT [dbo].[HomePage] ([id], [bannerPhoto], [introImage], [introTitle], [introDes], [aboutTitle], [aboutDes], [aboutImage], [authorName], [authorImage]) VALUES (2, NULL, NULL, N'Prayers', N'Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt ut laoreet dolore magna aliquam erat volutpat.', NULL, NULL, NULL, NULL, NULL)
