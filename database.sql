USE [db_kmaes]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 05/04/2016 10:22:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 05/04/2016 10:22:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
	[User_Id] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 05/04/2016 10:22:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[UserId] [nvarchar](128) NOT NULL,
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 05/04/2016 10:22:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 05/04/2016 10:22:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Phone] [nvarchar](max) NULL,
	[Discriminator] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [kmaes].[AccountAddress]    Script Date: 05/04/2016 10:22:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [kmaes].[AccountAddress](
	[AccountAddressID] [int] IDENTITY(1,1) NOT NULL,
	[AddressID] [int] NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
	[AddressType] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AccountAddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [kmaes].[Address]    Script Date: 05/04/2016 10:22:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [kmaes].[Address](
	[AddressID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [varchar](100) NOT NULL,
	[Line1] [varchar](100) NOT NULL,
	[Line2] [varchar](100) NULL,
	[City] [varchar](50) NOT NULL,
	[StateOrProvince] [varchar](2) NOT NULL,
	[ZipCode] [varchar](20) NOT NULL,
	[County] [varchar](2) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[AddressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [kmaes].[Category]    Script Date: 05/04/2016 10:22:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [kmaes].[Category](
	[CategoryID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [kmaes].[CategoryEntry]    Script Date: 05/04/2016 10:22:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [kmaes].[CategoryEntry](
	[CategoryEntryID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[CategoryEntryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [kmaes].[Inventory]    Script Date: 05/04/2016 10:22:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [kmaes].[Inventory](
	[InventoryID] [int] IDENTITY(1,1) NOT NULL,
	[PhysicalLocationID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Count] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[InventoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [kmaes].[OrderProduct]    Script Date: 05/04/2016 10:22:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [kmaes].[OrderProduct](
	[OrderProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductID] [int] NOT NULL,
	[OrderID] [int] NOT NULL,
	[Quantity] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [kmaes].[Orders]    Script Date: 05/04/2016 10:22:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [kmaes].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[AccountID] [uniqueidentifier] NULL,
	[CartID] [uniqueidentifier] NOT NULL,
	[OrderTotal] [decimal](18, 0) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[DatePlaced] [datetime] NULL,
	[AddressID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [kmaes].[Payment]    Script Date: 05/04/2016 10:22:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [kmaes].[Payment](
	[PaymentID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NOT NULL,
	[CardType] [varchar](20) NOT NULL,
	[FourDigits] [varchar](4) NOT NULL,
	[Amount] [decimal](18, 0) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[PayPalID] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PaymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [kmaes].[PhysicalLocation]    Script Date: 05/04/2016 10:22:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [kmaes].[PhysicalLocation](
	[PhysicalLocationID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[LocationType] [varchar](20) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[PhysicalLocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [kmaes].[Product]    Script Date: 05/04/2016 10:22:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [kmaes].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](50) NOT NULL,
	[Description] [text] NULL,
	[Price] [decimal](18, 0) NOT NULL,
	[DateCreated] [datetime] NOT NULL,
	[Inventory] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name]) VALUES (N'34c12f5b-bb34-4d9a-914f-f8e114ec2c06', N'Administrator')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e7ec2023-4055-43c3-b464-72de54295a9a', N'34c12f5b-bb34-4d9a-914f-f8e114ec2c06')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [FirstName], [LastName], [Email], [Phone], [Discriminator]) VALUES (N'2a6e7e83-d4e2-4abe-b9b2-8cbfaee2a2d1', N'jay', N'ACACbr8Tro+qqqnNlvleNX61Et9r/a5nEY4r7WG4sV/FUqoRPrJZAb0U18LTkqTdSQ==', N'e33eb0ef-fd63-4850-ad28-c6b168be68ef', N'jay', N'jay', N'jay', N'jay', N'ApplicationUser')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [FirstName], [LastName], [Email], [Phone], [Discriminator]) VALUES (N'6ead72c9-db5e-4e9d-b223-1874005eeb21', N'cdecl', N'AMcxVoCagvgAsMCkkBtRke7wbCvj8RdoGhK+WAiAkqStkM9Tpxq3cw5FQjp1TBpfZw==', N'8e4fb1b3-b89a-444a-b33d-4ac55462c6e4', N'asd', N'asd', N'asd', NULL, N'ApplicationUser')
GO
INSERT [dbo].[AspNetUsers] ([Id], [UserName], [PasswordHash], [SecurityStamp], [FirstName], [LastName], [Email], [Phone], [Discriminator]) VALUES (N'e7ec2023-4055-43c3-b464-72de54295a9a', N'admin', N'AHNjRSNG5ZR7vSxP3qBg3bEKn8F6qMRkEuOFaxXzgVcQaj8PW7BhmNw/UNzM/q6MZQ==', N'de55f9e3-df1d-4789-b37c-d66e62e14daf', N'admin', N'admin', N'admin', NULL, N'ApplicationUser')
GO
SET IDENTITY_INSERT [kmaes].[Address] ON 

GO
INSERT [kmaes].[Address] ([AddressID], [FullName], [Line1], [Line2], [City], [StateOrProvince], [ZipCode], [County]) VALUES (1, N'asdasd', N'sadasd', N'sadasd', N'sadsa', N'as', N'asd', N'as')
GO
INSERT [kmaes].[Address] ([AddressID], [FullName], [Line1], [Line2], [City], [StateOrProvince], [ZipCode], [County]) VALUES (2, N'q', N'q', N'q', N'q', N'q', N'q', N'q')
GO
INSERT [kmaes].[Address] ([AddressID], [FullName], [Line1], [Line2], [City], [StateOrProvince], [ZipCode], [County]) VALUES (3, N'd', N'd', N'd', N'd', N'd', N'd', N'd')
GO
INSERT [kmaes].[Address] ([AddressID], [FullName], [Line1], [Line2], [City], [StateOrProvince], [ZipCode], [County]) VALUES (4, N'sdfsdfsdfds', N'asdsad', N'asdasdas', N'asd', N'as', N'sda', N'as')
GO
INSERT [kmaes].[Address] ([AddressID], [FullName], [Line1], [Line2], [City], [StateOrProvince], [ZipCode], [County]) VALUES (5, N'dsf', N'zv', NULL, N'zv', N'zv', N'zvz', N'zv')
GO
INSERT [kmaes].[Address] ([AddressID], [FullName], [Line1], [Line2], [City], [StateOrProvince], [ZipCode], [County]) VALUES (6, N'1', N'1', N'1', N'1', N'1', N'1', N'1')
GO
INSERT [kmaes].[Address] ([AddressID], [FullName], [Line1], [Line2], [City], [StateOrProvince], [ZipCode], [County]) VALUES (7, N'1', N'1', N'1', N'1', N'1', N'1', N'1')
GO
SET IDENTITY_INSERT [kmaes].[Address] OFF
GO
SET IDENTITY_INSERT [kmaes].[Category] ON 

GO
INSERT [kmaes].[Category] ([CategoryID], [Name]) VALUES (1, N'Lands')
GO
INSERT [kmaes].[Category] ([CategoryID], [Name]) VALUES (2, N'Creatures')
GO
INSERT [kmaes].[Category] ([CategoryID], [Name]) VALUES (3, N'Spells')
GO
INSERT [kmaes].[Category] ([CategoryID], [Name]) VALUES (4, N'Artifacts')
GO
SET IDENTITY_INSERT [kmaes].[Category] OFF
GO
SET IDENTITY_INSERT [kmaes].[CategoryEntry] ON 

GO
INSERT [kmaes].[CategoryEntry] ([CategoryEntryID], [CategoryID], [ProductID]) VALUES (3, 1, 7)
GO
INSERT [kmaes].[CategoryEntry] ([CategoryEntryID], [CategoryID], [ProductID]) VALUES (4, 1, 9)
GO
INSERT [kmaes].[CategoryEntry] ([CategoryEntryID], [CategoryID], [ProductID]) VALUES (5, 1, 12)
GO
INSERT [kmaes].[CategoryEntry] ([CategoryEntryID], [CategoryID], [ProductID]) VALUES (6, 2, 13)
GO
INSERT [kmaes].[CategoryEntry] ([CategoryEntryID], [CategoryID], [ProductID]) VALUES (7, 2, 14)
GO
INSERT [kmaes].[CategoryEntry] ([CategoryEntryID], [CategoryID], [ProductID]) VALUES (8, 2, 15)
GO
INSERT [kmaes].[CategoryEntry] ([CategoryEntryID], [CategoryID], [ProductID]) VALUES (9, 3, 16)
GO
INSERT [kmaes].[CategoryEntry] ([CategoryEntryID], [CategoryID], [ProductID]) VALUES (10, 3, 17)
GO
INSERT [kmaes].[CategoryEntry] ([CategoryEntryID], [CategoryID], [ProductID]) VALUES (11, 3, 18)
GO
INSERT [kmaes].[CategoryEntry] ([CategoryEntryID], [CategoryID], [ProductID]) VALUES (12, 2, 19)
GO
INSERT [kmaes].[CategoryEntry] ([CategoryEntryID], [CategoryID], [ProductID]) VALUES (13, 4, 19)
GO
INSERT [kmaes].[CategoryEntry] ([CategoryEntryID], [CategoryID], [ProductID]) VALUES (14, 4, 20)
GO
SET IDENTITY_INSERT [kmaes].[CategoryEntry] OFF
GO
SET IDENTITY_INSERT [kmaes].[OrderProduct] ON 

GO
INSERT [kmaes].[OrderProduct] ([OrderProductID], [ProductID], [OrderID], [Quantity]) VALUES (2, 7, 11, 1)
GO
INSERT [kmaes].[OrderProduct] ([OrderProductID], [ProductID], [OrderID], [Quantity]) VALUES (3, 7, 12, 1)
GO
INSERT [kmaes].[OrderProduct] ([OrderProductID], [ProductID], [OrderID], [Quantity]) VALUES (4, 7, 14, 1)
GO
INSERT [kmaes].[OrderProduct] ([OrderProductID], [ProductID], [OrderID], [Quantity]) VALUES (5, 9, 16, 1)
GO
INSERT [kmaes].[OrderProduct] ([OrderProductID], [ProductID], [OrderID], [Quantity]) VALUES (6, 9, 17, 1)
GO
INSERT [kmaes].[OrderProduct] ([OrderProductID], [ProductID], [OrderID], [Quantity]) VALUES (7, 14, 19, 1)
GO
INSERT [kmaes].[OrderProduct] ([OrderProductID], [ProductID], [OrderID], [Quantity]) VALUES (8, 12, 22, 1)
GO
SET IDENTITY_INSERT [kmaes].[OrderProduct] OFF
GO
SET IDENTITY_INSERT [kmaes].[Orders] ON 

GO
INSERT [kmaes].[Orders] ([OrderID], [AccountID], [CartID], [OrderTotal], [DateCreated], [DatePlaced], [AddressID]) VALUES (1, N'e7ec2023-4055-43c3-b464-72de54295a9a', N'8639d8e5-1176-4833-aa79-aa0ec443639c', CAST(0 AS Decimal(18, 0)), CAST(N'2016-03-24T19:37:37.207' AS DateTime), NULL, NULL)
GO
INSERT [kmaes].[Orders] ([OrderID], [AccountID], [CartID], [OrderTotal], [DateCreated], [DatePlaced], [AddressID]) VALUES (2, N'e7ec2023-4055-43c3-b464-72de54295a9a', N'77c1498b-bc92-4cd4-85c0-7cf9f79377f5', CAST(0 AS Decimal(18, 0)), CAST(N'2016-03-24T20:09:27.657' AS DateTime), NULL, NULL)
GO
INSERT [kmaes].[Orders] ([OrderID], [AccountID], [CartID], [OrderTotal], [DateCreated], [DatePlaced], [AddressID]) VALUES (3, N'e7ec2023-4055-43c3-b464-72de54295a9a', N'fe64f2ff-150b-4ef8-9141-5ad7dc299690', CAST(0 AS Decimal(18, 0)), CAST(N'2016-03-24T20:09:27.657' AS DateTime), NULL, NULL)
GO
INSERT [kmaes].[Orders] ([OrderID], [AccountID], [CartID], [OrderTotal], [DateCreated], [DatePlaced], [AddressID]) VALUES (4, N'6ead72c9-db5e-4e9d-b223-1874005eeb21', N'b21be916-5961-4931-8e3a-d6c5338319c4', CAST(0 AS Decimal(18, 0)), CAST(N'2016-03-24T20:09:59.237' AS DateTime), NULL, NULL)
GO
INSERT [kmaes].[Orders] ([OrderID], [AccountID], [CartID], [OrderTotal], [DateCreated], [DatePlaced], [AddressID]) VALUES (6, NULL, N'02898767-56d1-4ef1-93ad-43ea261bbe86', CAST(0 AS Decimal(18, 0)), CAST(N'2016-03-24T20:50:35.540' AS DateTime), NULL, NULL)
GO
INSERT [kmaes].[Orders] ([OrderID], [AccountID], [CartID], [OrderTotal], [DateCreated], [DatePlaced], [AddressID]) VALUES (7, N'e7ec2023-4055-43c3-b464-72de54295a9a', N'b3137f89-392e-4619-a419-5343a7cd5f4d', CAST(0 AS Decimal(18, 0)), CAST(N'2016-03-24T20:50:58.087' AS DateTime), NULL, NULL)
GO
INSERT [kmaes].[Orders] ([OrderID], [AccountID], [CartID], [OrderTotal], [DateCreated], [DatePlaced], [AddressID]) VALUES (8, N'e7ec2023-4055-43c3-b464-72de54295a9a', N'd69f95bd-4b64-400f-b327-0dd8599dedfa', CAST(0 AS Decimal(18, 0)), CAST(N'2016-03-24T21:23:42.750' AS DateTime), NULL, NULL)
GO
INSERT [kmaes].[Orders] ([OrderID], [AccountID], [CartID], [OrderTotal], [DateCreated], [DatePlaced], [AddressID]) VALUES (9, N'e7ec2023-4055-43c3-b464-72de54295a9a', N'f03eb28e-60db-4dfd-820a-cefe4da93194', CAST(0 AS Decimal(18, 0)), CAST(N'2016-03-24T22:58:38.247' AS DateTime), NULL, NULL)
GO
INSERT [kmaes].[Orders] ([OrderID], [AccountID], [CartID], [OrderTotal], [DateCreated], [DatePlaced], [AddressID]) VALUES (10, N'2a6e7e83-d4e2-4abe-b9b2-8cbfaee2a2d1', N'c68f7d4e-25ee-453a-856a-9972c28e409f', CAST(0 AS Decimal(18, 0)), CAST(N'2016-03-24T23:28:27.797' AS DateTime), NULL, NULL)
GO
INSERT [kmaes].[Orders] ([OrderID], [AccountID], [CartID], [OrderTotal], [DateCreated], [DatePlaced], [AddressID]) VALUES (11, N'2a6e7e83-d4e2-4abe-b9b2-8cbfaee2a2d1', N'9eeea482-a10d-415a-bb98-4d132e96a97f', CAST(70 AS Decimal(18, 0)), CAST(N'2016-03-24T23:33:12.340' AS DateTime), CAST(N'2016-03-24T23:33:45.563' AS DateTime), 2)
GO
INSERT [kmaes].[Orders] ([OrderID], [AccountID], [CartID], [OrderTotal], [DateCreated], [DatePlaced], [AddressID]) VALUES (12, N'2a6e7e83-d4e2-4abe-b9b2-8cbfaee2a2d1', N'c26301d5-14a1-4cfd-bc7e-3e812d6baed5', CAST(70 AS Decimal(18, 0)), CAST(N'2016-03-24T23:34:28.807' AS DateTime), CAST(N'2016-03-24T23:35:08.787' AS DateTime), 3)
GO
INSERT [kmaes].[Orders] ([OrderID], [AccountID], [CartID], [OrderTotal], [DateCreated], [DatePlaced], [AddressID]) VALUES (13, N'6ead72c9-db5e-4e9d-b223-1874005eeb21', N'7991f7aa-2900-423d-9801-5fc19a1c0231', CAST(0 AS Decimal(18, 0)), CAST(N'2016-03-24T23:38:45.087' AS DateTime), NULL, NULL)
GO
INSERT [kmaes].[Orders] ([OrderID], [AccountID], [CartID], [OrderTotal], [DateCreated], [DatePlaced], [AddressID]) VALUES (14, N'6ead72c9-db5e-4e9d-b223-1874005eeb21', N'45d70b1a-e25b-4079-b989-c157deda5e59', CAST(70 AS Decimal(18, 0)), CAST(N'2016-03-24T23:38:50.850' AS DateTime), CAST(N'2016-03-24T23:39:25.753' AS DateTime), 4)
GO
INSERT [kmaes].[Orders] ([OrderID], [AccountID], [CartID], [OrderTotal], [DateCreated], [DatePlaced], [AddressID]) VALUES (15, N'e7ec2023-4055-43c3-b464-72de54295a9a', N'6c97a51f-ac4f-4e39-8aaf-bcf049b16653', CAST(0 AS Decimal(18, 0)), CAST(N'2016-04-03T14:02:11.240' AS DateTime), NULL, NULL)
GO
INSERT [kmaes].[Orders] ([OrderID], [AccountID], [CartID], [OrderTotal], [DateCreated], [DatePlaced], [AddressID]) VALUES (16, NULL, N'48c643f4-8d65-4c5b-a94b-e3ed409d54ff', CAST(50 AS Decimal(18, 0)), CAST(N'2016-04-05T09:40:42.923' AS DateTime), CAST(N'2016-04-05T09:41:22.983' AS DateTime), 5)
GO
INSERT [kmaes].[Orders] ([OrderID], [AccountID], [CartID], [OrderTotal], [DateCreated], [DatePlaced], [AddressID]) VALUES (17, NULL, N'898489c3-62d0-457f-b737-bc19087b2415', CAST(50 AS Decimal(18, 0)), CAST(N'2016-04-05T09:44:53.973' AS DateTime), CAST(N'2016-04-05T09:45:07.643' AS DateTime), 6)
GO
INSERT [kmaes].[Orders] ([OrderID], [AccountID], [CartID], [OrderTotal], [DateCreated], [DatePlaced], [AddressID]) VALUES (18, N'6ead72c9-db5e-4e9d-b223-1874005eeb21', N'bf43f0f9-9a85-453d-85b5-63d7d5f29554', CAST(0 AS Decimal(18, 0)), CAST(N'2016-04-05T09:45:12.427' AS DateTime), NULL, NULL)
GO
INSERT [kmaes].[Orders] ([OrderID], [AccountID], [CartID], [OrderTotal], [DateCreated], [DatePlaced], [AddressID]) VALUES (19, NULL, N'c9f93594-1c22-49ee-9286-e34d0e7be47f', CAST(1 AS Decimal(18, 0)), CAST(N'2016-04-05T09:45:45.300' AS DateTime), NULL, NULL)
GO
INSERT [kmaes].[Orders] ([OrderID], [AccountID], [CartID], [OrderTotal], [DateCreated], [DatePlaced], [AddressID]) VALUES (20, N'e7ec2023-4055-43c3-b464-72de54295a9a', N'1f13976c-7626-42a9-96e6-37f75e866f61', CAST(0 AS Decimal(18, 0)), CAST(N'2016-04-05T09:57:28.797' AS DateTime), NULL, NULL)
GO
INSERT [kmaes].[Orders] ([OrderID], [AccountID], [CartID], [OrderTotal], [DateCreated], [DatePlaced], [AddressID]) VALUES (21, N'e7ec2023-4055-43c3-b464-72de54295a9a', N'2f09d0f1-4b90-4635-9ec9-4f253e34c6bf', CAST(0 AS Decimal(18, 0)), CAST(N'2016-04-05T09:58:09.137' AS DateTime), NULL, NULL)
GO
INSERT [kmaes].[Orders] ([OrderID], [AccountID], [CartID], [OrderTotal], [DateCreated], [DatePlaced], [AddressID]) VALUES (22, NULL, N'e4d8a3dd-ebe7-4b1e-8128-f341dd20a656', CAST(45 AS Decimal(18, 0)), CAST(N'2016-04-05T09:58:23.697' AS DateTime), CAST(N'2016-04-05T09:58:47.723' AS DateTime), 7)
GO
INSERT [kmaes].[Orders] ([OrderID], [AccountID], [CartID], [OrderTotal], [DateCreated], [DatePlaced], [AddressID]) VALUES (23, N'e7ec2023-4055-43c3-b464-72de54295a9a', N'9b85a6c9-b686-497c-af90-9aaf6551951d', CAST(0 AS Decimal(18, 0)), CAST(N'2016-04-05T10:08:36.017' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [kmaes].[Orders] OFF
GO
SET IDENTITY_INSERT [kmaes].[Payment] ON 

GO
INSERT [kmaes].[Payment] ([PaymentID], [OrderID], [CardType], [FourDigits], [Amount], [DateCreated], [PayPalID]) VALUES (2, 11, N'1111111111111111', N'1111', CAST(70 AS Decimal(18, 0)), CAST(N'2016-03-24T23:33:46.233' AS DateTime), N'1111111111111111')
GO
INSERT [kmaes].[Payment] ([PaymentID], [OrderID], [CardType], [FourDigits], [Amount], [DateCreated], [PayPalID]) VALUES (3, 12, N'visa', N'1234', CAST(70 AS Decimal(18, 0)), CAST(N'2016-03-24T23:35:09.460' AS DateTime), N'fsfs')
GO
INSERT [kmaes].[Payment] ([PaymentID], [OrderID], [CardType], [FourDigits], [Amount], [DateCreated], [PayPalID]) VALUES (4, 14, N'asdasd', N'1234', CAST(70 AS Decimal(18, 0)), CAST(N'2016-03-24T23:39:13.597' AS DateTime), N'asdasdasdsa')
GO
INSERT [kmaes].[Payment] ([PaymentID], [OrderID], [CardType], [FourDigits], [Amount], [DateCreated], [PayPalID]) VALUES (5, 16, N'1111111111111111', N'1111', CAST(50 AS Decimal(18, 0)), CAST(N'2016-04-05T09:41:24.653' AS DateTime), N'1111')
GO
INSERT [kmaes].[Payment] ([PaymentID], [OrderID], [CardType], [FourDigits], [Amount], [DateCreated], [PayPalID]) VALUES (6, 17, N'1111111111111111', N'2711', CAST(50 AS Decimal(18, 0)), CAST(N'2016-04-05T09:45:09.320' AS DateTime), N'11')
GO
INSERT [kmaes].[Payment] ([PaymentID], [OrderID], [CardType], [FourDigits], [Amount], [DateCreated], [PayPalID]) VALUES (7, 22, N'1111111111111111', N'1111', CAST(45 AS Decimal(18, 0)), CAST(N'2016-04-05T09:58:49.397' AS DateTime), N'fdsfs')
GO
SET IDENTITY_INSERT [kmaes].[Payment] OFF
GO
SET IDENTITY_INSERT [kmaes].[Product] ON 

GO
INSERT [kmaes].[Product] ([ProductID], [Name], [Description], [Price], [DateCreated], [Inventory]) VALUES (7, N'Sunken Hollow', N'<b>Black Blue</b>', CAST(70 AS Decimal(18, 0)), CAST(N'2016-03-24T23:02:31.583' AS DateTime), 11)
GO
INSERT [kmaes].[Product] ([ProductID], [Name], [Description], [Price], [DateCreated], [Inventory]) VALUES (9, N'Blood Crypt', N'<b>Black Red</b>', CAST(50 AS Decimal(18, 0)), CAST(N'2016-03-24T23:05:03.207' AS DateTime), 10)
GO
INSERT [kmaes].[Product] ([ProductID], [Name], [Description], [Price], [DateCreated], [Inventory]) VALUES (12, N'Arid Mesa', N'<b>Black White</b>', CAST(45 AS Decimal(18, 0)), CAST(N'2016-03-24T23:07:16.847' AS DateTime), 75)
GO
INSERT [kmaes].[Product] ([ProductID], [Name], [Description], [Price], [DateCreated], [Inventory]) VALUES (13, N'Delver of Secrets', N'<h1>Flip Card!</h1>', CAST(4 AS Decimal(18, 0)), CAST(N'2016-03-24T23:15:46.387' AS DateTime), 20)
GO
INSERT [kmaes].[Product] ([ProductID], [Name], [Description], [Price], [DateCreated], [Inventory]) VALUES (14, N'Sigiled Starfish', N'<b><i>Sigiled Star Fish</i></b>', CAST(1 AS Decimal(18, 0)), CAST(N'2016-03-24T23:16:26.707' AS DateTime), 60)
GO
INSERT [kmaes].[Product] ([ProductID], [Name], [Description], [Price], [DateCreated], [Inventory]) VALUES (15, N'Sidisi, Blood Tyrant', N'<b>Black Blue Green</b>', CAST(5 AS Decimal(18, 0)), CAST(N'2016-03-24T23:17:05.720' AS DateTime), 15)
GO
INSERT [kmaes].[Product] ([ProductID], [Name], [Description], [Price], [DateCreated], [Inventory]) VALUES (16, N'Shock', N'<b>SHOCK</b>', CAST(1 AS Decimal(18, 0)), CAST(N'2016-03-24T23:20:26.053' AS DateTime), 19)
GO
INSERT [kmaes].[Product] ([ProductID], [Name], [Description], [Price], [DateCreated], [Inventory]) VALUES (17, N'Reverberate', N'<b>Copy</b>', CAST(2 AS Decimal(18, 0)), CAST(N'2016-03-24T23:22:01.600' AS DateTime), 43)
GO
INSERT [kmaes].[Product] ([ProductID], [Name], [Description], [Price], [DateCreated], [Inventory]) VALUES (18, N'Crater''s Claw', N'<b>The Claw</b>', CAST(12 AS Decimal(18, 0)), CAST(N'2016-03-24T23:22:41.197' AS DateTime), 44)
GO
INSERT [kmaes].[Product] ([ProductID], [Name], [Description], [Price], [DateCreated], [Inventory]) VALUES (19, N'Gargoyle', N'<b>Artifact and Creature</b>', CAST(2 AS Decimal(18, 0)), CAST(N'2016-03-24T23:25:37.090' AS DateTime), 15)
GO
INSERT [kmaes].[Product] ([ProductID], [Name], [Description], [Price], [DateCreated], [Inventory]) VALUES (20, N'Lightning Greaves', N'<b>Boots</b>', CAST(2 AS Decimal(18, 0)), CAST(N'2016-03-24T23:26:15.320' AS DateTime), 66)
GO
SET IDENTITY_INSERT [kmaes].[Product] OFF
GO
ALTER TABLE [kmaes].[Orders] ADD  DEFAULT (newid()) FOR [CartID]
GO
ALTER TABLE [kmaes].[Orders] ADD  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [kmaes].[Payment] ADD  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [kmaes].[Product] ADD  DEFAULT (getdate()) FOR [DateCreated]
GO
ALTER TABLE [kmaes].[Product] ADD  DEFAULT ((0)) FOR [Inventory]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_User_Id] FOREIGN KEY([User_Id])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_User_Id]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [kmaes].[AccountAddress]  WITH CHECK ADD FOREIGN KEY([AddressID])
REFERENCES [kmaes].[Address] ([AddressID])
GO
ALTER TABLE [kmaes].[AccountAddress]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [kmaes].[AspNetUsers] ([Id])
GO
ALTER TABLE [kmaes].[CategoryEntry]  WITH CHECK ADD FOREIGN KEY([CategoryID])
REFERENCES [kmaes].[Category] ([CategoryID])
GO
ALTER TABLE [kmaes].[CategoryEntry]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [kmaes].[Product] ([ProductID])
GO
ALTER TABLE [kmaes].[Inventory]  WITH CHECK ADD FOREIGN KEY([PhysicalLocationID])
REFERENCES [kmaes].[PhysicalLocation] ([PhysicalLocationID])
GO
ALTER TABLE [kmaes].[Inventory]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [kmaes].[Product] ([ProductID])
GO
ALTER TABLE [kmaes].[OrderProduct]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [kmaes].[Orders] ([OrderID])
GO
ALTER TABLE [kmaes].[OrderProduct]  WITH CHECK ADD FOREIGN KEY([ProductID])
REFERENCES [kmaes].[Product] ([ProductID])
GO
ALTER TABLE [kmaes].[Orders]  WITH CHECK ADD FOREIGN KEY([AddressID])
REFERENCES [kmaes].[Address] ([AddressID])
GO
ALTER TABLE [kmaes].[Payment]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [kmaes].[Orders] ([OrderID])
GO
ALTER TABLE [kmaes].[AccountAddress]  WITH CHECK ADD  CONSTRAINT [chk_AddressType] CHECK  (([addresstype]='Billing' OR [addresstype]='Mailing'))
GO
ALTER TABLE [kmaes].[AccountAddress] CHECK CONSTRAINT [chk_AddressType]
GO
ALTER TABLE [kmaes].[PhysicalLocation]  WITH CHECK ADD  CONSTRAINT [chk_LocationType] CHECK  (([locationtype]='Warehouse' OR [locationtype]='Store'))
GO
ALTER TABLE [kmaes].[PhysicalLocation] CHECK CONSTRAINT [chk_LocationType]
GO
