/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2016 (13.0.4206)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2012
    Target Database Engine Edition : Microsoft SQL Server Standard Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [master]
GO
/****** Object:  Database [DapperMultiMapping]    Script Date: 11/3/2017 2:22:41 PM ******/
CREATE DATABASE [DapperMultiMapping]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DapperMultiMapping', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\DapperMultiMapping.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DapperMultiMapping_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\DapperMultiMapping_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DapperMultiMapping].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DapperMultiMapping] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DapperMultiMapping] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DapperMultiMapping] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DapperMultiMapping] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DapperMultiMapping] SET ARITHABORT OFF 
GO
ALTER DATABASE [DapperMultiMapping] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DapperMultiMapping] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DapperMultiMapping] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DapperMultiMapping] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DapperMultiMapping] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DapperMultiMapping] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DapperMultiMapping] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DapperMultiMapping] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DapperMultiMapping] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DapperMultiMapping] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DapperMultiMapping] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DapperMultiMapping] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DapperMultiMapping] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DapperMultiMapping] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DapperMultiMapping] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DapperMultiMapping] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DapperMultiMapping] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DapperMultiMapping] SET RECOVERY FULL 
GO
ALTER DATABASE [DapperMultiMapping] SET  MULTI_USER 
GO
ALTER DATABASE [DapperMultiMapping] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DapperMultiMapping] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DapperMultiMapping] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DapperMultiMapping] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DapperMultiMapping', N'ON'
GO
USE [DapperMultiMapping]
GO
/****** Object:  Table [dbo].[AccountCategory]    Script Date: 11/3/2017 2:22:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountCategory](
	[Id] [int] NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_AccountCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AccountType]    Script Date: 11/3/2017 2:22:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccountType](
	[Id] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_AccountType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Address]    Script Date: 11/3/2017 2:22:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[Id] [int] NOT NULL,
	[Street] [varchar](50) NOT NULL,
	[City] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bank]    Script Date: 11/3/2017 2:22:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bank](
	[Id] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Bank] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BankAccount]    Script Date: 11/3/2017 2:22:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BankAccount](
	[Id] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[CurrencyId] [int] NOT NULL,
	[AccountTypeId] [int] NOT NULL,
	[AccountCategory] [int] NOT NULL,
	[Branch] [varchar](50) NOT NULL,
	[Account] [varchar](50) NOT NULL,
	[BankId] [int] NULL,
	[ManagerId] [int] NULL,
 CONSTRAINT [PK_BankAccount] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Currency]    Script Date: 11/3/2017 2:22:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Currency](
	[Id] [int] NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_Currency] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manager]    Script Date: 11/3/2017 2:22:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manager](
	[Id] [int] NOT NULL,
	[Name] [varchar](50) NULL,
 CONSTRAINT [PK_Manager] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 11/3/2017 2:22:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[AddressId] [int] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AccountCategory] ([Id], [Name]) VALUES (1, N'Bronze')
INSERT [dbo].[AccountCategory] ([Id], [Name]) VALUES (2, N'Prata')
INSERT [dbo].[AccountCategory] ([Id], [Name]) VALUES (3, N'Ouro')
INSERT [dbo].[AccountType] ([Id], [Name]) VALUES (1, N'Poupança')
INSERT [dbo].[AccountType] ([Id], [Name]) VALUES (2, N'Corrente')
INSERT [dbo].[Address] ([Id], [Street], [City]) VALUES (1, N'Av. Marginal Pinheiros', N'São Paulo')
INSERT [dbo].[Bank] ([Id], [Name]) VALUES (1, N'Itaú')
INSERT [dbo].[Bank] ([Id], [Name]) VALUES (2, N'Banco do Brasil')
INSERT [dbo].[Bank] ([Id], [Name]) VALUES (3, N'Bradesco')
INSERT [dbo].[BankAccount] ([Id], [UserId], [CurrencyId], [AccountTypeId], [AccountCategory], [Branch], [Account], [BankId], [ManagerId]) VALUES (1, 5, 1, 2, 2, N'3344', N'55789-8', 1, 1)
INSERT [dbo].[BankAccount] ([Id], [UserId], [CurrencyId], [AccountTypeId], [AccountCategory], [Branch], [Account], [BankId], [ManagerId]) VALUES (2, 5, 2, 1, 3, N'5544', N'48781-7', 1, 2)
INSERT [dbo].[Currency] ([Id], [Name]) VALUES (1, N'BRL')
INSERT [dbo].[Currency] ([Id], [Name]) VALUES (2, N'USD')
INSERT [dbo].[Currency] ([Id], [Name]) VALUES (3, N'EUR')
INSERT [dbo].[Manager] ([Id], [Name]) VALUES (1, N'Gerente Junior')
INSERT [dbo].[Manager] ([Id], [Name]) VALUES (2, N'Gerente Ricardo')
INSERT [dbo].[User] ([Id], [Name], [AddressId]) VALUES (5, N'Peris Cleiton', 1)
USE [master]
GO
ALTER DATABASE [DapperMultiMapping] SET  READ_WRITE 
GO
