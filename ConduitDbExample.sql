USE [master]
GO
/****** Object:  Database [Conduit]    Script Date: 15.05.2018 15:56:39 ******/
CREATE DATABASE [Conduit]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Conduit', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Conduit.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Conduit_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\Conduit_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Conduit] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Conduit].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Conduit] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Conduit] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Conduit] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Conduit] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Conduit] SET ARITHABORT OFF 
GO
ALTER DATABASE [Conduit] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Conduit] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Conduit] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Conduit] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Conduit] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Conduit] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Conduit] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Conduit] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Conduit] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Conduit] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Conduit] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Conduit] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Conduit] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Conduit] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Conduit] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Conduit] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [Conduit] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Conduit] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Conduit] SET  MULTI_USER 
GO
ALTER DATABASE [Conduit] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Conduit] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Conduit] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Conduit] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Conduit] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Conduit] SET QUERY_STORE = OFF
GO
USE [Conduit]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [Conduit]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 15.05.2018 15:56:40 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArticleFavorites]    Script Date: 15.05.2018 15:56:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticleFavorites](
	[ArticleId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
 CONSTRAINT [PK_ArticleFavorites] PRIMARY KEY CLUSTERED 
(
	[ArticleId] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Articles]    Script Date: 15.05.2018 15:56:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Articles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AuthorUserId] [int] NULL,
	[Body] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[Slug] [nvarchar](max) NULL,
	[Title] [nvarchar](max) NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Articles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ArticleTags]    Script Date: 15.05.2018 15:56:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ArticleTags](
	[ArticleId] [int] NOT NULL,
	[TagId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_ArticleTags] PRIMARY KEY CLUSTERED 
(
	[ArticleId] ASC,
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comments]    Script Date: 15.05.2018 15:56:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ArticleId] [int] NULL,
	[AuthorUserId] [int] NULL,
	[Body] [nvarchar](max) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[UpdatedAt] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_Comments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FollowedPeoples]    Script Date: 15.05.2018 15:56:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FollowedPeoples](
	[ObserverId] [int] NOT NULL,
	[TargetId] [int] NOT NULL,
 CONSTRAINT [PK_FollowedPeoples] PRIMARY KEY CLUSTERED 
(
	[ObserverId] ASC,
	[TargetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Log]    Script Date: 15.05.2018 15:56:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Log](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Application] [nvarchar](50) NOT NULL,
	[Logged] [datetime] NOT NULL,
	[Level] [nvarchar](50) NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
	[Logger] [nvarchar](250) NULL,
	[Callsite] [nvarchar](max) NULL,
	[Exception] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Log] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tags]    Script Date: 15.05.2018 15:56:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tags](
	[TagId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_Tags] PRIMARY KEY CLUSTERED 
(
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 15.05.2018 15:56:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Bio] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[FirstName] [nvarchar](max) NULL,
	[Hash] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Salt] [nvarchar](max) NULL,
	[UserName] [nvarchar](max) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20180312115342_InitialCreate', N'2.0.1-rtm-125')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20180312120633_InitialCreate2', N'2.0.1-rtm-125')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20180316081100_SaltAndHashString', N'2.0.1-rtm-125')
INSERT [dbo].[ArticleFavorites] ([ArticleId], [UserId]) VALUES (2, 1)
INSERT [dbo].[ArticleFavorites] ([ArticleId], [UserId]) VALUES (3, 1)
INSERT [dbo].[ArticleFavorites] ([ArticleId], [UserId]) VALUES (7, 1)
INSERT [dbo].[ArticleFavorites] ([ArticleId], [UserId]) VALUES (2, 2)
INSERT [dbo].[ArticleFavorites] ([ArticleId], [UserId]) VALUES (3, 2)
INSERT [dbo].[ArticleFavorites] ([ArticleId], [UserId]) VALUES (7, 2)
INSERT [dbo].[ArticleFavorites] ([ArticleId], [UserId]) VALUES (2, 3)
INSERT [dbo].[ArticleFavorites] ([ArticleId], [UserId]) VALUES (3, 3)
INSERT [dbo].[ArticleFavorites] ([ArticleId], [UserId]) VALUES (7, 3)
INSERT [dbo].[ArticleFavorites] ([ArticleId], [UserId]) VALUES (3, 23)
INSERT [dbo].[ArticleFavorites] ([ArticleId], [UserId]) VALUES (7, 23)
INSERT [dbo].[ArticleFavorites] ([ArticleId], [UserId]) VALUES (23, 23)
INSERT [dbo].[ArticleFavorites] ([ArticleId], [UserId]) VALUES (25, 23)
INSERT [dbo].[ArticleFavorites] ([ArticleId], [UserId]) VALUES (3, 26)
INSERT [dbo].[ArticleFavorites] ([ArticleId], [UserId]) VALUES (7, 26)
INSERT [dbo].[ArticleFavorites] ([ArticleId], [UserId]) VALUES (23, 28)
SET IDENTITY_INSERT [dbo].[Articles] ON 

INSERT [dbo].[Articles] ([Id], [AuthorUserId], [Body], [CreatedAt], [Description], [Slug], [Title], [UpdatedAt]) VALUES (2, 1, N'Denemesada', CAST(N'2018-01-02T00:00:00.0000000' AS DateTime2), N'Description', NULL, N'Title', CAST(N'2018-03-14T15:20:11.0952226' AS DateTime2))
INSERT [dbo].[Articles] ([Id], [AuthorUserId], [Body], [CreatedAt], [Description], [Slug], [Title], [UpdatedAt]) VALUES (3, 2, N'Adminde update edilebiliyor...', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'Update Of Admin', NULL, N'Update Admin', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Articles] ([Id], [AuthorUserId], [Body], [CreatedAt], [Description], [Slug], [Title], [UpdatedAt]) VALUES (7, 2, N'Article Tags Update', CAST(N'2018-03-20T10:34:12.4908894' AS DateTime2), N'asdafq1 update', N'ArticleTagsDenemesi', N'asdaasd', CAST(N'2018-03-20T10:37:17.5212486' AS DateTime2))
INSERT [dbo].[Articles] ([Id], [AuthorUserId], [Body], [CreatedAt], [Description], [Slug], [Title], [UpdatedAt]) VALUES (23, 23, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla non venenatis tortor, at congue dui. Mauris nec laoreet dolor. In in tellus massa. Proin vitae massa arcu. Donec feugiat, arcu in tempus placerat, sapien mi facilisis enim, eget tincidunt erat nibh et dolor. Proin vulputate pellentesque ex nec eleifend. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed iaculis faucibus sagittis.

Pellentesque rutrum, ipsum tempus sollicitudin faucibus, felis orci volutpat magna, a ornare metus elit eu tortor. Phasellus mauris est, porta nec nunc sit amet, tincidunt condimentum sem. Sed dapibus quam ac nisl laoreet, sit amet lacinia ante consequat. In blandit lorem id augue consectetur, non hendrerit purus dignissim. Maecenas pulvinar, risus vel interdum fringilla, eros elit eleifend felis, in convallis arcu odio non ipsum. Donec sit amet mollis velit, ut vehicula arcu. Cras non mattis est, molestie sollicitudin lectus. Suspendisse eget facilisis nisl. In ac nunc eget justo posuere sollicitudin. Pellentesque quis lacinia libero. Mauris risus turpis, vestibulum id dui a, dapibus euismod ex. Vivamus dolor risus, faucibus eu nisl id, ultrices cursus nisl. Cras vestibulum ligula nisi. Nam eget nisl vel felis tempor condimentum id sit amet augue.

Proin ante nisl, volutpat sit amet tempus et, vestibulum vitae turpis. Curabitur eget velit dictum, eleifend libero a, gravida mi. Aliquam imperdiet posuere ante, lacinia sollicitudin nulla varius vitae. Aenean quis purus tempus, iaculis lacus ac, imperdiet sapien. Nam finibus in odio id maximus. Phasellus sollicitudin lacinia velit vel mattis. Morbi posuere metus quis tincidunt fermentum. Sed vel faucibus nisi, vitae lacinia nunc. Fusce pulvinar, tortor id laoreet fringilla, lacus lorem tempus nisl, quis iaculis est erat at nisi. Nulla in sagittis diam, id posuere purus. Nullam interdum dapibus venenatis. Aliquam dignissim lobortis mauris non eleifend. Cras nec nibh nec ex blandit convallis vitae tempus arcu. Donec posuere, lacus eu sagittis aliquam, leo leo malesuada purus, nec venenatis urna metus ut odio.

Donec cursus enim ut malesuada ultrices. In suscipit tortor justo, id hendrerit elit interdum at. Vestibulum at velit quis mauris placerat finibus. Aliquam et massa purus. Sed metus neque, viverra eu quam nec, finibus tempor neque. Morbi feugiat euismod libero, semper porta odio luctus sed. Aenean bibendum elementum dignissim. Mauris sed tortor tempor, suscipit quam sit amet, imperdiet risus. Aliquam eu ligula semper, tincidunt urna quis, sagittis purus. Sed molestie laoreet condimentum. Phasellus eget dictum sem.

Nunc scelerisque lacus eu accumsan scelerisque. Integer semper nunc eu arcu efficitur gravida. Nulla hendrerit vestibulum magna, id semper arcu luctus vel. Mauris convallis consectetur lorem vel egestas. Duis condimentum, justo ut bibendum ullamcorper, justo nisl volutpat eros, in efficitur ligula tellus vel ante. Duis vitae fringilla libero, et lacinia risus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Sed vulputate nisl nulla, at viverra felis varius eu. Nunc libero diam, fringilla ut urna quis, accumsan ultricies risus. Duis blandit purus et risus iaculis, ac suscipit est dapibus. Donec fermentum at metus at sagittis.', CAST(N'2018-04-19T14:04:09.7272638' AS DateTime2), N'Lorem ipsum dolor sit amet..', N'Lorem_İpsum', N'Lorem İpsum', CAST(N'2018-04-20T11:12:37.8104214' AS DateTime2))
INSERT [dbo].[Articles] ([Id], [AuthorUserId], [Body], [CreatedAt], [Description], [Slug], [Title], [UpdatedAt]) VALUES (24, 23, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla non venenatis tortor, at congue dui. Mauris nec laoreet dolor. In in tellus massa. Proin vitae massa arcu. Donec feugiat, arcu in tempus placerat, sapien mi facilisis enim, eget tincidunt erat nibh et dolor. Proin vulputate pellentesque ex nec eleifend. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed iaculis faucibus sagittis.

Pellentesque rutrum, ipsum tempus sollicitudin faucibus, felis orci volutpat magna, a ornare metus elit eu tortor. Phasellus mauris est, porta nec nunc sit amet, tincidunt condimentum sem. Sed dapibus quam ac nisl laoreet, sit amet lacinia ante consequat. In blandit lorem id augue consectetur, non hendrerit purus dignissim. Maecenas pulvinar, risus vel interdum fringilla, eros elit eleifend felis, in convallis arcu odio non ipsum. Donec sit amet mollis velit, ut vehicula arcu. Cras non mattis est, molestie sollicitudin lectus. Suspendisse eget facilisis nisl. In ac nunc eget justo posuere sollicitudin. Pellentesque quis lacinia libero. Mauris risus turpis, vestibulum id dui a, dapibus euismod ex. Vivamus dolor risus, faucibus eu nisl id, ultrices cursus nisl. Cras vestibulum ligula nisi. Nam eget nisl vel felis tempor condimentum id sit amet augue.

Proin ante nisl, volutpat sit amet tempus et, vestibulum vitae turpis. Curabitur eget velit dictum, eleifend libero a, gravida mi. Aliquam imperdiet posuere ante, lacinia sollicitudin nulla varius vitae. Aenean quis purus tempus, iaculis lacus ac, imperdiet sapien. Nam finibus in odio id maximus. Phasellus sollicitudin lacinia velit vel mattis. Morbi posuere metus quis tincidunt fermentum. Sed vel faucibus nisi, vitae lacinia nunc. Fusce pulvinar, tortor id laoreet fringilla, lacus lorem tempus nisl, quis iaculis est erat at nisi. Nulla in sagittis diam, id posuere purus. Nullam interdum dapibus venenatis. Aliquam dignissim lobortis mauris non eleifend. Cras nec nibh nec ex blandit convallis vitae tempus arcu. Donec posuere, lacus eu sagittis aliquam, leo leo malesuada purus, nec venenatis urna metus ut odio.

Donec cursus enim ut malesuada ultrices. In suscipit tortor justo, id hendrerit elit interdum at. Vestibulum at velit quis mauris placerat finibus. Aliquam et massa purus. Sed metus neque, viverra eu quam nec, finibus tempor neque. Morbi feugiat euismod libero, semper porta odio luctus sed. Aenean bibendum elementum dignissim. Mauris sed tortor tempor, suscipit quam sit amet, imperdiet risus. Aliquam eu ligula semper, tincidunt urna quis, sagittis purus. Sed molestie laoreet condimentum. Phasellus eget dictum sem.', CAST(N'2018-04-19T14:07:33.3118033' AS DateTime2), N'testxvzvx.zç', N'tamtest', N'tamtest', CAST(N'2018-04-20T10:53:02.6852632' AS DateTime2))
INSERT [dbo].[Articles] ([Id], [AuthorUserId], [Body], [CreatedAt], [Description], [Slug], [Title], [UpdatedAt]) VALUES (25, 28, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla non venenatis tortor, at congue dui. Mauris nec laoreet dolor. In in tellus massa. Proin vitae massa arcu. Donec feugiat, arcu in tempus placerat, sapien mi facilisis enim, eget tincidunt erat nibh et dolor. Proin vulputate pellentesque ex nec eleifend. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed iaculis faucibus sagittis.
 
 Pellentesque rutrum, ipsum tempus sollicitudin faucibus, felis orci volutpat magna, a ornare metus elit eu tortor. Phasellus mauris est, porta nec nunc sit amet, tincidunt condimentum sem. Sed dapibus quam ac nisl laoreet, sit amet lacinia ante consequat. In blandit lorem id augue consectetur, non hendrerit purus dignissim. Maecenas pulvinar, risus vel interdum fringilla, eros elit eleifend felis, in convallis arcu odio non ipsum. Donec sit amet mollis velit, ut vehicula arcu.', CAST(N'2018-05-04T08:28:15.0080997' AS DateTime2), N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla non venenatis tortor, at congue dui. Mauris nec laoreet dolor. In in tellus massa. ', N'test', N'test', CAST(N'2018-05-04T08:28:15.0081005' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Articles] OFF
INSERT [dbo].[ArticleTags] ([ArticleId], [TagId]) VALUES (23, N'1')
INSERT [dbo].[ArticleTags] ([ArticleId], [TagId]) VALUES (25, N'1')
INSERT [dbo].[ArticleTags] ([ArticleId], [TagId]) VALUES (23, N'2')
INSERT [dbo].[ArticleTags] ([ArticleId], [TagId]) VALUES (23, N'3')
INSERT [dbo].[ArticleTags] ([ArticleId], [TagId]) VALUES (23, N'4')
INSERT [dbo].[ArticleTags] ([ArticleId], [TagId]) VALUES (2, N'Aksiyon')
INSERT [dbo].[ArticleTags] ([ArticleId], [TagId]) VALUES (3, N'Aksiyon')
INSERT [dbo].[ArticleTags] ([ArticleId], [TagId]) VALUES (7, N'Aşk')
INSERT [dbo].[ArticleTags] ([ArticleId], [TagId]) VALUES (24, N'Awesome')
INSERT [dbo].[ArticleTags] ([ArticleId], [TagId]) VALUES (3, N'Bilim')
INSERT [dbo].[ArticleTags] ([ArticleId], [TagId]) VALUES (7, N'Bilim')
INSERT [dbo].[ArticleTags] ([ArticleId], [TagId]) VALUES (7, N'Deneme')
INSERT [dbo].[ArticleTags] ([ArticleId], [TagId]) VALUES (23, N'Deneme')
INSERT [dbo].[ArticleTags] ([ArticleId], [TagId]) VALUES (25, N'Deneme')
INSERT [dbo].[ArticleTags] ([ArticleId], [TagId]) VALUES (23, N'Ipsus')
INSERT [dbo].[ArticleTags] ([ArticleId], [TagId]) VALUES (24, N'Ipsus')
INSERT [dbo].[ArticleTags] ([ArticleId], [TagId]) VALUES (25, N'Ipsus')
INSERT [dbo].[ArticleTags] ([ArticleId], [TagId]) VALUES (24, N'İpsus')
INSERT [dbo].[ArticleTags] ([ArticleId], [TagId]) VALUES (23, N'Lorem')
INSERT [dbo].[ArticleTags] ([ArticleId], [TagId]) VALUES (24, N'Lorem')
INSERT [dbo].[ArticleTags] ([ArticleId], [TagId]) VALUES (25, N'Lorem')
INSERT [dbo].[ArticleTags] ([ArticleId], [TagId]) VALUES (3, N'Macera')
INSERT [dbo].[ArticleTags] ([ArticleId], [TagId]) VALUES (7, N'Macera')
INSERT [dbo].[ArticleTags] ([ArticleId], [TagId]) VALUES (25, N'Test')
INSERT [dbo].[ArticleTags] ([ArticleId], [TagId]) VALUES (7, N'Yepisyeni')
SET IDENTITY_INSERT [dbo].[Comments] ON 

INSERT [dbo].[Comments] ([Id], [ArticleId], [AuthorUserId], [Body], [CreatedAt], [UpdatedAt]) VALUES (3, 2, 18, N'18 id li kullanıcı mesaj atıyor dağılın..', CAST(N'2018-03-21T15:44:41.9360778' AS DateTime2), CAST(N'2018-03-21T15:44:41.9361023' AS DateTime2))
INSERT [dbo].[Comments] ([Id], [ArticleId], [AuthorUserId], [Body], [CreatedAt], [UpdatedAt]) VALUES (7, 23, 18, N'Deneme', CAST(N'2018-01-01T00:00:00.0000000' AS DateTime2), CAST(N'2018-01-01T00:00:00.0000000' AS DateTime2))
INSERT [dbo].[Comments] ([Id], [ArticleId], [AuthorUserId], [Body], [CreatedAt], [UpdatedAt]) VALUES (10, 23, 23, N'Comment Deneme', CAST(N'2018-05-02T09:22:47.8543462' AS DateTime2), CAST(N'2018-05-02T09:22:47.8546381' AS DateTime2))
INSERT [dbo].[Comments] ([Id], [ArticleId], [AuthorUserId], [Body], [CreatedAt], [UpdatedAt]) VALUES (11, 23, 23, N'Yepisyeni deneme', CAST(N'2018-05-02T09:59:24.0209305' AS DateTime2), CAST(N'2018-05-02T09:59:24.0209687' AS DateTime2))
INSERT [dbo].[Comments] ([Id], [ArticleId], [AuthorUserId], [Body], [CreatedAt], [UpdatedAt]) VALUES (12, 23, 23, N'En deneme bu.', CAST(N'2018-05-02T09:59:56.0263983' AS DateTime2), CAST(N'2018-05-02T09:59:56.0263994' AS DateTime2))
INSERT [dbo].[Comments] ([Id], [ArticleId], [AuthorUserId], [Body], [CreatedAt], [UpdatedAt]) VALUES (15, 23, 23, N'en son deneme', CAST(N'2018-05-02T11:15:49.2401077' AS DateTime2), CAST(N'2018-05-02T11:15:49.2401451' AS DateTime2))
INSERT [dbo].[Comments] ([Id], [ArticleId], [AuthorUserId], [Body], [CreatedAt], [UpdatedAt]) VALUES (16, 23, 23, N'awesome', CAST(N'2018-05-02T11:17:23.0008261' AS DateTime2), CAST(N'2018-05-02T11:17:23.0008280' AS DateTime2))
INSERT [dbo].[Comments] ([Id], [ArticleId], [AuthorUserId], [Body], [CreatedAt], [UpdatedAt]) VALUES (18, 23, 23, N'yepisyeni', CAST(N'2018-05-02T11:40:10.4619164' AS DateTime2), CAST(N'2018-05-02T11:40:10.4619182' AS DateTime2))
INSERT [dbo].[Comments] ([Id], [ArticleId], [AuthorUserId], [Body], [CreatedAt], [UpdatedAt]) VALUES (21, 23, 23, N'en son deneme', CAST(N'2018-05-02T13:35:43.1234565' AS DateTime2), CAST(N'2018-05-02T16:03:14.4520707' AS DateTime2))
INSERT [dbo].[Comments] ([Id], [ArticleId], [AuthorUserId], [Body], [CreatedAt], [UpdatedAt]) VALUES (23, 7, 23, N'deneme 1233', CAST(N'2018-05-02T16:07:55.7815064' AS DateTime2), CAST(N'2018-05-02T16:07:55.7815080' AS DateTime2))
INSERT [dbo].[Comments] ([Id], [ArticleId], [AuthorUserId], [Body], [CreatedAt], [UpdatedAt]) VALUES (24, 7, 23, N'yeni', CAST(N'2018-05-02T16:08:58.1746737' AS DateTime2), CAST(N'2018-05-02T16:08:58.1746748' AS DateTime2))
INSERT [dbo].[Comments] ([Id], [ArticleId], [AuthorUserId], [Body], [CreatedAt], [UpdatedAt]) VALUES (25, 7, 23, N'asdasd', CAST(N'2018-05-02T16:09:41.3553172' AS DateTime2), CAST(N'2018-05-02T16:09:41.3553180' AS DateTime2))
INSERT [dbo].[Comments] ([Id], [ArticleId], [AuthorUserId], [Body], [CreatedAt], [UpdatedAt]) VALUES (27, 24, 23, N'yeni', CAST(N'2018-05-02T16:17:12.9508464' AS DateTime2), CAST(N'2018-05-02T16:17:12.9508472' AS DateTime2))
INSERT [dbo].[Comments] ([Id], [ArticleId], [AuthorUserId], [Body], [CreatedAt], [UpdatedAt]) VALUES (28, 23, 28, N'Bunların hepsi yalan dolan.', CAST(N'2018-05-10T07:50:16.2749577' AS DateTime2), CAST(N'2018-05-10T07:50:38.4538039' AS DateTime2))
INSERT [dbo].[Comments] ([Id], [ArticleId], [AuthorUserId], [Body], [CreatedAt], [UpdatedAt]) VALUES (29, 25, 23, N'Çok güzel bir makale olmuş. Teşekkür ederim...
', CAST(N'2018-05-15T09:52:03.5472335' AS DateTime2), CAST(N'2018-05-15T09:52:03.5474566' AS DateTime2))
SET IDENTITY_INSERT [dbo].[Comments] OFF
INSERT [dbo].[FollowedPeoples] ([ObserverId], [TargetId]) VALUES (2, 1)
INSERT [dbo].[FollowedPeoples] ([ObserverId], [TargetId]) VALUES (6, 1)
INSERT [dbo].[FollowedPeoples] ([ObserverId], [TargetId]) VALUES (28, 1)
INSERT [dbo].[FollowedPeoples] ([ObserverId], [TargetId]) VALUES (1, 2)
INSERT [dbo].[FollowedPeoples] ([ObserverId], [TargetId]) VALUES (6, 2)
INSERT [dbo].[FollowedPeoples] ([ObserverId], [TargetId]) VALUES (28, 2)
INSERT [dbo].[FollowedPeoples] ([ObserverId], [TargetId]) VALUES (6, 18)
INSERT [dbo].[FollowedPeoples] ([ObserverId], [TargetId]) VALUES (6, 21)
INSERT [dbo].[FollowedPeoples] ([ObserverId], [TargetId]) VALUES (28, 23)
INSERT [dbo].[FollowedPeoples] ([ObserverId], [TargetId]) VALUES (23, 28)
SET IDENTITY_INSERT [dbo].[Log] ON 

INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (1, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:18.143' AS DateTime), N'Debug', N'url:  | action:  | init main', N'LoggerDeneme.Program', N'LoggerDeneme.Program.Main(C:\Users\EXT02D13704\Desktop\Denemeler\LoggerDeneme\LoggerDeneme\Program.cs:25)', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (2, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:20.017' AS DateTime), N'Info', N'url:  | action:  | User profile is available. Using ''C:\Users\EXT02D13704\AppData\Local\ASP.NET\DataProtection-Keys'' as key repository and Windows DPAPI to encrypt keys at rest.', N'Microsoft.AspNetCore.DataProtection.KeyManagement.XmlKeyManager', N'Microsoft.Extensions.Logging.LoggingExtensions.UsingProfileAsKeyRepositoryWithDPAPI', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (3, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:20.987' AS DateTime), N'Info', N'url: http://localhost/ | action:  | Request starting HTTP/1.1 GET http://localhost:61806/  ', N'Microsoft.AspNetCore.Hosting.Internal.WebHost', N'Microsoft.AspNetCore.Hosting.Internal.HostingApplicationDiagnostics.LogRequestStarting', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (4, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:21.057' AS DateTime), N'Info', N'url: http://localhost/ | action:  | Request starting HTTP/1.1 GET http://localhost:61806/  ', N'Microsoft.AspNetCore.Hosting.Internal.WebHost', N'Microsoft.AspNetCore.Hosting.Internal.HostingApplicationDiagnostics.LogRequestStarting', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (5, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:21.253' AS DateTime), N'Info', N'url: http://localhost/ | action: Index | Executing action method LoggerDeneme.Controllers.HomeController.Index (LoggerDeneme) with arguments ((null)) - ModelState is Valid', N'Microsoft.AspNetCore.Mvc.Internal.ControllerActionInvoker', N'Microsoft.AspNetCore.Mvc.Internal.MvcCoreLoggerExtensions.ActionMethodExecuting', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (6, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:21.533' AS DateTime), N'Info', N'url: http://localhost/ | action: Index | Executing action method LoggerDeneme.Controllers.HomeController.Index (LoggerDeneme) with arguments ((null)) - ModelState is Valid', N'Microsoft.AspNetCore.Mvc.Internal.ControllerActionInvoker', N'Microsoft.AspNetCore.Mvc.Internal.MvcCoreLoggerExtensions.ActionMethodExecuting', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (7, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:21.740' AS DateTime), N'Info', N'url: http://localhost/ | action: Index | Index say is Hello', N'LoggerDeneme.Controllers.HomeController', N'LoggerDeneme.Controllers.HomeController.Index(C:\Users\EXT02D13704\Desktop\Denemeler\LoggerDeneme\LoggerDeneme\Controllers\HomeController.cs:23)', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (8, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:21.933' AS DateTime), N'Info', N'url: http://localhost/ | action: Index | Index say is Hello', N'LoggerDeneme.Controllers.HomeController', N'LoggerDeneme.Controllers.HomeController.Index(C:\Users\EXT02D13704\Desktop\Denemeler\LoggerDeneme\LoggerDeneme\Controllers\HomeController.cs:23)', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (9, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:22.117' AS DateTime), N'Fatal', N'url: http://localhost/ | action: Index | Index say is Hello', N'LoggerDeneme.Controllers.HomeController', N'LoggerDeneme.Controllers.HomeController.Index(C:\Users\EXT02D13704\Desktop\Denemeler\LoggerDeneme\LoggerDeneme\Controllers\HomeController.cs:24)', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (10, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:22.310' AS DateTime), N'Fatal', N'url: http://localhost/ | action: Index | Index say is Hello', N'LoggerDeneme.Controllers.HomeController', N'LoggerDeneme.Controllers.HomeController.Index(C:\Users\EXT02D13704\Desktop\Denemeler\LoggerDeneme\LoggerDeneme\Controllers\HomeController.cs:24)', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (11, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:22.507' AS DateTime), N'Error', N'url: http://localhost/ | action: Index | Index say is Hello', N'LoggerDeneme.Controllers.HomeController', N'LoggerDeneme.Controllers.HomeController.Index(C:\Users\EXT02D13704\Desktop\Denemeler\LoggerDeneme\LoggerDeneme\Controllers\HomeController.cs:25)', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (12, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:22.693' AS DateTime), N'Error', N'url: http://localhost/ | action: Index | Index say is Hello', N'LoggerDeneme.Controllers.HomeController', N'LoggerDeneme.Controllers.HomeController.Index(C:\Users\EXT02D13704\Desktop\Denemeler\LoggerDeneme\LoggerDeneme\Controllers\HomeController.cs:25)', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (13, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:28.380' AS DateTime), N'Info', N'url: http://localhost/ | action: Index | Executing ViewResult, running view at path /Views/Home/Index.cshtml.', N'Microsoft.AspNetCore.Mvc.ViewFeatures.Internal.ViewResultExecutor', N'Microsoft.AspNetCore.Mvc.ViewFeatures.Internal.MvcViewFeaturesLoggerExtensions.ViewResultExecuting', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (14, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:28.560' AS DateTime), N'Info', N'url: http://localhost/ | action: Index | Executing ViewResult, running view at path /Views/Home/Index.cshtml.', N'Microsoft.AspNetCore.Mvc.ViewFeatures.Internal.ViewResultExecutor', N'Microsoft.AspNetCore.Mvc.ViewFeatures.Internal.MvcViewFeaturesLoggerExtensions.ViewResultExecuting', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (15, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:29.343' AS DateTime), N'Info', N'url: http://localhost/lib/jquery/dist/jquery.js | action:  | Request starting HTTP/1.1 GET http://localhost:61806/lib/jquery/dist/jquery.js  ', N'Microsoft.AspNetCore.Hosting.Internal.WebHost', N'Microsoft.AspNetCore.Hosting.Internal.HostingApplicationDiagnostics.LogRequestStarting', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (16, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:29.353' AS DateTime), N'Info', N'url: http://localhost/css/site.css | action:  | Request starting HTTP/1.1 GET http://localhost:61806/css/site.css  ', N'Microsoft.AspNetCore.Hosting.Internal.WebHost', N'Microsoft.AspNetCore.Hosting.Internal.HostingApplicationDiagnostics.LogRequestStarting', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (17, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:29.353' AS DateTime), N'Info', N'url: http://localhost/lib/bootstrap/dist/css/bootstrap.css | action:  | Request starting HTTP/1.1 GET http://localhost:61806/lib/bootstrap/dist/css/bootstrap.css  ', N'Microsoft.AspNetCore.Hosting.Internal.WebHost', N'Microsoft.AspNetCore.Hosting.Internal.HostingApplicationDiagnostics.LogRequestStarting', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (18, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:29.477' AS DateTime), N'Info', N'url: http://localhost/lib/jquery/dist/jquery.js | action:  | Request starting HTTP/1.1 GET http://localhost:61806/lib/jquery/dist/jquery.js  ', N'Microsoft.AspNetCore.Hosting.Internal.WebHost', N'Microsoft.AspNetCore.Hosting.Internal.HostingApplicationDiagnostics.LogRequestStarting', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (19, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:29.477' AS DateTime), N'Info', N'url: http://localhost/css/site.css | action:  | Request starting HTTP/1.1 GET http://localhost:61806/css/site.css  ', N'Microsoft.AspNetCore.Hosting.Internal.WebHost', N'Microsoft.AspNetCore.Hosting.Internal.HostingApplicationDiagnostics.LogRequestStarting', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (20, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:29.510' AS DateTime), N'Info', N'url: http://localhost/lib/bootstrap/dist/css/bootstrap.css | action:  | Request starting HTTP/1.1 GET http://localhost:61806/lib/bootstrap/dist/css/bootstrap.css  ', N'Microsoft.AspNetCore.Hosting.Internal.WebHost', N'Microsoft.AspNetCore.Hosting.Internal.HostingApplicationDiagnostics.LogRequestStarting', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (21, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:29.280' AS DateTime), N'Info', N'url: http://localhost/ | action: Index | Executed action LoggerDeneme.Controllers.HomeController.Index (LoggerDeneme) in 8042.1515ms', N'Microsoft.AspNetCore.Mvc.Internal.ControllerActionInvoker', N'Microsoft.AspNetCore.Mvc.Internal.MvcCoreLoggerExtensions.ExecutedAction', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (22, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:29.597' AS DateTime), N'Info', N'url: http://localhost/lib/jquery/dist/jquery.js | action:  | The file /lib/jquery/dist/jquery.js was not modified', N'Microsoft.AspNetCore.StaticFiles.StaticFileMiddleware', N'Microsoft.AspNetCore.StaticFiles.LoggerExtensions.LogPathNotModified', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (23, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:29.637' AS DateTime), N'Info', N'url: http://localhost/lib/bootstrap/dist/css/bootstrap.css | action:  | The file /lib/bootstrap/dist/css/bootstrap.css was not modified', N'Microsoft.AspNetCore.StaticFiles.StaticFileMiddleware', N'Microsoft.AspNetCore.StaticFiles.LoggerExtensions.LogPathNotModified', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (24, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:29.617' AS DateTime), N'Info', N'url: http://localhost/css/site.css | action:  | The file /css/site.css was not modified', N'Microsoft.AspNetCore.StaticFiles.StaticFileMiddleware', N'Microsoft.AspNetCore.StaticFiles.LoggerExtensions.LogPathNotModified', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (25, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:29.660' AS DateTime), N'Info', N'url: http://localhost/ | action: Index | Executed action LoggerDeneme.Controllers.HomeController.Index (LoggerDeneme) in 8042.1515ms', N'Microsoft.AspNetCore.Mvc.Internal.ControllerActionInvoker', N'Microsoft.AspNetCore.Mvc.Internal.MvcCoreLoggerExtensions.ExecutedAction', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (26, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:29.787' AS DateTime), N'Info', N'url: http://localhost/lib/jquery/dist/jquery.js | action:  | The file /lib/jquery/dist/jquery.js was not modified', N'Microsoft.AspNetCore.StaticFiles.StaticFileMiddleware', N'Microsoft.AspNetCore.StaticFiles.LoggerExtensions.LogPathNotModified', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (27, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:29.927' AS DateTime), N'Info', N'url: http://localhost/ | action: Index | Request finished in 8943.2847ms 200 text/html; charset=utf-8', N'Microsoft.AspNetCore.Hosting.Internal.WebHost', N'Microsoft.AspNetCore.Hosting.Internal.HostingApplicationDiagnostics.LogRequestFinished', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (28, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:29.880' AS DateTime), N'Info', N'url: http://localhost/lib/bootstrap/dist/css/bootstrap.css | action:  | The file /lib/bootstrap/dist/css/bootstrap.css was not modified', N'Microsoft.AspNetCore.StaticFiles.StaticFileMiddleware', N'Microsoft.AspNetCore.StaticFiles.LoggerExtensions.LogPathNotModified', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (29, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:29.970' AS DateTime), N'Info', N'url: http://localhost/lib/jquery/dist/jquery.js | action:  | Request finished in 624.6378ms 304 application/javascript', N'Microsoft.AspNetCore.Hosting.Internal.WebHost', N'Microsoft.AspNetCore.Hosting.Internal.HostingApplicationDiagnostics.LogRequestFinished', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (30, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:30.100' AS DateTime), N'Info', N'url: http://localhost/ | action: Index | Request finished in 8943.2847ms 200 text/html; charset=utf-8', N'Microsoft.AspNetCore.Hosting.Internal.WebHost', N'Microsoft.AspNetCore.Hosting.Internal.HostingApplicationDiagnostics.LogRequestFinished', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (31, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:30.120' AS DateTime), N'Info', N'url: http://localhost/lib/bootstrap/dist/css/bootstrap.css | action:  | Request finished in 767.5455ms 304 text/css', N'Microsoft.AspNetCore.Hosting.Internal.WebHost', N'Microsoft.AspNetCore.Hosting.Internal.HostingApplicationDiagnostics.LogRequestFinished', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (32, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:29.893' AS DateTime), N'Info', N'url: http://localhost/css/site.css | action:  | The file /css/site.css was not modified', N'Microsoft.AspNetCore.StaticFiles.StaticFileMiddleware', N'Microsoft.AspNetCore.StaticFiles.LoggerExtensions.LogPathNotModified', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (33, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:30.193' AS DateTime), N'Info', N'url: http://localhost/lib/jquery/dist/jquery.js | action:  | Request finished in 624.6378ms 304 application/javascript', N'Microsoft.AspNetCore.Hosting.Internal.WebHost', N'Microsoft.AspNetCore.Hosting.Internal.HostingApplicationDiagnostics.LogRequestFinished', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (34, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:30.257' AS DateTime), N'Info', N'url: http://localhost/lib/bootstrap/dist/css/bootstrap.css | action:  | Request finished in 767.5455ms 304 text/css', N'Microsoft.AspNetCore.Hosting.Internal.WebHost', N'Microsoft.AspNetCore.Hosting.Internal.HostingApplicationDiagnostics.LogRequestFinished', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (35, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:30.230' AS DateTime), N'Info', N'url: http://localhost/lib/bootstrap/dist/js/bootstrap.js | action:  | Request starting HTTP/1.1 GET http://localhost:61806/lib/bootstrap/dist/js/bootstrap.js  ', N'Microsoft.AspNetCore.Hosting.Internal.WebHost', N'Microsoft.AspNetCore.Hosting.Internal.HostingApplicationDiagnostics.LogRequestStarting', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (36, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:30.277' AS DateTime), N'Info', N'url: http://localhost/css/site.css | action:  | Request finished in 924.1535ms 304 text/css', N'Microsoft.AspNetCore.Hosting.Internal.WebHost', N'Microsoft.AspNetCore.Hosting.Internal.HostingApplicationDiagnostics.LogRequestFinished', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (37, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:30.433' AS DateTime), N'Info', N'url: http://localhost/images/banner3.svg | action:  | Request starting HTTP/1.1 GET http://localhost:61806/images/banner3.svg  ', N'Microsoft.AspNetCore.Hosting.Internal.WebHost', N'Microsoft.AspNetCore.Hosting.Internal.HostingApplicationDiagnostics.LogRequestStarting', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (38, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:30.433' AS DateTime), N'Info', N'url: http://localhost/images/banner2.svg | action:  | Request starting HTTP/1.1 GET http://localhost:61806/images/banner2.svg  ', N'Microsoft.AspNetCore.Hosting.Internal.WebHost', N'Microsoft.AspNetCore.Hosting.Internal.HostingApplicationDiagnostics.LogRequestStarting', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (39, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:30.500' AS DateTime), N'Info', N'url: http://localhost/images/banner1.svg | action:  | Request starting HTTP/1.1 GET http://localhost:61806/images/banner1.svg  ', N'Microsoft.AspNetCore.Hosting.Internal.WebHost', N'Microsoft.AspNetCore.Hosting.Internal.HostingApplicationDiagnostics.LogRequestStarting', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (40, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:30.587' AS DateTime), N'Info', N'url: http://localhost/lib/bootstrap/dist/js/bootstrap.js | action:  | Request starting HTTP/1.1 GET http://localhost:61806/lib/bootstrap/dist/js/bootstrap.js  ', N'Microsoft.AspNetCore.Hosting.Internal.WebHost', N'Microsoft.AspNetCore.Hosting.Internal.HostingApplicationDiagnostics.LogRequestStarting', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (41, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:30.643' AS DateTime), N'Info', N'url: http://localhost/css/site.css | action:  | Request finished in 924.1535ms 304 text/css', N'Microsoft.AspNetCore.Hosting.Internal.WebHost', N'Microsoft.AspNetCore.Hosting.Internal.HostingApplicationDiagnostics.LogRequestFinished', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (42, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:30.713' AS DateTime), N'Info', N'url: http://localhost/images/banner3.svg | action:  | Request starting HTTP/1.1 GET http://localhost:61806/images/banner3.svg  ', N'Microsoft.AspNetCore.Hosting.Internal.WebHost', N'Microsoft.AspNetCore.Hosting.Internal.HostingApplicationDiagnostics.LogRequestStarting', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (43, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:30.757' AS DateTime), N'Info', N'url: http://localhost/images/banner2.svg | action:  | Request starting HTTP/1.1 GET http://localhost:61806/images/banner2.svg  ', N'Microsoft.AspNetCore.Hosting.Internal.WebHost', N'Microsoft.AspNetCore.Hosting.Internal.HostingApplicationDiagnostics.LogRequestStarting', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (44, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:30.900' AS DateTime), N'Info', N'url: http://localhost/images/banner4.svg | action:  | Request starting HTTP/1.1 GET http://localhost:61806/images/banner4.svg  ', N'Microsoft.AspNetCore.Hosting.Internal.WebHost', N'Microsoft.AspNetCore.Hosting.Internal.HostingApplicationDiagnostics.LogRequestStarting', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (45, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:30.807' AS DateTime), N'Info', N'url: http://localhost/images/banner1.svg | action:  | Request starting HTTP/1.1 GET http://localhost:61806/images/banner1.svg  ', N'Microsoft.AspNetCore.Hosting.Internal.WebHost', N'Microsoft.AspNetCore.Hosting.Internal.HostingApplicationDiagnostics.LogRequestStarting', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (46, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:30.867' AS DateTime), N'Info', N'url: http://localhost/lib/bootstrap/dist/js/bootstrap.js | action:  | The file /lib/bootstrap/dist/js/bootstrap.js was not modified', N'Microsoft.AspNetCore.StaticFiles.StaticFileMiddleware', N'Microsoft.AspNetCore.StaticFiles.LoggerExtensions.LogPathNotModified', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (47, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:30.993' AS DateTime), N'Info', N'url: http://localhost/images/banner4.svg | action:  | Request starting HTTP/1.1 GET http://localhost:61806/images/banner4.svg  ', N'Microsoft.AspNetCore.Hosting.Internal.WebHost', N'Microsoft.AspNetCore.Hosting.Internal.HostingApplicationDiagnostics.LogRequestStarting', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (48, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:30.957' AS DateTime), N'Info', N'url: http://localhost/images/banner3.svg | action:  | The file /images/banner3.svg was not modified', N'Microsoft.AspNetCore.StaticFiles.StaticFileMiddleware', N'Microsoft.AspNetCore.StaticFiles.LoggerExtensions.LogPathNotModified', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (49, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:30.977' AS DateTime), N'Info', N'url: http://localhost/images/banner2.svg | action:  | The file /images/banner2.svg was not modified', N'Microsoft.AspNetCore.StaticFiles.StaticFileMiddleware', N'Microsoft.AspNetCore.StaticFiles.LoggerExtensions.LogPathNotModified', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (50, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:30.993' AS DateTime), N'Info', N'url: http://localhost/images/banner1.svg | action:  | The file /images/banner1.svg was not modified', N'Microsoft.AspNetCore.StaticFiles.StaticFileMiddleware', N'Microsoft.AspNetCore.StaticFiles.LoggerExtensions.LogPathNotModified', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (51, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:31.067' AS DateTime), N'Info', N'url: http://localhost/lib/bootstrap/dist/js/bootstrap.js | action:  | The file /lib/bootstrap/dist/js/bootstrap.js was not modified', N'Microsoft.AspNetCore.StaticFiles.StaticFileMiddleware', N'Microsoft.AspNetCore.StaticFiles.LoggerExtensions.LogPathNotModified', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (52, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:31.277' AS DateTime), N'Info', N'url: http://localhost/lib/bootstrap/dist/js/bootstrap.js | action:  | Request finished in 1051.8251ms 304 application/javascript', N'Microsoft.AspNetCore.Hosting.Internal.WebHost', N'Microsoft.AspNetCore.Hosting.Internal.HostingApplicationDiagnostics.LogRequestFinished', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (53, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:31.123' AS DateTime), N'Info', N'url: http://localhost/images/banner4.svg | action:  | The file /images/banner4.svg was not modified', N'Microsoft.AspNetCore.StaticFiles.StaticFileMiddleware', N'Microsoft.AspNetCore.StaticFiles.LoggerExtensions.LogPathNotModified', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (54, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:31.193' AS DateTime), N'Info', N'url: http://localhost/images/banner3.svg | action:  | The file /images/banner3.svg was not modified', N'Microsoft.AspNetCore.StaticFiles.StaticFileMiddleware', N'Microsoft.AspNetCore.StaticFiles.LoggerExtensions.LogPathNotModified', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (55, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:31.443' AS DateTime), N'Info', N'url: http://localhost/lib/bootstrap/dist/js/bootstrap.js | action:  | Request finished in 1051.8251ms 304 application/javascript', N'Microsoft.AspNetCore.Hosting.Internal.WebHost', N'Microsoft.AspNetCore.Hosting.Internal.HostingApplicationDiagnostics.LogRequestFinished', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (56, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:31.267' AS DateTime), N'Info', N'url: http://localhost/images/banner2.svg | action:  | The file /images/banner2.svg was not modified', N'Microsoft.AspNetCore.StaticFiles.StaticFileMiddleware', N'Microsoft.AspNetCore.StaticFiles.LoggerExtensions.LogPathNotModified', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (57, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:31.277' AS DateTime), N'Info', N'url: http://localhost/images/banner1.svg | action:  | The file /images/banner1.svg was not modified', N'Microsoft.AspNetCore.StaticFiles.StaticFileMiddleware', N'Microsoft.AspNetCore.StaticFiles.LoggerExtensions.LogPathNotModified', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (58, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:31.560' AS DateTime), N'Info', N'url: http://localhost/images/banner3.svg | action:  | Request finished in 1125.2215ms 304 image/svg+xml', N'Microsoft.AspNetCore.Hosting.Internal.WebHost', N'Microsoft.AspNetCore.Hosting.Internal.HostingApplicationDiagnostics.LogRequestFinished', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (59, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:31.493' AS DateTime), N'Info', N'url: http://localhost/images/banner4.svg | action:  | The file /images/banner4.svg was not modified', N'Microsoft.AspNetCore.StaticFiles.StaticFileMiddleware', N'Microsoft.AspNetCore.StaticFiles.LoggerExtensions.LogPathNotModified', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (60, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:31.600' AS DateTime), N'Info', N'url: http://localhost/lib/bootstrap/dist/fonts/glyphicons-halflings-regular.woff2 | action:  | Request starting HTTP/1.1 GET http://localhost:61806/lib/bootstrap/dist/fonts/glyphicons-halflings-regular.woff2  ', N'Microsoft.AspNetCore.Hosting.Internal.WebHost', N'Microsoft.AspNetCore.Hosting.Internal.HostingApplicationDiagnostics.LogRequestStarting', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (61, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:31.627' AS DateTime), N'Info', N'url: http://localhost/images/banner2.svg | action:  | Request finished in 1191.8701ms 304 image/svg+xml', N'Microsoft.AspNetCore.Hosting.Internal.WebHost', N'Microsoft.AspNetCore.Hosting.Internal.HostingApplicationDiagnostics.LogRequestFinished', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (62, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:31.667' AS DateTime), N'Info', N'url: http://localhost/images/banner3.svg | action:  | Request finished in 1125.2215ms 304 image/svg+xml', N'Microsoft.AspNetCore.Hosting.Internal.WebHost', N'Microsoft.AspNetCore.Hosting.Internal.HostingApplicationDiagnostics.LogRequestFinished', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (63, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:31.637' AS DateTime), N'Info', N'url: http://localhost/images/banner1.svg | action:  | Request finished in 1137.2323ms 304 image/svg+xml', N'Microsoft.AspNetCore.Hosting.Internal.WebHost', N'Microsoft.AspNetCore.Hosting.Internal.HostingApplicationDiagnostics.LogRequestFinished', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (64, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:31.723' AS DateTime), N'Info', N'url: http://localhost/images/banner4.svg | action:  | Request finished in 822.2932ms 304 image/svg+xml', N'Microsoft.AspNetCore.Hosting.Internal.WebHost', N'Microsoft.AspNetCore.Hosting.Internal.HostingApplicationDiagnostics.LogRequestFinished', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (65, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:31.757' AS DateTime), N'Info', N'url: http://localhost/lib/bootstrap/dist/fonts/glyphicons-halflings-regular.woff2 | action:  | Request starting HTTP/1.1 GET http://localhost:61806/lib/bootstrap/dist/fonts/glyphicons-halflings-regular.woff2  ', N'Microsoft.AspNetCore.Hosting.Internal.WebHost', N'Microsoft.AspNetCore.Hosting.Internal.HostingApplicationDiagnostics.LogRequestStarting', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (66, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:31.757' AS DateTime), N'Info', N'url: http://localhost/images/banner2.svg | action:  | Request finished in 1191.8701ms 304 image/svg+xml', N'Microsoft.AspNetCore.Hosting.Internal.WebHost', N'Microsoft.AspNetCore.Hosting.Internal.HostingApplicationDiagnostics.LogRequestFinished', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (67, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:31.817' AS DateTime), N'Info', N'url: http://localhost/images/banner1.svg | action:  | Request finished in 1137.2323ms 304 image/svg+xml', N'Microsoft.AspNetCore.Hosting.Internal.WebHost', N'Microsoft.AspNetCore.Hosting.Internal.HostingApplicationDiagnostics.LogRequestFinished', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (68, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:31.907' AS DateTime), N'Info', N'url: http://localhost/js/site.js | action:  | Request starting HTTP/1.1 GET http://localhost:61806/js/site.js?v=ji3-IxbEzYWjzzLCGkF1KDjrT2jLbbrSYXw-AhMPNIA  ', N'Microsoft.AspNetCore.Hosting.Internal.WebHost', N'Microsoft.AspNetCore.Hosting.Internal.HostingApplicationDiagnostics.LogRequestStarting', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (69, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:31.850' AS DateTime), N'Info', N'url: http://localhost/images/banner4.svg | action:  | Request finished in 822.2932ms 304 image/svg+xml', N'Microsoft.AspNetCore.Hosting.Internal.WebHost', N'Microsoft.AspNetCore.Hosting.Internal.HostingApplicationDiagnostics.LogRequestFinished', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (70, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:31.863' AS DateTime), N'Info', N'url: http://localhost/lib/bootstrap/dist/fonts/glyphicons-halflings-regular.woff2 | action:  | The file /lib/bootstrap/dist/fonts/glyphicons-halflings-regular.woff2 was not modified', N'Microsoft.AspNetCore.StaticFiles.StaticFileMiddleware', N'Microsoft.AspNetCore.StaticFiles.LoggerExtensions.LogPathNotModified', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (71, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:32.003' AS DateTime), N'Info', N'url: http://localhost/js/site.js | action:  | Request starting HTTP/1.1 GET http://localhost:61806/js/site.js?v=ji3-IxbEzYWjzzLCGkF1KDjrT2jLbbrSYXw-AhMPNIA  ', N'Microsoft.AspNetCore.Hosting.Internal.WebHost', N'Microsoft.AspNetCore.Hosting.Internal.HostingApplicationDiagnostics.LogRequestStarting', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (72, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:32.027' AS DateTime), N'Info', N'url: http://localhost/lib/bootstrap/dist/fonts/glyphicons-halflings-regular.woff2 | action:  | The file /lib/bootstrap/dist/fonts/glyphicons-halflings-regular.woff2 was not modified', N'Microsoft.AspNetCore.StaticFiles.StaticFileMiddleware', N'Microsoft.AspNetCore.StaticFiles.LoggerExtensions.LogPathNotModified', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (73, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:32.080' AS DateTime), N'Info', N'url: http://localhost/js/site.js | action:  | The file /js/site.js was not modified', N'Microsoft.AspNetCore.StaticFiles.StaticFileMiddleware', N'Microsoft.AspNetCore.StaticFiles.LoggerExtensions.LogPathNotModified', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (74, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:32.237' AS DateTime), N'Info', N'url: http://localhost/lib/bootstrap/dist/fonts/glyphicons-halflings-regular.woff2 | action:  | Request finished in 636.9918ms 304 font/woff2', N'Microsoft.AspNetCore.Hosting.Internal.WebHost', N'Microsoft.AspNetCore.Hosting.Internal.HostingApplicationDiagnostics.LogRequestFinished', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (75, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:32.363' AS DateTime), N'Info', N'url: http://localhost/lib/bootstrap/dist/fonts/glyphicons-halflings-regular.woff2 | action:  | Request finished in 636.9918ms 304 font/woff2', N'Microsoft.AspNetCore.Hosting.Internal.WebHost', N'Microsoft.AspNetCore.Hosting.Internal.HostingApplicationDiagnostics.LogRequestFinished', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (76, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:32.293' AS DateTime), N'Info', N'url: http://localhost/js/site.js | action:  | The file /js/site.js was not modified', N'Microsoft.AspNetCore.StaticFiles.StaticFileMiddleware', N'Microsoft.AspNetCore.StaticFiles.LoggerExtensions.LogPathNotModified', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (77, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:32.487' AS DateTime), N'Info', N'url: http://localhost/js/site.js | action:  | Request finished in 578.1931ms 304 application/javascript', N'Microsoft.AspNetCore.Hosting.Internal.WebHost', N'Microsoft.AspNetCore.Hosting.Internal.HostingApplicationDiagnostics.LogRequestFinished', N'')
INSERT [dbo].[Log] ([Id], [Application], [Logged], [Level], [Message], [Logger], [Callsite], [Exception]) VALUES (78, N'AspNetCoreNlog', CAST(N'2018-04-20T15:48:32.537' AS DateTime), N'Info', N'url: http://localhost/js/site.js | action:  | Request finished in 578.1931ms 304 application/javascript', N'Microsoft.AspNetCore.Hosting.Internal.WebHost', N'Microsoft.AspNetCore.Hosting.Internal.HostingApplicationDiagnostics.LogRequestFinished', N'')
SET IDENTITY_INSERT [dbo].[Log] OFF
INSERT [dbo].[Tags] ([TagId]) VALUES (N'1')
INSERT [dbo].[Tags] ([TagId]) VALUES (N'2')
INSERT [dbo].[Tags] ([TagId]) VALUES (N'3')
INSERT [dbo].[Tags] ([TagId]) VALUES (N'4')
INSERT [dbo].[Tags] ([TagId]) VALUES (N'5')
INSERT [dbo].[Tags] ([TagId]) VALUES (N'6')
INSERT [dbo].[Tags] ([TagId]) VALUES (N'Aksiyon')
INSERT [dbo].[Tags] ([TagId]) VALUES (N'Aşk')
INSERT [dbo].[Tags] ([TagId]) VALUES (N'Awesome')
INSERT [dbo].[Tags] ([TagId]) VALUES (N'Bilim')
INSERT [dbo].[Tags] ([TagId]) VALUES (N'Deneme')
INSERT [dbo].[Tags] ([TagId]) VALUES (N'Ipsus')
INSERT [dbo].[Tags] ([TagId]) VALUES (N'İpsus')
INSERT [dbo].[Tags] ([TagId]) VALUES (N'Lorem')
INSERT [dbo].[Tags] ([TagId]) VALUES (N'Macera')
INSERT [dbo].[Tags] ([TagId]) VALUES (N'Test')
INSERT [dbo].[Tags] ([TagId]) VALUES (N'Yeni')
INSERT [dbo].[Tags] ([TagId]) VALUES (N'Yepisyeni')
INSERT [dbo].[Tags] ([TagId]) VALUES (N'Yes')
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [Bio], [Email], [FirstName], [Hash], [Image], [LastName], [Salt], [UserName]) VALUES (1, N'Boş', N'e@e.com.tr', N'Emre', NULL, NULL, N'Deneme', NULL, N'deneme')
INSERT [dbo].[Users] ([Id], [Bio], [Email], [FirstName], [Hash], [Image], [LastName], [Salt], [UserName]) VALUES (2, N'admin', N'admin@admin.com', N'admin', NULL, NULL, N'admin', NULL, N'admin')
INSERT [dbo].[Users] ([Id], [Bio], [Email], [FirstName], [Hash], [Image], [LastName], [Salt], [UserName]) VALUES (3, N'deneme', N'deneme@deneme.com', N'deneme', N'6F-76-32-E5-5B-25-22-14-C2-80-C0-1E-19-11-C4-05-EB-84-2C-EE-E4-1B-E9-38-28-45-68-C8-B8-C0-6C-E6', N'yok', N'deneme', N'D8-C9-FD-FB-2C-73-E8-26-D0-EF-8B-A5-E5-62-01-14-30-E9-88-48-CF-A6-8E-0C-93-50-F3-46-71-DE-AE-90', N'deneme2')
INSERT [dbo].[Users] ([Id], [Bio], [Email], [FirstName], [Hash], [Image], [LastName], [Salt], [UserName]) VALUES (4, N'deneme', N'yeni@yeni.com', NULL, N'55-16-4C-EA-6E-0B-F6-B2-AD-82-FF-7E-6E-DF-7F-0B-C0-8B-EE-BE-1C-78-82-3E-CA-94-6C-EE-87-3D-73-4C', N'yok', N'deneme', N'6F-5C-04-07-CF-31-98-2D-CD-8E-43-31-1E-F6-B7-F4-60-01-58-F0-6B-6F-E4-4E-DB-F7-18-49-45-B1-F9-54', N'yeni')
INSERT [dbo].[Users] ([Id], [Bio], [Email], [FirstName], [Hash], [Image], [LastName], [Salt], [UserName]) VALUES (6, N'a', N'a@a.com', N'a', N'79-08-28-1B-11-9B-08-7A-0C-71-9C-D4-2D-7D-75-A9-F3-01-30-4F-4D-B9-6B-03-75-60-01-31-7D-BD-94-2F', N'a', N'a', N'CA-97-81-12-CA-1B-BD-CA-FA-C2-31-B3-9A-23-DC-4D-A7-86-EF-F8-14-7C-4E-72-B9-80-77-85-AF-EE-48-BB', N'a')
INSERT [dbo].[Users] ([Id], [Bio], [Email], [FirstName], [Hash], [Image], [LastName], [Salt], [UserName]) VALUES (18, N'1u', N'1@1.com', N'u1', N'96-CA-E3-5C-E8-A9-B0-24-41-78-BF-28-E4-96-6C-2C-E1-B8-38-57-23-A9-6A-6B-83-88-58-CD-D6-CA-0A-1E', NULL, N'1u', N'A6-65-A4-59-20-42-2F-9D-41-7E-48-67-EF-DC-4F-B8-A0-4A-1F-3F-FF-1F-A0-7E-99-8E-86-F7-F7-A2-7A-E3', N'123')
INSERT [dbo].[Users] ([Id], [Bio], [Email], [FirstName], [Hash], [Image], [LastName], [Salt], [UserName]) VALUES (21, N'1u', N'1@1.com', N'u1', N'25-45-F1-4D-23-B5-70-96-3A-A5-71-33-2C-FD-99-D2-08-A1-52-7F-82-BD-CE-C4-02-5D-5F-0A-F2-6B-E9-47', NULL, N'1u', N'16-F7-8A-7D-63-17-F1-02-BB-D9-5F-C9-A4-F3-FF-2E-32-49-28-76-90-B8-BD-AD-6B-78-10-F8-2B-34-AC-E3', N'username')
INSERT [dbo].[Users] ([Id], [Bio], [Email], [FirstName], [Hash], [Image], [LastName], [Salt], [UserName]) VALUES (22, N'bio işte takma', N'yenidemee@yeni.com', N'yeni', N'6C-93-2B-46-DF-E0-4F-64-F8-88-72-E4-7F-7F-26-6F-50-52-D9-11-34-48-36-28-75-A6-AF-89-3E-A0-C3-FF', NULL, N'deneme', N'9F-FF-FD-F0-D5-FE-0E-A6-B7-1C-D2-40-F4-5E-B8-76-84-A7-84-B2-D6-D5-7D-06-DF-84-64-F3-67-63-52-09', N'yenideneme')
INSERT [dbo].[Users] ([Id], [Bio], [Email], [FirstName], [Hash], [Image], [LastName], [Salt], [UserName]) VALUES (23, N'Biyografimi istemiyorum.', N'emre@emre.com', N'emre', N'9E-5D-70-A8-F5-16-8C-8A-4F-99-0A-06-91-54-9A-9E-A6-1F-0B-ED-4B-8E-28-52-37-8E-F6-88-F3-42-71-70', N'https://www.telegraph.co.uk/content/dam/Travel/2017/April/view-bigben.jpg', N'balcı', N'C4-26-5F-1F-10-53-CA-35-88-F9-93-4F-37-DE-B1-FD-8D-81-81-34-E3-FD-00-DF-96-79-95-2E-51-6F-DB-7B', N'emre')
INSERT [dbo].[Users] ([Id], [Bio], [Email], [FirstName], [Hash], [Image], [LastName], [Salt], [UserName]) VALUES (24, NULL, N'emre@emre.com', N'emre', N'09-94-1F-C1-DA-26-42-03-4D-9D-7A-14-F2-E9-A4-95-7B-1E-4C-5D-FC-FE-D3-69-09-68-6F-C8-8B-EE-EC-34', NULL, NULL, N'24-21-7F-65-2B-3C-F9-C9-B1-A7-82-DD-AC-08-99-D6-B2-47-B5-E8-73-E7-D8-CF-CD-24-36-34-85-A0-C3-78', N'emre2')
INSERT [dbo].[Users] ([Id], [Bio], [Email], [FirstName], [Hash], [Image], [LastName], [Salt], [UserName]) VALUES (25, NULL, N'emre@emre.com', N'emre', N'90-4A-A5-18-E7-0F-79-CF-DB-92-3D-AB-A9-B4-F4-16-76-80-69-00-D3-11-F3-7B-B0-72-50-23-E5-26-9D-62', NULL, NULL, N'EE-7F-0D-0E-8D-47-22-15-B2-22-29-93-A8-12-88-F8-73-18-3E-7D-C4-06-7F-B6-E2-C4-07-80-AC-3A-5A-C4', N'emre123')
INSERT [dbo].[Users] ([Id], [Bio], [Email], [FirstName], [Hash], [Image], [LastName], [Salt], [UserName]) VALUES (26, NULL, N'emre@emre.com', N'emre', N'22-2D-F9-F0-CA-F1-E4-0D-10-97-2F-B9-1F-34-83-BD-FC-27-3E-6F-8E-E7-DC-00-54-08-7B-CC-A2-93-29-F6', NULL, NULL, N'70-5D-B0-60-3F-D5-43-14-51-DA-B1-17-1B-96-4B-4B-D5-75-E2-23-0F-40-F4-C3-00-D7-0D-F6-E6-5F-5F-1C', N'awesome')
INSERT [dbo].[Users] ([Id], [Bio], [Email], [FirstName], [Hash], [Image], [LastName], [Salt], [UserName]) VALUES (27, NULL, N'emre@emre.com', N'emre', N'B4-FC-49-2A-5F-D3-48-94-C6-94-13-F4-13-8D-28-91-F6-16-91-0B-45-DC-D1-96-41-BE-1D-0D-92-70-CC-F3', NULL, NULL, N'A2-FF-C1-36-A0-C9-8E-A3-FB-FE-E8-0D-7A-5F-F7-D8-53-2C-D4-39-02-26-6F-BB-29-A0-EE-41-23-F8-0A-08', N'emre3')
INSERT [dbo].[Users] ([Id], [Bio], [Email], [FirstName], [Hash], [Image], [LastName], [Salt], [UserName]) VALUES (28, N'Bio', N'yeni@deneme.com', N'Yeni', N'80-1F-36-8A-68-D1-68-D9-5E-67-AB-F4-40-BB-C9-13-2D-C9-68-26-63-79-38-37-94-B2-B0-44-2E-87-4F-6C', N'https://i1.wp.com/www.winhelponline.com/blog/wp-content/uploads/2017/12/user.png?resize=256%2C256&quality=100', N'Deneme', N'E5-ED-B3-48-C1-07-6B-D3-89-0C-CE-8D-5A-BA-96-54-40-37-33-4B-A4-FB-DC-2D-48-8E-68-5D-64-B1-64-7A', N'emre4')
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Index [IX_ArticleFavorites_UserId]    Script Date: 15.05.2018 15:56:40 ******/
CREATE NONCLUSTERED INDEX [IX_ArticleFavorites_UserId] ON [dbo].[ArticleFavorites]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Articles_AuthorUserId]    Script Date: 15.05.2018 15:56:40 ******/
CREATE NONCLUSTERED INDEX [IX_Articles_AuthorUserId] ON [dbo].[Articles]
(
	[AuthorUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_ArticleTags_TagId]    Script Date: 15.05.2018 15:56:40 ******/
CREATE NONCLUSTERED INDEX [IX_ArticleTags_TagId] ON [dbo].[ArticleTags]
(
	[TagId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comments_ArticleId]    Script Date: 15.05.2018 15:56:40 ******/
CREATE NONCLUSTERED INDEX [IX_Comments_ArticleId] ON [dbo].[Comments]
(
	[ArticleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Comments_AuthorUserId]    Script Date: 15.05.2018 15:56:40 ******/
CREATE NONCLUSTERED INDEX [IX_Comments_AuthorUserId] ON [dbo].[Comments]
(
	[AuthorUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_FollowedPeoples_TargetId]    Script Date: 15.05.2018 15:56:40 ******/
CREATE NONCLUSTERED INDEX [IX_FollowedPeoples_TargetId] ON [dbo].[FollowedPeoples]
(
	[TargetId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ArticleFavorites]  WITH CHECK ADD  CONSTRAINT [FK_ArticleFavorites_Articles_ArticleId] FOREIGN KEY([ArticleId])
REFERENCES [dbo].[Articles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ArticleFavorites] CHECK CONSTRAINT [FK_ArticleFavorites_Articles_ArticleId]
GO
ALTER TABLE [dbo].[ArticleFavorites]  WITH CHECK ADD  CONSTRAINT [FK_ArticleFavorites_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ArticleFavorites] CHECK CONSTRAINT [FK_ArticleFavorites_Users_UserId]
GO
ALTER TABLE [dbo].[Articles]  WITH CHECK ADD  CONSTRAINT [FK_Articles_Users_AuthorUserId] FOREIGN KEY([AuthorUserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Articles] CHECK CONSTRAINT [FK_Articles_Users_AuthorUserId]
GO
ALTER TABLE [dbo].[ArticleTags]  WITH CHECK ADD  CONSTRAINT [FK_ArticleTags_Articles_ArticleId] FOREIGN KEY([ArticleId])
REFERENCES [dbo].[Articles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ArticleTags] CHECK CONSTRAINT [FK_ArticleTags_Articles_ArticleId]
GO
ALTER TABLE [dbo].[ArticleTags]  WITH CHECK ADD  CONSTRAINT [FK_ArticleTags_Tags_TagId] FOREIGN KEY([TagId])
REFERENCES [dbo].[Tags] ([TagId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ArticleTags] CHECK CONSTRAINT [FK_ArticleTags_Tags_TagId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Articles_ArticleId] FOREIGN KEY([ArticleId])
REFERENCES [dbo].[Articles] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Articles_ArticleId]
GO
ALTER TABLE [dbo].[Comments]  WITH CHECK ADD  CONSTRAINT [FK_Comments_Users_AuthorUserId] FOREIGN KEY([AuthorUserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Comments] CHECK CONSTRAINT [FK_Comments_Users_AuthorUserId]
GO
ALTER TABLE [dbo].[FollowedPeoples]  WITH CHECK ADD  CONSTRAINT [FK_FollowedPeoples_Users_ObserverId] FOREIGN KEY([ObserverId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FollowedPeoples] CHECK CONSTRAINT [FK_FollowedPeoples_Users_ObserverId]
GO
USE [master]
GO
ALTER DATABASE [Conduit] SET  READ_WRITE 
GO
