@JS()
library google_places;

import 'dart:convert';
import 'dart:js_util';

import 'package:js/js.dart';
import 'package:widgets/models/web_google_place_object.dart';

@JS('setNativeInputValue')
external setNativeInputValue(String input);

@JS('getSuggestions')
external getSuggestions();

@JS('getPlaceObject')
external getPlaceObject(String address);

Future<WebGooglePlaceObject> getPlaceObjectFuture(String address) async {
  final webGooglePlaceObjectJson = await promiseToFuture(getPlaceObject(address));
  Map webGooglePlaceObjectMap = jsonDecode(webGooglePlaceObjectJson);
  return WebGooglePlaceObject.fromJson(webGooglePlaceObjectMap);
}

