USE [Quizz]
GO
/****** Object:  Table [dbo].[questions]    Script Date: 4/10/2020 8:24:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[questions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[question] [nvarchar](max) NULL,
	[option_1] [nvarchar](max) NULL,
	[option_2] [nvarchar](max) NULL,
	[option_3] [nvarchar](max) NULL,
	[option_4] [nvarchar](max) NULL,
	[answer] [nvarchar](50) NULL,
	[created_date] [date] NULL,
	[teacher_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 4/10/2020 8:24:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](150) NULL,
	[password] [nvarchar](150) NULL,
	[typeid] [int] NULL,
	[email] [nvarchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[usertype]    Script Date: 4/10/2020 8:24:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[usertype](
	[id] [int] NOT NULL,
	[name] [nvarchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[questions] ON 

INSERT [dbo].[questions] ([id], [question], [option_1], [option_2], [option_3], [option_4], [answer], [created_date], [teacher_id]) VALUES (14, N'2*4 = ?', N'?', N'6', N'8', N'3', N'1,3', CAST(N'2020-03-25' AS Date), 1)
INSERT [dbo].[questions] ([id], [question], [option_1], [option_2], [option_3], [option_4], [answer], [created_date], [teacher_id]) VALUES (15, N'2:1 = ?', N'1', N'2', N'3', N'4', N'2', CAST(N'2020-03-26' AS Date), 1)
INSERT [dbo].[questions] ([id], [question], [option_1], [option_2], [option_3], [option_4], [answer], [created_date], [teacher_id]) VALUES (52, N'1+2=', N'1', N'2', N'3', N'4', N'3', CAST(N'2020-04-04' AS Date), 1)
INSERT [dbo].[questions] ([id], [question], [option_1], [option_2], [option_3], [option_4], [answer], [created_date], [teacher_id]) VALUES (54, N'3+3  = ', N'1', N'2', N'3', N'6', N'4', CAST(N'2020-04-04' AS Date), 1)
INSERT [dbo].[questions] ([id], [question], [option_1], [option_2], [option_3], [option_4], [answer], [created_date], [teacher_id]) VALUES (55, N'2+2 = ', N'4', N'5', N'6', N'7', N'1', CAST(N'2020-04-04' AS Date), 1)
SET IDENTITY_INSERT [dbo].[questions] OFF
SET IDENTITY_INSERT [dbo].[user] ON 

INSERT [dbo].[user] ([id], [username], [password], [typeid], [email]) VALUES (1, N'admin', N'123', 1, NULL)
INSERT [dbo].[user] ([id], [username], [password], [typeid], [email]) VALUES (2, N'nghiatq', N'123', 2, N'nghiatqhe130530@fpt.edu.vn')
INSERT [dbo].[user] ([id], [username], [password], [typeid], [email]) VALUES (3, N'quang', N'123', 2, N'quang@fpt.edu.vn')
INSERT [dbo].[user] ([id], [username], [password], [typeid], [email]) VALUES (4, N'abc', N'123', 1, N'abc123@gmail.com')
INSERT [dbo].[user] ([id], [username], [password], [typeid], [email]) VALUES (5, N'tran', N'123', 1, N'tran@gmail.com')
INSERT [dbo].[user] ([id], [username], [password], [typeid], [email]) VALUES (6, N'admin2', N'1234', 1, N'quang@gmail.com')
INSERT [dbo].[user] ([id], [username], [password], [typeid], [email]) VALUES (7, N'mra', N'1234', 1, N'')
INSERT [dbo].[user] ([id], [username], [password], [typeid], [email]) VALUES (8, N'mrb', N'123', 1, N'')
INSERT [dbo].[user] ([id], [username], [password], [typeid], [email]) VALUES (9, N'admin', N'12345', 1, N'quang@gmail.com')
INSERT [dbo].[user] ([id], [username], [password], [typeid], [email]) VALUES (10, N'admin', N'12345', 1, N'quang@gmail.com')
INSERT [dbo].[user] ([id], [username], [password], [typeid], [email]) VALUES (11, N'admin3', N'123', 1, N'quang@gmail.com')
INSERT [dbo].[user] ([id], [username], [password], [typeid], [email]) VALUES (12, N'admin12', N'', 1, N'')
INSERT [dbo].[user] ([id], [username], [password], [typeid], [email]) VALUES (13, N'admin123', N'123', 1, N'quang@gmail.com')
SET IDENTITY_INSERT [dbo].[user] OFF
INSERT [dbo].[usertype] ([id], [name]) VALUES (1, N'teacher')
INSERT [dbo].[usertype] ([id], [name]) VALUES (2, N'normal user')
ALTER TABLE [dbo].[questions]  WITH CHECK ADD FOREIGN KEY([teacher_id])
REFERENCES [dbo].[user] ([id])
GO
ALTER TABLE [dbo].[user]  WITH CHECK ADD FOREIGN KEY([typeid])
REFERENCES [dbo].[usertype] ([id])
GO
/****** Object:  StoredProcedure [dbo].[pagingManageQuiz]    Script Date: 4/10/2020 8:24:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROC [dbo].[pagingManageQuiz]
@Page INT,
@Size INT
AS
BEGIN
	select * from 
	(select * from questions
	) as table1
	ORDER BY id asc
	OFFSET (@Page -1) * @Size ROWS
	FETCH NEXT @Size ROWS ONLY
	end
GO
