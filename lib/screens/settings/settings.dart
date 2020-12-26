import 'package:flutter/material.dart';
import 'package:hareclip/screens/settings/components/alert.dart';
import 'package:hareclip/services/themeManager.dart';
import 'package:shared_preferences/shared_preferences.dart';

// SettingsScreen displays settings
class SettingsScreen extends StatelessWidget {
  final SharedPreferences prefs;
  final ThemeNotifier themeNotifier;

  SettingsScreen({
    Key key,
    @required this.prefs,
    @required this.themeNotifier,
  }) : super(key: key);

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  "Settings",
                  style: Theme.of(context).textTheme.headline4,
                ),
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Dark Mode"),
                    Switch(
                      value: themeNotifier.getMode() == ThemeMode.dark,
                      onChanged: (e) {
                        if (themeNotifier.getMode() == ThemeMode.dark) {
                          themeNotifier.setLightMode();
                        } else {
                          themeNotifier.setDarkMode();
                        }
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: OutlineButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => ClearCacheAlert(prefs: prefs),
                    );
                  },
                  borderSide: BorderSide(color: Colors.red[400]),
                  child: Text(
                    "Clear Cached Data",
                    style: TextStyle(color: Colors.red[400]),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
