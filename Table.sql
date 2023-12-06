SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [maintanence].[ChangeLog](
	[LogId] [int] IDENTITY(1,1) NOT NULL,
	[DatabaseName] [varchar](256) NOT NULL,
	[EventType] [varchar](50) NOT NULL,
	[ObjectName] [varchar](256) NOT NULL,
	[ObjectType] [varchar](25) NOT NULL,
	[SqlCommand] [varchar](max) NOT NULL,
	[EventDate] [datetime] NOT NULL,
	[LoginName] [varchar](256) NOT NULL,
	[MachineName] [varchar](25) NULL,
PRIMARY KEY CLUSTERED 
(
	[LogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [maintanence].[ChangeLog] ADD  CONSTRAINT [Maintenance_Insert_date]  DEFAULT (getdate()) FOR [EventDate]
GO

ALTER TABLE [maintanence].[ChangeLog] ADD  CONSTRAINT [Maintenance_Machine_Name]  DEFAULT (host_name()) FOR [MachineName]
GO
