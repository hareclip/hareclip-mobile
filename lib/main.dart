import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hareclip/screens/article.dart';
import 'package:hareclip/screens/home.dart';

Future main() async {
  await DotEnv().load('.env');
  runApp(
    MaterialApp(
      routes: {'/article': (context) => ArticleScreen()},
      title: 'Hareclip',
      home: HomeScreen(),
    ),
  );
}
