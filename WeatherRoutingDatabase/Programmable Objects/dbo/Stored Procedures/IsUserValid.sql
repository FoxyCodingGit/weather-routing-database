IF OBJECT_ID('[dbo].[IsUserValid]') IS NOT NULL
	DROP PROCEDURE [dbo].[IsUserValid];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[IsUserValid] (
	@Username VARCHAR(50),
	@Password VARCHAR(50)
)
	
AS
BEGIN
	SET NOCOUNT ON;

	SELECT *
	FROM [User]
	WHERE UserId = @Username AND [Password] = @Password
END
GO
