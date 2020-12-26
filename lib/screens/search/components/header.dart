import 'package:flutter/material.dart';

class SearchHeader extends StatefulWidget {
  final Function onSearchInput;

  SearchHeader({
    Key key,
    @required this.onSearchInput,
  }) : super(key: key);

  @override
  _SearchHeaderState createState() => _SearchHeaderState();
}

// SearchHeader is search screen header
class _SearchHeaderState extends State<SearchHeader> {
  final _fieldText = TextEditingController();

  @override
  void initState() {
    super.initState();
    _fieldText.addListener(() {
      final text = _fieldText.text.toLowerCase();
      _fieldText.value = _fieldText.value.copyWith(
        text: text,
        selection:
            TextSelection(baseOffset: text.length, extentOffset: text.length),
        composing: TextRange.empty,
      );
      widget.onSearchInput(text);
    });
  }

  @override
  void dispose() {
    _fieldText.dispose();
    super.dispose();
  }

  // Clears search bar
  void _clearText() {
    _fieldText.clear();
    widget.onSearchInput("");
  }

  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      controller: _fieldText,
                      decoration: new InputDecoration(
                        suffixIcon: _fieldText.text.length > 0
                            ? IconButton(
                                icon: Icon(Icons.clear),
                                onPressed: _clearText,
                              )
                            : null,
                        contentPadding: const EdgeInsets.only(
                          left: 10,
                          top: 0,
                          right: 10,
                          bottom: 0,
                        ),
                        border: new OutlineInputBorder(
                          borderRadius: const BorderRadius.all(
                            const Radius.circular(10.0),
                          ),
                        ),
                        filled: true,
                        //hintStyle: new TextStyle(color: Colors.grey[800]),
                        hintText: "Search",
                        //fillColor: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
