IF OBJECT_ID('[dbo].[DeleteRoute]') IS NOT NULL
	DROP PROCEDURE [dbo].[DeleteRoute];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE PROCEDURE [dbo].[DeleteRoute] (
	@Username VARCHAR(50),
	@RouteId INT
)
	
AS
BEGIN
	SET NOCOUNT ON;

	SELECT *
	FROM [Route]
	WHERE [Route].RouteId = @RouteId;

	DELETE UserRoute
	FROM UserRoute 
	WHERE  RouteId = @RouteId
		AND UserId = @Username;

	PRINT dbo.IsRouteAssignedToUser(@RouteId);

	IF dbo.IsRouteAssignedToUser(@RouteId) != 1
	BEGIN	
		DELETE [Route]
		FROM [Route]
		WHERE [Route].RouteId = @RouteId

		-- TODO: DELETE COORDS AS WELL
	END
END
GO
