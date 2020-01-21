CREATE TABLE [dbo].[UserRoute]
(
[UserId] [varchar] (50) NOT NULL,
[RouteId] [int] NOT NULL
)
GO
ALTER TABLE [dbo].[UserRoute] ADD CONSTRAINT [FK_UserRoute_Route] FOREIGN KEY ([RouteId]) REFERENCES [dbo].[Route] ([RouteId])
GO
ALTER TABLE [dbo].[UserRoute] ADD CONSTRAINT [FK_UserRoute_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([UserId])
GO
