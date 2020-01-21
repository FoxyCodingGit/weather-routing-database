CREATE TABLE [dbo].[ModeOfTransport]
(
[ModeOfTransportId] [int] NOT NULL,
[Name] [varchar] (10) NOT NULL
)
GO
ALTER TABLE [dbo].[ModeOfTransport] ADD CONSTRAINT [PK_ModeOfTransport] PRIMARY KEY CLUSTERED  ([ModeOfTransportId])
GO
