
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 7/29/2022 4:25:05 PM ******/
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
/****** Object:  Table [dbo].[Answers]    Script Date: 7/29/2022 4:25:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Answers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[QuestionId] [int] NOT NULL,
	[Statement] [nvarchar](max) NOT NULL,
	[IsCorrect] [bit] NULL,
 CONSTRAINT [PK_Answers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 7/29/2022 4:25:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 7/29/2022 4:25:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 7/29/2022 4:25:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 7/29/2022 4:25:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 7/29/2022 4:25:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 7/29/2022 4:25:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 7/29/2022 4:25:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Questions]    Script Date: 7/29/2022 4:25:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Questions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Statement] [nvarchar](max) NOT NULL,
	[HasMultipleAnswers] [bit] NULL,
	[QuizId] [int] NOT NULL,
 CONSTRAINT [PK_Questions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quizzes]    Script Date: 7/29/2022 4:25:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quizzes](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[IsPubslished] [bit] NULL,
	[PublishedDate] [datetime2](7) NULL,
	[PubslishedId] [nvarchar](max) NULL,
 CONSTRAINT [PK_Quizzes] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Students]    Script Date: 7/29/2022 4:25:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](30) NOT NULL,
	[Class] [nvarchar](20) NOT NULL,
	[TeacherId] [int] NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teachers]    Script Date: 7/29/2022 4:25:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teachers](
	[TeacherId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](60) NOT NULL,
	[Subject] [nvarchar](max) NULL,
 CONSTRAINT [PK_Teachers] PRIMARY KEY CLUSTERED 
(
	[TeacherId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220724112200_IdentityMigration', N'6.0.4')
GO
SET IDENTITY_INSERT [dbo].[Answers] ON 
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (4, 13, N'Optionj 1', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (5, 13, N'22222222222222', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (6, 13, N'3333333333333', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (7, 1, N'Programming OOP', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (8, 1, N'Logic Building', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (84, 16, N'Answer 1', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (85, 16, N'2222222222222222', 1)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (86, 16, N'33333333333333333', 1)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (87, 16, N'44444444444', 1)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (88, 17, N' <script>', 1)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (89, 17, N' <scripting>', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (90, 17, N'<js>', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (91, 17, N'<javascript>', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (92, 18, N' document.getElementById("demo").innerHTML = "Hello World!";', 1)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (93, 18, N' #demo.innerHTML = "Hello World!";', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (94, 18, N' document.getElementByName("p").innerHTML = "Hello World!";', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (95, 18, N' document.getElement("p").innerHTML = "Hello World!";', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (96, 19, N' Both the <head> section and the <body> section are correct', 1)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (97, 19, N' The <body> section', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (98, 19, N' The <head> section', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (99, 20, N' <script src="xxx.js">', 1)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (100, 20, N' <script href="xxx.js">', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (101, 20, N' <script name="xxx.js">', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (102, 21, N'True', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (103, 21, N'False', 1)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (104, 22, N' if i = 5 then', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (105, 22, N' if i == 5 then', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (106, 22, N' if i = 5', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (107, 22, N' if (i == 5)', 1)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (108, 23, N' if i =! 5 then', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (109, 23, N' if (i <> 5)', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (110, 23, N' if i <> 5', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (111, 23, N' if (i != 5)', 1)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (112, 24, N' for (i = 0; i <= 5; i++)', 1)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (113, 24, N' for (i <= 5; i++)', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (114, 24, N' for i = 1 to 5', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (115, 24, N' for (i = 0; i <= 5)', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (116, 25, N' var colors = "red", "green", "blue"', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (117, 25, N' var colors = 1 = ("red"), 2 = ("green"), 3 = ("blue")', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (118, 25, N' var colors = ["red", "green", "blue"]', 1)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (119, 25, N' var colors = (1:"red", 2:"green", 3:"blue")', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (121, 26, N' w2 = window.new("http://www.w3schools.com");', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (122, 26, N' w2 = window.open("http://www.w3schools.com");', 1)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (123, 27, N'
interface User {
  id: string | number;
  name: string;
  email: string
}
', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (124, 27, N'
interface <UserIdType>User {
  id: UserIdType;
  name: string;
  email: string
}', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (125, 27, N'
interface User<UserIdType> {
  id: UserIdType;
  name: string;
  email: string
}', 1)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (126, 28, N' Boolean, Number, String', 1)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (127, 28, N' Object, String, Number', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (128, 28, N' Array, Object, Boolean', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (129, 28, N' Object, Array, Symbol', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (130, 29, N'An interface can extend another interface in TypeScript.', 1)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (131, 29, N'An interface can extend a class in TypeScript.', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (132, 29, N'TypeScript interface does not generate any JavaScript code.', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (133, 29, N'All of above', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (134, 30, N' Implicit = FALSE', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (135, 30, N' autoTypeAssignment = FALSE', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (136, 30, N' noImplicitAny', 1)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (137, 30, N' noAutoType', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (141, 31, N' strictNullChecks', 1)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (142, 31, N' strictChecksRequired', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (143, 31, N' noAutoType', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (144, 31, N' noFalseyInits', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (145, 32, N'string[]', 1)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (146, 32, N'any[]', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (147, 32, N'unknown[]', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (148, 32, N'string', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (152, 33, N' Allows no changes and is there simply to be read from and not modified', 1)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (153, 33, N' Makes you read it for better clean code', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (154, 33, N' Makes it private and can only be used in the file its created', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (155, 33, N' Allows only adding but not deleting elements in the array', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (156, 34, N' const ourTuple = [101, ''Coding God'']', 1)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (157, 34, N' const ourTuple = [101]', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (158, 34, N' const ourTuple = [101, 101, ''Coding God'', ''Coding God'']', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (159, 34, N' const ourTuple = [''Coding God'', 101]', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (160, 35, N' Improving', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (161, 35, N'Extending', 1)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (162, 35, N'Duplicating', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (163, 35, N'Inheriting', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (164, 36, N' string | undefined', 1)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (165, 36, N' string', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (166, 36, N'string | null', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (167, 36, N'unknown', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (168, 37, N'Option 1', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (169, 37, N'Option 2', 1)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (170, 38, N'1', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (171, 38, N'2', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (172, 38, N'3', 1)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (173, 38, N'4', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (174, 39, N'Option 1', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (175, 39, N'Option 2', 1)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (176, 39, N'Option 3', 1)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (177, 39, N'Option 4', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (178, 40, N'1', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (179, 40, N'2', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (180, 40, N'3', 1)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (181, 40, N'4', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (182, 41, N'1', 0)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (183, 41, N'2', 1)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (184, 41, N'3', 1)
GO
INSERT [dbo].[Answers] ([Id], [QuestionId], [Statement], [IsCorrect]) VALUES (185, 41, N'4', 0)
GO
SET IDENTITY_INSERT [dbo].[Answers] OFF
GO
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'539c4495-645e-49df-9f0c-99302c18f00f', N'Kamran', N'Khan', N'kkhan@gmail.com', N'KKHAN@GMAIL.COM', N'kkhan@gmail.com', N'KKHAN@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEPxQ9x7X3xqzbJ/ljSmr3hZfTybga8adHj1dRhPcFDxLVPlqkqISXGUoGMpBhZijtg==', N'PNFDCDFJTASPIGF36G3CEOYLHEAILKCW', N'55957038-14d2-4dc8-87c0-411d5199db72', NULL, 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'5e79079e-188f-4a35-bd12-0a4a09925160', N'Test', N'User', N'test@gmail.com', N'TEST@GMAIL.COM', N'test@gmail.com', N'TEST@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAENMcCixM7Io9RU/gWHjmc1H5VSsGQERAyEWWhfoNSsIRZ7ZyfQSgtZn/bZ0BuEZ9Yg==', N'CGMBZ6XQX6AQ2RX6NFKD2TG2SVWUNUAH', N'b2b07d27-3ddb-4ac4-88e8-6600c58bea1c', NULL, 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'6026f518-8852-43df-9aa8-f517ab278a7a', N'Mujassir', N'Nasir', N'mujassir@gmail.com', N'MUJASSIR@GMAIL.COM', N'mujassir@gmail.com', N'MUJASSIR@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEIMHM1FfAuSu2q15+n+glOwX1Dmq2to2SAj5cUS/xcKSGg/GoKeMZ77hVqPP3q2Hog==', N'5J42GQ6NCCI37X2UDGQWDQFJYODYVWTI', N'62c19ed0-e95e-4902-add2-19aca18788d6', N'string', 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'731fa2ea-049f-46b1-b8f8-fbd2c7397ff9', N'Iqbal', N'Raf', N'iqbal@gmail.com', N'IQBAL@GMAIL.COM', N'iqbal@gmail.com', N'IQBAL@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEOvJumwRxVUwoLigml2rD1N/QLSf7KgKRIi843QI+q66wSjUcGAZDNrAG9phMdBZ2g==', N'KJITXR7IW6HMMNZ2GJKT32VKS6OZJPRR', N'5c94acd9-dbe0-4209-abc2-475c0f6b3e53', NULL, 0, 0, NULL, 1, 0)
GO
INSERT [dbo].[AspNetUsers] ([Id], [FirstName], [LastName], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount]) VALUES (N'd004ba13-f07b-4e91-8c7d-94637d0fbe49', N'Nasir', N'K', N'nasir@gmail.com', N'NASIR@GMAIL.COM', N'nasir@gmail.com', N'NASIR@GMAIL.COM', 0, N'AQAAAAEAACcQAAAAEMpWeKQyHIeOawJj6TdBRIoXruDWk/HlHYuL+Ge8RgfVx8QH6pxlTyzYbgov8DqgUg==', N'ZJSP5SYBGZAIGG7OPDQ2ALLG5JVJWEAV', N'4109d694-c2fc-4f8f-bd5c-0fdc12eda78f', NULL, 0, 0, NULL, 1, 0)
GO
SET IDENTITY_INSERT [dbo].[Questions] ON 
GO
INSERT [dbo].[Questions] ([Id], [Statement], [HasMultipleAnswers], [QuizId]) VALUES (1, N'What is programming? 4', 1, 1)
GO
INSERT [dbo].[Questions] ([Id], [Statement], [HasMultipleAnswers], [QuizId]) VALUES (2, N'Test Question', NULL, 1)
GO
INSERT [dbo].[Questions] ([Id], [Statement], [HasMultipleAnswers], [QuizId]) VALUES (3, N'My new question', NULL, 1)
GO
INSERT [dbo].[Questions] ([Id], [Statement], [HasMultipleAnswers], [QuizId]) VALUES (4, N'How communication can make an impact?', NULL, 2)
GO
INSERT [dbo].[Questions] ([Id], [Statement], [HasMultipleAnswers], [QuizId]) VALUES (7, N'New question', NULL, 15)
GO
INSERT [dbo].[Questions] ([Id], [Statement], [HasMultipleAnswers], [QuizId]) VALUES (8, N'What is this querstions', NULL, 1)
GO
INSERT [dbo].[Questions] ([Id], [Statement], [HasMultipleAnswers], [QuizId]) VALUES (9, N'New Question statement', 1, 1)
GO
INSERT [dbo].[Questions] ([Id], [Statement], [HasMultipleAnswers], [QuizId]) VALUES (10, N'Phasellus eu justo ac libero aliquet lacinia sit amet vitae quam. Vestibulum aliquet justo id lorem pretium dignissim. Nam pulvinar interdum ipsum at bibendum. Curabitur eu tellus turpis. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean pellentesque risus ut metus vulputate, id iaculis ex pulvinar. Duis faucibus est consectetur nibh varius, posuere molestie diam fermentum.', 0, 1)
GO
INSERT [dbo].[Questions] ([Id], [Statement], [HasMultipleAnswers], [QuizId]) VALUES (11, N' Aliquam ornare, magna vitae cursus finibus, lacus erat lacinia lectus, bibendum fermentum erat libero id mi. Nullam porta, tortor eu tincidunt aliquet, arcu ipsum vestibulum justo, sed maximus diam nunc at est. Morbi nec tortor massa. Integer aliquet eleifend finibus.', 0, 1)
GO
INSERT [dbo].[Questions] ([Id], [Statement], [HasMultipleAnswers], [QuizId]) VALUES (12, N'Duis euismod pulvinar aliquet. Morbi ut tortor sit amet enim orn', 1, 1)
GO
INSERT [dbo].[Questions] ([Id], [Statement], [HasMultipleAnswers], [QuizId]) VALUES (13, N'Nullam eleifend sed lacus quis eleifend. Interdum et malesuada fames', 1, 1)
GO
INSERT [dbo].[Questions] ([Id], [Statement], [HasMultipleAnswers], [QuizId]) VALUES (14, N'Duis eget ipsum euismod, mollis felis ac, venenatis est. Sed blandit ac orci eget venenatis. Aliquam nisl lorem, blandit eget molestie at, varius ac sem. Sed facilisis turpis non egestas commodo. Vestibulum dignissim vitae metus non euismod. Curabitur maximus pellentesqu', 1, 1)
GO
INSERT [dbo].[Questions] ([Id], [Statement], [HasMultipleAnswers], [QuizId]) VALUES (16, N'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum laoreet sit amet neque vel consequ', 1, 16)
GO
INSERT [dbo].[Questions] ([Id], [Statement], [HasMultipleAnswers], [QuizId]) VALUES (17, N'Inside which HTML element do we put the JavaScript?', 1, 17)
GO
INSERT [dbo].[Questions] ([Id], [Statement], [HasMultipleAnswers], [QuizId]) VALUES (18, N'What is the correct JavaScript syntax to change the content of the HTML element below?

<p id="demo">This is a demonstration.</p>

', 0, 17)
GO
INSERT [dbo].[Questions] ([Id], [Statement], [HasMultipleAnswers], [QuizId]) VALUES (19, N'Where is the correct place to insert JavaScript?', 0, 17)
GO
INSERT [dbo].[Questions] ([Id], [Statement], [HasMultipleAnswers], [QuizId]) VALUES (20, N'What is the correct syntax for referring to an external script called "xxx.js"?', 0, 17)
GO
INSERT [dbo].[Questions] ([Id], [Statement], [HasMultipleAnswers], [QuizId]) VALUES (21, N'The external JavaScript file must contain the <script> tag.', 0, 17)
GO
INSERT [dbo].[Questions] ([Id], [Statement], [HasMultipleAnswers], [QuizId]) VALUES (22, N'How to write an IF statement in JavaScript?', 0, 17)
GO
INSERT [dbo].[Questions] ([Id], [Statement], [HasMultipleAnswers], [QuizId]) VALUES (23, N'How to write an IF statement for executing some code if "i" is NOT equal to 5?', 0, 17)
GO
INSERT [dbo].[Questions] ([Id], [Statement], [HasMultipleAnswers], [QuizId]) VALUES (24, N'How does a FOR loop start?', 0, 17)
GO
INSERT [dbo].[Questions] ([Id], [Statement], [HasMultipleAnswers], [QuizId]) VALUES (25, N'What is the correct way to write a JavaScript array?', 0, 17)
GO
INSERT [dbo].[Questions] ([Id], [Statement], [HasMultipleAnswers], [QuizId]) VALUES (26, N'What is the correct JavaScript syntax for opening a new window called "w2" ?', 0, 17)
GO
INSERT [dbo].[Questions] ([Id], [Statement], [HasMultipleAnswers], [QuizId]) VALUES (27, N'We have the following interface which represents a user:
interface User {
  id: any;
  name: string;
  email: string
}
How can we improve this by removing the any type on the id property and letting the consumer of the interface supply its type?', 0, 19)
GO
INSERT [dbo].[Questions] ([Id], [Statement], [HasMultipleAnswers], [QuizId]) VALUES (28, N'What are the three main ''simple types'' in TypeScript?', 0, 19)
GO
INSERT [dbo].[Questions] ([Id], [Statement], [HasMultipleAnswers], [QuizId]) VALUES (29, N'Which of the following statement is TRUE?', 0, 19)
GO
INSERT [dbo].[Questions] ([Id], [Statement], [HasMultipleAnswers], [QuizId]) VALUES (30, N'You can disable implicit variable type assignment by enabling the compiler option:', 0, 19)
GO
INSERT [dbo].[Questions] ([Id], [Statement], [HasMultipleAnswers], [QuizId]) VALUES (31, N'You can enable ''undefined'' and ''null'' types to be accounted for by enabling the compiler property:', 0, 19)
GO
INSERT [dbo].[Questions] ([Id], [Statement], [HasMultipleAnswers], [QuizId]) VALUES (32, N'What is the inherited type for the variable example in `const example = [''Dylan'']`?', 0, 19)
GO
INSERT [dbo].[Questions] ([Id], [Statement], [HasMultipleAnswers], [QuizId]) VALUES (33, N'What does the ''readonly'' access modifier do for an array variable assignment like: `const codeNames: readonly string[] = [''Coding'', ''God'']`?', 0, 19)
GO
INSERT [dbo].[Questions] ([Id], [Statement], [HasMultipleAnswers], [QuizId]) VALUES (34, N'Which is a successful example of this tuple `[number, string]`?', 0, 19)
GO
INSERT [dbo].[Questions] ([Id], [Statement], [HasMultipleAnswers], [QuizId]) VALUES (35, N'________ an interface will have the same properties as that interface.', 0, 19)
GO
INSERT [dbo].[Questions] ([Id], [Statement], [HasMultipleAnswers], [QuizId]) VALUES (36, N'What is the type of the parameter: `function ex(param1?: string){}`?', 0, 19)
GO
INSERT [dbo].[Questions] ([Id], [Statement], [HasMultipleAnswers], [QuizId]) VALUES (37, N'Test Question', 0, 20)
GO
INSERT [dbo].[Questions] ([Id], [Statement], [HasMultipleAnswers], [QuizId]) VALUES (38, N'Question 1', 0, 12)
GO
INSERT [dbo].[Questions] ([Id], [Statement], [HasMultipleAnswers], [QuizId]) VALUES (39, N'Choose the correct HTML element for the largest heading:', 1, 22)
GO
INSERT [dbo].[Questions] ([Id], [Statement], [HasMultipleAnswers], [QuizId]) VALUES (40, N'Soft Skills question 1', 0, 23)
GO
INSERT [dbo].[Questions] ([Id], [Statement], [HasMultipleAnswers], [QuizId]) VALUES (41, N'Question 1', 1, 25)
GO
SET IDENTITY_INSERT [dbo].[Questions] OFF
GO
SET IDENTITY_INSERT [dbo].[Quizzes] ON 
GO
INSERT [dbo].[Quizzes] ([Id], [UserId], [Title], [IsPubslished], [PublishedDate], [PubslishedId]) VALUES (12, N'd004ba13-f07b-4e91-8c7d-94637d0fbe49', N'Azure Dev Ops', NULL, NULL, NULL)
GO
INSERT [dbo].[Quizzes] ([Id], [UserId], [Title], [IsPubslished], [PublishedDate], [PubslishedId]) VALUES (17, N'6026f518-8852-43df-9aa8-f517ab278a7a', N'JavaScript Quiz', 1, CAST(N'2022-07-28T17:19:24.1228451' AS DateTime2), N'42UG0N')
GO
INSERT [dbo].[Quizzes] ([Id], [UserId], [Title], [IsPubslished], [PublishedDate], [PubslishedId]) VALUES (19, N'6026f518-8852-43df-9aa8-f517ab278a7a', N'TypeScript Quiz', 1, CAST(N'2022-07-29T15:34:29.5054303' AS DateTime2), N'T6GREX')
GO
INSERT [dbo].[Quizzes] ([Id], [UserId], [Title], [IsPubslished], [PublishedDate], [PubslishedId]) VALUES (21, N'd004ba13-f07b-4e91-8c7d-94637d0fbe49', N'Programming', NULL, NULL, NULL)
GO
INSERT [dbo].[Quizzes] ([Id], [UserId], [Title], [IsPubslished], [PublishedDate], [PubslishedId]) VALUES (23, N'6026f518-8852-43df-9aa8-f517ab278a7a', N'Soft Skills', NULL, NULL, NULL)
GO
INSERT [dbo].[Quizzes] ([Id], [UserId], [Title], [IsPubslished], [PublishedDate], [PubslishedId]) VALUES (24, N'731fa2ea-049f-46b1-b8f8-fbd2c7397ff9', N'Programming', NULL, NULL, NULL)
GO
INSERT [dbo].[Quizzes] ([Id], [UserId], [Title], [IsPubslished], [PublishedDate], [PubslishedId]) VALUES (25, N'6026f518-8852-43df-9aa8-f517ab278a7a', N'Quiz', NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Quizzes] OFF
GO
SET IDENTITY_INSERT [dbo].[Students] ON 
GO
INSERT [dbo].[Students] ([StudentId], [Name], [Class], [TeacherId]) VALUES (1, N'Azeez', N'Science', 1)
GO
INSERT [dbo].[Students] ([StudentId], [Name], [Class], [TeacherId]) VALUES (2, N'Kamal', N'Management', 2)
GO
INSERT [dbo].[Students] ([StudentId], [Name], [Class], [TeacherId]) VALUES (3, N'Benson', N'Science', 1)
GO
SET IDENTITY_INSERT [dbo].[Students] OFF
GO
SET IDENTITY_INSERT [dbo].[Teachers] ON 
GO
INSERT [dbo].[Teachers] ([TeacherId], [Name], [Subject]) VALUES (1, N'John', N'Maths')
GO
INSERT [dbo].[Teachers] ([TeacherId], [Name], [Subject]) VALUES (2, N'Femi', N'English')
GO
SET IDENTITY_INSERT [dbo].[Teachers] OFF
GO
ALTER TABLE [dbo].[Answers]  WITH CHECK ADD  CONSTRAINT [FK_Answers_Questions_QuestionId] FOREIGN KEY([QuestionId])
REFERENCES [dbo].[Questions] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Answers] CHECK CONSTRAINT [FK_Answers_Questions_QuestionId]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[Quizzes]  WITH CHECK ADD  CONSTRAINT [FK_Quizzes_AspNetUsers] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Quizzes] CHECK CONSTRAINT [FK_Quizzes_AspNetUsers]
GO
ALTER TABLE [dbo].[Students]  WITH CHECK ADD  CONSTRAINT [FK_Students_Teachers_TeacherId] FOREIGN KEY([TeacherId])
REFERENCES [dbo].[Teachers] ([TeacherId])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Students] CHECK CONSTRAINT [FK_Students_Teachers_TeacherId]
GO
