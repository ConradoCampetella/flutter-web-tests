import 'package:flutter/material.dart';

import 'auto_complete_widget.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'AutoComplete Widget';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      theme: ThemeData(
        primaryColor: Colors.orange,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: AutoCompleteWidget(),
      ),
//       home: WebGooglePlacesScreen(),
    );
  }
}
