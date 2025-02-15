USE [master]
GO
/****** Object:  Database [SkolaJosef]    Script Date: 2025-01-30 10:00:01 ******/
CREATE DATABASE [SkolaJosef]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SkolaJosef', FILENAME = N'/var/opt/mssql/data/SkolaJosef.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'SkolaJosef_log', FILENAME = N'/var/opt/mssql/data/SkolaJosef_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [SkolaJosef] SET COMPATIBILITY_LEVEL = 160
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
ALTER DATABASE [SkolaJosef] SET READ_COMMITTED_SNAPSHOT OFF 
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
ALTER DATABASE [SkolaJosef] SET QUERY_STORE = ON
GO
ALTER DATABASE [SkolaJosef] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [SkolaJosef]
GO
/****** Object:  Table [dbo].[class]    Script Date: 2025-01-30 10:00:01 ******/
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
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[class_schema]    Script Date: 2025-01-30 10:00:02 ******/
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
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employee]    Script Date: 2025-01-30 10:00:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employee](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[first_name] [varchar](100) NULL,
	[last_name] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[grade]    Script Date: 2025-01-30 10:00:02 ******/
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
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role]    Script Date: 2025-01-30 10:00:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](80) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[role_grope]    Script Date: 2025-01-30 10:00:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[role_grope](
	[employee_id] [int] NOT NULL,
	[role_id] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[student]    Script Date: 2025-01-30 10:00:02 ******/
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
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[subject]    Script Date: 2025-01-30 10:00:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[subject](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](255) NOT NULL,
	[discription] [varchar](800) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
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

INSERT [dbo].[employee] ([id], [first_name], [last_name]) VALUES (1, N'Anna', N'Svensson')
INSERT [dbo].[employee] ([id], [first_name], [last_name]) VALUES (2, N'Erik', N'Johansson')
INSERT [dbo].[employee] ([id], [first_name], [last_name]) VALUES (3, N'Maria', N'Andersson')
INSERT [dbo].[employee] ([id], [first_name], [last_name]) VALUES (4, N'Oskar', N'Larsson')
INSERT [dbo].[employee] ([id], [first_name], [last_name]) VALUES (5, N'Sara', N'Karlsson')
SET IDENTITY_INSERT [dbo].[employee] OFF
GO
SET IDENTITY_INSERT [dbo].[grade] ON 

INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (1, N'A', CAST(N'2025-01-01T00:00:00.000' AS DateTime), CAST(N'2025-12-15T00:00:00.000' AS DateTime), 1, 1, 1)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (2, N'B', CAST(N'2025-12-15T00:00:00.000' AS DateTime), CAST(N'2025-12-15T00:00:00.000' AS DateTime), 2, 2, 1)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (3, N'C', CAST(N'2025-12-15T00:00:00.000' AS DateTime), CAST(N'2025-12-15T00:00:00.000' AS DateTime), 1, 1, 2)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (4, N'A', CAST(N'2025-12-15T00:00:00.000' AS DateTime), CAST(N'2025-12-15T00:00:00.000' AS DateTime), 3, 3, 2)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (5, N'B', CAST(N'2025-12-15T00:00:00.000' AS DateTime), CAST(N'2025-12-15T00:00:00.000' AS DateTime), 4, 4, 3)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (6, N'A', CAST(N'2020-02-10T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 1, 1, 1)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (7, N'B', CAST(N'2023-06-30T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 1, 1, 2)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (8, N'C', CAST(N'2021-07-08T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 1, 2, 3)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (9, N'D', CAST(N'2020-06-19T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 1, 2, 4)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (10, N'F', CAST(N'2022-12-03T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 1, 3, 5)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (11, N'A', CAST(N'2023-07-07T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 2, 1, 1)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (12, N'B', CAST(N'2022-10-19T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 2, 2, 2)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (13, N'C', CAST(N'2021-09-29T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 2, 3, 3)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (14, N'D', CAST(N'2022-10-21T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 2, 4, 4)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (15, N'F', CAST(N'2020-09-10T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 2, 5, 5)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (16, N'A', CAST(N'2021-05-16T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 3, 1, 1)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (17, N'B', CAST(N'2021-02-10T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 3, 2, 2)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (18, N'C', CAST(N'2020-07-31T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 3, 3, 3)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (19, N'D', CAST(N'2021-03-04T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 3, 4, 4)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (20, N'F', CAST(N'2021-05-19T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 3, 5, 5)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (21, N'A', CAST(N'2024-02-29T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 4, 1, 1)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (22, N'B', CAST(N'2024-12-03T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 4, 2, 2)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (23, N'C', CAST(N'2020-06-18T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 4, 3, 3)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (24, N'D', CAST(N'2020-04-03T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 4, 4, 4)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (25, N'F', CAST(N'2023-11-17T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 4, 5, 5)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (26, N'A', CAST(N'2020-12-17T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 1, 1, 1)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (27, N'B', CAST(N'2020-12-13T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 1, 1, 2)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (28, N'C', CAST(N'2024-07-15T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 1, 2, 3)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (29, N'D', CAST(N'2025-01-17T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 1, 2, 4)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (30, N'F', CAST(N'2024-06-21T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 1, 3, 5)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (31, N'A', CAST(N'2023-08-18T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 2, 1, 1)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (32, N'B', CAST(N'2020-10-01T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 2, 2, 2)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (33, N'C', CAST(N'2022-05-24T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 2, 3, 3)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (34, N'D', CAST(N'2022-05-25T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 2, 4, 4)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (35, N'F', CAST(N'2023-05-16T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 2, 5, 5)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (36, N'A', CAST(N'2022-11-18T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 3, 1, 1)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (37, N'B', CAST(N'2021-08-02T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 3, 2, 2)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (38, N'C', CAST(N'2021-11-11T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 3, 3, 3)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (39, N'D', CAST(N'2023-05-11T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 3, 4, 4)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (40, N'F', CAST(N'2022-02-13T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 3, 5, 5)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (41, N'A', CAST(N'2023-06-19T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 4, 1, 1)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (42, N'B', CAST(N'2020-08-31T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 4, 2, 2)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (43, N'C', CAST(N'2024-06-11T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 4, 3, 3)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (44, N'D', CAST(N'2021-11-28T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 4, 4, 4)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (45, N'F', CAST(N'2024-11-21T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 4, 5, 5)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (46, N'C', CAST(N'2022-12-10T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 1, 1, 1)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (47, N'A', CAST(N'2021-03-10T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 1, 2, 2)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (48, N'B', CAST(N'2021-05-29T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 1, 3, 3)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (49, N'F', CAST(N'2022-06-12T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 1, 4, 4)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (50, N'D', CAST(N'2024-02-02T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 1, 5, 5)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (51, N'D', CAST(N'2021-02-03T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 2, 1, 1)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (52, N'C', CAST(N'2024-10-02T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 2, 2, 2)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (53, N'B', CAST(N'2020-11-08T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 2, 3, 3)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (54, N'A', CAST(N'2025-01-01T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 2, 4, 4)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (55, N'F', CAST(N'2024-04-13T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 2, 5, 5)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (56, N'C', CAST(N'2021-07-15T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 3, 1, 1)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (57, N'B', CAST(N'2024-09-02T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 3, 2, 2)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (58, N'A', CAST(N'2020-07-10T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 3, 3, 3)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (59, N'F', CAST(N'2020-07-07T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 3, 4, 4)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (60, N'D', CAST(N'2021-06-19T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 3, 5, 5)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (61, N'B', CAST(N'2020-11-09T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 4, 1, 1)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (62, N'C', CAST(N'2023-10-24T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 4, 2, 2)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (63, N'A', CAST(N'2024-02-05T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 4, 3, 3)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (64, N'D', CAST(N'2023-01-10T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 4, 4, 4)
INSERT [dbo].[grade] ([id], [level], [created_at], [updated_at], [subject_id], [employee_id], [student_id]) VALUES (65, N'F', CAST(N'2023-04-29T22:10:53.783' AS DateTime), CAST(N'2025-01-29T22:10:53.783' AS DateTime), 4, 5, 5)
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
INSERT [dbo].[role_grope] ([employee_id], [role_id]) VALUES (1, 1)
INSERT [dbo].[role_grope] ([employee_id], [role_id]) VALUES (1, 2)
INSERT [dbo].[role_grope] ([employee_id], [role_id]) VALUES (1, 3)
INSERT [dbo].[role_grope] ([employee_id], [role_id]) VALUES (2, 1)
INSERT [dbo].[role_grope] ([employee_id], [role_id]) VALUES (2, 4)
INSERT [dbo].[role_grope] ([employee_id], [role_id]) VALUES (2, 5)
INSERT [dbo].[role_grope] ([employee_id], [role_id]) VALUES (3, 7)
INSERT [dbo].[role_grope] ([employee_id], [role_id]) VALUES (4, 8)
INSERT [dbo].[role_grope] ([employee_id], [role_id]) VALUES (5, 9)
GO
SET IDENTITY_INSERT [dbo].[student] ON 

INSERT [dbo].[student] ([id], [first_name], [last_name], [personal_code_number], [class_id]) VALUES (1, N'Alice', N'Karlsson', N'20080915-1234', 1)
INSERT [dbo].[student] ([id], [first_name], [last_name], [personal_code_number], [class_id]) VALUES (2, N'Bob', N'Johansson', N'20080915-5678', 1)
INSERT [dbo].[student] ([id], [first_name], [last_name], [personal_code_number], [class_id]) VALUES (3, N'Clara', N'Nilsson', N'20090123-9101', 1)
INSERT [dbo].[student] ([id], [first_name], [last_name], [personal_code_number], [class_id]) VALUES (4, N'David', N'Olsson', N'20090202-1122', 2)
INSERT [dbo].[student] ([id], [first_name], [last_name], [personal_code_number], [class_id]) VALUES (5, N'Eva', N'Mårtensson', N'20090401-3344', 2)
INSERT [dbo].[student] ([id], [first_name], [last_name], [personal_code_number], [class_id]) VALUES (6, N'John', N'Doe', N'19990621-7745', 1)
SET IDENTITY_INSERT [dbo].[student] OFF
GO
SET IDENTITY_INSERT [dbo].[subject] ON 

INSERT [dbo].[subject] ([id], [name], [discription]) VALUES (1, N'Matematik', N'Studier av tal, mätningar och algebra.')
INSERT [dbo].[subject] ([id], [name], [discription]) VALUES (2, N'Svenska', N'Läsning, skrivning och grammatik.')
INSERT [dbo].[subject] ([id], [name], [discription]) VALUES (3, N'Engelska', N'Lärande av det engelska språket.')
INSERT [dbo].[subject] ([id], [name], [discription]) VALUES (4, N'Biologi', N'Studier av levande organismer och deras miljö.')
SET IDENTITY_INSERT [dbo].[subject] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__class__72E12F1BB48FCD8E]    Script Date: 2025-01-30 10:00:02 ******/
ALTER TABLE [dbo].[class] ADD UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__role__72E12F1BC5BDBCE8]    Script Date: 2025-01-30 10:00:02 ******/
ALTER TABLE [dbo].[role] ADD UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__subject__72E12F1BB2A1357A]    Script Date: 2025-01-30 10:00:02 ******/
ALTER TABLE [dbo].[subject] ADD UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[class] ADD  DEFAULT (getdate()) FOR [start_date]
GO
ALTER TABLE [dbo].[class] ADD  DEFAULT (getdate()) FOR [end_date]
GO
ALTER TABLE [dbo].[class_schema] ADD  DEFAULT (getdate()) FOR [start_date]
GO
ALTER TABLE [dbo].[class_schema] ADD  DEFAULT (getdate()) FOR [end_date]
GO
ALTER TABLE [dbo].[grade] ADD  DEFAULT (getdate()) FOR [created_at]
GO
ALTER TABLE [dbo].[grade] ADD  DEFAULT (getdate()) FOR [updated_at]
GO
ALTER TABLE [dbo].[class]  WITH CHECK ADD FOREIGN KEY([mentor_id])
REFERENCES [dbo].[employee] ([id])
GO
ALTER TABLE [dbo].[class_schema]  WITH CHECK ADD FOREIGN KEY([class_id])
REFERENCES [dbo].[class] ([id])
GO
ALTER TABLE [dbo].[class_schema]  WITH CHECK ADD FOREIGN KEY([subject_id])
REFERENCES [dbo].[subject] ([id])
GO
ALTER TABLE [dbo].[grade]  WITH CHECK ADD FOREIGN KEY([employee_id])
REFERENCES [dbo].[employee] ([id])
GO
ALTER TABLE [dbo].[grade]  WITH CHECK ADD FOREIGN KEY([student_id])
REFERENCES [dbo].[student] ([id])
GO
ALTER TABLE [dbo].[grade]  WITH CHECK ADD FOREIGN KEY([subject_id])
REFERENCES [dbo].[subject] ([id])
GO
ALTER TABLE [dbo].[role_grope]  WITH CHECK ADD FOREIGN KEY([employee_id])
REFERENCES [dbo].[employee] ([id])
GO
ALTER TABLE [dbo].[role_grope]  WITH CHECK ADD FOREIGN KEY([role_id])
REFERENCES [dbo].[role] ([id])
GO
ALTER TABLE [dbo].[student]  WITH CHECK ADD FOREIGN KEY([class_id])
REFERENCES [dbo].[class] ([id])
GO
/****** Object:  StoredProcedure [dbo].[insertNewStudent]    Script Date: 2025-01-30 10:00:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[insertNewStudent]
    @first_name VARCHAR(50),
    @last_name VARCHAR(50),
    @personal_code_number VARCHAR(11),
    @class_id INT
AS
BEGIN
    INSERT INTO student
        (first_name, last_name, personal_code_number, class_id)
    VALUES
        (@first_name, @last_name, @personal_code_number, @class_id);
END;
GO
/****** Object:  StoredProcedure [dbo].[SelectAllEmployees]    Script Date: 2025-01-30 10:00:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SelectAllEmployees]
    @EmployeeRole nvarchar(50)
AS
BEGIN
    IF @EmployeeRole != ''
    BEGIN
        SELECT role.name as 'role name', employee.first_name, employee.last_name
        FROM role_grope
            JOIN role ON role_grope.role_id = role.id
            JOIN employee ON role_grope.employee_id = employee.id
        WHERE role.name = @EmployeeRole;
    END
    ELSE
    BEGIN
        SELECT role.name as 'role name', employee.first_name, employee.last_name
        FROM role_grope
            JOIN role ON role_grope.role_id = role.id
            JOIN employee ON role_grope.employee_id = employee.id
    END
END;
GO
USE [master]
GO
ALTER DATABASE [SkolaJosef] SET  READ_WRITE 
GO
