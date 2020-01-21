-- <Migration ID="8a00fbc7-9c07-410b-94db-54aea4bec7d3" />
GO

PRINT N'Creating [dbo].[UserRoute]'
GO
CREATE TABLE [dbo].[UserRoute]
(
[UserId] [varchar] (50) NOT NULL,
[RouteId] [int] NOT NULL
)
GO
PRINT N'Adding foreign keys to [dbo].[UserRoute]'
GO
ALTER TABLE [dbo].[UserRoute] ADD CONSTRAINT [FK_UserRoute_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([UserId])
GO
ALTER TABLE [dbo].[UserRoute] ADD CONSTRAINT [FK_UserRoute_Route] FOREIGN KEY ([RouteId]) REFERENCES [dbo].[Route] ([RouteId])
GO
