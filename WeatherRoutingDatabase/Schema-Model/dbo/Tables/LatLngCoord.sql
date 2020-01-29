CREATE TABLE [dbo].[LatLngCoord]
(
[LatLngCoordId] [int] NOT NULL IDENTITY(1, 1),
[latitude] [decimal] (8, 5) NOT NULL,
[longitude] [decimal] (8, 5) NOT NULL
)
GO
ALTER TABLE [dbo].[LatLngCoord] ADD CONSTRAINT [PK_LatLngCoord] PRIMARY KEY CLUSTERED  ([LatLngCoordId])
GO
