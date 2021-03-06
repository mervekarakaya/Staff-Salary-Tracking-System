USE [master]
GO
/****** Object:  Database [Staff Salary Tracking System]    Script Date: 21.05.2021 00:02:13 ******/
CREATE DATABASE [Staff Salary Tracking System]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Staff Salary Tracking System', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Staff Salary Tracking System.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Staff Salary Tracking System_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Staff Salary Tracking System_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Staff Salary Tracking System] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Staff Salary Tracking System].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Staff Salary Tracking System] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Staff Salary Tracking System] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Staff Salary Tracking System] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Staff Salary Tracking System] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Staff Salary Tracking System] SET ARITHABORT OFF 
GO
ALTER DATABASE [Staff Salary Tracking System] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Staff Salary Tracking System] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Staff Salary Tracking System] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Staff Salary Tracking System] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Staff Salary Tracking System] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Staff Salary Tracking System] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Staff Salary Tracking System] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Staff Salary Tracking System] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Staff Salary Tracking System] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Staff Salary Tracking System] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Staff Salary Tracking System] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Staff Salary Tracking System] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Staff Salary Tracking System] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Staff Salary Tracking System] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Staff Salary Tracking System] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Staff Salary Tracking System] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Staff Salary Tracking System] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Staff Salary Tracking System] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Staff Salary Tracking System] SET  MULTI_USER 
GO
ALTER DATABASE [Staff Salary Tracking System] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Staff Salary Tracking System] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Staff Salary Tracking System] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Staff Salary Tracking System] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Staff Salary Tracking System] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Staff Salary Tracking System] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Staff Salary Tracking System] SET QUERY_STORE = OFF
GO
USE [Staff Salary Tracking System]
GO
/****** Object:  Table [dbo].[tbl_staff]    Script Date: 21.05.2021 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_staff](
	[Staff_ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Surname] [nvarchar](50) NULL,
	[Phone] [numeric](20, 0) NULL,
	[Email] [nvarchar](100) NULL,
	[TC_No] [nvarchar](10) NULL,
	[Department_ID] [int] NOT NULL,
	[Password] [nvarchar](50) NULL,
	[Responsibility] [nvarchar](100) NULL,
 CONSTRAINT [PK_tbl_staff] PRIMARY KEY CLUSTERED 
(
	[Staff_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[tbl_AdminEmployee]    Script Date: 21.05.2021 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[tbl_AdminEmployee] (Name, Surname) AS
SELECT Name, Surname
FROM tbl_staff
WHERE Responsibility='Industrial Engineer'
GO
/****** Object:  Table [dbo].[tbl_department]    Script Date: 21.05.2021 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_department](
	[Department_ID] [int] IDENTITY(1000,1) NOT NULL,
	[Department] [nvarchar](50) NULL,
 CONSTRAINT [PK_tbl_department] PRIMARY KEY CLUSTERED 
(
	[Department_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_salary]    Script Date: 21.05.2021 00:02:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_salary](
	[Salary_ID] [int] IDENTITY(1,1) NOT NULL,
	[Salary] [money] NULL,
	[Date] [date] NULL,
	[Staff_ID] [int] NULL,
 CONSTRAINT [PK_tbl_salary] PRIMARY KEY CLUSTERED 
(
	[Salary_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_department] ON 

INSERT [dbo].[tbl_department] ([Department_ID], [Department]) VALUES (1000, N'IT')
INSERT [dbo].[tbl_department] ([Department_ID], [Department]) VALUES (1001, N'Production')
INSERT [dbo].[tbl_department] ([Department_ID], [Department]) VALUES (1002, N'AR-GE')
INSERT [dbo].[tbl_department] ([Department_ID], [Department]) VALUES (1003, N'Management ')
INSERT [dbo].[tbl_department] ([Department_ID], [Department]) VALUES (1004, N'Finance')
INSERT [dbo].[tbl_department] ([Department_ID], [Department]) VALUES (1005, N'HR')
INSERT [dbo].[tbl_department] ([Department_ID], [Department]) VALUES (1006, N'Sales')
INSERT [dbo].[tbl_department] ([Department_ID], [Department]) VALUES (1007, N'Technical')
SET IDENTITY_INSERT [dbo].[tbl_department] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_salary] ON 

INSERT [dbo].[tbl_salary] ([Salary_ID], [Salary], [Date], [Staff_ID]) VALUES (1, 8000.0000, CAST(N'2022-05-06' AS Date), 1)
INSERT [dbo].[tbl_salary] ([Salary_ID], [Salary], [Date], [Staff_ID]) VALUES (2, 4000.0000, CAST(N'2022-05-03' AS Date), 2)
INSERT [dbo].[tbl_salary] ([Salary_ID], [Salary], [Date], [Staff_ID]) VALUES (3, 12000.0000, CAST(N'2022-05-05' AS Date), 3)
INSERT [dbo].[tbl_salary] ([Salary_ID], [Salary], [Date], [Staff_ID]) VALUES (4, 3600.0000, CAST(N'2022-05-04' AS Date), 4)
INSERT [dbo].[tbl_salary] ([Salary_ID], [Salary], [Date], [Staff_ID]) VALUES (5, 5000.0000, CAST(N'2022-05-07' AS Date), 6)
INSERT [dbo].[tbl_salary] ([Salary_ID], [Salary], [Date], [Staff_ID]) VALUES (6, 4000.0000, CAST(N'2022-05-08' AS Date), 7)
INSERT [dbo].[tbl_salary] ([Salary_ID], [Salary], [Date], [Staff_ID]) VALUES (7, 15000.0000, CAST(N'2022-05-05' AS Date), 8)
INSERT [dbo].[tbl_salary] ([Salary_ID], [Salary], [Date], [Staff_ID]) VALUES (8, 15000.0000, CAST(N'2022-05-06' AS Date), 9)
INSERT [dbo].[tbl_salary] ([Salary_ID], [Salary], [Date], [Staff_ID]) VALUES (9, 5000.0000, CAST(N'2022-05-07' AS Date), 17)
INSERT [dbo].[tbl_salary] ([Salary_ID], [Salary], [Date], [Staff_ID]) VALUES (10, 20000.0000, CAST(N'2022-05-09' AS Date), 18)
INSERT [dbo].[tbl_salary] ([Salary_ID], [Salary], [Date], [Staff_ID]) VALUES (11, 4000.0000, CAST(N'2022-05-10' AS Date), 19)
INSERT [dbo].[tbl_salary] ([Salary_ID], [Salary], [Date], [Staff_ID]) VALUES (12, 1000.0000, CAST(N'2022-05-09' AS Date), 20)
INSERT [dbo].[tbl_salary] ([Salary_ID], [Salary], [Date], [Staff_ID]) VALUES (14, 5000.0000, CAST(N'2022-05-07' AS Date), 22)
SET IDENTITY_INSERT [dbo].[tbl_salary] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_staff] ON 

INSERT [dbo].[tbl_staff] ([Staff_ID], [Name], [Surname], [Phone], [Email], [TC_No], [Department_ID], [Password], [Responsibility]) VALUES (1, N'Hazal', N'Yılmaz', CAST(5489795636 AS Numeric(20, 0)), N'hazal.yılmaz@gmail.com', N'8965217230', 1000, N'hazalyılmaz', N'Computer Engineer')
INSERT [dbo].[tbl_staff] ([Staff_ID], [Name], [Surname], [Phone], [Email], [TC_No], [Department_ID], [Password], [Responsibility]) VALUES (2, N'Ayşe', N'Kahraman', CAST(5465638862 AS Numeric(20, 0)), N'ayse.kahraman@gmail.com', N'2305896471', 1005, N'ayse123', N'Business Administration')
INSERT [dbo].[tbl_staff] ([Staff_ID], [Name], [Surname], [Phone], [Email], [TC_No], [Department_ID], [Password], [Responsibility]) VALUES (3, N'Mete', N'Tan', CAST(5129603217 AS Numeric(20, 0)), N'mete.tan@gmail.com', N'2073069478', 1002, N'metehan1071', N'Industrial Engineer')
INSERT [dbo].[tbl_staff] ([Staff_ID], [Name], [Surname], [Phone], [Email], [TC_No], [Department_ID], [Password], [Responsibility]) VALUES (4, N'Tolga', N'Güneş', CAST(5896302588 AS Numeric(20, 0)), N'tolga.güneş@gmail.com', N'7023666698', 1007, N'tlggns', N'Mechanic')
INSERT [dbo].[tbl_staff] ([Staff_ID], [Name], [Surname], [Phone], [Email], [TC_No], [Department_ID], [Password], [Responsibility]) VALUES (6, N'Gülbeyaz', N'Sarı', CAST(5423699875 AS Numeric(20, 0)), N'gülbeyaz.sari@gmail.com', N'1102202335', 1001, N'sarisunny', N'Industrial Engineer')
INSERT [dbo].[tbl_staff] ([Staff_ID], [Name], [Surname], [Phone], [Email], [TC_No], [Department_ID], [Password], [Responsibility]) VALUES (7, N'Kerim', N'Kirlenmez', CAST(5558869721 AS Numeric(20, 0)), N'kirlenmez@gmail.com', N'8799563017', 1004, N'kerimkirli', N'Economy')
INSERT [dbo].[tbl_staff] ([Staff_ID], [Name], [Surname], [Phone], [Email], [TC_No], [Department_ID], [Password], [Responsibility]) VALUES (8, N'Merve', N'Karakaya', CAST(5423698722 AS Numeric(20, 0)), N'merve.karakaya@gmail.com', N'5463982013', 1002, N'merve123', N'Electronic and Communication Engineer')
INSERT [dbo].[tbl_staff] ([Staff_ID], [Name], [Surname], [Phone], [Email], [TC_No], [Department_ID], [Password], [Responsibility]) VALUES (9, N'Rana ', N'Deliömeroğlu', CAST(8966683320 AS Numeric(20, 0)), N'rana.deliömeroğlu@gmail.com', N'3300216698', 1000, N'rana456', N'Computer Engineer')
INSERT [dbo].[tbl_staff] ([Staff_ID], [Name], [Surname], [Phone], [Email], [TC_No], [Department_ID], [Password], [Responsibility]) VALUES (17, N'Gürcü', N'Delialioğlu', CAST(5669978833 AS Numeric(20, 0)), N'gürcü.delialioğlu@gmail.com', N'4452306987', 1001, N'ranagurcu', N'Industrial Engineer')
INSERT [dbo].[tbl_staff] ([Staff_ID], [Name], [Surname], [Phone], [Email], [TC_No], [Department_ID], [Password], [Responsibility]) VALUES (18, N'Uzay', N'Sak', CAST(5963269878 AS Numeric(20, 0)), N'uzaysak@gmail.com', N'9200036657', 1003, N'binüç	', N'CEO')
INSERT [dbo].[tbl_staff] ([Staff_ID], [Name], [Surname], [Phone], [Email], [TC_No], [Department_ID], [Password], [Responsibility]) VALUES (19, N'Mert', N'Çalışkan', CAST(5448889991 AS Numeric(20, 0)), N'mert.calıskan@gmail.com', N'7896543210', 1006, N'm_çalışkann!', N'International Relations')
INSERT [dbo].[tbl_staff] ([Staff_ID], [Name], [Surname], [Phone], [Email], [TC_No], [Department_ID], [Password], [Responsibility]) VALUES (20, N'Mavi', N'Kara', CAST(5468963021 AS Numeric(20, 0)), N'mavi.kara@gmail.com', N'3021589369', 1003, N'yavruvatan', N'Lawyer')
INSERT [dbo].[tbl_staff] ([Staff_ID], [Name], [Surname], [Phone], [Email], [TC_No], [Department_ID], [Password], [Responsibility]) VALUES (22, N'Elvan', N'Kara', CAST(5496332888 AS Numeric(20, 0)), N'elvan.kara@gmail.com', N'7893652555', 1001, N'blackpink@', N'Electronic and Communication Engineer')
INSERT [dbo].[tbl_staff] ([Staff_ID], [Name], [Surname], [Phone], [Email], [TC_No], [Department_ID], [Password], [Responsibility]) VALUES (1005, N'Zeynep', N'Bulut', CAST(5338567245 AS Numeric(20, 0)), N'zeynep.bulut@gmail.com', N'2267996606', 1005, N'zb123', N'International Relations')
SET IDENTITY_INSERT [dbo].[tbl_staff] OFF
GO
ALTER TABLE [dbo].[tbl_salary]  WITH CHECK ADD  CONSTRAINT [FK_tbl_salary_tbl_staff] FOREIGN KEY([Staff_ID])
REFERENCES [dbo].[tbl_staff] ([Staff_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_salary] CHECK CONSTRAINT [FK_tbl_salary_tbl_staff]
GO
ALTER TABLE [dbo].[tbl_staff]  WITH CHECK ADD  CONSTRAINT [FK_tbl_staff_tbl_department] FOREIGN KEY([Department_ID])
REFERENCES [dbo].[tbl_department] ([Department_ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[tbl_staff] CHECK CONSTRAINT [FK_tbl_staff_tbl_department]
GO
USE [master]
GO
ALTER DATABASE [Staff Salary Tracking System] SET  READ_WRITE 
GO
