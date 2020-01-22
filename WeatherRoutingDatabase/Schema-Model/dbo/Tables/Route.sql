CREATE TABLE [dbo].[Route]
(
[RouteId] [int] NOT NULL IDENTITY(1, 1),
[Name] [varchar] (50) NOT NULL,
[ModeOfTransportId] [int] NOT NULL,
[StartLatLngCoordId] [int] NOT NULL,
[EndLatLngCoordId] [int] NOT NULL
)
GO
ALTER TABLE [dbo].[Route] ADD CONSTRAINT [PK_Route] PRIMARY KEY CLUSTERED  ([RouteId])
GO
ALTER TABLE [dbo].[Route] ADD CONSTRAINT [FK_Route_LatLngCoord] FOREIGN KEY ([StartLatLngCoordId]) REFERENCES [dbo].[LatLngCoord] ([LatLngCoordId])
GO
ALTER TABLE [dbo].[Route] ADD CONSTRAINT [FK_Route_LatLngCoord1] FOREIGN KEY ([EndLatLngCoordId]) REFERENCES [dbo].[LatLngCoord] ([LatLngCoordId])
GO
ALTER TABLE [dbo].[Route] ADD CONSTRAINT [FK_Route_ModeOfTransport] FOREIGN KEY ([ModeOfTransportId]) REFERENCES [dbo].[ModeOfTransport] ([ModeOfTransportId])
GO
