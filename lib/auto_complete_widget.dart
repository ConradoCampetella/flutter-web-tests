import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:widgets/styles.dart';

class AutoCompleteWidget extends StatefulWidget {
  AutoCompleteWidget({Key key}) : super(key: key);

  @override
  _AutoCompleteWidgetState createState() => _AutoCompleteWidgetState();
}

class _AutoCompleteWidgetState extends State<AutoCompleteWidget> {
  ScrollController _scrollController = ScrollController();

  // DropDown1
  List<String> _suggestions = [
    "Birth Certificate",
    "Citizenship Certificate",
    "Death Certificate",
    "Marriage Certificate",
    "Power of Attorney",
    "Will",
    "Will2",
  ];
  TextEditingController suggestController = TextEditingController();
  GlobalKey _keySuggestController = GlobalKey();
  RenderBox renderBoxSuggestController;
  Offset renderBoxSuggestControllerPosition;
  Size renderBoxSuggestControllerSize;
  bool _displayList = false;

  // DropDown2
  TextEditingController suggestController2 = TextEditingController();
  List<String> _suggestions2 = [
    "Antiques",
    "Art",
    "Books",
    "Cameras",
    "Fine China",
    "Coins",
    "Comic Books",
    "Film Memorabilia",
    "Jewellery",
    "Maps",
    "Music Memorabilia",
    "Pins",
    "Posts Cards",
    "Stamps",
    "Telephones",
    "Typewriters",
  ];
  GlobalKey _keySuggestController2 = GlobalKey();
  RenderBox renderBoxSuggestController2;
  Offset renderBoxSuggestControllerPosition2;
  Size renderBoxSuggestControllerSize2;
  bool _displayList2 = false;

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
      renderBoxSuggestController = _keySuggestController.currentContext.findRenderObject();
      renderBoxSuggestControllerPosition = renderBoxSuggestController.localToGlobal(Offset.zero);
      renderBoxSuggestControllerSize = renderBoxSuggestController.size;
    }
    if (_keySuggestController2.currentContext != null) {
      renderBoxSuggestController2 = _keySuggestController2.currentContext.findRenderObject();
      renderBoxSuggestControllerPosition2 = renderBoxSuggestController2.localToGlobal(Offset.zero);
      renderBoxSuggestControllerSize2 = renderBoxSuggestController2.size;
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
            _displayList2 = false;
            setState(() {});
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
                    _displayList2 = false;
                    setState(() {});
                  },
                  controller: suggestController,
                  decoration: textFormFieldStyle(context, "Text Field"),
                  onChanged: (String text) {
                    _displayList = true;
                    _displayList2 = false;
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
                TextFormField(
                  key: _keySuggestController2,
                  onTap: () {
                    _displayList2 = true;
                    _displayList = false;
                    setState(() {});
                  },
                  controller: suggestController2,
                  decoration: textFormFieldStyle(context, "Text Field 2"),
                  onChanged: (String text) {
                    _displayList2 = true;
                    _displayList = false;
                    setState(() {});
                  },
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
                top: renderBoxSuggestControllerPosition != null && renderBoxSuggestControllerSize != null
                    ? -renderBoxSuggestControllerSize.height * (kIsWeb ? 0 : 0.5) + renderBoxSuggestControllerPosition.dy + 3
                    : 65,
                left: 8,
                child: Container(
                  width: MediaQuery.of(context).size.width - 16,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black38,
                        blurRadius: 20.0, // has the effect of softening the shadow
                        spreadRadius: 5.0, // has the effect of extending the shadow
                        offset: Offset(
                          10.0, // horizontal, move right 10
                          20.0, // vertical, move down 10
                        ),
                      ),
                    ],
                  ),
                  height: 100 * _suggestions.where((sug) => sug.toLowerCase().contains(suggestController.text.toLowerCase())).length.toDouble() + 2,
                  constraints: BoxConstraints(
                    maxHeight: 400,
                    minHeight: 120,
                  ),
                  child: Scrollbar(
                    child: ListView(
                      children: <Widget>[
                        ListTile(
                          title: Text(
                            "Suggetions:",
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                        // ignore: sdk_version_ui_as_code
                        ..._suggestions.where((sug) => sug.toLowerCase().contains(suggestController.text.toLowerCase())).map((sug) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              SizedBox(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Material(
                                      child: ListTile(
                                        onTap: () {
                                          suggestController.text = sug;
                                          _displayList = false;
                                          setState(() {});
                                        },
                                        title: Text(sug),
                                      ),
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
                ),
              )
            : Container(),
        _displayList2
            ? Positioned(
                top: renderBoxSuggestControllerPosition2 != null && renderBoxSuggestControllerSize2 != null
                    ? -renderBoxSuggestControllerSize2.height * (kIsWeb ? 0 : 0.5) + renderBoxSuggestControllerPosition2.dy + 5
                    : 992,
                left: 8,
                child: Container(
                  width: MediaQuery.of(context).size.width - 16,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black38,
                        blurRadius: 20.0, // has the effect of softening the shadow
                        spreadRadius: 5.0, // has the effect of extending the shadow
                        offset: Offset(
                          10.0, // horizontal, move right 10
                          20.0, // vertical, move down 10
                        ),
                      ),
                    ],
                  ),
                  height: 100 * _suggestions2.where((sug) => sug.toLowerCase().contains(suggestController2.text.toLowerCase())).length.toDouble() + 2,
                  constraints: BoxConstraints(
                    maxHeight: 400,
                    minHeight: 120,
                  ),
                  child: Scrollbar(child: ListView(
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          "Suggetions 2:",
                          style: TextStyle(fontWeight: FontWeight.w600),
                        ),
                      ),
                      // ignore: sdk_version_ui_as_code
                      ..._suggestions2.where((sug) => sug.toLowerCase().contains(suggestController.text.toLowerCase())).map((sug) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            SizedBox(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  Material(
                                    child: ListTile(
                                      onTap: () {
                                        suggestController2.text = sug;
                                        _displayList2 = false;
                                        _displayList = false;
                                        setState(() {});
                                      },
                                      title: Text(sug),
                                    ),
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
                  ),),
                ),
              )
            : Container(),
      ],
    );
  }
}
