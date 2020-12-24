import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hareclip/screens/article/article.dart';
import 'package:hareclip/screens/home/home.dart';

Future main() async {
  await DotEnv().load('.env');
  runApp(
    MaterialApp(
      routes: {'/article': (context) => ArticleScreen()},
      title: 'Hareclip',
      theme: ThemeData(
        backgroundColor: Colors.black26,
        primarySwatch: Colors.red,
        textTheme: TextTheme(
          bodyText2:
              TextStyle(fontSize: 18.0, color: Colors.grey[700], height: 1.5),
          headline4: TextStyle(color: Colors.black),
        ),
      ),
      home: HomeScreen(),
    ),
  );
}
