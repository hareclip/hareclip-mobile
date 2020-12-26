import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hareclip/services/articleSaving.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ClearCacheAlert is alert dialog to confirm cache clearing
class ClearCacheAlert extends StatelessWidget {
  final SharedPreferences prefs;

  ClearCacheAlert({
    Key key,
    @required this.prefs,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Clear Cached Data'),
      content: Text("Are you sure you want to clear cache?"),
      actions: <Widget>[
        FlatButton(
          child: Text("Yes"),
          onPressed: () {
            clearSavedArticles(prefs);
            Navigator.of(context).pop();
          },
        ),
        FlatButton(
          child: Text("Cancel"),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
