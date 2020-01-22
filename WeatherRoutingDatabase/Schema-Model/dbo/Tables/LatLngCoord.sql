CREATE TABLE [dbo].[LatLngCoord]
(
[LatLngCoordId] [int] NOT NULL IDENTITY(1, 1),
[latitude] [varchar] (50) NOT NULL,
[longitude] [varchar] (50) NOT NULL
)
GO
ALTER TABLE [dbo].[LatLngCoord] ADD CONSTRAINT [PK_LatLngCoord] PRIMARY KEY CLUSTERED  ([LatLngCoordId])
GO
