CREATE TABLE [dbo].[User]
(
[UserId] [varchar] (50) NOT NULL,
[Password] [varchar] (50) NOT NULL,
[Salt] [varchar] (50) NOT NULL
)
GO
ALTER TABLE [dbo].[User] ADD CONSTRAINT [PK_USer] PRIMARY KEY CLUSTERED  ([UserId])
GO
