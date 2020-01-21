-- <Migration ID="a5fef015-aca3-4509-bd8f-672db05bae0a" />
GO

PRINT N'Adding foreign keys to [dbo].[Route]'
GO
ALTER TABLE [dbo].[Route] ADD CONSTRAINT [FK_Route_LatLngCoord] FOREIGN KEY ([StartLatLngCoordId]) REFERENCES [dbo].[LatLngCoord] ([LatLngCoordId])
GO
ALTER TABLE [dbo].[Route] ADD CONSTRAINT [FK_Route_LatLngCoord1] FOREIGN KEY ([EndLatLngCoordId]) REFERENCES [dbo].[LatLngCoord] ([LatLngCoordId])
GO
ALTER TABLE [dbo].[Route] ADD CONSTRAINT [FK_Route_ModeOfTransport] FOREIGN KEY ([ModeOfTransportId]) REFERENCES [dbo].[ModeOfTransport] ([ModeOfTransportId])
GO
