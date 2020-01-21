-- <Migration ID="cd16ec1c-4865-462a-b3f0-bde74e569187" />
GO

PRINT N'Creating [dbo].[LatLngCoord]'
GO
CREATE TABLE [dbo].[LatLngCoord]
(
[LatLngCoordId] [int] NOT NULL,
[latitude] [varchar] (50) NOT NULL,
[longitude] [varchar] (50) NOT NULL
)
GO
PRINT N'Creating primary key [PK_LatLngCoord] on [dbo].[LatLngCoord]'
GO
ALTER TABLE [dbo].[LatLngCoord] ADD CONSTRAINT [PK_LatLngCoord] PRIMARY KEY CLUSTERED  ([LatLngCoordId])
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
PRINT N'Creating [dbo].[Route]'
GO
CREATE TABLE [dbo].[Route]
(
[RouteId] [int] NOT NULL,
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
PRINT N'Creating [dbo].[User]'
GO
CREATE TABLE [dbo].[User]
(
[UserId] [varchar] (50) NOT NULL,
[Password] [varchar] (50) NOT NULL
)
GO
PRINT N'Creating primary key [PK_USer] on [dbo].[User]'
GO
ALTER TABLE [dbo].[User] ADD CONSTRAINT [PK_USer] PRIMARY KEY CLUSTERED  ([UserId])
GO
