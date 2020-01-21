CREATE TABLE [dbo].[Route]
(
[RouteId] [int] NOT NULL,
[Name] [varchar] (50) NOT NULL,
[ModeOfTransportId] [int] NOT NULL,
[StartLatLngCoordId] [int] NOT NULL,
[EndLatLngCoordId] [int] NOT NULL
)
GO
ALTER TABLE [dbo].[Route] ADD CONSTRAINT [PK_Route] PRIMARY KEY CLUSTERED  ([RouteId])
GO
