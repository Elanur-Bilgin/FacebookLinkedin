USE [DBProject]
GO
/****** Object:  Table [dbo].[MEMBER]    Script Date: 12/26/2014 11:12:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MEMBER](
	[Member_id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](20) NOT NULL,
	[First_name] [nvarchar](20) NOT NULL,
	[Middle_name] [nvarchar](20) NULL,
	[Last_name] [nvarchar](20) NOT NULL,
	[Picture] [image] NULL,
	[Create_at] [date] NULL,
	[Date_of_birth] [date] NULL,
	[Sex] [nchar](1) NOT NULL,
 CONSTRAINT [PK_Member] PRIMARY KEY CLUSTERED 
(
	[Member_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SHARING_OBJECT]    Script Date: 12/26/2014 11:12:11 ******/
CREATE TABLE [dbo].[SHARING_OBJECT](
	[Sharing_id] [int] NOT NULL,
	[Sharing_type] [nvarchar](20) NOT NULL,
	[Member_id] [int] NOT NULL,
	[Thumb_up] [int] NOT NULL,
 CONSTRAINT [PK_SharingObject] PRIMARY KEY CLUSTERED 
(
	[Sharing_id] ASC,
	[Sharing_type] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
)
GO
/****** Object:  Table [dbo].[STATUSS]    Script Date: 12/26/2014 11:12:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[STATUSS](
	[Sharing_id] [int] NOT NULL,
	[Sharing_type] [nvarchar](20) NULL,
	[Context] [nvarchar](100) NULL,
 CONSTRAINT [PK_Statuss] PRIMARY KEY CLUSTERED 
(
	[Sharing_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PICTURE]    Script Date: 12/26/2014 11:12:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PICTURE](
	[Sharing_id] [int] NOT NULL,
	[Sharing_type] [nvarchar](20) NOT NULL,
	[Avatar] [image] NULL,
 CONSTRAINT [PK_Picture] PRIMARY KEY CLUSTERED 
(
	[Sharing_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FEED]    Script Date: 12/26/2014 11:12:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FEED](
	[Feed_id] [int] IDENTITY(1,1) NOT NULL,
	[Sharing_id] [int] NOT NULL,
	[Sharing_type] [nvarchar](20) NULL,
	[Created_at] [date] NULL,
 CONSTRAINT [PK_Feed] PRIMARY KEY CLUSTERED 
(
	[Feed_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MEMBERS_GROUP]    Script Date: 12/26/2014 11:12:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MEMBERS_GROUP](
	[Member_id] [int] NOT NULL,
	[Group_id] [int] NOT NULL,
	[Date_joined] [date] NULL,
	[Date_left] [date] NULL,
 CONSTRAINT [PK_Members_Group] PRIMARY KEY CLUSTERED 
(
	[Member_id] ASC,
	[Group_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GROUPS]    Script Date: 12/26/2014 11:12:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GROUPS](
	[Group_id] [int] IDENTITY(1,1) NOT NULL,
	[Created_by_member_id] [int] NOT NULL,
	[Group_name] [nvarchar](30) NOT NULL,
	[Group_description] [nvarchar](100) NULL,
	[Group_date_started] [date] NULL,
	[Other_details] [nvarchar](50) NULL,
 CONSTRAINT [PK_Groups] PRIMARY KEY CLUSTERED 
(
	[Group_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Group_name] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FEED_INFO]    Script Date: 12/26/2014 11:12:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FEED_INFO](
	[Feed_info_id] [int] IDENTITY(1,1) NOT NULL,
	[Feed_id] [int] NOT NULL,
	[Member_id] [int] NOT NULL,
 CONSTRAINT [PK_FeedInfo] PRIMARY KEY CLUSTERED 
(
	[Feed_info_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CV_SECTION_NAME]    Script Date: 12/26/2014 11:12:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CV_SECTION_NAME](
	[CV_section_code] [int] IDENTITY(1,1) NOT NULL,
	[CV_section_name] [nvarchar](20) NULL,
 CONSTRAINT [PK_CVSection] PRIMARY KEY CLUSTERED 
(
	[CV_section_code] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ORGANIZATION_CATEGORY]    Script Date: 12/26/2014 11:12:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORGANIZATION_CATEGORY](
	[Organization_category_id] [int] IDENTITY(1,1) NOT NULL,
	[Organization_name] [nvarchar](30) NOT NULL,
	[Organization_description] [nvarchar](100) NULL,
 CONSTRAINT [PK_Organization_Category] PRIMARY KEY CLUSTERED 
(
	[Organization_category_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRIVACY_GROUP]    Script Date: 12/26/2014 11:12:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRIVACY_GROUP](
	[Privacy_group_id] [int] NOT NULL,
	[Privacy_group_name] [nvarchar](20) NULL,
 CONSTRAINT [PK_PrivacyGroup] PRIMARY KEY CLUSTERED 
(
	[Privacy_group_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PEOPLE_BEING_FOLLOWED]    Script Date: 12/26/2014 11:12:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PEOPLE_BEING_FOLLOWED](
	[Member_id] [int] NOT NULL,
	[Member_being_followed_id] [int] NOT NULL,
	[Date_started_following] [date] NULL,
 CONSTRAINT [PK_People_Being_Followed] PRIMARY KEY CLUSTERED 
(
	[Member_id] ASC,
	[Member_being_followed_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MEMBER_MESSAGE]    Script Date: 12/26/2014 11:12:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MEMBER_MESSAGE](
	[Message_id] [int] IDENTITY(1,1) NOT NULL,
	[Context] [nvarchar](100) NULL,
	[Created_at] [date] NULL,
	[is_read] [bit] NULL,
	[From_id] [int] NOT NULL,
	[To_id] [int] NOT NULL,
	[is_reply] [bit] NULL,
 CONSTRAINT [PK_MemberMessage] PRIMARY KEY CLUSTERED 
(
	[Message_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRIVACY]    Script Date: 12/26/2014 11:12:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PRIVACY](
	[Privacy_id] [int] NOT NULL,
	[Visible] [bit] NOT NULL,
	[Privacy_group_id] [int] NOT NULL,
 CONSTRAINT [PK_Privacy] PRIMARY KEY CLUSTERED 
(
	[Privacy_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ORGANIZATION]    Script Date: 12/26/2014 11:12:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ORGANIZATION](
	[Organization_id] [int] IDENTITY(1,1) NOT NULL,
	[Member_id] [int] NOT NULL,
	[Organization_category_id] [int] NOT NULL,
	[Other_details] [nvarchar](100) NULL,
 CONSTRAINT [PK_Organization] PRIMARY KEY CLUSTERED 
(
	[Organization_id] ASC,
	[Member_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NOTIFICATIONS]    Script Date: 12/26/2014 11:12:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NOTIFICATIONS](
	[Notification_id] [int] NOT NULL,
	[Member_id] [int] NOT NULL,
	[Create_at] [date] NULL,
	[Message] [nvarchar](100) NULL,
 CONSTRAINT [PK_Notifications] PRIMARY KEY CLUSTERED 
(
	[Notification_id] ASC,
	[Member_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FRIEND]    Script Date: 12/26/2014 11:12:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FRIEND](
	[Friend_table_id] [int] IDENTITY(1,1) NOT NULL,
	[Friend_id] [int] NOT NULL,
	[Member_id] [int] NOT NULL,
	[Created_at] [date] NULL,
 CONSTRAINT [PK_Friend] PRIMARY KEY CLUSTERED 
(
	[Friend_table_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Friend_id] ASC,
	[Member_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[THUMBS_UP]    Script Date: 12/26/2014 11:12:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THUMBS_UP](
	[Sharing_id] [int] NOT NULL,
	[Sharing_type] [nvarchar](20) NOT NULL,
	[Friend_table_id] [int] NOT NULL,
	[Created_at] [date] NULL,
 CONSTRAINT [PK_Thums_Up] PRIMARY KEY CLUSTERED 
(
	[Sharing_id] ASC,
	[Sharing_type] ASC,
	[Friend_table_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[COMMENT]    Script Date: 12/26/2014 11:12:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[COMMENT](
	[Comment_id] [int] IDENTITY(1,1) NOT NULL,
	[Sharing_id] [int] NOT NULL,
	[Sharing_type] [nvarchar](20) NOT NULL,
	[Friend_table_id] [int] NOT NULL,
	[Created_at] [date] NULL,
	[Message] [nvarchar](100) NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[Comment_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Sharing_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BLOG]    Script Date: 12/26/2014 11:12:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BLOG](
	[Blog_table_id] [int] IDENTITY(1,1) NOT NULL,
	[Blog_id] [int] NULL,
	[Member_id] [int] NOT NULL,
	[Context] [nvarchar](50) NULL,
	[Created_at] [date] NULL,
 CONSTRAINT [PK_Blog] PRIMARY KEY CLUSTERED 
(
	[Blog_table_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Blog_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EVENT_LIST]    Script Date: 12/26/2014 11:12:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EVENT_LIST](
	[Event_id] [int] NOT NULL,
	[Title] [nvarchar](20) NULL,
	[StartDate] [date] NULL,
	[FinishDate] [date] NULL,
	[Creator_id] [int] NOT NULL,
	[Context] [nvarchar](50) NULL,
 CONSTRAINT [PK_Event_List] PRIMARY KEY CLUSTERED 
(
	[Event_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CV]    Script Date: 12/26/2014 11:12:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CV](
	[CV_table_id] [int] IDENTITY(1,1) NOT NULL,
	[CV_id] [int] NULL,
	[Member_id] [int] NOT NULL,
	[Date_created] [date] NULL,
	[Date_updated] [date] NULL,
 CONSTRAINT [PK_CV] PRIMARY KEY CLUSTERED 
(
	[CV_table_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Member_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EVENT_MEMBER]    Script Date: 12/26/2014 11:12:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EVENT_MEMBER](
	[Friend_table_id] [int] NOT NULL,
	[Event_id] [int] NOT NULL,
	[Participate] [nvarchar](30) NULL,
 CONSTRAINT [PK_Event_Member] PRIMARY KEY CLUSTERED 
(
	[Friend_table_id] ASC,
	[Event_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CV_SECTION]    Script Date: 12/26/2014 11:12:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CV_SECTION](
	[CV_section_id] [int] IDENTITY(1,1) NOT NULL,
	[CV_table_id] [int] NOT NULL,
	[CV_section_code] [int] NOT NULL,
	[Date_created] [date] NULL,
	[Date_updated] [date] NULL,
	[Blog_table_id] [int] NULL,
 CONSTRAINT [PK_CVSectionn] PRIMARY KEY CLUSTERED 
(
	[CV_section_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ADRESS]    Script Date: 12/26/2014 11:12:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ADRESS](
	[Adress_id] [int] NOT NULL,
	[Adress] [nvarchar](100) NULL,
	[City] [nvarchar](20) NULL,
	[Country] [nvarchar](20) NULL,
	[Member_id] [int] NOT NULL,
	[Privacy_id] [int] NOT NULL,
 CONSTRAINT [PK_Adress] PRIMARY KEY CLUSTERED 
(
	[Adress_id] ASC,
	[Member_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FRIEND_REQUEST]    Script Date: 12/26/2014 11:12:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FRIEND_REQUEST](
	[Member_id_to] [int] NOT NULL,
	[Member_id_from] [int] NOT NULL,
	[Request_time] [date] NULL,
	[Message] [nvarchar](100) NULL,
	[Accept] [bit] NULL,
 CONSTRAINT [PK_FriendRequest] PRIMARY KEY CLUSTERED 
(
	[Member_id_to] ASC,
	[Member_id_from] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RECOMMENDATION]    Script Date: 12/26/2014 11:12:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RECOMMENDATION](
	[Member_recommending_id] [int] NOT NULL,
	[Friend_table_id] [int] NOT NULL,
	[Member_being_recommending_id] [int] NOT NULL,
	[Date_of_recommendation] [date] NULL,
 CONSTRAINT [PK_Recommendation] PRIMARY KEY CLUSTERED 
(
	[Member_recommending_id] ASC,
	[Member_being_recommending_id] ASC,
	[Friend_table_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[REF_CV_SECTION]    Script Date: 12/26/2014 11:12:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[REF_CV_SECTION](
	[Ref_CV_section_id] [int] IDENTITY(1,1) NOT NULL,
	[CV_section_id] [int] NOT NULL,
	[Friend_table_id] [int] NOT NULL,
 CONSTRAINT [PK_Ref_CV_Section] PRIMARY KEY CLUSTERED 
(
	[Ref_CV_section_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MEMBER_PROFILE]    Script Date: 12/26/2014 11:12:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MEMBER_PROFILE](
	[Profile_id] [int] IDENTITY(1,1) NOT NULL,
	[Member_id] [int] NOT NULL,
	[Privacy_id] [int] NOT NULL,
	[Interests] [nvarchar](100) NULL,
	[Education] [nvarchar](30) NULL,
	[Hobbies] [nvarchar](100) NULL,
	[Fav_movies] [nvarchar](100) NULL,
	[Fav_artists] [nvarchar](100) NULL,
	[Fav_books] [nvarchar](100) NULL,
	[Fav_animals] [nvarchar](100) NULL,
	[Religion] [nvarchar](20) NULL,
	[Everthing_else] [nvarchar](100) NULL,
	[Update_at] [date] NULL,
	[Adress_id] [int] NULL,
	[Marrital_status] [nvarchar](20) NULL,
	[Current_organization_id] [int] NULL,
 CONSTRAINT [PK_Member_Profile] PRIMARY KEY CLUSTERED 
(
	[Profile_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Member_id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Default [DF__ADRESS__Privacy___70DDC3D8]    Script Date: 12/26/2014 11:12:10 ******/
ALTER TABLE [dbo].[ADRESS] ADD  DEFAULT ((0)) FOR [Privacy_id]
GO
/****** Object:  Default [DF__GROUPS__Created___0AD2A005]    Script Date: 12/26/2014 11:12:10 ******/
ALTER TABLE [dbo].[GROUPS] ADD  DEFAULT ((0)) FOR [Created_by_member_id]
GO
/****** Object:  Default [DF__MEMBER_PR__Priva__787EE5A0]    Script Date: 12/26/2014 11:12:10 ******/
ALTER TABLE [dbo].[MEMBER_PROFILE] ADD  DEFAULT ((0)) FOR [Privacy_id]
GO
/****** Object:  Default [DF__PRIVACY__Privacy__44FF419A]    Script Date: 12/26/2014 11:12:10 ******/
ALTER TABLE [dbo].[PRIVACY] ADD  DEFAULT ((1)) FOR [Privacy_group_id]
GO
/****** Object:  Check [CheckDateCons]    Script Date: 12/26/2014 11:12:10 ******/
ALTER TABLE [dbo].[EVENT_LIST]  WITH CHECK ADD  CONSTRAINT [CheckDateCons] CHECK  (([StartDate]<=[FinishDate]))
GO
ALTER TABLE [dbo].[EVENT_LIST] CHECK CONSTRAINT [CheckDateCons]
GO
/****** Object:  Check [FriendRequestCons]    Script Date: 12/26/2014 11:12:10 ******/
ALTER TABLE [dbo].[FRIEND_REQUEST]  WITH CHECK ADD  CONSTRAINT [FriendRequestCons] CHECK  (([Member_id_from]<>[Member_id_to]))
GO
ALTER TABLE [dbo].[FRIEND_REQUEST] CHECK CONSTRAINT [FriendRequestCons]
GO
/****** Object:  Check [MemberPasswordCons]    Script Date: 12/26/2014 11:12:10 ******/
ALTER TABLE [dbo].[MEMBER]  WITH CHECK ADD  CONSTRAINT [MemberPasswordCons] CHECK  ((len([Password])>=(6)))
GO
ALTER TABLE [dbo].[MEMBER] CHECK CONSTRAINT [MemberPasswordCons]
GO
/****** Object:  Check [MemberSexCons]    Script Date: 12/26/2014 11:12:10 ******/
ALTER TABLE [dbo].[MEMBER]  WITH CHECK ADD  CONSTRAINT [MemberSexCons] CHECK  (([Sex]='M' OR [Sex]='F'))
GO
ALTER TABLE [dbo].[MEMBER] CHECK CONSTRAINT [MemberSexCons]
GO
/****** Object:  Check [SharingTypeCons2]    Script Date: 12/26/2014 11:12:10 ******/
ALTER TABLE [dbo].[PICTURE]  WITH CHECK ADD  CONSTRAINT [SharingTypeCons2] CHECK  (([Sharing_type]='PICTURE'))
GO
ALTER TABLE [dbo].[PICTURE] CHECK CONSTRAINT [SharingTypeCons2]
GO
/****** Object:  Check [SharingTypeCons1]    Script Date: 12/26/2014 11:12:10 ******/
ALTER TABLE [dbo].[STATUSS]  WITH CHECK ADD  CONSTRAINT [SharingTypeCons1] CHECK  (([Sharing_type]='STATUS'))
GO
ALTER TABLE [dbo].[STATUSS] CHECK CONSTRAINT [SharingTypeCons1]
GO
/****** Object:  Check [SharingTypeCons]    Script Date: 12/26/2014 11:12:11 ******/
ALTER TABLE [dbo].[SHARING_OBJECT]  WITH CHECK ADD  CONSTRAINT [SharingTypeCons] CHECK  (([Sharing_type]='STATUS' OR [Sharing_type]='PICTURE'))
GO
ALTER TABLE [dbo].[SHARING_OBJECT] CHECK CONSTRAINT [SharingTypeCons]
GO
/****** Object:  ForeignKey [FK_Adress_Member]    Script Date: 12/26/2014 11:12:10 ******/
ALTER TABLE [dbo].[ADRESS]  WITH CHECK ADD  CONSTRAINT [FK_Adress_Member] FOREIGN KEY([Member_id])
REFERENCES [dbo].[MEMBER] ([Member_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ADRESS] CHECK CONSTRAINT [FK_Adress_Member]
GO
/****** Object:  ForeignKey [FK_Adress_Privacy]    Script Date: 12/26/2014 11:12:10 ******/
ALTER TABLE [dbo].[ADRESS]  WITH CHECK ADD  CONSTRAINT [FK_Adress_Privacy] FOREIGN KEY([Privacy_id])
REFERENCES [dbo].[PRIVACY] ([Privacy_id])
ON UPDATE CASCADE
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[ADRESS] CHECK CONSTRAINT [FK_Adress_Privacy]
GO
/****** Object:  ForeignKey [FK_Blog_Member]    Script Date: 12/26/2014 11:12:10 ******/
ALTER TABLE [dbo].[BLOG]  WITH CHECK ADD  CONSTRAINT [FK_Blog_Member] FOREIGN KEY([Member_id])
REFERENCES [dbo].[MEMBER] ([Member_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[BLOG] CHECK CONSTRAINT [FK_Blog_Member]
GO
/****** Object:  ForeignKey [FK_Comment_Friend]    Script Date: 12/26/2014 11:12:10 ******/
ALTER TABLE [dbo].[COMMENT]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Friend] FOREIGN KEY([Friend_table_id])
REFERENCES [dbo].[FRIEND] ([Friend_table_id])
GO
ALTER TABLE [dbo].[COMMENT] CHECK CONSTRAINT [FK_Comment_Friend]
GO
/****** Object:  ForeignKey [FK_Comment_Sharing_Object]    Script Date: 12/26/2014 11:12:10 ******/
ALTER TABLE [dbo].[COMMENT]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Sharing_Object] FOREIGN KEY([Sharing_id], [Sharing_type])
REFERENCES [dbo].[SHARING_OBJECT] ([Sharing_id], [Sharing_type])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[COMMENT] CHECK CONSTRAINT [FK_Comment_Sharing_Object]
GO
/****** Object:  ForeignKey [FK_CV_Member]    Script Date: 12/26/2014 11:12:10 ******/
ALTER TABLE [dbo].[CV]  WITH CHECK ADD  CONSTRAINT [FK_CV_Member] FOREIGN KEY([Member_id])
REFERENCES [dbo].[MEMBER] ([Member_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CV] CHECK CONSTRAINT [FK_CV_Member]
GO
/****** Object:  ForeignKey [FK_CVSection_Blog]    Script Date: 12/26/2014 11:12:10 ******/
ALTER TABLE [dbo].[CV_SECTION]  WITH CHECK ADD  CONSTRAINT [FK_CVSection_Blog] FOREIGN KEY([Blog_table_id])
REFERENCES [dbo].[BLOG] ([Blog_table_id])
GO
ALTER TABLE [dbo].[CV_SECTION] CHECK CONSTRAINT [FK_CVSection_Blog]
GO
/****** Object:  ForeignKey [FK_CVSection_CV]    Script Date: 12/26/2014 11:12:10 ******/
ALTER TABLE [dbo].[CV_SECTION]  WITH CHECK ADD  CONSTRAINT [FK_CVSection_CV] FOREIGN KEY([CV_table_id])
REFERENCES [dbo].[CV] ([CV_table_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CV_SECTION] CHECK CONSTRAINT [FK_CVSection_CV]
GO
/****** Object:  ForeignKey [FK_CVSection_CVSectionName]    Script Date: 12/26/2014 11:12:10 ******/
ALTER TABLE [dbo].[CV_SECTION]  WITH CHECK ADD  CONSTRAINT [FK_CVSection_CVSectionName] FOREIGN KEY([CV_section_code])
REFERENCES [dbo].[CV_SECTION_NAME] ([CV_section_code])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[CV_SECTION] CHECK CONSTRAINT [FK_CVSection_CVSectionName]
GO
/****** Object:  ForeignKey [FK_Event_List_Member]    Script Date: 12/26/2014 11:12:10 ******/
ALTER TABLE [dbo].[EVENT_LIST]  WITH CHECK ADD  CONSTRAINT [FK_Event_List_Member] FOREIGN KEY([Creator_id])
REFERENCES [dbo].[MEMBER] ([Member_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EVENT_LIST] CHECK CONSTRAINT [FK_Event_List_Member]
GO
/****** Object:  ForeignKey [FK_Event_Member_Event_List]    Script Date: 12/26/2014 11:12:10 ******/
ALTER TABLE [dbo].[EVENT_MEMBER]  WITH CHECK ADD  CONSTRAINT [FK_Event_Member_Event_List] FOREIGN KEY([Event_id])
REFERENCES [dbo].[EVENT_LIST] ([Event_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[EVENT_MEMBER] CHECK CONSTRAINT [FK_Event_Member_Event_List]
GO
/****** Object:  ForeignKey [FK_Event_Member_Friend]    Script Date: 12/26/2014 11:12:10 ******/
ALTER TABLE [dbo].[EVENT_MEMBER]  WITH CHECK ADD  CONSTRAINT [FK_Event_Member_Friend] FOREIGN KEY([Friend_table_id])
REFERENCES [dbo].[FRIEND] ([Friend_table_id])
GO
ALTER TABLE [dbo].[EVENT_MEMBER] CHECK CONSTRAINT [FK_Event_Member_Friend]
GO
/****** Object:  ForeignKey [FK_Feed_SharingObject]    Script Date: 12/26/2014 11:12:10 ******/
ALTER TABLE [dbo].[FEED]  WITH CHECK ADD  CONSTRAINT [FK_Feed_SharingObject] FOREIGN KEY([Sharing_id], [Sharing_type])
REFERENCES [dbo].[SHARING_OBJECT] ([Sharing_id], [Sharing_type])
GO
ALTER TABLE [dbo].[FEED] CHECK CONSTRAINT [FK_Feed_SharingObject]
GO
/****** Object:  ForeignKey [FK_FeedInfo_Feed]    Script Date: 12/26/2014 11:12:10 ******/
ALTER TABLE [dbo].[FEED_INFO]  WITH CHECK ADD  CONSTRAINT [FK_FeedInfo_Feed] FOREIGN KEY([Feed_id])
REFERENCES [dbo].[FEED] ([Feed_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FEED_INFO] CHECK CONSTRAINT [FK_FeedInfo_Feed]
GO
/****** Object:  ForeignKey [FK_FeedInfo_Member]    Script Date: 12/26/2014 11:12:10 ******/
ALTER TABLE [dbo].[FEED_INFO]  WITH CHECK ADD  CONSTRAINT [FK_FeedInfo_Member] FOREIGN KEY([Member_id])
REFERENCES [dbo].[MEMBER] ([Member_id])
GO
ALTER TABLE [dbo].[FEED_INFO] CHECK CONSTRAINT [FK_FeedInfo_Member]
GO
/****** Object:  ForeignKey [FK_Friend_Member]    Script Date: 12/26/2014 11:12:10 ******/
ALTER TABLE [dbo].[FRIEND]  WITH CHECK ADD  CONSTRAINT [FK_Friend_Member] FOREIGN KEY([Member_id])
REFERENCES [dbo].[MEMBER] ([Member_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FRIEND] CHECK CONSTRAINT [FK_Friend_Member]
GO
/****** Object:  ForeignKey [FK1_Friend_Member]    Script Date: 12/26/2014 11:12:10 ******/
ALTER TABLE [dbo].[FRIEND]  WITH CHECK ADD  CONSTRAINT [FK1_Friend_Member] FOREIGN KEY([Friend_id])
REFERENCES [dbo].[MEMBER] ([Member_id])
GO
ALTER TABLE [dbo].[FRIEND] CHECK CONSTRAINT [FK1_Friend_Member]
GO
/****** Object:  ForeignKey [FK_FriendRequest_Member]    Script Date: 12/26/2014 11:12:10 ******/
ALTER TABLE [dbo].[FRIEND_REQUEST]  WITH CHECK ADD  CONSTRAINT [FK_FriendRequest_Member] FOREIGN KEY([Member_id_to])
REFERENCES [dbo].[MEMBER] ([Member_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[FRIEND_REQUEST] CHECK CONSTRAINT [FK_FriendRequest_Member]
GO
/****** Object:  ForeignKey [FK1_FriendRequest_Member]    Script Date: 12/26/2014 11:12:10 ******/
ALTER TABLE [dbo].[FRIEND_REQUEST]  WITH CHECK ADD  CONSTRAINT [FK1_FriendRequest_Member] FOREIGN KEY([Member_id_from])
REFERENCES [dbo].[MEMBER] ([Member_id])
GO
ALTER TABLE [dbo].[FRIEND_REQUEST] CHECK CONSTRAINT [FK1_FriendRequest_Member]
GO
/****** Object:  ForeignKey [FK_Groups_Member]    Script Date: 12/26/2014 11:12:10 ******/
ALTER TABLE [dbo].[GROUPS]  WITH CHECK ADD  CONSTRAINT [FK_Groups_Member] FOREIGN KEY([Created_by_member_id])
REFERENCES [dbo].[MEMBER] ([Member_id])
GO
ALTER TABLE [dbo].[GROUPS] CHECK CONSTRAINT [FK_Groups_Member]
GO
/****** Object:  ForeignKey [FK_MemberMessage_Member]    Script Date: 12/26/2014 11:12:10 ******/
ALTER TABLE [dbo].[MEMBER_MESSAGE]  WITH CHECK ADD  CONSTRAINT [FK_MemberMessage_Member] FOREIGN KEY([From_id])
REFERENCES [dbo].[MEMBER] ([Member_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MEMBER_MESSAGE] CHECK CONSTRAINT [FK_MemberMessage_Member]
GO
/****** Object:  ForeignKey [FK1_MemberMessage_Member]    Script Date: 12/26/2014 11:12:10 ******/
ALTER TABLE [dbo].[MEMBER_MESSAGE]  WITH CHECK ADD  CONSTRAINT [FK1_MemberMessage_Member] FOREIGN KEY([To_id])
REFERENCES [dbo].[MEMBER] ([Member_id])
GO
ALTER TABLE [dbo].[MEMBER_MESSAGE] CHECK CONSTRAINT [FK1_MemberMessage_Member]
GO
/****** Object:  ForeignKey [FK_Member_Profile_Address]    Script Date: 12/26/2014 11:12:10 ******/
ALTER TABLE [dbo].[MEMBER_PROFILE]  WITH CHECK ADD  CONSTRAINT [FK_Member_Profile_Address] FOREIGN KEY([Adress_id], [Member_id])
REFERENCES [dbo].[ADRESS] ([Adress_id], [Member_id])
GO
ALTER TABLE [dbo].[MEMBER_PROFILE] CHECK CONSTRAINT [FK_Member_Profile_Address]
GO
/****** Object:  ForeignKey [FK_Member_Profile_Member]    Script Date: 12/26/2014 11:12:10 ******/
ALTER TABLE [dbo].[MEMBER_PROFILE]  WITH CHECK ADD  CONSTRAINT [FK_Member_Profile_Member] FOREIGN KEY([Member_id])
REFERENCES [dbo].[MEMBER] ([Member_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[MEMBER_PROFILE] CHECK CONSTRAINT [FK_Member_Profile_Member]
GO
/****** Object:  ForeignKey [FK_Member_Profile_Organization]    Script Date: 12/26/2014 11:12:10 ******/
ALTER TABLE [dbo].[MEMBER_PROFILE]  WITH CHECK ADD  CONSTRAINT [FK_Member_Profile_Organization] FOREIGN KEY([Current_organization_id], [Member_id])
REFERENCES [dbo].[ORGANIZATION] ([Organization_id], [Member_id])
GO
ALTER TABLE [dbo].[MEMBER_PROFILE] CHECK CONSTRAINT [FK_Member_Profile_Organization]
GO
/****** Object:  ForeignKey [FK_Member_Profile_Privacy]    Script Date: 12/26/2014 11:12:10 ******/
ALTER TABLE [dbo].[MEMBER_PROFILE]  WITH CHECK ADD  CONSTRAINT [FK_Member_Profile_Privacy] FOREIGN KEY([Privacy_id])
REFERENCES [dbo].[PRIVACY] ([Privacy_id])
ON UPDATE CASCADE
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[MEMBER_PROFILE] CHECK CONSTRAINT [FK_Member_Profile_Privacy]
GO
/****** Object:  ForeignKey [FK_Members_Group_Groups]    Script Date: 12/26/2014 11:12:10 ******/
ALTER TABLE [dbo].[MEMBERS_GROUP]  WITH CHECK ADD  CONSTRAINT [FK_Members_Group_Groups] FOREIGN KEY([Group_id])
REFERENCES [dbo].[GROUPS] ([Group_id])
GO
ALTER TABLE [dbo].[MEMBERS_GROUP] CHECK CONSTRAINT [FK_Members_Group_Groups]
GO
/****** Object:  ForeignKey [FK_Members_Group_Member]    Script Date: 12/26/2014 11:12:10 ******/
ALTER TABLE [dbo].[MEMBERS_GROUP]  WITH CHECK ADD  CONSTRAINT [FK_Members_Group_Member] FOREIGN KEY([Member_id])
REFERENCES [dbo].[MEMBER] ([Member_id])
GO
ALTER TABLE [dbo].[MEMBERS_GROUP] CHECK CONSTRAINT [FK_Members_Group_Member]
GO
/****** Object:  ForeignKey [FK_Notifications_Member]    Script Date: 12/26/2014 11:12:10 ******/
ALTER TABLE [dbo].[NOTIFICATIONS]  WITH CHECK ADD  CONSTRAINT [FK_Notifications_Member] FOREIGN KEY([Member_id])
REFERENCES [dbo].[MEMBER] ([Member_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[NOTIFICATIONS] CHECK CONSTRAINT [FK_Notifications_Member]
GO
/****** Object:  ForeignKey [FK_Organization_Member]    Script Date: 12/26/2014 11:12:10 ******/
ALTER TABLE [dbo].[ORGANIZATION]  WITH CHECK ADD  CONSTRAINT [FK_Organization_Member] FOREIGN KEY([Member_id])
REFERENCES [dbo].[MEMBER] ([Member_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ORGANIZATION] CHECK CONSTRAINT [FK_Organization_Member]
GO
/****** Object:  ForeignKey [FK_Organization_OranizationCategory]    Script Date: 12/26/2014 11:12:10 ******/
ALTER TABLE [dbo].[ORGANIZATION]  WITH CHECK ADD  CONSTRAINT [FK_Organization_OranizationCategory] FOREIGN KEY([Organization_category_id])
REFERENCES [dbo].[ORGANIZATION_CATEGORY] ([Organization_category_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ORGANIZATION] CHECK CONSTRAINT [FK_Organization_OranizationCategory]
GO
/****** Object:  ForeignKey [FK_People_Being_Followed_Member]    Script Date: 12/26/2014 11:12:10 ******/
ALTER TABLE [dbo].[PEOPLE_BEING_FOLLOWED]  WITH CHECK ADD  CONSTRAINT [FK_People_Being_Followed_Member] FOREIGN KEY([Member_id])
REFERENCES [dbo].[MEMBER] ([Member_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PEOPLE_BEING_FOLLOWED] CHECK CONSTRAINT [FK_People_Being_Followed_Member]
GO
/****** Object:  ForeignKey [FK1_People_Being_Followed_Member]    Script Date: 12/26/2014 11:12:10 ******/
ALTER TABLE [dbo].[PEOPLE_BEING_FOLLOWED]  WITH CHECK ADD  CONSTRAINT [FK1_People_Being_Followed_Member] FOREIGN KEY([Member_being_followed_id])
REFERENCES [dbo].[MEMBER] ([Member_id])
GO
ALTER TABLE [dbo].[PEOPLE_BEING_FOLLOWED] CHECK CONSTRAINT [FK1_People_Being_Followed_Member]
GO
/****** Object:  ForeignKey [FK_Picture_Sharing_Object]    Script Date: 12/26/2014 11:12:10 ******/
ALTER TABLE [dbo].[PICTURE]  WITH CHECK ADD  CONSTRAINT [FK_Picture_Sharing_Object] FOREIGN KEY([Sharing_id], [Sharing_type])
REFERENCES [dbo].[SHARING_OBJECT] ([Sharing_id], [Sharing_type])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[PICTURE] CHECK CONSTRAINT [FK_Picture_Sharing_Object]
GO
/****** Object:  ForeignKey [FK_Privacy_PrivacyGroup]    Script Date: 12/26/2014 11:12:10 ******/
ALTER TABLE [dbo].[PRIVACY]  WITH CHECK ADD  CONSTRAINT [FK_Privacy_PrivacyGroup] FOREIGN KEY([Privacy_group_id])
REFERENCES [dbo].[PRIVACY_GROUP] ([Privacy_group_id])
ON UPDATE CASCADE
ON DELETE SET DEFAULT
GO
ALTER TABLE [dbo].[PRIVACY] CHECK CONSTRAINT [FK_Privacy_PrivacyGroup]
GO
/****** Object:  ForeignKey [FK_Recommendation_Friend]    Script Date: 12/26/2014 11:12:10 ******/
ALTER TABLE [dbo].[RECOMMENDATION]  WITH CHECK ADD  CONSTRAINT [FK_Recommendation_Friend] FOREIGN KEY([Friend_table_id])
REFERENCES [dbo].[FRIEND] ([Friend_table_id])
GO
ALTER TABLE [dbo].[RECOMMENDATION] CHECK CONSTRAINT [FK_Recommendation_Friend]
GO
/****** Object:  ForeignKey [FK_Recommendation_Member]    Script Date: 12/26/2014 11:12:10 ******/
ALTER TABLE [dbo].[RECOMMENDATION]  WITH CHECK ADD  CONSTRAINT [FK_Recommendation_Member] FOREIGN KEY([Member_recommending_id])
REFERENCES [dbo].[MEMBER] ([Member_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RECOMMENDATION] CHECK CONSTRAINT [FK_Recommendation_Member]
GO
/****** Object:  ForeignKey [FK1_Recommendation_Member]    Script Date: 12/26/2014 11:12:10 ******/
ALTER TABLE [dbo].[RECOMMENDATION]  WITH CHECK ADD  CONSTRAINT [FK1_Recommendation_Member] FOREIGN KEY([Member_being_recommending_id])
REFERENCES [dbo].[MEMBER] ([Member_id])
GO
ALTER TABLE [dbo].[RECOMMENDATION] CHECK CONSTRAINT [FK1_Recommendation_Member]
GO
/****** Object:  ForeignKey [FK_Ref_CV_Section_Friend]    Script Date: 12/26/2014 11:12:10 ******/
ALTER TABLE [dbo].[REF_CV_SECTION]  WITH CHECK ADD  CONSTRAINT [FK_Ref_CV_Section_Friend] FOREIGN KEY([Friend_table_id])
REFERENCES [dbo].[FRIEND] ([Friend_table_id])
GO
ALTER TABLE [dbo].[REF_CV_SECTION] CHECK CONSTRAINT [FK_Ref_CV_Section_Friend]
GO
/****** Object:  ForeignKey [FK_RefCVSection_CVSection]    Script Date: 12/26/2014 11:12:10 ******/
ALTER TABLE [dbo].[REF_CV_SECTION]  WITH CHECK ADD  CONSTRAINT [FK_RefCVSection_CVSection] FOREIGN KEY([CV_section_id])
REFERENCES [dbo].[CV_SECTION] ([CV_section_id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[REF_CV_SECTION] CHECK CONSTRAINT [FK_RefCVSection_CVSection]
GO
/****** Object:  ForeignKey [FK_Statuss_SharingObject]    Script Date: 12/26/2014 11:12:10 ******/
ALTER TABLE [dbo].[STATUSS]  WITH CHECK ADD  CONSTRAINT [FK_Statuss_SharingObject] FOREIGN KEY([Sharing_id], [Sharing_type])
REFERENCES [dbo].[SHARING_OBJECT] ([Sharing_id], [Sharing_type])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[STATUSS] CHECK CONSTRAINT [FK_Statuss_SharingObject]
GO
/****** Object:  ForeignKey [FK_SharingObject_Member]    Script Date: 12/26/2014 11:12:11 ******/
ALTER TABLE [dbo].[SHARING_OBJECT]  WITH CHECK ADD  CONSTRAINT [FK_SharingObject_Member] FOREIGN KEY([Member_id])
REFERENCES [dbo].[MEMBER] ([Member_id])
GO
ALTER TABLE [dbo].[SHARING_OBJECT] CHECK CONSTRAINT [FK_SharingObject_Member]
GO
/****** Object:  ForeignKey [FK_Thums_Up_Friend]    Script Date: 12/26/2014 11:12:11 ******/
ALTER TABLE [dbo].[THUMBS_UP]  WITH CHECK ADD  CONSTRAINT [FK_Thums_Up_Friend] FOREIGN KEY([Friend_table_id])
REFERENCES [dbo].[FRIEND] ([Friend_table_id])
GO
ALTER TABLE [dbo].[THUMBS_UP] CHECK CONSTRAINT [FK_Thums_Up_Friend]
GO
/****** Object:  ForeignKey [FK_Thums_Up_Sharing_Object]    Script Date: 12/26/2014 11:12:11 ******/
ALTER TABLE [dbo].[THUMBS_UP]  WITH CHECK ADD  CONSTRAINT [FK_Thums_Up_Sharing_Object] FOREIGN KEY([Sharing_id], [Sharing_type])
REFERENCES [dbo].[SHARING_OBJECT] ([Sharing_id], [Sharing_type])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[THUMBS_UP] CHECK CONSTRAINT [FK_Thums_Up_Sharing_Object]
GO
