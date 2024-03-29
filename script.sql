USE [master]
GO
/****** Object:  Database [CustomerSideDatabaseForBank]    Script Date: 12/3/2018 11:34:26 PM ******/
CREATE DATABASE [CustomerSideDatabaseForBank]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CustomerSideDatabaseForBank', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\CustomerSideDatabaseForBank.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CustomerSideDatabaseForBank_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\CustomerSideDatabaseForBank_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [CustomerSideDatabaseForBank] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CustomerSideDatabaseForBank].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CustomerSideDatabaseForBank] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CustomerSideDatabaseForBank] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CustomerSideDatabaseForBank] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CustomerSideDatabaseForBank] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CustomerSideDatabaseForBank] SET ARITHABORT OFF 
GO
ALTER DATABASE [CustomerSideDatabaseForBank] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CustomerSideDatabaseForBank] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CustomerSideDatabaseForBank] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CustomerSideDatabaseForBank] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CustomerSideDatabaseForBank] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CustomerSideDatabaseForBank] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CustomerSideDatabaseForBank] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CustomerSideDatabaseForBank] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CustomerSideDatabaseForBank] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CustomerSideDatabaseForBank] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CustomerSideDatabaseForBank] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CustomerSideDatabaseForBank] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CustomerSideDatabaseForBank] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CustomerSideDatabaseForBank] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CustomerSideDatabaseForBank] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CustomerSideDatabaseForBank] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CustomerSideDatabaseForBank] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CustomerSideDatabaseForBank] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CustomerSideDatabaseForBank] SET  MULTI_USER 
GO
ALTER DATABASE [CustomerSideDatabaseForBank] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CustomerSideDatabaseForBank] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CustomerSideDatabaseForBank] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CustomerSideDatabaseForBank] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CustomerSideDatabaseForBank] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CustomerSideDatabaseForBank] SET QUERY_STORE = OFF
GO
USE [CustomerSideDatabaseForBank]
GO
/****** Object:  UserDefinedFunction [dbo].[BranchCity]    Script Date: 12/3/2018 11:34:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE   FUNCTION [dbo].[BranchCity]
(@city VARCHAR(15))
returns INT
AS    
BEGIN  
    DECLARE @c_id int;  

	

	SELECT @c_id = CASE @city
         WHEN 'Central City' THEN 1
	     WHEN 'Chicago' THEN 2
		 WHEN 'Columbia' THEN 3
		 WHEN 'Krypton' THEN 4
		 WHEN 'Minnesota' THEN 5
		 WHEN 'Moscow' THEN 6
		 WHEN 'Mumbai' THEN 7
		 WHEN 'National City' THEN 8
		 WHEN 'New Islands' THEN 9
		 WHEN 'New Jersey' THEN 10
		 WHEN 'New Orleans' THEN 11
         WHEN 'New York' THEN 12
		 WHEN 'Ohio' THEN 13
         WHEN 'Oklahoma' THEN 14 
         WHEN 'Paris' THEN 15
		 WHEN 'San Francisco' THEN 16
		 WHEN 'Star City' THEN 17
		 WHEN 'Texas' THEN 18
         END;

/*
	    CASE city 
		 WHEN 'Central City' THEN @c_id=1
	     WHEN 'Chicago' THEN @c_id=2
		 WHEN 'Columbia' THEN @c_id=3
		 WHEN 'Krypton' THEN @c_id=4
		 WHEN 'Minnesota' THEN @c_id=5
		 WHEN 'Moscow' THEN @c_id=6
		 WHEN 'Mumbai' THEN @c_id=7
		 WHEN 'National City' THEN @c_id=8
		 WHEN 'New Islands' THEN @c_id=9
		 WHEN 'New Jersey' THEN @c_id=10
		 WHEN 'New Orleans' THEN @c_id=11
         WHEN 'New York' THEN @c_id=12
		 WHEN 'Ohio' THEN @c_id=13
         WHEN 'Oklahoma' THEN @c_id=14 
         WHEN 'Paris' THEN @c_id=15
		 WHEN 'San Francisco' THEN @c_id=16
		 WHEN 'Star City' THEN @c_id=17
		 WHEN 'Texas' THEN @c_id=18
		
      END  */
RETURN (@c_id);
END;
GO
/****** Object:  Table [dbo].[CUSTOMER]    Script Date: 12/3/2018 11:34:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CUSTOMER](
	[customer_id] [int] IDENTITY(1,1) NOT NULL,
	[c_name] [varchar](20) NULL,
	[c_last_name] [varchar](20) NULL,
	[street] [varchar](20) NULL,
	[city] [varchar](20) NULL,
	[c_phone_number] [numeric](10, 0) NULL,
 CONSTRAINT [customer_pk] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BRANCH]    Script Date: 12/3/2018 11:34:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BRANCH](
	[branch_id] [int] NOT NULL,
	[branch_name] [varchar](30) NOT NULL,
	[branch_city] [varchar](15) NOT NULL,
 CONSTRAINT [branch_pk] PRIMARY KEY CLUSTERED 
(
	[branch_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BANK]    Script Date: 12/3/2018 11:34:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BANK](
	[cust_id] [int] NULL,
	[bran_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[TOP15_CUSTOMER_BRANCH]    Script Date: 12/3/2018 11:34:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TOP15_CUSTOMER_BRANCH] AS
SELECT cust_id,bran_id,c_name,branch_name
FROM BANK b, CUSTOMER c,BRANCH br
WHERE c.customer_id<15
AND b.cust_id=c.customer_id 
AND b.bran_id=br.branch_id 
GO
/****** Object:  Table [dbo].[TRANSACTIONS]    Script Date: 12/3/2018 11:34:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TRANSACTIONS](
	[transaction_number] [numeric](11, 0) IDENTITY(11112465244,4) NOT NULL,
	[transaction_type] [varchar](15) NULL,
	[amount] [int] NULL,
	[cust_id] [int] NULL,
 CONSTRAINT [transaction_pk] PRIMARY KEY CLUSTERED 
(
	[transaction_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[TRANSACT]    Script Date: 12/3/2018 11:34:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TRANSACT] AS
SELECT c_name,cust_id,transaction_type,amount
FROM CUSTOMER c INNER JOIN TRANSACTIONS t
ON c.customer_id=t.cust_id
GO
/****** Object:  Table [dbo].[BANK_CARD]    Script Date: 12/3/2018 11:34:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BANK_CARD](
	[card_number] [numeric](16, 0) IDENTITY(1111222233334444,1) NOT NULL,
	[card_type] [varchar](20) NULL,
	[expire_date] [date] NOT NULL,
	[c_id] [int] NULL,
 CONSTRAINT [card_pk] PRIMARY KEY CLUSTERED 
(
	[card_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DEBIT_CARD]    Script Date: 12/3/2018 11:34:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DEBIT_CARD](
	[card_number] [numeric](16, 0) NULL,
	[card_type]  AS (isnull(CONVERT([varchar](20),'DEBIT_CARD'),'')) PERSISTED NOT NULL,
	[withdraw_limit] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[DEBIT]    Script Date: 12/3/2018 11:34:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[DEBIT] AS
SELECT dc.card_number,dc.card_type,withdraw_limit,c_id
FROM DEBIT_CARD dc LEFT JOIN BANK_CARD bc
ON dc.card_number=bc.card_number
WHERE withdraw_limit >1000
GO
/****** Object:  View [dbo].[CUSTOMER_BRANCH]    Script Date: 12/3/2018 11:34:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[CUSTOMER_BRANCH] AS
SELECT c_name,c_last_name,branch_name FROM CUSTOMER c, BRANCH b,BANK
WHERE BANK.cust_id=c.customer_id
AND BANK.bran_id=b.branch_id
AND bran_id IN(
SELECT branch_id FROM BRANCH 
WHERE branch_name<>'National Bank')
GO
/****** Object:  View [dbo].[BANK_INFO]    Script Date: 12/3/2018 11:34:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[BANK_INFO]  AS
 SELECT card_number,c_id,c_name 
 FROM BANK_CARD bc LEFT JOIN CUSTOMER c
 ON bc.c_id=c.customer_id
 WHERE c.city='New York'
GO
/****** Object:  View [dbo].[CARD_INFO]    Script Date: 12/3/2018 11:34:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 CREATE VIEW [dbo].[CARD_INFO] AS
SELECT c_name,city
FROM CUSTOMER WHERE customer_id IN (
SELECT c_id FROM BANK_CARD
WHERE card_number IN(
SELECT card_number FROM DEBIT_CARD) 
) 
GO
/****** Object:  Table [dbo].[BALANCE_LOG]    Script Date: 12/3/2018 11:34:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BALANCE_LOG](
	[cid] [int] NOT NULL,
	[ACTIONTYPE] [varchar](15) NULL,
	[last_status] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BANK_ACCOUNT]    Script Date: 12/3/2018 11:34:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BANK_ACCOUNT](
	[account_number] [numeric](18, 0) IDENTITY(100900001111145896,2) NOT NULL,
	[balance] [int] NULL,
	[account_type] [varchar](20) NULL,
	[cust_id] [int] NULL,
 CONSTRAINT [acc_pk] PRIMARY KEY CLUSTERED 
(
	[account_number] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CREDIT_CARD]    Script Date: 12/3/2018 11:34:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CREDIT_CARD](
	[card_number] [numeric](16, 0) NULL,
	[card_type]  AS (isnull(CONVERT([varchar](20),'CREDIT_CARD'),'')) PERSISTED NOT NULL,
	[loan_limit] [int] NULL,
	[current_dept] [numeric](20, 5) NULL,
	[minimum_monthly_payment] [numeric](20, 5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CUSTOMER_LOG]    Script Date: 12/3/2018 11:34:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CUSTOMER_LOG](
	[cid] [int] NOT NULL,
	[ACTIONTYPE] [varchar](1) NULL,
	[ACTIONDATE] [datetime2](7) NULL
) ON [PRIMARY]
GO
INSERT [dbo].[BANK] ([cust_id], [bran_id]) VALUES (1, 17)
INSERT [dbo].[BANK] ([cust_id], [bran_id]) VALUES (2, 13)
INSERT [dbo].[BANK] ([cust_id], [bran_id]) VALUES (3, 11)
INSERT [dbo].[BANK] ([cust_id], [bran_id]) VALUES (4, 1)
INSERT [dbo].[BANK] ([cust_id], [bran_id]) VALUES (5, 7)
INSERT [dbo].[BANK] ([cust_id], [bran_id]) VALUES (6, 3)
INSERT [dbo].[BANK] ([cust_id], [bran_id]) VALUES (7, 2)
INSERT [dbo].[BANK] ([cust_id], [bran_id]) VALUES (8, 3)
INSERT [dbo].[BANK] ([cust_id], [bran_id]) VALUES (9, 1)
INSERT [dbo].[BANK] ([cust_id], [bran_id]) VALUES (10, 12)
INSERT [dbo].[BANK] ([cust_id], [bran_id]) VALUES (11, 15)
INSERT [dbo].[BANK] ([cust_id], [bran_id]) VALUES (12, 17)
INSERT [dbo].[BANK] ([cust_id], [bran_id]) VALUES (13, 9)
INSERT [dbo].[BANK] ([cust_id], [bran_id]) VALUES (14, 8)
INSERT [dbo].[BANK] ([cust_id], [bran_id]) VALUES (15, 7)
INSERT [dbo].[BANK] ([cust_id], [bran_id]) VALUES (16, 6)
INSERT [dbo].[BANK] ([cust_id], [bran_id]) VALUES (17, 5)
INSERT [dbo].[BANK] ([cust_id], [bran_id]) VALUES (18, 4)
INSERT [dbo].[BANK] ([cust_id], [bran_id]) VALUES (19, 3)
INSERT [dbo].[BANK] ([cust_id], [bran_id]) VALUES (20, 2)
INSERT [dbo].[BANK] ([cust_id], [bran_id]) VALUES (21, 1)
INSERT [dbo].[BANK] ([cust_id], [bran_id]) VALUES (22, 18)
INSERT [dbo].[BANK] ([cust_id], [bran_id]) VALUES (23, 17)
INSERT [dbo].[BANK] ([cust_id], [bran_id]) VALUES (24, 16)
INSERT [dbo].[BANK] ([cust_id], [bran_id]) VALUES (25, 16)
INSERT [dbo].[BANK] ([cust_id], [bran_id]) VALUES (26, 15)
INSERT [dbo].[BANK] ([cust_id], [bran_id]) VALUES (27, 14)
INSERT [dbo].[BANK] ([cust_id], [bran_id]) VALUES (28, 13)
INSERT [dbo].[BANK] ([cust_id], [bran_id]) VALUES (29, 12)
INSERT [dbo].[BANK] ([cust_id], [bran_id]) VALUES (30, 11)
INSERT [dbo].[BANK] ([cust_id], [bran_id]) VALUES (31, 10)
INSERT [dbo].[BANK] ([cust_id], [bran_id]) VALUES (32, 9)
INSERT [dbo].[BANK] ([cust_id], [bran_id]) VALUES (33, 8)
INSERT [dbo].[BANK] ([cust_id], [bran_id]) VALUES (34, 7)
SET IDENTITY_INSERT [dbo].[BANK_ACCOUNT] ON 

INSERT [dbo].[BANK_ACCOUNT] ([account_number], [balance], [account_type], [cust_id]) VALUES (CAST(100900001111145896 AS Numeric(18, 0)), 500, N'Deposit', 1)
INSERT [dbo].[BANK_ACCOUNT] ([account_number], [balance], [account_type], [cust_id]) VALUES (CAST(100900001111145898 AS Numeric(18, 0)), 1400, N'Deposit', 2)
INSERT [dbo].[BANK_ACCOUNT] ([account_number], [balance], [account_type], [cust_id]) VALUES (CAST(100900001111145900 AS Numeric(18, 0)), -500, N'Checking', 3)
INSERT [dbo].[BANK_ACCOUNT] ([account_number], [balance], [account_type], [cust_id]) VALUES (CAST(100900001111145902 AS Numeric(18, 0)), 200, N'Deposit', 4)
INSERT [dbo].[BANK_ACCOUNT] ([account_number], [balance], [account_type], [cust_id]) VALUES (CAST(100900001111145904 AS Numeric(18, 0)), 200, N'Checking', 5)
INSERT [dbo].[BANK_ACCOUNT] ([account_number], [balance], [account_type], [cust_id]) VALUES (CAST(100900001111145906 AS Numeric(18, 0)), -1800, N'Deposit', 6)
INSERT [dbo].[BANK_ACCOUNT] ([account_number], [balance], [account_type], [cust_id]) VALUES (CAST(100900001111145908 AS Numeric(18, 0)), 500, N'Deposit', 7)
INSERT [dbo].[BANK_ACCOUNT] ([account_number], [balance], [account_type], [cust_id]) VALUES (CAST(100900001111145910 AS Numeric(18, 0)), 200, N'Checking', 8)
INSERT [dbo].[BANK_ACCOUNT] ([account_number], [balance], [account_type], [cust_id]) VALUES (CAST(100900001111145912 AS Numeric(18, 0)), 200, N'Deposit', 9)
INSERT [dbo].[BANK_ACCOUNT] ([account_number], [balance], [account_type], [cust_id]) VALUES (CAST(100900001111145914 AS Numeric(18, 0)), -2800, N'Deposit', 10)
INSERT [dbo].[BANK_ACCOUNT] ([account_number], [balance], [account_type], [cust_id]) VALUES (CAST(100900001111145916 AS Numeric(18, 0)), 200, N'Checking', 11)
INSERT [dbo].[BANK_ACCOUNT] ([account_number], [balance], [account_type], [cust_id]) VALUES (CAST(100900001111145918 AS Numeric(18, 0)), 200, N'Checking', 12)
INSERT [dbo].[BANK_ACCOUNT] ([account_number], [balance], [account_type], [cust_id]) VALUES (CAST(100900001111145920 AS Numeric(18, 0)), -700, N'Checking', 13)
INSERT [dbo].[BANK_ACCOUNT] ([account_number], [balance], [account_type], [cust_id]) VALUES (CAST(100900001111145922 AS Numeric(18, 0)), 1200, N'Checking', 14)
INSERT [dbo].[BANK_ACCOUNT] ([account_number], [balance], [account_type], [cust_id]) VALUES (CAST(100900001111145924 AS Numeric(18, 0)), 1700, N'Deposit', 15)
INSERT [dbo].[BANK_ACCOUNT] ([account_number], [balance], [account_type], [cust_id]) VALUES (CAST(100900001111145926 AS Numeric(18, 0)), 200, N'Deposit', 16)
INSERT [dbo].[BANK_ACCOUNT] ([account_number], [balance], [account_type], [cust_id]) VALUES (CAST(100900001111145928 AS Numeric(18, 0)), 200, N'Checking', 17)
INSERT [dbo].[BANK_ACCOUNT] ([account_number], [balance], [account_type], [cust_id]) VALUES (CAST(100900001111145930 AS Numeric(18, 0)), 200, N'Deposit', 18)
INSERT [dbo].[BANK_ACCOUNT] ([account_number], [balance], [account_type], [cust_id]) VALUES (CAST(100900001111145932 AS Numeric(18, 0)), 200, N'Deposit', 19)
INSERT [dbo].[BANK_ACCOUNT] ([account_number], [balance], [account_type], [cust_id]) VALUES (CAST(100900001111145934 AS Numeric(18, 0)), 2400, N'Deposit', 20)
INSERT [dbo].[BANK_ACCOUNT] ([account_number], [balance], [account_type], [cust_id]) VALUES (CAST(100900001111145936 AS Numeric(18, 0)), 200, N'Deposit', 21)
INSERT [dbo].[BANK_ACCOUNT] ([account_number], [balance], [account_type], [cust_id]) VALUES (CAST(100900001111145938 AS Numeric(18, 0)), -300, N'Checking', 22)
INSERT [dbo].[BANK_ACCOUNT] ([account_number], [balance], [account_type], [cust_id]) VALUES (CAST(100900001111145940 AS Numeric(18, 0)), -3300, N'Checking', 23)
INSERT [dbo].[BANK_ACCOUNT] ([account_number], [balance], [account_type], [cust_id]) VALUES (CAST(100900001111145942 AS Numeric(18, 0)), 200, N'Checking', 24)
INSERT [dbo].[BANK_ACCOUNT] ([account_number], [balance], [account_type], [cust_id]) VALUES (CAST(100900001111145944 AS Numeric(18, 0)), -100, N'Checking', 25)
INSERT [dbo].[BANK_ACCOUNT] ([account_number], [balance], [account_type], [cust_id]) VALUES (CAST(100900001111145946 AS Numeric(18, 0)), 1400, N'Deposit', 26)
INSERT [dbo].[BANK_ACCOUNT] ([account_number], [balance], [account_type], [cust_id]) VALUES (CAST(100900001111145948 AS Numeric(18, 0)), 200, N'Deposit', 27)
INSERT [dbo].[BANK_ACCOUNT] ([account_number], [balance], [account_type], [cust_id]) VALUES (CAST(100900001111145950 AS Numeric(18, 0)), 200, N'Deposit', 28)
INSERT [dbo].[BANK_ACCOUNT] ([account_number], [balance], [account_type], [cust_id]) VALUES (CAST(100900001111145952 AS Numeric(18, 0)), 200, N'Checking', 29)
INSERT [dbo].[BANK_ACCOUNT] ([account_number], [balance], [account_type], [cust_id]) VALUES (CAST(100900001111145954 AS Numeric(18, 0)), 200, N'Deposit', 30)
INSERT [dbo].[BANK_ACCOUNT] ([account_number], [balance], [account_type], [cust_id]) VALUES (CAST(100900001111145956 AS Numeric(18, 0)), 800, N'Checking', 31)
INSERT [dbo].[BANK_ACCOUNT] ([account_number], [balance], [account_type], [cust_id]) VALUES (CAST(100900001111145958 AS Numeric(18, 0)), 200, N'Deposit', 32)
INSERT [dbo].[BANK_ACCOUNT] ([account_number], [balance], [account_type], [cust_id]) VALUES (CAST(100900001111145960 AS Numeric(18, 0)), 200, N'Deposit', 33)
INSERT [dbo].[BANK_ACCOUNT] ([account_number], [balance], [account_type], [cust_id]) VALUES (CAST(100900001111145962 AS Numeric(18, 0)), 0, N'Checking', 34)
SET IDENTITY_INSERT [dbo].[BANK_ACCOUNT] OFF
SET IDENTITY_INSERT [dbo].[BANK_CARD] ON 

INSERT [dbo].[BANK_CARD] ([card_number], [card_type], [expire_date], [c_id]) VALUES (CAST(1111222233334444 AS Numeric(16, 0)), N'DEBIT_CARD', CAST(N'2018-12-03' AS Date), 1)
INSERT [dbo].[BANK_CARD] ([card_number], [card_type], [expire_date], [c_id]) VALUES (CAST(1111222233334445 AS Numeric(16, 0)), N'CREDIT_CARD', CAST(N'2018-12-03' AS Date), 2)
INSERT [dbo].[BANK_CARD] ([card_number], [card_type], [expire_date], [c_id]) VALUES (CAST(1111222233334446 AS Numeric(16, 0)), N'DEBIT_CARD', CAST(N'2018-12-03' AS Date), 3)
INSERT [dbo].[BANK_CARD] ([card_number], [card_type], [expire_date], [c_id]) VALUES (CAST(1111222233334447 AS Numeric(16, 0)), N'DEBIT_CARD', CAST(N'2018-12-03' AS Date), 4)
INSERT [dbo].[BANK_CARD] ([card_number], [card_type], [expire_date], [c_id]) VALUES (CAST(1111222233334448 AS Numeric(16, 0)), N'CREDIT_CARD', CAST(N'2018-12-03' AS Date), 5)
INSERT [dbo].[BANK_CARD] ([card_number], [card_type], [expire_date], [c_id]) VALUES (CAST(1111222233334449 AS Numeric(16, 0)), N'CREDIT_CARD', CAST(N'2018-12-03' AS Date), 6)
INSERT [dbo].[BANK_CARD] ([card_number], [card_type], [expire_date], [c_id]) VALUES (CAST(1111222233334450 AS Numeric(16, 0)), N'CREDIT_CARD', CAST(N'2018-12-03' AS Date), 7)
INSERT [dbo].[BANK_CARD] ([card_number], [card_type], [expire_date], [c_id]) VALUES (CAST(1111222233334451 AS Numeric(16, 0)), N'DEBIT_CARD', CAST(N'2018-12-03' AS Date), 8)
INSERT [dbo].[BANK_CARD] ([card_number], [card_type], [expire_date], [c_id]) VALUES (CAST(1111222233334452 AS Numeric(16, 0)), N'CREDIT_CARD', CAST(N'2018-12-03' AS Date), 9)
INSERT [dbo].[BANK_CARD] ([card_number], [card_type], [expire_date], [c_id]) VALUES (CAST(1111222233334453 AS Numeric(16, 0)), N'DEBIT_CARD', CAST(N'2018-12-03' AS Date), 10)
INSERT [dbo].[BANK_CARD] ([card_number], [card_type], [expire_date], [c_id]) VALUES (CAST(1111222233334454 AS Numeric(16, 0)), N'CREDIT_CARD', CAST(N'2018-12-03' AS Date), 20)
INSERT [dbo].[BANK_CARD] ([card_number], [card_type], [expire_date], [c_id]) VALUES (CAST(1111222233334455 AS Numeric(16, 0)), N'DEBIT_CARD', CAST(N'2018-12-03' AS Date), 19)
INSERT [dbo].[BANK_CARD] ([card_number], [card_type], [expire_date], [c_id]) VALUES (CAST(1111222233334456 AS Numeric(16, 0)), N'DEBIT_CARD', CAST(N'2018-12-03' AS Date), 18)
INSERT [dbo].[BANK_CARD] ([card_number], [card_type], [expire_date], [c_id]) VALUES (CAST(1111222233334457 AS Numeric(16, 0)), N'DEBIT_CARD', CAST(N'2018-12-03' AS Date), 17)
INSERT [dbo].[BANK_CARD] ([card_number], [card_type], [expire_date], [c_id]) VALUES (CAST(1111222233334458 AS Numeric(16, 0)), N'CREDIT_CARD', CAST(N'2018-12-03' AS Date), 16)
INSERT [dbo].[BANK_CARD] ([card_number], [card_type], [expire_date], [c_id]) VALUES (CAST(1111222233334459 AS Numeric(16, 0)), N'DEBIT_CARD', CAST(N'2018-12-03' AS Date), 15)
INSERT [dbo].[BANK_CARD] ([card_number], [card_type], [expire_date], [c_id]) VALUES (CAST(1111222233334460 AS Numeric(16, 0)), N'CREDIT_CARD', CAST(N'2018-12-03' AS Date), 14)
INSERT [dbo].[BANK_CARD] ([card_number], [card_type], [expire_date], [c_id]) VALUES (CAST(1111222233334461 AS Numeric(16, 0)), N'DEBIT_CARD', CAST(N'2018-12-03' AS Date), 13)
INSERT [dbo].[BANK_CARD] ([card_number], [card_type], [expire_date], [c_id]) VALUES (CAST(1111222233334462 AS Numeric(16, 0)), N'DEBIT_CARD', CAST(N'2018-12-03' AS Date), 12)
INSERT [dbo].[BANK_CARD] ([card_number], [card_type], [expire_date], [c_id]) VALUES (CAST(1111222233334463 AS Numeric(16, 0)), N'DEBIT_CARD', CAST(N'2018-12-03' AS Date), 11)
INSERT [dbo].[BANK_CARD] ([card_number], [card_type], [expire_date], [c_id]) VALUES (CAST(1111222233334464 AS Numeric(16, 0)), N'DEBIT_CARD', CAST(N'2018-12-03' AS Date), 21)
INSERT [dbo].[BANK_CARD] ([card_number], [card_type], [expire_date], [c_id]) VALUES (CAST(1111222233334465 AS Numeric(16, 0)), N'DEBIT_CARD', CAST(N'2018-12-03' AS Date), 22)
INSERT [dbo].[BANK_CARD] ([card_number], [card_type], [expire_date], [c_id]) VALUES (CAST(1111222233334466 AS Numeric(16, 0)), N'CREDIT_CARD', CAST(N'2018-12-03' AS Date), 23)
INSERT [dbo].[BANK_CARD] ([card_number], [card_type], [expire_date], [c_id]) VALUES (CAST(1111222233334467 AS Numeric(16, 0)), N'CREDIT_CARD', CAST(N'2018-12-03' AS Date), 24)
INSERT [dbo].[BANK_CARD] ([card_number], [card_type], [expire_date], [c_id]) VALUES (CAST(1111222233334468 AS Numeric(16, 0)), N'CREDIT_CARD', CAST(N'2018-12-03' AS Date), 25)
INSERT [dbo].[BANK_CARD] ([card_number], [card_type], [expire_date], [c_id]) VALUES (CAST(1111222233334469 AS Numeric(16, 0)), N'CREDIT_CARD', CAST(N'2018-12-03' AS Date), 34)
INSERT [dbo].[BANK_CARD] ([card_number], [card_type], [expire_date], [c_id]) VALUES (CAST(1111222233334470 AS Numeric(16, 0)), N'CREDIT_CARD', CAST(N'2018-12-03' AS Date), 33)
INSERT [dbo].[BANK_CARD] ([card_number], [card_type], [expire_date], [c_id]) VALUES (CAST(1111222233334471 AS Numeric(16, 0)), N'DEBIT_CARD', CAST(N'2018-12-03' AS Date), 32)
INSERT [dbo].[BANK_CARD] ([card_number], [card_type], [expire_date], [c_id]) VALUES (CAST(1111222233334472 AS Numeric(16, 0)), N'CREDIT_CARD', CAST(N'2018-12-03' AS Date), 31)
INSERT [dbo].[BANK_CARD] ([card_number], [card_type], [expire_date], [c_id]) VALUES (CAST(1111222233334473 AS Numeric(16, 0)), N'CREDIT_CARD', CAST(N'2018-12-03' AS Date), 30)
INSERT [dbo].[BANK_CARD] ([card_number], [card_type], [expire_date], [c_id]) VALUES (CAST(1111222233334474 AS Numeric(16, 0)), N'DEBIT_CARD', CAST(N'2018-12-03' AS Date), 29)
INSERT [dbo].[BANK_CARD] ([card_number], [card_type], [expire_date], [c_id]) VALUES (CAST(1111222233334475 AS Numeric(16, 0)), N'DEBIT_CARD', CAST(N'2018-12-03' AS Date), 28)
INSERT [dbo].[BANK_CARD] ([card_number], [card_type], [expire_date], [c_id]) VALUES (CAST(1111222233334476 AS Numeric(16, 0)), N'DEBIT_CARD', CAST(N'2018-12-03' AS Date), 27)
INSERT [dbo].[BANK_CARD] ([card_number], [card_type], [expire_date], [c_id]) VALUES (CAST(1111222233334477 AS Numeric(16, 0)), N'CREDIT_CARD', CAST(N'2018-12-03' AS Date), 26)
SET IDENTITY_INSERT [dbo].[BANK_CARD] OFF
INSERT [dbo].[BRANCH] ([branch_id], [branch_name], [branch_city]) VALUES (1, N'Working Bank', N'Central City')
INSERT [dbo].[BRANCH] ([branch_id], [branch_name], [branch_city]) VALUES (2, N'Business Bank', N'Chicago')
INSERT [dbo].[BRANCH] ([branch_id], [branch_name], [branch_city]) VALUES (3, N'Secure Bank', N'Columbia')
INSERT [dbo].[BRANCH] ([branch_id], [branch_name], [branch_city]) VALUES (4, N'Alien Bank', N'Krypton')
INSERT [dbo].[BRANCH] ([branch_id], [branch_name], [branch_city]) VALUES (5, N'Trust Bank', N'Minnesota')
INSERT [dbo].[BRANCH] ([branch_id], [branch_name], [branch_city]) VALUES (6, N'FarCold Bank', N'Moscow')
INSERT [dbo].[BRANCH] ([branch_id], [branch_name], [branch_city]) VALUES (7, N'Sweet Bank', N'Mumbai')
INSERT [dbo].[BRANCH] ([branch_id], [branch_name], [branch_city]) VALUES (8, N'National Bank', N'National City')
INSERT [dbo].[BRANCH] ([branch_id], [branch_name], [branch_city]) VALUES (9, N'Island Bank', N'New Islands')
INSERT [dbo].[BRANCH] ([branch_id], [branch_name], [branch_city]) VALUES (10, N'Central Bank', N'New Jersey')
INSERT [dbo].[BRANCH] ([branch_id], [branch_name], [branch_city]) VALUES (11, N'Orleans Bank', N'New Orleans')
INSERT [dbo].[BRANCH] ([branch_id], [branch_name], [branch_city]) VALUES (12, N'Manhattan Bank', N'New York')
INSERT [dbo].[BRANCH] ([branch_id], [branch_name], [branch_city]) VALUES (13, N'Ohio City Bank', N'Ohio')
INSERT [dbo].[BRANCH] ([branch_id], [branch_name], [branch_city]) VALUES (14, N'Jeck Jack Bank', N'Oklahoma')
INSERT [dbo].[BRANCH] ([branch_id], [branch_name], [branch_city]) VALUES (15, N'Modern Bank', N'Paris')
INSERT [dbo].[BRANCH] ([branch_id], [branch_name], [branch_city]) VALUES (16, N'Red Bank', N'San Francisco')
INSERT [dbo].[BRANCH] ([branch_id], [branch_name], [branch_city]) VALUES (17, N'Star Bank', N'Star City')
INSERT [dbo].[BRANCH] ([branch_id], [branch_name], [branch_city]) VALUES (18, N'Texas Bank', N'Texas')
INSERT [dbo].[CREDIT_CARD] ([card_number], [loan_limit], [current_dept], [minimum_monthly_payment]) VALUES (CAST(1111222233334445 AS Numeric(16, 0)), 10000, CAST(0.00000 AS Numeric(20, 5)), CAST(0.00000 AS Numeric(20, 5)))
INSERT [dbo].[CREDIT_CARD] ([card_number], [loan_limit], [current_dept], [minimum_monthly_payment]) VALUES (CAST(1111222233334448 AS Numeric(16, 0)), 20000, CAST(0.00000 AS Numeric(20, 5)), CAST(0.00000 AS Numeric(20, 5)))
INSERT [dbo].[CREDIT_CARD] ([card_number], [loan_limit], [current_dept], [minimum_monthly_payment]) VALUES (CAST(1111222233334449 AS Numeric(16, 0)), 30000, CAST(0.00000 AS Numeric(20, 5)), CAST(0.00000 AS Numeric(20, 5)))
INSERT [dbo].[CREDIT_CARD] ([card_number], [loan_limit], [current_dept], [minimum_monthly_payment]) VALUES (CAST(1111222233334450 AS Numeric(16, 0)), 10000, CAST(0.00000 AS Numeric(20, 5)), CAST(0.00000 AS Numeric(20, 5)))
INSERT [dbo].[CREDIT_CARD] ([card_number], [loan_limit], [current_dept], [minimum_monthly_payment]) VALUES (CAST(1111222233334452 AS Numeric(16, 0)), 25000, CAST(0.00000 AS Numeric(20, 5)), CAST(0.00000 AS Numeric(20, 5)))
INSERT [dbo].[CREDIT_CARD] ([card_number], [loan_limit], [current_dept], [minimum_monthly_payment]) VALUES (CAST(1111222233334454 AS Numeric(16, 0)), 34000, CAST(10000.00000 AS Numeric(20, 5)), CAST(3000.00000 AS Numeric(20, 5)))
INSERT [dbo].[CREDIT_CARD] ([card_number], [loan_limit], [current_dept], [minimum_monthly_payment]) VALUES (CAST(1111222233334458 AS Numeric(16, 0)), 45000, CAST(100.00000 AS Numeric(20, 5)), CAST(30.00000 AS Numeric(20, 5)))
INSERT [dbo].[CREDIT_CARD] ([card_number], [loan_limit], [current_dept], [minimum_monthly_payment]) VALUES (CAST(1111222233334460 AS Numeric(16, 0)), 50000, CAST(1500.00000 AS Numeric(20, 5)), CAST(450.00000 AS Numeric(20, 5)))
INSERT [dbo].[CREDIT_CARD] ([card_number], [loan_limit], [current_dept], [minimum_monthly_payment]) VALUES (CAST(1111222233334466 AS Numeric(16, 0)), 20000, CAST(1000.00000 AS Numeric(20, 5)), CAST(300.00000 AS Numeric(20, 5)))
INSERT [dbo].[CREDIT_CARD] ([card_number], [loan_limit], [current_dept], [minimum_monthly_payment]) VALUES (CAST(1111222233334467 AS Numeric(16, 0)), 100000, CAST(2000.00000 AS Numeric(20, 5)), CAST(600.00000 AS Numeric(20, 5)))
INSERT [dbo].[CREDIT_CARD] ([card_number], [loan_limit], [current_dept], [minimum_monthly_payment]) VALUES (CAST(1111222233334468 AS Numeric(16, 0)), 150000, CAST(0.00000 AS Numeric(20, 5)), CAST(0.00000 AS Numeric(20, 5)))
INSERT [dbo].[CREDIT_CARD] ([card_number], [loan_limit], [current_dept], [minimum_monthly_payment]) VALUES (CAST(1111222233334469 AS Numeric(16, 0)), 10000, CAST(0.00000 AS Numeric(20, 5)), CAST(0.00000 AS Numeric(20, 5)))
INSERT [dbo].[CREDIT_CARD] ([card_number], [loan_limit], [current_dept], [minimum_monthly_payment]) VALUES (CAST(1111222233334470 AS Numeric(16, 0)), 15000, CAST(0.00000 AS Numeric(20, 5)), CAST(0.00000 AS Numeric(20, 5)))
INSERT [dbo].[CREDIT_CARD] ([card_number], [loan_limit], [current_dept], [minimum_monthly_payment]) VALUES (CAST(1111222233334472 AS Numeric(16, 0)), 12000, CAST(500.00000 AS Numeric(20, 5)), CAST(150.00000 AS Numeric(20, 5)))
INSERT [dbo].[CREDIT_CARD] ([card_number], [loan_limit], [current_dept], [minimum_monthly_payment]) VALUES (CAST(1111222233334473 AS Numeric(16, 0)), 20000, CAST(1500.00000 AS Numeric(20, 5)), CAST(450.00000 AS Numeric(20, 5)))
INSERT [dbo].[CREDIT_CARD] ([card_number], [loan_limit], [current_dept], [minimum_monthly_payment]) VALUES (CAST(1111222233334477 AS Numeric(16, 0)), 50000, CAST(25000.00000 AS Numeric(20, 5)), CAST(7500.00000 AS Numeric(20, 5)))
SET IDENTITY_INSERT [dbo].[CUSTOMER] ON 

INSERT [dbo].[CUSTOMER] ([customer_id], [c_name], [c_last_name], [street], [city], [c_phone_number]) VALUES (1, N'Chandler', N'Bing', N'Manhattan', N'New York', CAST(1245784587 AS Numeric(10, 0)))
INSERT [dbo].[CUSTOMER] ([customer_id], [c_name], [c_last_name], [street], [city], [c_phone_number]) VALUES (2, N'Monica', N'Geller', N'Manhattan', N'New York', CAST(1239874565 AS Numeric(10, 0)))
INSERT [dbo].[CUSTOMER] ([customer_id], [c_name], [c_last_name], [street], [city], [c_phone_number]) VALUES (3, N'Rachel', N'Green', N'Manhattan', N'New York', CAST(5468793652 AS Numeric(10, 0)))
INSERT [dbo].[CUSTOMER] ([customer_id], [c_name], [c_last_name], [street], [city], [c_phone_number]) VALUES (4, N'Ross', N'Geller', N'Jack', N'Oklahoma', CAST(8796854257 AS Numeric(10, 0)))
INSERT [dbo].[CUSTOMER] ([customer_id], [c_name], [c_last_name], [street], [city], [c_phone_number]) VALUES (5, N'Joey', N'Tribbiani', N'Sandy', N'New York', CAST(6547457578 AS Numeric(10, 0)))
INSERT [dbo].[CUSTOMER] ([customer_id], [c_name], [c_last_name], [street], [city], [c_phone_number]) VALUES (6, N'Phoebe', N'Buffay', N'Central Park', N'New Jersey', CAST(6666555547 AS Numeric(10, 0)))
INSERT [dbo].[CUSTOMER] ([customer_id], [c_name], [c_last_name], [street], [city], [c_phone_number]) VALUES (7, N'Sheldon', N'Cooper', N'Downtown', N'Texas', CAST(4578797858 AS Numeric(10, 0)))
INSERT [dbo].[CUSTOMER] ([customer_id], [c_name], [c_last_name], [street], [city], [c_phone_number]) VALUES (8, N'Amy Farah', N'Fowler', N'Madelon', N'San Francisco', CAST(6632014578 AS Numeric(10, 0)))
INSERT [dbo].[CUSTOMER] ([customer_id], [c_name], [c_last_name], [street], [city], [c_phone_number]) VALUES (9, N'Leonard', N'Hoftstader', N'Black', N'New Islands', CAST(3457816556 AS Numeric(10, 0)))
INSERT [dbo].[CUSTOMER] ([customer_id], [c_name], [c_last_name], [street], [city], [c_phone_number]) VALUES (10, N'Penny', N'Beauty', N'Comenart', N'Paris', CAST(5124768574 AS Numeric(10, 0)))
INSERT [dbo].[CUSTOMER] ([customer_id], [c_name], [c_last_name], [street], [city], [c_phone_number]) VALUES (11, N'Howard', N'Wolowitz', N'Habdesd', N'Chicago', CAST(5478665585 AS Numeric(10, 0)))
INSERT [dbo].[CUSTOMER] ([customer_id], [c_name], [c_last_name], [street], [city], [c_phone_number]) VALUES (12, N'Bernadette', N'Rostenkowski', N'Cab', N'Moscow', CAST(6352147458 AS Numeric(10, 0)))
INSERT [dbo].[CUSTOMER] ([customer_id], [c_name], [c_last_name], [street], [city], [c_phone_number]) VALUES (13, N'Rajesh', N'Koothrapali', N'Delhi', N'Mumbai', CAST(5465025007 AS Numeric(10, 0)))
INSERT [dbo].[CUSTOMER] ([customer_id], [c_name], [c_last_name], [street], [city], [c_phone_number]) VALUES (14, N'Thedeore', N'Mosby', N'Shaker', N'Ohio', CAST(5141020478 AS Numeric(10, 0)))
INSERT [dbo].[CUSTOMER] ([customer_id], [c_name], [c_last_name], [street], [city], [c_phone_number]) VALUES (15, N'Lily', N'Aldrin', N'Heights', N'New York', CAST(3030104050 AS Numeric(10, 0)))
INSERT [dbo].[CUSTOMER] ([customer_id], [c_name], [c_last_name], [street], [city], [c_phone_number]) VALUES (16, N'Marshall', N'Erickson', N'St.Cloud', N'Minnesota', CAST(6257841365 AS Numeric(10, 0)))
INSERT [dbo].[CUSTOMER] ([customer_id], [c_name], [c_last_name], [street], [city], [c_phone_number]) VALUES (17, N'Barney', N'Stinson', N'Brooklyn', N'New York', CAST(3040576985 AS Numeric(10, 0)))
INSERT [dbo].[CUSTOMER] ([customer_id], [c_name], [c_last_name], [street], [city], [c_phone_number]) VALUES (18, N'Robin', N'Scherbatsky', N'Vancouver', N'Columbia', CAST(6287014630 AS Numeric(10, 0)))
INSERT [dbo].[CUSTOMER] ([customer_id], [c_name], [c_last_name], [street], [city], [c_phone_number]) VALUES (19, N'Tracy', N'Mosby', N'Manhattan', N'New York', CAST(6632010147 AS Numeric(10, 0)))
INSERT [dbo].[CUSTOMER] ([customer_id], [c_name], [c_last_name], [street], [city], [c_phone_number]) VALUES (20, N'Barry', N'Allen', N'Benert', N'Central City', CAST(5410257850 AS Numeric(10, 0)))
INSERT [dbo].[CUSTOMER] ([customer_id], [c_name], [c_last_name], [street], [city], [c_phone_number]) VALUES (21, N'Iris', N'West', N'Benert', N'Central City', CAST(6664602510 AS Numeric(10, 0)))
INSERT [dbo].[CUSTOMER] ([customer_id], [c_name], [c_last_name], [street], [city], [c_phone_number]) VALUES (22, N'Caitlin', N'Snow', N'Erlesay', N'Central City', CAST(3025784102 AS Numeric(10, 0)))
INSERT [dbo].[CUSTOMER] ([customer_id], [c_name], [c_last_name], [street], [city], [c_phone_number]) VALUES (23, N'Cisco', N'Ramon', N'Machito', N'Central City', CAST(5639755487 AS Numeric(10, 0)))
INSERT [dbo].[CUSTOMER] ([customer_id], [c_name], [c_last_name], [street], [city], [c_phone_number]) VALUES (24, N'Harrison', N'Wells', N'Brooklyn', N'New York', CAST(3657415748 AS Numeric(10, 0)))
INSERT [dbo].[CUSTOMER] ([customer_id], [c_name], [c_last_name], [street], [city], [c_phone_number]) VALUES (25, N'Oliver', N'Queen', N'Baccef', N'Star City', CAST(4547963025 AS Numeric(10, 0)))
INSERT [dbo].[CUSTOMER] ([customer_id], [c_name], [c_last_name], [street], [city], [c_phone_number]) VALUES (26, N'Felicity', N'Smoak', N'Heights', N'Ohio', CAST(6601201230 AS Numeric(10, 0)))
INSERT [dbo].[CUSTOMER] ([customer_id], [c_name], [c_last_name], [street], [city], [c_phone_number]) VALUES (27, N'Kara', N'Zor El', N'Daxam', N'Krypton', CAST(124506980 AS Numeric(10, 0)))
INSERT [dbo].[CUSTOMER] ([customer_id], [c_name], [c_last_name], [street], [city], [c_phone_number]) VALUES (28, N'Kara', N'Danvers', N'Upstate', N'National City', CAST(2014587540 AS Numeric(10, 0)))
INSERT [dbo].[CUSTOMER] ([customer_id], [c_name], [c_last_name], [street], [city], [c_phone_number]) VALUES (29, N'Ras', N'Al Ghul', N'Center', N'Star City', CAST(102025056 AS Numeric(10, 0)))
INSERT [dbo].[CUSTOMER] ([customer_id], [c_name], [c_last_name], [street], [city], [c_phone_number]) VALUES (30, N'Sara', N'Lance', N'Shippy', N'Star City', CAST(4152796630 AS Numeric(10, 0)))
INSERT [dbo].[CUSTOMER] ([customer_id], [c_name], [c_last_name], [street], [city], [c_phone_number]) VALUES (31, N'Laurel', N'Lance', N'Kanstre', N'National City', CAST(5413065028 AS Numeric(10, 0)))
INSERT [dbo].[CUSTOMER] ([customer_id], [c_name], [c_last_name], [street], [city], [c_phone_number]) VALUES (32, N'Alex', N'Danvers', N'Vasxer', N'Mumbai', CAST(201985674 AS Numeric(10, 0)))
INSERT [dbo].[CUSTOMER] ([customer_id], [c_name], [c_last_name], [street], [city], [c_phone_number]) VALUES (33, N'Mick', N'Rory', N'Lordpick', N'Texas', CAST(578965214 AS Numeric(10, 0)))
INSERT [dbo].[CUSTOMER] ([customer_id], [c_name], [c_last_name], [street], [city], [c_phone_number]) VALUES (34, N'Sara', N'Ramon', N'Alight', N'New Orleans', CAST(5136547845 AS Numeric(10, 0)))
SET IDENTITY_INSERT [dbo].[CUSTOMER] OFF
INSERT [dbo].[DEBIT_CARD] ([card_number], [withdraw_limit]) VALUES (CAST(1111222233334444 AS Numeric(16, 0)), 1000)
INSERT [dbo].[DEBIT_CARD] ([card_number], [withdraw_limit]) VALUES (CAST(1111222233334446 AS Numeric(16, 0)), 500)
INSERT [dbo].[DEBIT_CARD] ([card_number], [withdraw_limit]) VALUES (CAST(1111222233334447 AS Numeric(16, 0)), 750)
INSERT [dbo].[DEBIT_CARD] ([card_number], [withdraw_limit]) VALUES (CAST(1111222233334451 AS Numeric(16, 0)), 1250)
INSERT [dbo].[DEBIT_CARD] ([card_number], [withdraw_limit]) VALUES (CAST(1111222233334453 AS Numeric(16, 0)), 150)
INSERT [dbo].[DEBIT_CARD] ([card_number], [withdraw_limit]) VALUES (CAST(1111222233334455 AS Numeric(16, 0)), 1850)
INSERT [dbo].[DEBIT_CARD] ([card_number], [withdraw_limit]) VALUES (CAST(1111222233334456 AS Numeric(16, 0)), 3500)
INSERT [dbo].[DEBIT_CARD] ([card_number], [withdraw_limit]) VALUES (CAST(1111222233334457 AS Numeric(16, 0)), 2000)
INSERT [dbo].[DEBIT_CARD] ([card_number], [withdraw_limit]) VALUES (CAST(1111222233334459 AS Numeric(16, 0)), 10000)
INSERT [dbo].[DEBIT_CARD] ([card_number], [withdraw_limit]) VALUES (CAST(1111222233334461 AS Numeric(16, 0)), 150000)
INSERT [dbo].[DEBIT_CARD] ([card_number], [withdraw_limit]) VALUES (CAST(1111222233334462 AS Numeric(16, 0)), 1540)
INSERT [dbo].[DEBIT_CARD] ([card_number], [withdraw_limit]) VALUES (CAST(1111222233334463 AS Numeric(16, 0)), 1450)
INSERT [dbo].[DEBIT_CARD] ([card_number], [withdraw_limit]) VALUES (CAST(1111222233334464 AS Numeric(16, 0)), 2500)
INSERT [dbo].[DEBIT_CARD] ([card_number], [withdraw_limit]) VALUES (CAST(1111222233334465 AS Numeric(16, 0)), 1000)
INSERT [dbo].[DEBIT_CARD] ([card_number], [withdraw_limit]) VALUES (CAST(1111222233334471 AS Numeric(16, 0)), 3200)
INSERT [dbo].[DEBIT_CARD] ([card_number], [withdraw_limit]) VALUES (CAST(1111222233334474 AS Numeric(16, 0)), 3480)
INSERT [dbo].[DEBIT_CARD] ([card_number], [withdraw_limit]) VALUES (CAST(1111222233334475 AS Numeric(16, 0)), 7800)
INSERT [dbo].[DEBIT_CARD] ([card_number], [withdraw_limit]) VALUES (CAST(1111222233334476 AS Numeric(16, 0)), 2500)
SET IDENTITY_INSERT [dbo].[TRANSACTIONS] ON 

INSERT [dbo].[TRANSACTIONS] ([transaction_number], [transaction_type], [amount], [cust_id]) VALUES (CAST(11112465244 AS Numeric(11, 0)), N'Add', 300, 7)
INSERT [dbo].[TRANSACTIONS] ([transaction_number], [transaction_type], [amount], [cust_id]) VALUES (CAST(11112465248 AS Numeric(11, 0)), N'Take', 900, 13)
INSERT [dbo].[TRANSACTIONS] ([transaction_number], [transaction_type], [amount], [cust_id]) VALUES (CAST(11112465252 AS Numeric(11, 0)), N'Add', 1500, 15)
INSERT [dbo].[TRANSACTIONS] ([transaction_number], [transaction_type], [amount], [cust_id]) VALUES (CAST(11112465256 AS Numeric(11, 0)), N'Take', 300, 25)
INSERT [dbo].[TRANSACTIONS] ([transaction_number], [transaction_type], [amount], [cust_id]) VALUES (CAST(11112465260 AS Numeric(11, 0)), N'Add', 200, 2)
INSERT [dbo].[TRANSACTIONS] ([transaction_number], [transaction_type], [amount], [cust_id]) VALUES (CAST(11112465264 AS Numeric(11, 0)), N'Take', 500, 22)
INSERT [dbo].[TRANSACTIONS] ([transaction_number], [transaction_type], [amount], [cust_id]) VALUES (CAST(11112465268 AS Numeric(11, 0)), N'Add', 1000, 14)
INSERT [dbo].[TRANSACTIONS] ([transaction_number], [transaction_type], [amount], [cust_id]) VALUES (CAST(11112465272 AS Numeric(11, 0)), N'Take', 2000, 6)
INSERT [dbo].[TRANSACTIONS] ([transaction_number], [transaction_type], [amount], [cust_id]) VALUES (CAST(11112465276 AS Numeric(11, 0)), N'Add', 300, 1)
INSERT [dbo].[TRANSACTIONS] ([transaction_number], [transaction_type], [amount], [cust_id]) VALUES (CAST(11112465280 AS Numeric(11, 0)), N'Take', 700, 3)
INSERT [dbo].[TRANSACTIONS] ([transaction_number], [transaction_type], [amount], [cust_id]) VALUES (CAST(11112465284 AS Numeric(11, 0)), N'Add', 600, 31)
INSERT [dbo].[TRANSACTIONS] ([transaction_number], [transaction_type], [amount], [cust_id]) VALUES (CAST(11112465288 AS Numeric(11, 0)), N'Take', 200, 34)
INSERT [dbo].[TRANSACTIONS] ([transaction_number], [transaction_type], [amount], [cust_id]) VALUES (CAST(11112465292 AS Numeric(11, 0)), N'Add', 1200, 26)
INSERT [dbo].[TRANSACTIONS] ([transaction_number], [transaction_type], [amount], [cust_id]) VALUES (CAST(11112465296 AS Numeric(11, 0)), N'Take', 3500, 23)
INSERT [dbo].[TRANSACTIONS] ([transaction_number], [transaction_type], [amount], [cust_id]) VALUES (CAST(11112465300 AS Numeric(11, 0)), N'Add', 1000, 2)
INSERT [dbo].[TRANSACTIONS] ([transaction_number], [transaction_type], [amount], [cust_id]) VALUES (CAST(11112465304 AS Numeric(11, 0)), N'Take', 3000, 10)
INSERT [dbo].[TRANSACTIONS] ([transaction_number], [transaction_type], [amount], [cust_id]) VALUES (CAST(11112465308 AS Numeric(11, 0)), N'Add', 2200, 20)
INSERT [dbo].[TRANSACTIONS] ([transaction_number], [transaction_type], [amount], [cust_id]) VALUES (CAST(11112465312 AS Numeric(11, 0)), N'Add', 300, 7)
INSERT [dbo].[TRANSACTIONS] ([transaction_number], [transaction_type], [amount], [cust_id]) VALUES (CAST(11112465316 AS Numeric(11, 0)), N'Add', 1500, 15)
INSERT [dbo].[TRANSACTIONS] ([transaction_number], [transaction_type], [amount], [cust_id]) VALUES (CAST(11112465320 AS Numeric(11, 0)), N'Add', 1200, 26)
INSERT [dbo].[TRANSACTIONS] ([transaction_number], [transaction_type], [amount], [cust_id]) VALUES (CAST(11112465324 AS Numeric(11, 0)), N'Add', 300, 7)
INSERT [dbo].[TRANSACTIONS] ([transaction_number], [transaction_type], [amount], [cust_id]) VALUES (CAST(11112465328 AS Numeric(11, 0)), N'Take', 900, 13)
INSERT [dbo].[TRANSACTIONS] ([transaction_number], [transaction_type], [amount], [cust_id]) VALUES (CAST(11112465332 AS Numeric(11, 0)), N'Add', 1500, 15)
INSERT [dbo].[TRANSACTIONS] ([transaction_number], [transaction_type], [amount], [cust_id]) VALUES (CAST(11112465336 AS Numeric(11, 0)), N'Take', 300, 25)
INSERT [dbo].[TRANSACTIONS] ([transaction_number], [transaction_type], [amount], [cust_id]) VALUES (CAST(11112465340 AS Numeric(11, 0)), N'Add', 200, 2)
INSERT [dbo].[TRANSACTIONS] ([transaction_number], [transaction_type], [amount], [cust_id]) VALUES (CAST(11112465344 AS Numeric(11, 0)), N'Take', 500, 22)
INSERT [dbo].[TRANSACTIONS] ([transaction_number], [transaction_type], [amount], [cust_id]) VALUES (CAST(11112465348 AS Numeric(11, 0)), N'Add', 1000, 14)
INSERT [dbo].[TRANSACTIONS] ([transaction_number], [transaction_type], [amount], [cust_id]) VALUES (CAST(11112465352 AS Numeric(11, 0)), N'Take', 2000, 6)
INSERT [dbo].[TRANSACTIONS] ([transaction_number], [transaction_type], [amount], [cust_id]) VALUES (CAST(11112465356 AS Numeric(11, 0)), N'Add', 300, 1)
INSERT [dbo].[TRANSACTIONS] ([transaction_number], [transaction_type], [amount], [cust_id]) VALUES (CAST(11112465360 AS Numeric(11, 0)), N'Take', 700, 3)
INSERT [dbo].[TRANSACTIONS] ([transaction_number], [transaction_type], [amount], [cust_id]) VALUES (CAST(11112465364 AS Numeric(11, 0)), N'Add', 600, 31)
INSERT [dbo].[TRANSACTIONS] ([transaction_number], [transaction_type], [amount], [cust_id]) VALUES (CAST(11112465368 AS Numeric(11, 0)), N'Take', 200, 34)
INSERT [dbo].[TRANSACTIONS] ([transaction_number], [transaction_type], [amount], [cust_id]) VALUES (CAST(11112465372 AS Numeric(11, 0)), N'Add', 1200, 26)
INSERT [dbo].[TRANSACTIONS] ([transaction_number], [transaction_type], [amount], [cust_id]) VALUES (CAST(11112465376 AS Numeric(11, 0)), N'Take', 3500, 23)
INSERT [dbo].[TRANSACTIONS] ([transaction_number], [transaction_type], [amount], [cust_id]) VALUES (CAST(11112465380 AS Numeric(11, 0)), N'Add', 1000, 2)
INSERT [dbo].[TRANSACTIONS] ([transaction_number], [transaction_type], [amount], [cust_id]) VALUES (CAST(11112465384 AS Numeric(11, 0)), N'Take', 3000, 10)
INSERT [dbo].[TRANSACTIONS] ([transaction_number], [transaction_type], [amount], [cust_id]) VALUES (CAST(11112465388 AS Numeric(11, 0)), N'Add', 2200, 20)
SET IDENTITY_INSERT [dbo].[TRANSACTIONS] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__BANK_CAR__8E4F293BFBE71AF6]    Script Date: 12/3/2018 11:34:26 PM ******/
ALTER TABLE [dbo].[BANK_CARD] ADD UNIQUE NONCLUSTERED 
(
	[card_number] ASC,
	[card_type] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BANK_ACCOUNT] ADD  DEFAULT ((0)) FOR [balance]
GO
ALTER TABLE [dbo].[BANK]  WITH CHECK ADD  CONSTRAINT [bank_cust] FOREIGN KEY([cust_id])
REFERENCES [dbo].[CUSTOMER] ([customer_id])
GO
ALTER TABLE [dbo].[BANK] CHECK CONSTRAINT [bank_cust]
GO
ALTER TABLE [dbo].[BANK]  WITH CHECK ADD  CONSTRAINT [bank_cust2] FOREIGN KEY([bran_id])
REFERENCES [dbo].[BRANCH] ([branch_id])
GO
ALTER TABLE [dbo].[BANK] CHECK CONSTRAINT [bank_cust2]
GO
ALTER TABLE [dbo].[BANK_ACCOUNT]  WITH CHECK ADD  CONSTRAINT [cust_id_fk] FOREIGN KEY([cust_id])
REFERENCES [dbo].[CUSTOMER] ([customer_id])
GO
ALTER TABLE [dbo].[BANK_ACCOUNT] CHECK CONSTRAINT [cust_id_fk]
GO
ALTER TABLE [dbo].[BANK_CARD]  WITH CHECK ADD  CONSTRAINT [card_fk] FOREIGN KEY([c_id])
REFERENCES [dbo].[CUSTOMER] ([customer_id])
GO
ALTER TABLE [dbo].[BANK_CARD] CHECK CONSTRAINT [card_fk]
GO
ALTER TABLE [dbo].[CREDIT_CARD]  WITH CHECK ADD FOREIGN KEY([card_number], [card_type])
REFERENCES [dbo].[BANK_CARD] ([card_number], [card_type])
GO
ALTER TABLE [dbo].[DEBIT_CARD]  WITH CHECK ADD FOREIGN KEY([card_number], [card_type])
REFERENCES [dbo].[BANK_CARD] ([card_number], [card_type])
GO
ALTER TABLE [dbo].[TRANSACTIONS]  WITH CHECK ADD  CONSTRAINT [transaction_fk] FOREIGN KEY([cust_id])
REFERENCES [dbo].[CUSTOMER] ([customer_id])
GO
ALTER TABLE [dbo].[TRANSACTIONS] CHECK CONSTRAINT [transaction_fk]
GO
ALTER TABLE [dbo].[BANK_CARD]  WITH CHECK ADD CHECK  (([card_type]='CREDIT_CARD' OR [card_type]='DEBIT_CARD'))
GO
/****** Object:  StoredProcedure [dbo].[InsertBank]    Script Date: 12/3/2018 11:34:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--4 INSERT BANK INFO
CREATE PROCEDURE [dbo].[InsertBank]
@cid INT,
@bid INT
AS
INSERT INTO BANK
VALUES(@cid,@bid)
GO
/****** Object:  StoredProcedure [dbo].[InsertBankAccount]    Script Date: 12/3/2018 11:34:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertBankAccount]
@id INT,
@type VARCHAR(20)
AS
INSERT INTO BANK_ACCOUNT
VALUES(default,@type,@id)
GO
/****** Object:  StoredProcedure [dbo].[InsertBankCard]    Script Date: 12/3/2018 11:34:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--5 INSERT BANK CARD
CREATE PROCEDURE [dbo].[InsertBankCard]
@c_type VARCHAR(20),
@cid INT
AS
INSERT INTO BANK_CARD
VALUES(@c_type,GETDATE(),@cid)
GO
/****** Object:  StoredProcedure [dbo].[InsertBranch]    Script Date: 12/3/2018 11:34:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--3 INSERT NEW BRANCH
CREATE PROCEDURE [dbo].[InsertBranch]
@bname VARCHAR(30),
@city VARCHAR(15)
AS
DECLARE @bid INT;
exec @bid = dbo.BranchCity  @city
INSERT INTO BRANCH
VALUES(@bid,@bname,@city)
GO
/****** Object:  StoredProcedure [dbo].[InsertCreditCard]    Script Date: 12/3/2018 11:34:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--6 INSERT CREDIT BANK CARD
CREATE PROCEDURE [dbo].[InsertCreditCard]
@cid INT,
@loan INT,
@dept NUMERIC(20,5)
AS
DECLARE @cardno NUMERIC(16,0);
DECLARE @minimum_payment NUMERIC(20,5);
SELECT @cardno=card_number FROM BANK_CARD 
WHERE @cid=BANK_CARD.c_id
set @minimum_payment=(@dept*30)/100;
INSERT INTO CREDIT_CARD
VALUES(@cardno,@loan,@dept,@minimum_payment)
GO
/****** Object:  StoredProcedure [dbo].[InsertDebitCard]    Script Date: 12/3/2018 11:34:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--6 INSERT DEBIT BANK CARD
CREATE PROCEDURE [dbo].[InsertDebitCard]
@cid INT,
@limit INT
AS
DECLARE @cardno NUMERIC(16,0);
SELECT @cardno=card_number FROM BANK_CARD 
WHERE @cid=BANK_CARD.c_id

INSERT INTO DEBIT_CARD
VALUES(@cardno,@limit)
GO
/****** Object:  StoredProcedure [dbo].[InsertNewCustomer]    Script Date: 12/3/2018 11:34:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--1  INSERT NEW CUSTOMER
CREATE PROCEDURE [dbo].[InsertNewCustomer]
@name VARCHAR(20),
@last_name VARCHAR(20),
@street VARCHAR(20),
@city VARCHAR(20),
@phone_number NUMERIC(10,0)

AS
INSERT INTO CUSTOMER 
VALUES(@name,@last_name,@street,@city,@phone_number)
GO
/****** Object:  StoredProcedure [dbo].[InsertTransaction]    Script Date: 12/3/2018 11:34:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--9 INSERT TRANSACTIONS
CREATE PROCEDURE [dbo].[InsertTransaction]
@type VARCHAR(15),
@amount INT,
@cid INT
AS
exec UpdateBankAccount @cid,@type,@amount
INSERT INTO TRANSACTIONS
VALUES(@type,@amount,@cid)
GO
/****** Object:  StoredProcedure [dbo].[UpdateBankAccount]    Script Date: 12/3/2018 11:34:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--8 UPDATE BALANCE IN BANK ACCOUNT
CREATE PROCEDURE [dbo].[UpdateBankAccount]
@id INT,
@type VARCHAR(15),
@amount INT
AS
DECLARE @balance INT;
SELECT @balance=balance FROM BANK_ACCOUNT
WHERE @id=BANK_ACCOUNT.cust_id
IF @type='Add'
SET @balance=@balance + @amount;
ELSE
SET @balance=@balance - @amount;
UPDATE BANK_ACCOUNT SET balance = @balance
WHERE @id=BANK_ACCOUNT.cust_id
GO
USE [master]
GO
ALTER DATABASE [CustomerSideDatabaseForBank] SET  READ_WRITE 
GO
