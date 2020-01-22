-- <Migration ID="69b44755-f68a-4241-b8d2-4c02ad913b58" />
GO

PRINT N'Dropping foreign keys from [dbo].[Route]'
GO
ALTER TABLE [dbo].[Route] DROP CONSTRAINT [FK_Route_LatLngCoord]
GO
ALTER TABLE [dbo].[Route] DROP CONSTRAINT [FK_Route_LatLngCoord1]
GO
ALTER TABLE [dbo].[Route] DROP CONSTRAINT [FK_Route_ModeOfTransport]
GO
PRINT N'Dropping foreign keys from [dbo].[UserRoute]'
GO
ALTER TABLE [dbo].[UserRoute] DROP CONSTRAINT [FK_UserRoute_Route]
GO
PRINT N'Dropping constraints from [dbo].[LatLngCoord]'
GO
ALTER TABLE [dbo].[LatLngCoord] DROP CONSTRAINT [PK_LatLngCoord]
GO
PRINT N'Dropping constraints from [dbo].[Route]'
GO
ALTER TABLE [dbo].[Route] DROP CONSTRAINT [PK_Route]
GO
PRINT N'Rebuilding [dbo].[LatLngCoord]'
GO
CREATE TABLE [dbo].[RG_Recovery_1_LatLngCoord]
(
[LatLngCoordId] [int] NOT NULL IDENTITY(1, 1),
[latitude] [varchar] (50) NOT NULL,
[longitude] [varchar] (50) NOT NULL
)
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_1_LatLngCoord] ON
GO
INSERT INTO [dbo].[RG_Recovery_1_LatLngCoord]([LatLngCoordId], [latitude], [longitude]) SELECT [LatLngCoordId], [latitude], [longitude] FROM [dbo].[LatLngCoord]
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_1_LatLngCoord] OFF
GO
DROP TABLE [dbo].[LatLngCoord]
GO
EXEC sp_rename N'[dbo].[RG_Recovery_1_LatLngCoord]', N'LatLngCoord', N'OBJECT'
GO
PRINT N'Creating primary key [PK_LatLngCoord] on [dbo].[LatLngCoord]'
GO
ALTER TABLE [dbo].[LatLngCoord] ADD CONSTRAINT [PK_LatLngCoord] PRIMARY KEY CLUSTERED  ([LatLngCoordId])
GO
PRINT N'Rebuilding [dbo].[Route]'
GO
CREATE TABLE [dbo].[RG_Recovery_2_Route]
(
[RouteId] [int] NOT NULL IDENTITY(1, 1),
[Name] [varchar] (50) NOT NULL,
[ModeOfTransportId] [int] NOT NULL,
[StartLatLngCoordId] [int] NOT NULL,
[EndLatLngCoordId] [int] NOT NULL
)
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_2_Route] ON
GO
INSERT INTO [dbo].[RG_Recovery_2_Route]([RouteId], [Name], [ModeOfTransportId], [StartLatLngCoordId], [EndLatLngCoordId]) SELECT [RouteId], [Name], [ModeOfTransportId], [StartLatLngCoordId], [EndLatLngCoordId] FROM [dbo].[Route]
GO
SET IDENTITY_INSERT [dbo].[RG_Recovery_2_Route] OFF
GO
DROP TABLE [dbo].[Route]
GO
EXEC sp_rename N'[dbo].[RG_Recovery_2_Route]', N'Route', N'OBJECT'
GO
PRINT N'Creating primary key [PK_Route] on [dbo].[Route]'
GO
ALTER TABLE [dbo].[Route] ADD CONSTRAINT [PK_Route] PRIMARY KEY CLUSTERED  ([RouteId])
GO
PRINT N'Adding foreign keys to [dbo].[Route]'
GO
ALTER TABLE [dbo].[Route] ADD CONSTRAINT [FK_Route_LatLngCoord] FOREIGN KEY ([StartLatLngCoordId]) REFERENCES [dbo].[LatLngCoord] ([LatLngCoordId])
GO
ALTER TABLE [dbo].[Route] ADD CONSTRAINT [FK_Route_LatLngCoord1] FOREIGN KEY ([EndLatLngCoordId]) REFERENCES [dbo].[LatLngCoord] ([LatLngCoordId])
GO
ALTER TABLE [dbo].[Route] ADD CONSTRAINT [FK_Route_ModeOfTransport] FOREIGN KEY ([ModeOfTransportId]) REFERENCES [dbo].[ModeOfTransport] ([ModeOfTransportId])
GO
PRINT N'Adding foreign keys to [dbo].[UserRoute]'
GO
ALTER TABLE [dbo].[UserRoute] ADD CONSTRAINT [FK_UserRoute_Route] FOREIGN KEY ([RouteId]) REFERENCES [dbo].[Route] ([RouteId])
GO
