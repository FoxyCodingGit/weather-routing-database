﻿-- <Migration ID="c2895d01-bb94-4b82-96a0-56964f86b08e" />
GO

PRINT N'Creating [dbo].[LatLngCoord]'
GO
CREATE TABLE [dbo].[LatLngCoord]
(
[LatLngCoordId] [int] NOT NULL IDENTITY(1, 1),
[latitude] [decimal] (8, 5) NOT NULL,
[longitude] [decimal] (8, 5) NOT NULL
)
GO
PRINT N'Creating primary key [PK_LatLngCoord] on [dbo].[LatLngCoord]'
GO
ALTER TABLE [dbo].[LatLngCoord] ADD CONSTRAINT [PK_LatLngCoord] PRIMARY KEY CLUSTERED  ([LatLngCoordId])
GO
PRINT N'Creating [dbo].[Route]'
GO
CREATE TABLE [dbo].[Route]
(
[RouteId] [int] NOT NULL IDENTITY(1, 1),
[Name] [varchar] (50) NOT NULL,
[ModeOfTransportId] [int] NOT NULL,
[StartLatLngCoordId] [int] NOT NULL,
[EndLatLngCoordId] [int] NOT NULL
)
GO
PRINT N'Creating primary key [PK_Route] on [dbo].[Route]'
GO
ALTER TABLE [dbo].[Route] ADD CONSTRAINT [PK_Route] PRIMARY KEY CLUSTERED  ([RouteId])
GO
PRINT N'Creating [dbo].[ModeOfTransport]'
GO
CREATE TABLE [dbo].[ModeOfTransport]
(
[ModeOfTransportId] [int] NOT NULL,
[Name] [varchar] (10) NOT NULL
)
GO
PRINT N'Creating primary key [PK_ModeOfTransport] on [dbo].[ModeOfTransport]'
GO
ALTER TABLE [dbo].[ModeOfTransport] ADD CONSTRAINT [PK_ModeOfTransport] PRIMARY KEY CLUSTERED  ([ModeOfTransportId])
GO
PRINT N'Creating [dbo].[UserRoute]'
GO
CREATE TABLE [dbo].[UserRoute]
(
[UserId] [varchar] (50) NOT NULL,
[RouteId] [int] NOT NULL
)
GO
PRINT N'Creating [dbo].[User]'
GO
CREATE TABLE [dbo].[User]
(
[UserId] [varchar] (50) NOT NULL,
[Password] [varchar] (50) NOT NULL,
[Salt] [varchar] (50) NOT NULL
)
GO
PRINT N'Creating primary key [PK_USer] on [dbo].[User]'
GO
ALTER TABLE [dbo].[User] ADD CONSTRAINT [PK_USer] PRIMARY KEY CLUSTERED  ([UserId])
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
ALTER TABLE [dbo].[UserRoute] ADD CONSTRAINT [FK_UserRoute_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([UserId])
GO
