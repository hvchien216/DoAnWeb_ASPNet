USE [master]
GO
/****** Object:  Database [doan_asp_DB]    Script Date: 1/13/2020 8:25:07 PM ******/
CREATE DATABASE [doan_asp_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'doan_asp_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQL_EN2012\MSSQL\DATA\doan_asp_DB.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'doan_asp_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQL_EN2012\MSSQL\DATA\doan_asp_DB_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [doan_asp_DB] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [doan_asp_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [doan_asp_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [doan_asp_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [doan_asp_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [doan_asp_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [doan_asp_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [doan_asp_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [doan_asp_DB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [doan_asp_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [doan_asp_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [doan_asp_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [doan_asp_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [doan_asp_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [doan_asp_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [doan_asp_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [doan_asp_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [doan_asp_DB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [doan_asp_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [doan_asp_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [doan_asp_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [doan_asp_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [doan_asp_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [doan_asp_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [doan_asp_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [doan_asp_DB] SET RECOVERY FULL 
GO
ALTER DATABASE [doan_asp_DB] SET  MULTI_USER 
GO
ALTER DATABASE [doan_asp_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [doan_asp_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [doan_asp_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [doan_asp_DB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'doan_asp_DB', N'ON'
GO
USE [doan_asp_DB]
GO
/****** Object:  Table [dbo].[comment]    Script Date: 1/13/2020 8:25:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[comment](
	[comment_id] [int] IDENTITY(1,1) NOT NULL,
	[cus_email] [varchar](255) NULL,
	[cus_name] [nvarchar](200) NULL,
	[des] [nvarchar](500) NULL,
	[status] [int] NULL,
	[created] [datetime] NULL,
	[post_id] [int] NULL,
	[rep_id] [int] NULL,
 CONSTRAINT [PK_comment] PRIMARY KEY CLUSTERED 
(
	[comment_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[customer]    Script Date: 1/13/2020 8:25:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[customer](
	[username] [varchar](50) NOT NULL,
	[password] [varchar](255) NULL,
	[name] [nvarchar](200) NULL,
	[phone] [varchar](20) NULL,
	[email] [varchar](255) NULL,
	[address] [nvarchar](300) NULL,
	[num_order] [int] NULL,
	[num_successful_order] [int] NULL,
	[sum] [decimal](10, 2) NULL,
	[status] [int] NULL,
	[created] [datetime] NULL,
 CONSTRAINT [PK_customer] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[food]    Script Date: 1/13/2020 8:25:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[food](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[description] [ntext] NULL,
	[price] [int] NULL,
	[price_promo] [int] NULL,
	[thumb] [varchar](255) NULL,
	[img] [varchar](255) NULL,
	[unit] [nvarchar](10) NULL,
	[percent_promo] [int] NULL,
	[rating] [int] NULL,
	[sold] [int] NULL,
	[point] [int] NULL,
	[type] [int] NULL,
	[status] [int] NULL,
	[username] [varchar](50) NULL,
	[modified] [datetime] NULL,
	[xoa] [bit] NULL,
 CONSTRAINT [PK_food] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[food_type]    Script Date: 1/13/2020 8:25:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[food_type](
	[type_id] [int] IDENTITY(1,1) NOT NULL,
	[type_name] [nvarchar](50) NULL,
	[type_pos] [int] NULL,
	[type_img] [varchar](255) NULL,
	[status] [int] NULL,
	[username] [varchar](50) NULL,
	[modified] [datetime] NULL,
	[xoa] [bit] NULL,
 CONSTRAINT [PK_food_type] PRIMARY KEY CLUSTERED 
(
	[type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[log_activity]    Script Date: 1/13/2020 8:25:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[log_activity](
	[log_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NULL,
	[description] [nvarchar](300) NULL,
	[time_log] [datetime] NULL,
	[type] [int] NULL,
 CONSTRAINT [PK_log_activity] PRIMARY KEY CLUSTERED 
(
	[log_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[member]    Script Date: 1/13/2020 8:25:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[member](
	[username] [varchar](50) NOT NULL,
	[pass] [varchar](255) NULL,
	[name] [nvarchar](200) NULL,
	[phone] [varchar](20) NULL,
	[role] [int] NULL,
	[status] [int] NULL,
	[email] [varchar](255) NULL,
	[xoa] [bit] NULL,
 CONSTRAINT [PK_member] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[order]    Script Date: 1/13/2020 8:25:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[order](
	[order_id] [int] IDENTITY(1,1) NOT NULL,
	[cus_name] [nvarchar](100) NULL,
	[cus_phone] [varchar](50) NULL,
	[cus_add] [nvarchar](255) NULL,
	[quan] [int] NULL,
	[sum] [int] NULL,
	[status] [int] NULL,
	[username] [varchar](50) NULL,
	[modified] [datetime] NULL,
	[created] [datetime] NULL,
	[cus_username] [varchar](50) NULL,
 CONSTRAINT [PK_order] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[order_detail]    Script Date: 1/13/2020 8:25:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_detail](
	[order_id] [int] NOT NULL,
	[food_id] [int] NOT NULL,
	[quan] [int] NULL,
	[unit] [nvarchar](10) NULL,
	[price] [int] NULL,
	[total] [int] NULL,
 CONSTRAINT [PK_order_detail] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC,
	[food_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[post]    Script Date: 1/13/2020 8:25:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[post](
	[post_id] [int] IDENTITY(1,1) NOT NULL,
	[title] [nvarchar](300) NULL,
	[short_des] [nvarchar](500) NULL,
	[des] [nvarchar](max) NULL,
	[imt] [varchar](255) NULL,
	[status] [int] NULL,
	[username] [varchar](50) NULL,
	[modified] [datetime] NULL,
	[created] [datetime] NULL,
 CONSTRAINT [PK_post] PRIMARY KEY CLUSTERED 
(
	[post_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[relative_food]    Script Date: 1/13/2020 8:25:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[relative_food](
	[food1_id] [int] NOT NULL,
	[food2_id] [int] NOT NULL,
	[des] [nvarchar](200) NULL,
 CONSTRAINT [PK_relative_food] PRIMARY KEY CLUSTERED 
(
	[food1_id] ASC,
	[food2_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[setting]    Script Date: 1/13/2020 8:25:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[setting](
	[id_setting] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](200) NULL,
	[des] [nvarchar](500) NULL,
	[value] [nvarchar](max) NULL,
	[username] [varchar](50) NULL,
	[modified] [datetime] NULL,
 CONSTRAINT [PK_setting] PRIMARY KEY CLUSTERED 
(
	[id_setting] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[slider]    Script Date: 1/13/2020 8:25:07 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[slider](
	[slide_id] [int] IDENTITY(1,1) NOT NULL,
	[id_object] [int] NULL,
	[img] [varchar](255) NULL,
	[capotion] [nvarchar](200) NULL,
	[type] [int] NULL,
	[rank] [int] NULL,
	[status] [int] NULL,
	[username] [varchar](50) NULL,
	[modified] [datetime] NULL,
 CONSTRAINT [PK_slider] PRIMARY KEY CLUSTERED 
(
	[slide_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[food] ON 

INSERT [dbo].[food] ([id], [name], [description], [price], [price_promo], [thumb], [img], [unit], [percent_promo], [rating], [sold], [point], [type], [status], [username], [modified], [xoa]) VALUES (4, N'BELL PEPPER', N'This is Bell Pepper...', 79, 79, N'hinh (1).jpg', N'hinh (1).jpg', N'1', 4, 5, 2, 5, 50, 0, N'chien1', CAST(N'2019-12-23 21:50:02.000' AS DateTime), 0)
INSERT [dbo].[food] ([id], [name], [description], [price], [price_promo], [thumb], [img], [unit], [percent_promo], [rating], [sold], [point], [type], [status], [username], [modified], [xoa]) VALUES (5, N'STRAWBERRY', N'This is strawberry', 120, 120, N'product-2.jpg', N'product-2.jpg', N'1', 4, 2, 2, 7, 51, 0, N'chien1', CAST(N'2019-12-20 14:15:39.000' AS DateTime), 0)
INSERT [dbo].[food] ([id], [name], [description], [price], [price_promo], [thumb], [img], [unit], [percent_promo], [rating], [sold], [point], [type], [status], [username], [modified], [xoa]) VALUES (6, N'GREAN BEANS', N'This is Grean Beans...', 121, 120, N'hinh (3).jpg', N'hinh (3).jpg', N'1', 4, 8, 2, 13, 50, 0, N'chien1', CAST(N'2019-12-23 21:26:31.000' AS DateTime), 0)
INSERT [dbo].[food] ([id], [name], [description], [price], [price_promo], [thumb], [img], [unit], [percent_promo], [rating], [sold], [point], [type], [status], [username], [modified], [xoa]) VALUES (7, N'PURPLE CABBAGE', N'This is PURPLE CABBAGE', 89, 89, N'hinh (4).jpg', N'hinh (4).jpg', N'1', 4, 9, 2, 9, 50, 0, N'chien1', CAST(N'2019-12-16 21:08:01.000' AS DateTime), 0)
INSERT [dbo].[food] ([id], [name], [description], [price], [price_promo], [thumb], [img], [unit], [percent_promo], [rating], [sold], [point], [type], [status], [username], [modified], [xoa]) VALUES (8, N'TOMATOE', N'This is Tomatoe', 50, 50, N'hinh (5).jpg', N'hinh (5).jpg', N'1', 4, 5, 2, 4, 51, 0, N'chien1', CAST(N'2019-12-16 21:08:43.000' AS DateTime), 0)
INSERT [dbo].[food] ([id], [name], [description], [price], [price_promo], [thumb], [img], [unit], [percent_promo], [rating], [sold], [point], [type], [status], [username], [modified], [xoa]) VALUES (9, N'BROCOLLI', N'This is BROCOLLI', 34, 34, N'hinh (6).jpg', N'hinh (6).jpg', N'1', 4, 4, 2, 3, 50, 0, N'chien1', CAST(N'2019-12-16 21:09:22.000' AS DateTime), 0)
INSERT [dbo].[food] ([id], [name], [description], [price], [price_promo], [thumb], [img], [unit], [percent_promo], [rating], [sold], [point], [type], [status], [username], [modified], [xoa]) VALUES (10, N'CARROTS', N'This is CARROTS', 65, 65, N'hinh (7).jpg', N'hinh (7).jpg', N'1', 4, 4, 2, 2, 51, 0, N'chien1', CAST(N'2019-12-16 21:09:49.000' AS DateTime), 0)
INSERT [dbo].[food] ([id], [name], [description], [price], [price_promo], [thumb], [img], [unit], [percent_promo], [rating], [sold], [point], [type], [status], [username], [modified], [xoa]) VALUES (11, N'FRUIT JUICE', N'This is FRUIT JUICE', 67, 67, N'hinh (8).jpg', N'hinh (8).jpg', N'1', 4, 3, 2, 1, 52, 0, N'chien1', CAST(N'2019-12-16 21:10:17.000' AS DateTime), 0)
INSERT [dbo].[food] ([id], [name], [description], [price], [price_promo], [thumb], [img], [unit], [percent_promo], [rating], [sold], [point], [type], [status], [username], [modified], [xoa]) VALUES (12, N'ONION', N'This is ONION', 87, 87, N'hinh (9).jpg', N'hinh (9).jpg', N'1', 4, 2, 2, 1, 50, 0, N'chien1', CAST(N'2019-12-16 21:10:47.000' AS DateTime), 0)
INSERT [dbo].[food] ([id], [name], [description], [price], [price_promo], [thumb], [img], [unit], [percent_promo], [rating], [sold], [point], [type], [status], [username], [modified], [xoa]) VALUES (13, N'APPLE', N'This is APPLE', 22, 22, N'hinh (10).jpg', N'hinh (10).jpg', N'1', 4, 2, 2, 2, 51, 0, N'chien1', CAST(N'2019-12-16 21:11:27.000' AS DateTime), 0)
INSERT [dbo].[food] ([id], [name], [description], [price], [price_promo], [thumb], [img], [unit], [percent_promo], [rating], [sold], [point], [type], [status], [username], [modified], [xoa]) VALUES (14, N'GARLIC', N'This is GARLIC', 55, 55, N'hinh (11).jpg', N'hinh (11).jpg', N'1', 4, 1, 2, 1, 50, 0, N'chien1', CAST(N'2019-12-16 21:12:00.000' AS DateTime), 0)
INSERT [dbo].[food] ([id], [name], [description], [price], [price_promo], [thumb], [img], [unit], [percent_promo], [rating], [sold], [point], [type], [status], [username], [modified], [xoa]) VALUES (15, N'CHILLI', N'This is CHILLI', 44, 44, N'hinh (12).jpg', N'hinh (12).jpg', N'1', 4, 1, 2, 3, 51, 0, N'chien1', CAST(N'2019-12-16 21:12:42.000' AS DateTime), 0)
INSERT [dbo].[food] ([id], [name], [description], [price], [price_promo], [thumb], [img], [unit], [percent_promo], [rating], [sold], [point], [type], [status], [username], [modified], [xoa]) VALUES (16, N'MILK TEA', N'This is MILK TEA', 33, 33, N'product-1.jpg', N'product-1.jpg', N'1', 4, 1, 2, 1, 52, 0, N'thuyhang', CAST(N'2019-12-23 21:28:43.000' AS DateTime), 0)
INSERT [dbo].[food] ([id], [name], [description], [price], [price_promo], [thumb], [img], [unit], [percent_promo], [rating], [sold], [point], [type], [status], [username], [modified], [xoa]) VALUES (17, N'LEMON JUICE', N'This is LEMON JUICE', 88, 88, N'product-2.jpg', N'product-2.jpg', N'1', 4, 1, 2, 1, 52, 0, N'chien1', CAST(N'2019-12-16 21:14:59.000' AS DateTime), 0)
INSERT [dbo].[food] ([id], [name], [description], [price], [price_promo], [thumb], [img], [unit], [percent_promo], [rating], [sold], [point], [type], [status], [username], [modified], [xoa]) VALUES (18, N'BANANA', N'This is BANANA', 76, 76, N'product-3.jpg', N'product-3.jpg', N'1', 5, 3, 2, 3, 51, 0, N'chien1', CAST(N'2019-12-16 21:15:50.000' AS DateTime), 0)
INSERT [dbo].[food] ([id], [name], [description], [price], [price_promo], [thumb], [img], [unit], [percent_promo], [rating], [sold], [point], [type], [status], [username], [modified], [xoa]) VALUES (19, N'Sting', N'This is Sting', 22, 22, N'product-4.jpg', N'product-4.jpg', N'1', 5, 11, 1, 1, 52, 0, N'chien1', CAST(N'2019-12-16 21:16:53.000' AS DateTime), 0)
INSERT [dbo].[food] ([id], [name], [description], [price], [price_promo], [thumb], [img], [unit], [percent_promo], [rating], [sold], [point], [type], [status], [username], [modified], [xoa]) VALUES (20, N'Number One', N'This is Number One', 98, 98, N'product-5.jpg', N'product-5.jpg', N'2', 5, 4, 2, 1, 52, 0, N'chien1', CAST(N'2019-12-16 21:17:37.000' AS DateTime), 0)
INSERT [dbo].[food] ([id], [name], [description], [price], [price_promo], [thumb], [img], [unit], [percent_promo], [rating], [sold], [point], [type], [status], [username], [modified], [xoa]) VALUES (21, N'ORANGE JUICE', N'This is ORANGE JUICE', 77, 77, N'product-6.jpg', N'product-6.jpg', N'1', 4, 1, 2, 1, 52, 0, N'chien1', CAST(N'2019-12-16 21:19:05.000' AS DateTime), 0)
INSERT [dbo].[food] ([id], [name], [description], [price], [price_promo], [thumb], [img], [unit], [percent_promo], [rating], [sold], [point], [type], [status], [username], [modified], [xoa]) VALUES (22, N'SODA', N'This is SODA', 5, 5, N'product-7.jpg', N'product-7.jpg', N'1', 4, 1, 1, 1, 52, 0, N'chien1', CAST(N'2019-12-16 21:19:40.000' AS DateTime), 0)
INSERT [dbo].[food] ([id], [name], [description], [price], [price_promo], [thumb], [img], [unit], [percent_promo], [rating], [sold], [point], [type], [status], [username], [modified], [xoa]) VALUES (23, N'COCA COLA', N'This is COCA COLA', 34, 34, N'product-8.jpg', N'product-8.jpg', N'1', 4, 1, 1, 1, 52, 0, N'chien1', CAST(N'2019-12-16 21:20:14.000' AS DateTime), 0)
INSERT [dbo].[food] ([id], [name], [description], [price], [price_promo], [thumb], [img], [unit], [percent_promo], [rating], [sold], [point], [type], [status], [username], [modified], [xoa]) VALUES (24, N'OLONG TEA', N'This is OLONG TEA', 69, 69, N'product-9.jpg', N'product-9.jpg', N'1', 4, 1, 1, 1, 52, 0, N'chien1', CAST(N'2019-12-16 21:20:54.000' AS DateTime), 0)
INSERT [dbo].[food] ([id], [name], [description], [price], [price_promo], [thumb], [img], [unit], [percent_promo], [rating], [sold], [point], [type], [status], [username], [modified], [xoa]) VALUES (25, N'Dưa hấu', N'This is Dua hấu', 12, 12, N'product-10.jpg', N'product-10.jpg', N'1', 1, 1, 1, 1, 51, 0, N'chien1', CAST(N'2019-12-16 21:23:12.000' AS DateTime), 0)
INSERT [dbo].[food] ([id], [name], [description], [price], [price_promo], [thumb], [img], [unit], [percent_promo], [rating], [sold], [point], [type], [status], [username], [modified], [xoa]) VALUES (26, N'Mít', N'This is Mít', 53, 53, N'product-11.jpg', N'product-11.jpg', N'1', 2, 3, 4, 5, 51, 0, N'chien1', CAST(N'2019-12-16 21:23:42.000' AS DateTime), 0)
INSERT [dbo].[food] ([id], [name], [description], [price], [price_promo], [thumb], [img], [unit], [percent_promo], [rating], [sold], [point], [type], [status], [username], [modified], [xoa]) VALUES (27, N'Ổi', N'This is Ổi', 87, 87, N'product-12.jpg', N'product-12.jpg', N'1', 2, 2, 2, 2, 51, 0, N'chien1', CAST(N'2019-12-16 21:24:18.000' AS DateTime), 0)
INSERT [dbo].[food] ([id], [name], [description], [price], [price_promo], [thumb], [img], [unit], [percent_promo], [rating], [sold], [point], [type], [status], [username], [modified], [xoa]) VALUES (28, N'Dưa leo', N'This is Dua leo', 43, 43, N'product-8.jpg', N'product-8.jpg', N'1', 2, 2, 2, 2, 51, 0, N'chien1', CAST(N'2019-12-16 21:25:06.000' AS DateTime), 0)
INSERT [dbo].[food] ([id], [name], [description], [price], [price_promo], [thumb], [img], [unit], [percent_promo], [rating], [sold], [point], [type], [status], [username], [modified], [xoa]) VALUES (29, N'Xoài', N'This is Xoài', 65, 65, N'product-10.jpg', N'product-10.jpg', N'1', 3, 3, 3, 3, 51, 0, N'chien1', CAST(N'2019-12-16 21:25:49.000' AS DateTime), 0)
INSERT [dbo].[food] ([id], [name], [description], [price], [price_promo], [thumb], [img], [unit], [percent_promo], [rating], [sold], [point], [type], [status], [username], [modified], [xoa]) VALUES (30, N'Chôm Chôm', N'This is Chôm Chôm', 76, 76, N'product-5.jpg', N'product-5.jpg', N'1', 5, 5, 5, 5, 51, 0, N'chien1', CAST(N'2019-12-16 21:26:27.000' AS DateTime), 0)
INSERT [dbo].[food] ([id], [name], [description], [price], [price_promo], [thumb], [img], [unit], [percent_promo], [rating], [sold], [point], [type], [status], [username], [modified], [xoa]) VALUES (31, N'Mận', N'This is Mận', 54, 54, N'product-3.jpg', N'product-3.jpg', N'1', 6, 6, 6, 6, 51, 0, N'chien1', CAST(N'2019-12-16 21:26:53.000' AS DateTime), 0)
INSERT [dbo].[food] ([id], [name], [description], [price], [price_promo], [thumb], [img], [unit], [percent_promo], [rating], [sold], [point], [type], [status], [username], [modified], [xoa]) VALUES (32, N'Sầu riêng', N'This is Sầu riêng', 73, 73, N'product-12.jpg', N'product-12.jpg', N'1', 7, 7, 7, 7, 51, 0, N'chien1', CAST(N'2019-12-16 21:27:28.000' AS DateTime), 0)
INSERT [dbo].[food] ([id], [name], [description], [price], [price_promo], [thumb], [img], [unit], [percent_promo], [rating], [sold], [point], [type], [status], [username], [modified], [xoa]) VALUES (33, N'Hành lá', N'This is Hành lá', 41, 41, N'product-6.jpg', N'product-6.jpg', N'1', 8, 8, 8, 8, 50, 0, N'chien1', CAST(N'2019-12-16 21:28:06.000' AS DateTime), 0)
INSERT [dbo].[food] ([id], [name], [description], [price], [price_promo], [thumb], [img], [unit], [percent_promo], [rating], [sold], [point], [type], [status], [username], [modified], [xoa]) VALUES (34, N'Ngò gai', N'This is Ngò gai', 12, 12, N'product-11.jpg', N'product-11.jpg', N'1', 2, 2, 2, 2, 50, 0, N'chien1', CAST(N'2019-12-16 21:28:51.000' AS DateTime), 0)
INSERT [dbo].[food] ([id], [name], [description], [price], [price_promo], [thumb], [img], [unit], [percent_promo], [rating], [sold], [point], [type], [status], [username], [modified], [xoa]) VALUES (35, N'Nước mía', N'This is nước mía', 14, 14, N'product-8.jpg', N'product-8.jpg', N'1', 2, 5, 2, 3, 52, 0, N'thuyhang', CAST(N'2019-12-23 21:32:34.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[food] OFF
SET IDENTITY_INSERT [dbo].[food_type] ON 

INSERT [dbo].[food_type] ([type_id], [type_name], [type_pos], [type_img], [status], [username], [modified], [xoa]) VALUES (50, N'Vegetables', 1, N'hinh (1).jpg', 1, N'thuyhang', CAST(N'2019-12-23 22:19:32.000' AS DateTime), 0)
INSERT [dbo].[food_type] ([type_id], [type_name], [type_pos], [type_img], [status], [username], [modified], [xoa]) VALUES (51, N'Fruits', 2, N'category-2.jpg', 1, N'chien1', CAST(N'2019-12-23 16:30:16.000' AS DateTime), 0)
INSERT [dbo].[food_type] ([type_id], [type_name], [type_pos], [type_img], [status], [username], [modified], [xoa]) VALUES (52, N'Juice', 3, N'category-3.jpg', 0, N'chien1', CAST(N'2019-12-23 21:20:05.000' AS DateTime), 0)
INSERT [dbo].[food_type] ([type_id], [type_name], [type_pos], [type_img], [status], [username], [modified], [xoa]) VALUES (53, N'aaa', 1, N'image_6.jpg', 0, N'chien1', CAST(N'2019-12-23 16:30:37.000' AS DateTime), 1)
INSERT [dbo].[food_type] ([type_id], [type_name], [type_pos], [type_img], [status], [username], [modified], [xoa]) VALUES (54, N'thịt cá sấu', 1, N'hinh (2).jpg', 0, N'chien1', CAST(N'2019-12-28 14:21:24.000' AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[food_type] OFF
INSERT [dbo].[member] ([username], [pass], [name], [phone], [role], [status], [email], [xoa]) VALUES (N'chien1', N'c4ca4238a0b923820dcc509a6f75849b', N'ho van chien', N'8888888888', 0, 0, N'iocutien@gmail.com', 0)
INSERT [dbo].[member] ([username], [pass], [name], [phone], [role], [status], [email], [xoa]) VALUES (N'chien216', N'c4ca4238a0b923820dcc509a6f75849b', N'chien', N'1212121212', 1, 0, N'iocutien@gmail.com', 0)
INSERT [dbo].[member] ([username], [pass], [name], [phone], [role], [status], [email], [xoa]) VALUES (N'duy111', N'c4ca4238a0b923820dcc509a6f75849b', N'ho van chien', N'8888888888', 0, 0, N'sadgas@gmail.com', 1)
INSERT [dbo].[member] ([username], [pass], [name], [phone], [role], [status], [email], [xoa]) VALUES (N'minh11', N'c4ca4238a0b923820dcc509a6f75849b', N'minh', N'0492374293', 0, 0, N'minh@gmail.com', 1)
INSERT [dbo].[member] ([username], [pass], [name], [phone], [role], [status], [email], [xoa]) VALUES (N'thuyhang', N'c4ca4238a0b923820dcc509a6f75849b', N'thuyhang', N'8888888888', 0, 0, N'thuyhang@gmail.com', 0)
SET IDENTITY_INSERT [dbo].[order] ON 

INSERT [dbo].[order] ([order_id], [cus_name], [cus_phone], [cus_add], [quan], [sum], [status], [username], [modified], [created], [cus_username]) VALUES (7, N'Hồ văn chiến', N'1212121212', N'nhà bè tphcm', 1, 120, 1, N'chien1', CAST(N'2019-12-21 11:24:48.000' AS DateTime), CAST(N'2019-12-21 11:24:48.000' AS DateTime), N'')
INSERT [dbo].[order] ([order_id], [cus_name], [cus_phone], [cus_add], [quan], [sum], [status], [username], [modified], [created], [cus_username]) VALUES (8, N'Hồ văn chiến', N'1212121212', N'nhà bè tphcm', 5, 428, 1, N'chien1', CAST(N'2019-12-21 12:59:28.000' AS DateTime), CAST(N'2019-12-21 12:59:28.000' AS DateTime), N'')
INSERT [dbo].[order] ([order_id], [cus_name], [cus_phone], [cus_add], [quan], [sum], [status], [username], [modified], [created], [cus_username]) VALUES (9, N'thuy hang', N'010109919', N'aa a', 1, 79, 1, N'chien1', CAST(N'2019-12-26 14:56:11.000' AS DateTime), CAST(N'2019-12-26 14:56:11.000' AS DateTime), N'')
INSERT [dbo].[order] ([order_id], [cus_name], [cus_phone], [cus_add], [quan], [sum], [status], [username], [modified], [created], [cus_username]) VALUES (10, N'thuy hang', N'1212121212', N'nhà bè tphcm', 1, 120, 1, N'chien1', CAST(N'2019-12-26 14:57:34.000' AS DateTime), CAST(N'2019-12-26 14:57:34.000' AS DateTime), N'')
INSERT [dbo].[order] ([order_id], [cus_name], [cus_phone], [cus_add], [quan], [sum], [status], [username], [modified], [created], [cus_username]) VALUES (11, N'thuy hang', N'1212121212', N'nhà bè tphcm', 1, 121, 1, N'chien1', CAST(N'2019-12-26 14:59:13.000' AS DateTime), CAST(N'2019-12-26 14:59:13.000' AS DateTime), N'')
INSERT [dbo].[order] ([order_id], [cus_name], [cus_phone], [cus_add], [quan], [sum], [status], [username], [modified], [created], [cus_username]) VALUES (12, N'jisoo', N'1212121212', N'nhà bè tphcm', 1, 120, 1, N'chien1', CAST(N'2019-12-26 15:11:47.000' AS DateTime), CAST(N'2019-12-26 15:11:47.000' AS DateTime), N'')
INSERT [dbo].[order] ([order_id], [cus_name], [cus_phone], [cus_add], [quan], [sum], [status], [username], [modified], [created], [cus_username]) VALUES (13, N'duy', N'1212121212', N'nhà bè tphcm', 1, 87, 1, N'chien1', CAST(N'2019-12-27 15:05:24.000' AS DateTime), CAST(N'2019-12-27 15:05:24.000' AS DateTime), N'')
INSERT [dbo].[order] ([order_id], [cus_name], [cus_phone], [cus_add], [quan], [sum], [status], [username], [modified], [created], [cus_username]) VALUES (14, N'thuy hang', N'1212121212', N'nhà bè tphcm', 18, 941, 1, N'chien1', CAST(N'2019-12-28 08:53:16.000' AS DateTime), CAST(N'2019-12-28 08:53:16.000' AS DateTime), N'')
INSERT [dbo].[order] ([order_id], [cus_name], [cus_phone], [cus_add], [quan], [sum], [status], [username], [modified], [created], [cus_username]) VALUES (15, N'CCC', N'0987654321', N'nhà bè tphcm', 2, 241, 1, N'chien1', CAST(N'2019-12-28 12:41:58.000' AS DateTime), CAST(N'2019-12-28 12:41:58.000' AS DateTime), N'')
INSERT [dbo].[order] ([order_id], [cus_name], [cus_phone], [cus_add], [quan], [sum], [status], [username], [modified], [created], [cus_username]) VALUES (16, N'zdgsg', N'0985443223', N'nhà bè tphcm', 1, 69, 1, N'chien1', CAST(N'2019-12-28 14:49:08.000' AS DateTime), CAST(N'2019-12-28 14:49:08.000' AS DateTime), N'')
SET IDENTITY_INSERT [dbo].[order] OFF
INSERT [dbo].[order_detail] ([order_id], [food_id], [quan], [unit], [price], [total]) VALUES (7, 5, 1, N'1', 120, 120)
INSERT [dbo].[order_detail] ([order_id], [food_id], [quan], [unit], [price], [total]) VALUES (8, 5, 1, N'1', 120, 120)
INSERT [dbo].[order_detail] ([order_id], [food_id], [quan], [unit], [price], [total]) VALUES (8, 6, 1, N'1', 120, 120)
INSERT [dbo].[order_detail] ([order_id], [food_id], [quan], [unit], [price], [total]) VALUES (8, 7, 1, N'1', 89, 89)
INSERT [dbo].[order_detail] ([order_id], [food_id], [quan], [unit], [price], [total]) VALUES (8, 9, 1, N'1', 34, 34)
INSERT [dbo].[order_detail] ([order_id], [food_id], [quan], [unit], [price], [total]) VALUES (8, 10, 1, N'1', 65, 65)
INSERT [dbo].[order_detail] ([order_id], [food_id], [quan], [unit], [price], [total]) VALUES (9, 4, 1, N'1', 79, 79)
INSERT [dbo].[order_detail] ([order_id], [food_id], [quan], [unit], [price], [total]) VALUES (10, 5, 1, N'1', 120, 120)
INSERT [dbo].[order_detail] ([order_id], [food_id], [quan], [unit], [price], [total]) VALUES (11, 6, 1, N'1', 121, 121)
INSERT [dbo].[order_detail] ([order_id], [food_id], [quan], [unit], [price], [total]) VALUES (12, 5, 1, N'1', 120, 120)
INSERT [dbo].[order_detail] ([order_id], [food_id], [quan], [unit], [price], [total]) VALUES (13, 27, 1, N'1', 87, 87)
INSERT [dbo].[order_detail] ([order_id], [food_id], [quan], [unit], [price], [total]) VALUES (14, 21, 4, N'1', 77, 308)
INSERT [dbo].[order_detail] ([order_id], [food_id], [quan], [unit], [price], [total]) VALUES (14, 23, 3, N'1', 34, 102)
INSERT [dbo].[order_detail] ([order_id], [food_id], [quan], [unit], [price], [total]) VALUES (14, 24, 7, N'1', 69, 483)
INSERT [dbo].[order_detail] ([order_id], [food_id], [quan], [unit], [price], [total]) VALUES (14, 25, 2, N'1', 12, 24)
INSERT [dbo].[order_detail] ([order_id], [food_id], [quan], [unit], [price], [total]) VALUES (14, 34, 2, N'1', 12, 24)
INSERT [dbo].[order_detail] ([order_id], [food_id], [quan], [unit], [price], [total]) VALUES (15, 5, 1, N'1', 120, 120)
INSERT [dbo].[order_detail] ([order_id], [food_id], [quan], [unit], [price], [total]) VALUES (15, 6, 1, N'1', 121, 121)
INSERT [dbo].[order_detail] ([order_id], [food_id], [quan], [unit], [price], [total]) VALUES (16, 24, 1, N'1', 69, 69)
SET IDENTITY_INSERT [dbo].[post] ON 

INSERT [dbo].[post] ([post_id], [title], [short_des], [des], [imt], [status], [username], [modified], [created]) VALUES (1, N'a', N'a', N'a', N'a', 1, N'chien1', CAST(N'2019-12-23 00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[post] OFF
SET IDENTITY_INSERT [dbo].[slider] ON 

INSERT [dbo].[slider] ([slide_id], [id_object], [img], [capotion], [type], [rank], [status], [username], [modified]) VALUES (22, NULL, N'bg_1.jpg', N'We serve Fresh Vegestables &amp; Fruits', 1, 1, 1, N'chien1', CAST(N'2019-12-23 00:00:00.000' AS DateTime))
INSERT [dbo].[slider] ([slide_id], [id_object], [img], [capotion], [type], [rank], [status], [username], [modified]) VALUES (23, NULL, N'bg_2.jpg', N'100% Fresh &amp; Organic Foods', 1, 1, 1, N'chien1', CAST(N'2019-12-23 00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[slider] OFF
ALTER TABLE [dbo].[comment]  WITH CHECK ADD  CONSTRAINT [FK_comment_post] FOREIGN KEY([post_id])
REFERENCES [dbo].[post] ([post_id])
GO
ALTER TABLE [dbo].[comment] CHECK CONSTRAINT [FK_comment_post]
GO
ALTER TABLE [dbo].[log_activity]  WITH CHECK ADD  CONSTRAINT [FK_log_activity_member] FOREIGN KEY([username])
REFERENCES [dbo].[member] ([username])
GO
ALTER TABLE [dbo].[log_activity] CHECK CONSTRAINT [FK_log_activity_member]
GO
ALTER TABLE [dbo].[order]  WITH CHECK ADD  CONSTRAINT [FK_order_member] FOREIGN KEY([username])
REFERENCES [dbo].[member] ([username])
GO
ALTER TABLE [dbo].[order] CHECK CONSTRAINT [FK_order_member]
GO
ALTER TABLE [dbo].[order_detail]  WITH CHECK ADD  CONSTRAINT [FK_order_detail_order] FOREIGN KEY([order_id])
REFERENCES [dbo].[order] ([order_id])
GO
ALTER TABLE [dbo].[order_detail] CHECK CONSTRAINT [FK_order_detail_order]
GO
ALTER TABLE [dbo].[post]  WITH CHECK ADD  CONSTRAINT [FK_post_member] FOREIGN KEY([username])
REFERENCES [dbo].[member] ([username])
GO
ALTER TABLE [dbo].[post] CHECK CONSTRAINT [FK_post_member]
GO
ALTER TABLE [dbo].[relative_food]  WITH CHECK ADD  CONSTRAINT [FK_relative_food_food] FOREIGN KEY([food1_id])
REFERENCES [dbo].[food] ([id])
GO
ALTER TABLE [dbo].[relative_food] CHECK CONSTRAINT [FK_relative_food_food]
GO
ALTER TABLE [dbo].[relative_food]  WITH CHECK ADD  CONSTRAINT [FK_relative_food_food1] FOREIGN KEY([food2_id])
REFERENCES [dbo].[food] ([id])
GO
ALTER TABLE [dbo].[relative_food] CHECK CONSTRAINT [FK_relative_food_food1]
GO
ALTER TABLE [dbo].[setting]  WITH CHECK ADD  CONSTRAINT [FK_setting_member] FOREIGN KEY([username])
REFERENCES [dbo].[member] ([username])
GO
ALTER TABLE [dbo].[setting] CHECK CONSTRAINT [FK_setting_member]
GO
ALTER TABLE [dbo].[slider]  WITH CHECK ADD  CONSTRAINT [FK_slider_food] FOREIGN KEY([id_object])
REFERENCES [dbo].[food] ([id])
GO
ALTER TABLE [dbo].[slider] CHECK CONSTRAINT [FK_slider_food]
GO
ALTER TABLE [dbo].[slider]  WITH CHECK ADD  CONSTRAINT [FK_slider_post] FOREIGN KEY([id_object])
REFERENCES [dbo].[post] ([post_id])
GO
ALTER TABLE [dbo].[slider] CHECK CONSTRAINT [FK_slider_post]
GO
USE [master]
GO
ALTER DATABASE [doan_asp_DB] SET  READ_WRITE 
GO
