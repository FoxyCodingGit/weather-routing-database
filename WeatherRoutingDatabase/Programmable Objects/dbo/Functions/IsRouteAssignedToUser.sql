IF OBJECT_ID('[dbo].[IsRouteAssignedToUser]') IS NOT NULL
	DROP FUNCTION [dbo].[IsRouteAssignedToUser];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE FUNCTION [dbo].[IsRouteAssignedToUser]
(
	@RouteId INT
)
RETURNS INT
AS
BEGIN
	-- Declare the return variable here
	DECLARE @ret BIT;

	SET @ret =
	CASE
	WHEN EXISTS (
		SELECT *
		FROM UserRoute
		WHERE RouteId = @RouteId
	)
	THEN CAST(1 AS BIT)
	ELSE CAST(0 AS BIT)
	END

	-- Return the result of the function
	RETURN @ret

END
GO
