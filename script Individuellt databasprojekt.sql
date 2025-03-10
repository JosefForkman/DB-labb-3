USE [master]
GO
/****** Object:  Database [SkolaJosef]    Script Date: 2025-02-09 20:05:56 ******/
CREATE DATABASE [SkolaJosef]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SkolaJosef', FILENAME = N'/var/opt/mssql/data/SkolaJosef.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SkolaJosef_log', FILENAME = N'/var/opt/mssql/data/SkolaJosef_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [SkolaJosef] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SkolaJosef].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SkolaJosef] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SkolaJosef] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SkolaJosef] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SkolaJosef] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SkolaJosef] SET ARITHABORT OFF 
GO
ALTER DATABASE [SkolaJosef] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SkolaJosef] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SkolaJosef] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SkolaJosef] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SkolaJosef] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SkolaJosef] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SkolaJosef] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SkolaJosef] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SkolaJosef] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SkolaJosef] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SkolaJosef] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SkolaJosef] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SkolaJosef] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SkolaJosef] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SkolaJosef] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SkolaJosef] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [SkolaJosef] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SkolaJosef] SET RECOVERY FULL 
GO
ALTER DATABASE [SkolaJosef] SET  MULTI_USER 
GO
ALTER DATABASE [SkolaJosef] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SkolaJosef] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SkolaJosef] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SkolaJosef] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SkolaJosef] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SkolaJosef] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'SkolaJosef', N'ON'
GO
ALTER DATABASE [SkolaJosef] SET QUERY_STORE = OFF
GO
USE [SkolaJosef]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 2025-02-09 20:05:57 ******/
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
/****** Object:  Table [dbo].[class]    Script Date: 2025-02-09 20:05:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[class](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[start_date] [datetime] NOT NULL,
	[end_date] [datetime] NOT NULL,
	[mentor_id] [int] NULL,
 CONSTRAINT [PK__class__3213E83F40C65ACA] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[class_schema]    Script Date: 2025-02-09 20:05:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[class_schema](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[start_date] [datetime] NOT NULL,
	[end_date] [datetime] NOT NULL,
	[subject_id] [int] NOT NULL,
	[class_id] [int] NOT NULL,
 CONSTRAINT [PK__class_sc__3213E83FEB2ACFDB] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employee]    Script Date: 2025-02-09 20:05:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](100) NULL,
	[last_name] [varchar](100) NULL,
	[salary] [decimal](10, 2) NULL,
	[start_date] [date] NULL,
 CONSTRAINT [PK__employee__3213E83F96E0A02F] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[grade]    Script Date: 2025-02-09 20:05:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[grade](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[level] [varchar](3) NOT NULL,
	[created_at] [datetime] NOT NULL,
	[updated_at] [datetime] NOT NULL,
	[subject_id] [int] NOT NULL,
	[employee_id] [int] NOT NULL,
	[student_id] [int] NOT NULL,
 CONSTRAINT [PK__grade__3213E83F2E3E999E] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 2025-02-09 20:05:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](80) NOT NULL,
 CONSTRAINT [PK__role__3213E83FB1A3DF13] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role_grope]    Script Date: 2025-02-09 20:05:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role_grope](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[employee_id] [int] NOT NULL,
	[role_id] [int] NOT NULL,
 CONSTRAINT [PK__role_gro__3213E83FC465BE71] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student]    Script Date: 2025-02-09 20:05:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[student](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](100) NULL,
	[last_name] [varchar](100) NULL,
	[personal_code_number] [varchar](14) NULL,
	[class_id] [int] NULL,
 CONSTRAINT [PK__student__3213E83F3B851BDB] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subject]    Script Date: 2025-02-09 20:05:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subject](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[discription] [varchar](800) NULL,
 CONSTRAINT [PK__subject__3213E83FEE79BB45] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250128173837_InitialCreate', N'9.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250205103118_id', N'9.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250206132023_salary to Employee', N'9.0.1')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20250206142702_add StartDate to Employee', N'9.0.1')
GO
SET IDENTITY_INSERT [dbo].[class] ON 

INSERT [dbo].[class] ([id], [name], [start_date], [end_date], [mentor_id]) VALUES (1, N'9A', CAST(N'2025-08-17T00:00:00.000' AS DateTime), CAST(N'2026-06-05T00:00:00.000' AS DateTime), 1)
INSERT [dbo].[class] ([id], [name], [start_date], [end_date], [mentor_id]) VALUES (2, N'8B', CAST(N'2025-08-17T00:00:00.000' AS DateTime), CAST(N'2026-06-05T00:00:00.000' AS DateTime), 2)
SET IDENTITY_INSERT [dbo].[class] OFF
GO
SET IDENTITY_INSERT [dbo].[class_schema] ON 

INSERT [dbo].[class_schema] ([id], [start_date], [end_date], [subject_id], [class_id]) VALUES (1, CAST(N'2025-08-17T00:00:00.000' AS DateTime), CAST(N'2025-12-15T00:00:00.000' AS DateTime), 1, 1)
INSERT [dbo].[class_schema] ([id], [start_date], [end_date], [subject_id], [class_id]) VALUES (2, CAST(N'2025-08-17T00:00:00.000' AS DateTime), CAST(N'2025-12-15T00:00:00.000' AS DateTime), 2, 1)
INSERT [dbo].[class_schema] ([id], [start_date], [end_date], [subject_id], [class_id]) VALUES (3, CAST(N'2025-08-17T00:00:00.000' AS DateTime), CAST(N'2025-12-15T00:00:00.000' AS DateTime), 3, 2)
INSERT [dbo].[class_schema] ([id], [start_date], [end_date], [subject_id], [class_id]) VALUES (4, CAST(N'2025-08-17T00:00:00.000' AS DateTime), CAST(N'2025-12-15T00:00:00.000' AS DateTime), 4, 2)
SET IDENTITY_INSERT [dbo].[class_schema] OFF
GO
SET IDENTITY_INSERT [dbo].[employee] ON 

INSERT [dbo].[employee] ([id], [first_name], [last_name], [salary], [start_date]) VALUES (1, N'Anna', N'Svensson', CAST(30000.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[employee] ([id], [first_name], [last_name], [salary], [start_date]) VALUES (2, N'Erik', N'Johansson', CAST(32500.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[employee] ([id], [first_name], [last_name], [salary], [start_date]) VALUES (3, N'Maria', N'Andersson', CAST(25000.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[employee] ([id], [first_name], [last_name], [salary], [start_date]) VALUES (4, N'Oskar', N'Larsson', CAST(42670.00 AS Decimal(10, 2)), NULL)
INSERT [dbo].[employee] ([id], [first_name], [last_name], [salary], [start_date]) VALUES (5, N'Sara', N'Karlsson', CAST(28480.00 AS Decimal(10, 2)), NULL)
SET IDENTITY_INSERT [dbo].[employee] OFF
GO
SET IDENTITY_INSERT [dbo].[grade] ON 

INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (1, N'A', CAST(N'2025-12-15T00:00:00.000' AS DateTime), CAST(N'2025-12-15T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (2, N'B', CAST(N'2025-12-15T00:00:00.000' AS DateTime), CAST(N'2025-12-15T00:00:00.000' AS DateTime), 2, 2, 1)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (3, N'C', CAST(N'2025-12-15T00:00:00.000' AS DateTime), CAST(N'2025-12-15T00:00:00.000' AS DateTime), 1, 1, 2)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (4, N'A', CAST(N'2025-12-15T00:00:00.000' AS DateTime), CAST(N'2025-12-15T00:00:00.000' AS DateTime), 3, 3, 2)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (5, N'B', CAST(N'2025-12-15T00:00:00.000' AS DateTime), CAST(N'2025-12-15T00:00:00.000' AS DateTime), 4, 4, 3)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (6, N'A', CAST(N'2024-08-04T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 1, 1, 1)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (7, N'B', CAST(N'2020-04-18T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 1, 1, 2)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (8, N'C', CAST(N'2024-01-17T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 1, 2, 3)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (9, N'D', CAST(N'2022-08-15T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 1, 2, 4)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (10, N'F', CAST(N'2022-03-24T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 1, 3, 5)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (11, N'A', CAST(N'2021-11-28T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 2, 1, 1)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (12, N'B', CAST(N'2023-09-27T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 2, 2, 2)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (13, N'C', CAST(N'2020-10-19T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 2, 3, 3)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (14, N'D', CAST(N'2023-06-24T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 2, 4, 4)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (15, N'F', CAST(N'2023-08-08T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 2, 5, 5)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (16, N'A', CAST(N'2021-07-11T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 3, 1, 1)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (17, N'B', CAST(N'2023-09-04T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 3, 2, 2)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (18, N'C', CAST(N'2023-08-04T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 3, 3, 3)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (19, N'D', CAST(N'2024-01-15T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 3, 4, 4)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (20, N'F', CAST(N'2021-09-11T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 3, 5, 5)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (21, N'A', CAST(N'2022-11-03T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 4, 1, 1)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (22, N'B', CAST(N'2021-10-19T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 4, 2, 2)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (23, N'C', CAST(N'2022-04-09T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 4, 3, 3)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (24, N'D', CAST(N'2023-08-08T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 4, 4, 4)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (25, N'F', CAST(N'2021-04-28T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 4, 5, 5)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (26, N'A', CAST(N'2020-08-18T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 1, 1, 1)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (27, N'B', CAST(N'2022-09-09T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 1, 1, 2)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (28, N'C', CAST(N'2024-12-28T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 1, 2, 3)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (29, N'D', CAST(N'2024-08-11T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 1, 2, 4)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (30, N'F', CAST(N'2022-03-11T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 1, 3, 5)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (31, N'A', CAST(N'2021-12-15T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 2, 1, 1)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (32, N'B', CAST(N'2024-09-21T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 2, 2, 2)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (33, N'C', CAST(N'2021-04-26T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 2, 3, 3)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (34, N'D', CAST(N'2020-10-01T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 2, 4, 4)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (35, N'F', CAST(N'2020-03-12T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 2, 5, 5)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (36, N'A', CAST(N'2021-03-11T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 3, 1, 1)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (37, N'B', CAST(N'2022-04-20T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 3, 2, 2)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (38, N'C', CAST(N'2020-06-11T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 3, 3, 3)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (39, N'D', CAST(N'2022-10-26T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 3, 4, 4)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (40, N'F', CAST(N'2023-07-31T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 3, 5, 5)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (41, N'A', CAST(N'2021-04-26T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 4, 1, 1)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (42, N'B', CAST(N'2020-04-26T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 4, 2, 2)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (43, N'C', CAST(N'2022-09-01T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 4, 3, 3)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (44, N'D', CAST(N'2022-03-28T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 4, 4, 4)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (45, N'F', CAST(N'2022-01-16T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 4, 5, 5)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (46, N'C', CAST(N'2020-05-27T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 1, 1, 1)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (47, N'A', CAST(N'2020-12-25T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 1, 2, 2)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (48, N'B', CAST(N'2023-10-14T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 1, 3, 3)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (49, N'F', CAST(N'2023-08-20T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 1, 4, 4)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (50, N'D', CAST(N'2024-11-09T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 1, 5, 5)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (51, N'D', CAST(N'2023-09-28T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 2, 1, 1)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (52, N'C', CAST(N'2020-03-03T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 2, 2, 2)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (53, N'B', CAST(N'2021-07-06T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 2, 3, 3)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (54, N'A', CAST(N'2024-02-22T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 2, 4, 4)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (55, N'F', CAST(N'2022-12-09T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 2, 5, 5)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (56, N'C', CAST(N'2022-06-01T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 3, 1, 1)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (57, N'B', CAST(N'2021-01-05T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 3, 2, 2)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (58, N'A', CAST(N'2022-11-29T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 3, 3, 3)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (59, N'F', CAST(N'2023-06-21T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 3, 4, 4)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (60, N'D', CAST(N'2020-04-25T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 3, 5, 5)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (61, N'B', CAST(N'2022-03-16T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 4, 1, 1)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (62, N'C', CAST(N'2021-11-23T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 4, 2, 2)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (63, N'A', CAST(N'2023-06-19T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 4, 3, 3)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (64, N'D', CAST(N'2022-04-09T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 4, 4, 4)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (65, N'F', CAST(N'2023-03-09T09:48:47.613' AS DateTime), CAST(N'2025-02-07T09:48:47.613' AS DateTime), 4, 5, 5)
SET IDENTITY_INSERT [dbo].[grade] OFF
GO
SET IDENTITY_INSERT [dbo].[role] ON 

INSERT [dbo].[role] ([id], [name]) VALUES (9, N'Administratör')
INSERT [dbo].[role] ([id], [name]) VALUES (5, N'Biologi Lärare')
INSERT [dbo].[role] ([id], [name]) VALUES (4, N'Engelska Lärare')
INSERT [dbo].[role] ([id], [name]) VALUES (6, N'Fysik Lärare')
INSERT [dbo].[role] ([id], [name]) VALUES (1, N'Lärare')
INSERT [dbo].[role] ([id], [name]) VALUES (2, N'Matematik')
INSERT [dbo].[role] ([id], [name]) VALUES (7, N'Rektor')
INSERT [dbo].[role] ([id], [name]) VALUES (3, N'Svenska Lärare')
INSERT [dbo].[role] ([id], [name]) VALUES (8, N'Vaktmästare')
SET IDENTITY_INSERT [dbo].[role] OFF
GO
SET IDENTITY_INSERT [dbo].[role_grope] ON 

INSERT [dbo].[role_grope] ([id], [employee_id], [role_id]) VALUES (1, 1, 1)
INSERT [dbo].[role_grope] ([id], [employee_id], [role_id]) VALUES (2, 1, 2)
INSERT [dbo].[role_grope] ([id], [employee_id], [role_id]) VALUES (3, 1, 3)
INSERT [dbo].[role_grope] ([id], [employee_id], [role_id]) VALUES (4, 2, 1)
INSERT [dbo].[role_grope] ([id], [employee_id], [role_id]) VALUES (5, 2, 4)
INSERT [dbo].[role_grope] ([id], [employee_id], [role_id]) VALUES (6, 2, 5)
INSERT [dbo].[role_grope] ([id], [employee_id], [role_id]) VALUES (7, 3, 1)
INSERT [dbo].[role_grope] ([id], [employee_id], [role_id]) VALUES (8, 3, 4)
INSERT [dbo].[role_grope] ([id], [employee_id], [role_id]) VALUES (9, 4, 7)
INSERT [dbo].[role_grope] ([id], [employee_id], [role_id]) VALUES (10, 4, 9)
INSERT [dbo].[role_grope] ([id], [employee_id], [role_id]) VALUES (11, 5, 8)
INSERT [dbo].[role_grope] ([id], [employee_id], [role_id]) VALUES (12, 5, 7)
SET IDENTITY_INSERT [dbo].[role_grope] OFF
GO
SET IDENTITY_INSERT [dbo].[student] ON 

INSERT [dbo].[student] ([id], [first_name], [last_name], [personal_code_number], [class_id]) VALUES (1, N'Alice', N'Karlsson', N'20080915-1234', 1)
INSERT [dbo].[student] ([id], [first_name], [last_name], [personal_code_number], [class_id]) VALUES (2, N'Bob', N'Johansson', N'20080915-5678', 1)
INSERT [dbo].[student] ([id], [first_name], [last_name], [personal_code_number], [class_id]) VALUES (3, N'Clara', N'Nilsson', N'20090123-9101', 1)
INSERT [dbo].[student] ([id], [first_name], [last_name], [personal_code_number], [class_id]) VALUES (4, N'David', N'Olsson', N'20090202-1122', 2)
INSERT [dbo].[student] ([id], [first_name], [last_name], [personal_code_number], [class_id]) VALUES (5, N'Eva', N'Mårtensson', N'20090401-3344', 2)
SET IDENTITY_INSERT [dbo].[student] OFF
GO
SET IDENTITY_INSERT [dbo].[subject] ON 

INSERT [dbo].[subject] ([id], [name], [discription]) VALUES (1, N'Matematik', N'Studier av tal, mätningar och algebra.')
INSERT [dbo].[subject] ([id], [name], [discription]) VALUES (2, N'Svenska', N'Läsning, skrivning och grammatik.')
INSERT [dbo].[subject] ([id], [name], [discription]) VALUES (3, N'Engelska', N'Lärande av det engelska språket.')
INSERT [dbo].[subject] ([id], [name], [discription]) VALUES (4, N'Biologi', N'Studier av levande organismer och deras miljö.')
SET IDENTITY_INSERT [dbo].[subject] OFF
GO
/****** Object:  Index [IX_class_mentor_id]    Script Date: 2025-02-09 20:05:58 ******/
CREATE NONCLUSTERED INDEX [IX_class_mentor_id] ON [dbo].[class]
(
	[mentor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__class__72E12F1B12AA3B38]    Script Date: 2025-02-09 20:05:58 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ__class__72E12F1B12AA3B38] ON [dbo].[class]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_class_schema_class_id]    Script Date: 2025-02-09 20:05:58 ******/
CREATE NONCLUSTERED INDEX [IX_class_schema_class_id] ON [dbo].[class_schema]
(
	[class_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_class_schema_subject_id]    Script Date: 2025-02-09 20:05:58 ******/
CREATE NONCLUSTERED INDEX [IX_class_schema_subject_id] ON [dbo].[class_schema]
(
	[subject_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_grade_employee_id]    Script Date: 2025-02-09 20:05:58 ******/
CREATE NONCLUSTERED INDEX [IX_grade_employee_id] ON [dbo].[grade]
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_grade_student_id]    Script Date: 2025-02-09 20:05:58 ******/
CREATE NONCLUSTERED INDEX [IX_grade_student_id] ON [dbo].[grade]
(
	[student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_grade_subject_id]    Script Date: 2025-02-09 20:05:58 ******/
CREATE NONCLUSTERED INDEX [IX_grade_subject_id] ON [dbo].[grade]
(
	[subject_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__role__72E12F1B3AB05169]    Script Date: 2025-02-09 20:05:58 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ__role__72E12F1B3AB05169] ON [dbo].[role]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_role_grope_employee_id]    Script Date: 2025-02-09 20:05:58 ******/
CREATE NONCLUSTERED INDEX [IX_role_grope_employee_id] ON [dbo].[role_grope]
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_role_grope_role_id]    Script Date: 2025-02-09 20:05:58 ******/
CREATE NONCLUSTERED INDEX [IX_role_grope_role_id] ON [dbo].[role_grope]
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_student_class_id]    Script Date: 2025-02-09 20:05:58 ******/
CREATE NONCLUSTERED INDEX [IX_student_class_id] ON [dbo].[student]
(
	[class_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__subject__72E12F1BB5F75BF6]    Script Date: 2025-02-09 20:05:58 ******/
CREATE UNIQUE NONCLUSTERED INDEX [UQ__subject__72E12F1BB5F75BF6] ON [dbo].[subject]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[class] ADD  DEFAULT (getdate()) FOR [start_date]
GO
ALTER TABLE [dbo].[class] ADD  DEFAULT (getdate()) FOR [end_date]
GO
ALTER TABLE [dbo].[class_schema] ADD  DEFAULT (getdate()) FOR [start_date]
GO
ALTER TABLE [dbo].[class_schema] ADD  DEFAULT (getdate()) FOR [end_date]
GO
ALTER TABLE [dbo].[employee] ADD  DEFAULT ((0.0)) FOR [salary]
GO
ALTER TABLE [dbo].[grade] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[grade] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[class]  WITH CHECK ADD  CONSTRAINT [FK__class__mentor_id__2F10007B] FOREIGN KEY([mentor_id])
REFERENCES [dbo].[employee] ([id])
GO
ALTER TABLE [dbo].[class] CHECK CONSTRAINT [FK__class__mentor_id__2F10007B]
GO
ALTER TABLE [dbo].[class_schema]  WITH CHECK ADD  CONSTRAINT [FK__class_sch__class__412EB0B6] FOREIGN KEY([class_id])
REFERENCES [dbo].[class] ([id])
GO
ALTER TABLE [dbo].[class_schema] CHECK CONSTRAINT [FK__class_sch__class__412EB0B6]
GO
ALTER TABLE [dbo].[class_schema]  WITH CHECK ADD  CONSTRAINT [FK__class_sch__subje__403A8C7D] FOREIGN KEY([subject_id])
REFERENCES [dbo].[subject] ([id])
GO
ALTER TABLE [dbo].[class_schema] CHECK CONSTRAINT [FK__class_sch__subje__403A8C7D]
GO
ALTER TABLE [dbo].[grade]  WITH CHECK ADD  CONSTRAINT [FK__grade__employee___3A81B327] FOREIGN KEY([employee_id])
REFERENCES [dbo].[employee] ([id])
GO
ALTER TABLE [dbo].[grade] CHECK CONSTRAINT [FK__grade__employee___3A81B327]
GO
ALTER TABLE [dbo].[grade]  WITH CHECK ADD  CONSTRAINT [FK__grade__student_i__3B75D760] FOREIGN KEY([student_id])
REFERENCES [dbo].[student] ([id])
GO
ALTER TABLE [dbo].[grade] CHECK CONSTRAINT [FK__grade__student_i__3B75D760]
GO
ALTER TABLE [dbo].[grade]  WITH CHECK ADD  CONSTRAINT [FK__grade__subject_i__398D8EEE] FOREIGN KEY([subject_id])
REFERENCES [dbo].[subject] ([id])
GO
ALTER TABLE [dbo].[grade] CHECK CONSTRAINT [FK__grade__subject_i__398D8EEE]
GO
ALTER TABLE [dbo].[role_grope]  WITH CHECK ADD  CONSTRAINT [FK__role_grop__emplo__286302EC] FOREIGN KEY([employee_id])
REFERENCES [dbo].[employee] ([id])
GO
ALTER TABLE [dbo].[role_grope] CHECK CONSTRAINT [FK__role_grop__emplo__286302EC]
GO
ALTER TABLE [dbo].[role_grope]  WITH CHECK ADD  CONSTRAINT [FK__role_grop__role___29572725] FOREIGN KEY([role_id])
REFERENCES [dbo].[role] ([id])
GO
ALTER TABLE [dbo].[role_grope] CHECK CONSTRAINT [FK__role_grop__role___29572725]
GO
ALTER TABLE [dbo].[student]  WITH CHECK ADD  CONSTRAINT [FK__student__class_i__31EC6D26] FOREIGN KEY([class_id])
REFERENCES [dbo].[class] ([id])
GO
ALTER TABLE [dbo].[student] CHECK CONSTRAINT [FK__student__class_i__31EC6D26]
GO
USE [master]
GO
ALTER DATABASE [SkolaJosef] SET  READ_WRITE 
GO
