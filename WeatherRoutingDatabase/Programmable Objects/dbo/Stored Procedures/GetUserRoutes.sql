IF OBJECT_ID('[dbo].[GetUserRoutes]') IS NOT NULL
	DROP PROCEDURE [dbo].[GetUserRoutes];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE [dbo].[GetUserRoutes] (
	@Username VARCHAR(50)
)
	
AS
BEGIN
	SET NOCOUNT ON;

	SELECT [Route].*
	FROM [User]
	JOIN UserRoute ON [User].UserId = UserRoute.UserId
	JOIN [Route] ON UserRoute.RouteId = [Route].RouteId
	WHERE [User].UserId = @Username
END
GO
