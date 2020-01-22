IF OBJECT_ID('[dbo].[CreateUserRoute]') IS NOT NULL
	DROP PROCEDURE [dbo].[CreateUserRoute];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE PROCEDURE [dbo].[CreateUserRoute] (
	@Username VARCHAR(50),
	@RouteName VARCHAR(50),
	@ModeOfTransport VARCHAR(10),
	@StartLat VARCHAR(50),
	@StartLng VARCHAR(50),
	@EndLat VARCHAR(50),
	@EndLng VARCHAR(50)
)
	
AS
BEGIN
	SET NOCOUNT ON;

	DECLARE @ModeOfTransportId INT;
	DECLARE @StartCoordId INT;
	DECLARE @EndCoordId INT;
	DECLARE @RouteId INT;

	-- TODO: Need to check if route already exists. For now just create route.

	-- Get ModeOfTransportId
	SELECT @ModeOfTransportId = ModeOfTransportId
	FROM ModeOfTransport
	WHERE [Name] = @ModeOfTransport;

	-- Create Coords
	INSERT INTO LatLngCoord
	VALUES (@StartLat, @StartLng);

	SET @StartCoordId = SCOPE_IDENTITY();
	
	INSERT INTO LatLngCoord
	VALUES (@StartLat, @StartLng);

	SET @EndCoordId = SCOPE_IDENTITY();

	-- Create Route
	INSERT INTO [Route]
	VALUES (@RouteName, @ModeOfTransportId, @StartCoordId, @EndCoordId)

	SET @RouteId = SCOPE_IDENTITY();

	-- Create User Association

	INSERT INTO UserRoute
	VALUES (@Username, @RouteId);
END
GO
