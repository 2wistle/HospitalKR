USE [master]
GO
/****** Object:  Database [hospital]    Script Date: 23.03.2022 12:21:51 ******/
CREATE DATABASE [hospital]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'hospital', FILENAME = N'A:\торрент\MSSQL15.SQLEXPRESS\MSSQL\DATA\hospital.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'hospital_log', FILENAME = N'A:\торрент\MSSQL15.SQLEXPRESS\MSSQL\DATA\hospital_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [hospital] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [hospital].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [hospital] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [hospital] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [hospital] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [hospital] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [hospital] SET ARITHABORT OFF 
GO
ALTER DATABASE [hospital] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [hospital] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [hospital] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [hospital] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [hospital] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [hospital] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [hospital] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [hospital] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [hospital] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [hospital] SET  DISABLE_BROKER 
GO
ALTER DATABASE [hospital] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [hospital] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [hospital] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [hospital] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [hospital] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [hospital] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [hospital] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [hospital] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [hospital] SET  MULTI_USER 
GO
ALTER DATABASE [hospital] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [hospital] SET DB_CHAINING OFF 
GO
ALTER DATABASE [hospital] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [hospital] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [hospital] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [hospital] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [hospital] SET QUERY_STORE = OFF
GO
USE [hospital]
GO
/****** Object:  Table [dbo].[Заболевания]    Script Date: 23.03.2022 12:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заболевания](
	[ID_заболевания] [int] NOT NULL,
	[Категория] [int] NULL,
	[Наименование_заболевания] [nvarchar](50) NULL,
 CONSTRAINT [PK_Заболевания] PRIMARY KEY CLUSTERED 
(
	[ID_заболевания] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[КатегорияЗаболевания]    Script Date: 23.03.2022 12:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[КатегорияЗаболевания](
	[ID_категории] [int] NOT NULL,
	[Наименование] [nvarchar](50) NULL,
 CONSTRAINT [PK_КатегорияЗаболевания] PRIMARY KEY CLUSTERED 
(
	[ID_категории] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Отделения]    Script Date: 23.03.2022 12:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Отделения](
	[ID_отделения] [int] NOT NULL,
	[Наименование] [nvarchar](50) NULL,
	[ЗавОтделения] [nvarchar](50) NULL,
	[Количество_коев] [int] NULL,
 CONSTRAINT [PK_Отделения] PRIMARY KEY CLUSTERED 
(
	[ID_отделения] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Пациенты]    Script Date: 23.03.2022 12:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Пациенты](
	[ID_пациента] [int] NOT NULL,
	[Фамилия] [nvarchar](50) NULL,
	[Имя] [nvarchar](50) NULL,
	[Отчество] [nvarchar](50) NULL,
	[Дата_рождения] [date] NULL,
	[Адрес] [nvarchar](50) NULL,
	[Участок] [int] NULL,
 CONSTRAINT [PK_Пациенты] PRIMARY KEY CLUSTERED 
(
	[ID_пациента] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[СложностьЗаболевания]    Script Date: 23.03.2022 12:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[СложностьЗаболевания](
	[ID_сложности] [int] NOT NULL,
	[Сложность] [nvarchar](50) NULL,
 CONSTRAINT [PK_СложностьЗаболевания] PRIMARY KEY CLUSTERED 
(
	[ID_сложности] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Участок]    Script Date: 23.03.2022 12:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Участок](
	[ID_участок] [int] NOT NULL,
	[Участок] [nvarchar](50) NULL,
 CONSTRAINT [PK_Участок] PRIMARY KEY CLUSTERED 
(
	[ID_участок] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Учёт больных]    Script Date: 23.03.2022 12:21:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Учёт больных](
	[ID_записи] [int] NOT NULL,
	[Пациент] [int] NULL,
	[Отделение] [int] NULL,
	[ID_заболевания] [int] NULL,
	[Дата_начала] [date] NULL,
	[Дата_окончания] [date] NULL,
	[Сложность] [int] NULL,
 CONSTRAINT [PK_Учёт больных] PRIMARY KEY CLUSTERED 
(
	[ID_записи] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Пациенты] ADD  CONSTRAINT [DF_Пациенты_ID_пациента]  DEFAULT ((1)) FOR [ID_пациента]
GO
ALTER TABLE [dbo].[Заболевания]  WITH CHECK ADD  CONSTRAINT [FK_Заболевания_КатегорияЗаболевания] FOREIGN KEY([Категория])
REFERENCES [dbo].[КатегорияЗаболевания] ([ID_категории])
GO
ALTER TABLE [dbo].[Заболевания] CHECK CONSTRAINT [FK_Заболевания_КатегорияЗаболевания]
GO
ALTER TABLE [dbo].[Пациенты]  WITH CHECK ADD  CONSTRAINT [FK_Пациенты_Участок] FOREIGN KEY([Участок])
REFERENCES [dbo].[Участок] ([ID_участок])
GO
ALTER TABLE [dbo].[Пациенты] CHECK CONSTRAINT [FK_Пациенты_Участок]
GO
ALTER TABLE [dbo].[Учёт больных]  WITH CHECK ADD  CONSTRAINT [FK_Учёт больных_Заболевания] FOREIGN KEY([ID_заболевания])
REFERENCES [dbo].[Заболевания] ([ID_заболевания])
GO
ALTER TABLE [dbo].[Учёт больных] CHECK CONSTRAINT [FK_Учёт больных_Заболевания]
GO
ALTER TABLE [dbo].[Учёт больных]  WITH CHECK ADD  CONSTRAINT [FK_Учёт больных_Отделения] FOREIGN KEY([Отделение])
REFERENCES [dbo].[Отделения] ([ID_отделения])
GO
ALTER TABLE [dbo].[Учёт больных] CHECK CONSTRAINT [FK_Учёт больных_Отделения]
GO
ALTER TABLE [dbo].[Учёт больных]  WITH CHECK ADD  CONSTRAINT [FK_Учёт больных_Пациенты] FOREIGN KEY([Отделение])
REFERENCES [dbo].[Пациенты] ([ID_пациента])
GO
ALTER TABLE [dbo].[Учёт больных] CHECK CONSTRAINT [FK_Учёт больных_Пациенты]
GO
ALTER TABLE [dbo].[Учёт больных]  WITH CHECK ADD  CONSTRAINT [FK_Учёт больных_СложностьЗаболевания] FOREIGN KEY([Сложность])
REFERENCES [dbo].[СложностьЗаболевания] ([ID_сложности])
GO
ALTER TABLE [dbo].[Учёт больных] CHECK CONSTRAINT [FK_Учёт больных_СложностьЗаболевания]
GO
USE [master]
GO
ALTER DATABASE [hospital] SET  READ_WRITE 
GO
