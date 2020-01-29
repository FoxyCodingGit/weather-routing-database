IF OBJECT_ID('[dbo].[GetReadableUserRoutes]') IS NOT NULL
	DROP PROCEDURE [dbo].[GetReadableUserRoutes];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO



CREATE PROCEDURE [dbo].[GetReadableUserRoutes] (
	@Username VARCHAR(50)
)
	
AS
BEGIN
	SET NOCOUNT ON;

	SELECT [Route].RouteId as ReadableRouteId, [Route].[Name] as RouteName, ModeOfTransport.[Name] as ModeOfTransport, startLatLng.latitude as StartLat, startLatLng.longitude as StartLng,
		endLatLng.latitude as EndLat, endLatLng.longitude as EndLng
	FROM [User]
		JOIN UserRoute ON [User].UserId = UserRoute.UserId
		JOIN [Route] ON UserRoute.RouteId = [Route].RouteId
		JOIN ModeOfTransport ON [Route].ModeOfTransportId = ModeOfTransport.ModeOfTransportId
		JOIN LatLngCoord as startLatLng ON [Route].StartLatLngCoordId = startLatLng.LatLngCoordId
		JOIN LatLngCoord as endLatLng ON [Route].EndLatLngCoordId = endLatLng.LatLngCoordId -- connecting twice. How to differentiate diff columsn for lat and lng.
	WHERE [User].UserId = @Username
END
GO
