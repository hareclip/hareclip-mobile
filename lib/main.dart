import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hareclip/screens/article/article.dart';
import 'package:hareclip/screens/home/home.dart';
import 'package:hareclip/screens/saved/saved.dart';
import 'package:hareclip/screens/search/search.dart';
import 'package:hareclip/screens/settings/settings.dart';
import 'package:hareclip/services/themeManager.dart';
import 'package:hareclip/themes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future main() async {
  await DotEnv().load('.env');
  SharedPreferences prefs = await SharedPreferences.getInstance();
  runApp(
    ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => ThemeNotifier(prefs),
      child: Consumer<ThemeNotifier>(
        builder: (context, themeNotifier, _) => Listener(
          onPointerDown: (e) {
            WidgetsBinding.instance.focusManager.primaryFocus?.unfocus();
          },
          child: MaterialApp(
            onGenerateRoute: (RouteSettings settings) {
              switch (settings.name) {
                case '/article':
                  return CupertinoPageRoute(
                      builder: (context) => ArticleScreen(prefs: prefs),
                      settings: settings);
                case '/saved':
                  return CupertinoPageRoute(
                      builder: (context) => SavedScreen(prefs: prefs),
                      settings: settings);
                case '/':
                  return CupertinoPageRoute(
                      builder: (context) => HomeScreen(), settings: settings);
              }
            },
            title: 'Hareclip',
            theme: lightTheme,
            darkTheme: darkTheme,
            themeMode: themeNotifier.getMode(),
            home: DefaultTabController(
              length: 3,
              child: Scaffold(
                body: TabBarView(
                  children: [
                    HomeScreen(),
                    SearchScreen(),
                    SettingsScreen(prefs: prefs, themeNotifier: themeNotifier),
                  ],
                ),
                bottomNavigationBar: TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.article)),
                    Tab(icon: Icon(Icons.search)),
                    Tab(icon: Icon(Icons.settings)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
