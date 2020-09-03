import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:widgets/styles.dart';

class AutoCompleteWidget extends StatefulWidget {
  AutoCompleteWidget({Key key}) : super(key: key);

  @override
  _AutoCompleteWidgetState createState() => _AutoCompleteWidgetState();
}

class _AutoCompleteWidgetState extends State<AutoCompleteWidget> {
  TextEditingController suggestController = TextEditingController();
  ScrollController _scrollController = ScrollController();
  List<String> _suggestions = [
    "Birth Certificate",
    "Citizenship Certificate",
    "Death Certificate",
    "Marriage Certificate",
    "Power of Attorney",
    "Will",
    "Will2",
  ];
  GlobalKey _keySuggestController = GlobalKey();
  RenderBox renderBoxSuggestController;
  Offset renderBoxSuggestControllerPosition;
  Size renderBoxSuggestControllerSize;
  bool _displayList = false;


  @override
  void initState() {
    suggestController.text = '';
    _scrollController.addListener(_scrollListener);
    super.initState();
  }

  @override
  didChangeDependencies() {

    super.didChangeDependencies();
  }

  _scrollListener() {
    if (_keySuggestController.currentContext != null) {
      renderBoxSuggestController =
          _keySuggestController.currentContext.findRenderObject();
      renderBoxSuggestControllerPosition =
          renderBoxSuggestController.localToGlobal(Offset.zero);
      renderBoxSuggestControllerSize = renderBoxSuggestController.size;
    }
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        GestureDetector(
          onTap: () {
            _displayList = false;
            setState(() {
            });
          },
          child: SingleChildScrollView(
            controller: _scrollController,
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                TextFormField(
                  key: _keySuggestController,
                  onTap: () {
                    _displayList = true;
                    setState(() {});
                  },
                  controller: suggestController,
                  decoration: textFormFieldStyle(context, "Text Field"),
                  onChanged: (String text) {
                    _displayList = true;
                    setState(() {});
                  },
                ),
                Container(
                  color: Colors.blue,
                  height: 100,
                ),
                Container(
                  color: Colors.yellow,
                  height: 200,
                ),
                Container(
                  color: Colors.green,
                  height: 400,
                ),
                TextFormField(
                  decoration: textFormFieldStyle(context, "Other Field"),
                ),
                Container(
                  color: Colors.blue,
                  height: 100,
                ),
                Container(
                  color: Colors.yellow,
                  height: 200,
                ),
                Container(
                  color: Colors.green,
                  height: 400,
                ),
              ],
            ),
          ),
        ),
        _displayList
            ? Positioned(
          top: renderBoxSuggestControllerPosition != null &&
              renderBoxSuggestControllerSize != null
              ? -renderBoxSuggestControllerSize.height *
              (kIsWeb ? 0 : 0.5) +
              renderBoxSuggestControllerPosition.dy + 10
              : 50,
          left: 8,
          child: Container(
            width: MediaQuery.of(context).size.width - 16,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black38,
                  blurRadius:
                  20.0, // has the effect of softening the shadow
                  spreadRadius:
                  5.0, // has the effect of extending the shadow
                  offset: Offset(
                    10.0, // horizontal, move right 10
                    20.0, // vertical, move down 10
                  ),
                ),
              ],
            ),
            height: 100 *
                _suggestions
                    .where((sug) => sug
                    .toLowerCase()
                    .contains(suggestController.text.toLowerCase()))
                    .length
                    .toDouble() + 2,
            constraints: BoxConstraints(
              maxHeight: 400,
              minHeight: 120,
            ),
            child: ListView(
              children: <Widget>[
                ListTile(
                  title: Text(
                    "Suggetions:",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                // ignore: sdk_version_ui_as_code
                ..._suggestions
                    .where((sug) => sug
                    .toLowerCase()
                    .contains(suggestController.text.toLowerCase()))
                    .map((sug) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      SizedBox(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ListTile(
                              onTap: () {
                                suggestController.text = sug;
                                _displayList = false;
                                setState(() {});
                              },
                              title: Text(sug),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.black, width: 1, style: BorderStyle.solid))),
                      )
                    ],
                  );
                }).toList(),
              ],
            ),
          ),
        )
            : Container(),
      ],
    );
  }
}