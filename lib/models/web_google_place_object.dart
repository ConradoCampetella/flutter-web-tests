class WebGooglePlaceObject {
  final String streetNumber;
  final String route;
  final String locality;
  final String administrativeAreaLevel1;
  final String country;
  final String postalCode;

  WebGooglePlaceObject({
    this.streetNumber,
    this.route,
    this.locality,
    this.administrativeAreaLevel1,
    this.country,
    this.postalCode,
  });

  WebGooglePlaceObject.fromJson(Map<String, dynamic> json)
      : streetNumber = json['street_number'],
        route = json['route'],
        locality = json['locality'],
        administrativeAreaLevel1 = json['administrative_area_level_1'],
        country = json['country'],
        postalCode = json['postal_code'];
}
