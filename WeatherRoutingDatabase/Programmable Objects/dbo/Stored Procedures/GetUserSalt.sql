IF OBJECT_ID('[dbo].[GetUserSalt]') IS NOT NULL
	DROP PROCEDURE [dbo].[GetUserSalt];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[GetUserSalt] (
	@Username VARCHAR(MAX)
)
	
AS
BEGIN
	SET NOCOUNT ON;

	SELECT UserId, Salt
	FROM [User]
	WHERE @Username = UserId;
END
GO
