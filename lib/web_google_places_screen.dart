import 'dart:html';
import 'package:flutter/material.dart';
import 'package:widgets/styles.dart';
import 'package:widgets/web_adapters/google_places_adapter.dart';
import './extensions/hover_extensions.dart';
import 'models/web_google_place_object.dart';

class WebGooglePlacesScreen extends StatefulWidget {
  @override
  _WebGooglePlacesScreenState createState() => _WebGooglePlacesScreenState();
}

class _WebGooglePlacesScreenState extends State<WebGooglePlacesScreen> {
  TextEditingController suggestController = TextEditingController();
  final _googleKEY = 'YOUR API KEY';
  FocusNode myFocusNode;
  List<dynamic> suggestions = [];
  var _hover;

  @override
  void initState() {
    myFocusNode = FocusNode();
    document
        .getElementById('autocomplete')
        .addEventListener('suggestionsChange', (_) {
      suggestions = getSuggestions();
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton(
        icon: Icon(Icons.ac_unit),
        color: Colors.blueAccent,
        onPressed: () async {
          final String address =
              '323 North Euclid Street, Santa Ana, California, EE. UU.';
          final WebGooglePlaceObject place = await getPlaceObjectFuture(address);
          print(place.streetNumber);
          print(place.route);
          print(place.locality);
          print(place.administrativeAreaLevel1);
          print(place.country);
          print(place.postalCode);
        },
      ),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.orange),
          onPressed: () => Navigator.of(context).pop(suggestController.text),
        ).showCursorOnHover,
        backgroundColor: Colors.white,
        title: TextFormField(
          controller: suggestController,
          focusNode: myFocusNode,
          decoration: textFormFieldStyle(context, "Enter your address"),
          onChanged: (String text) async {
            if (text.length == 0) {
              await setNativeInputValue(' ');
            } else {
              await setNativeInputValue(suggestController.text);
            }
            FocusScope.of(context).requestFocus(myFocusNode);
            setState(() {});
          },
        ),
        centerTitle: true,
      ),
      body: suggestions != null && suggestions.length > 0
          ? Container(
              color: Colors.white,
              child: Scrollbar(
                child: ListView.builder(
                  itemBuilder: (BuildContext context, index) {
                    return Material(
                      color: Colors.transparent,
                      child: InkWell(
                        onTap: () async {
                          suggestController.text = suggestions[index];
                          await setNativeInputValue(suggestController.text);
                          FocusScope.of(context).requestFocus(myFocusNode);
                          setState(() {});
                        },
                        child: ListTile(
                          leading: Icon(Icons.location_on),
                          title: Text(suggestions[index]),
                        ),
                      ).showCursorOnHover,
                    );
                  },
                  itemCount: suggestions.length,
                ),
              ),
            )
          : Container(),
    );
  }
}
