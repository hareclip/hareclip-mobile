import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hareclip/screens/article/article.dart';
import 'package:hareclip/screens/home/home.dart';
import 'package:hareclip/screens/search/search.dart';
import 'package:hareclip/screens/settings/settings.dart';

Future main() async {
  await DotEnv().load('.env');
  runApp(
    MaterialApp(
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case '/article':
            return CupertinoPageRoute(
                builder: (context) => ArticleScreen(), settings: settings);
          case '/':
            return CupertinoPageRoute(
                builder: (context) => HomeScreen(), settings: settings);
        }
      },
      title: 'Hareclip',
      theme: ThemeData(
        primaryColor: Color(0xFFC12A2A),
        backgroundColor: Colors.grey[200],
        primarySwatch: Colors.red,
        textTheme: TextTheme(
          bodyText1:
              TextStyle(fontSize: 18.0, color: Color(0xFFC12A2A), height: 1.5),
          bodyText2:
              TextStyle(fontSize: 18.0, color: Colors.grey[700], height: 1.5),
          headline4: TextStyle(color: Colors.black),
        ),
        tabBarTheme: TabBarTheme(
          labelColor: Colors.red,
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Colors.yellow,
        ),
      ),
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
          body: TabBarView(
            children: [
              HomeScreen(),
              SearchScreen(),
              SettingsScreen(),
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
  );
}
