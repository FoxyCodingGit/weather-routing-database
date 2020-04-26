IF OBJECT_ID('[dbo].[CreateUser]') IS NOT NULL
	DROP PROCEDURE [dbo].[CreateUser];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[CreateUser] (
	@Username VARCHAR(MAX),
	@Hashed VARCHAR(MAX),
	@Salt VARCHAR(MAX)
)
	
AS
BEGIN
	SET NOCOUNT ON;

	INSERT INTO [User] 
	VALUES (@Username, @Hashed, @Salt)
END
GO
