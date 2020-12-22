import 'package:flutter/material.dart';
import 'package:hareclip/screens/article.dart';
import 'package:hareclip/screens/home.dart';

void main() {
  runApp(
    MaterialApp(
      routes: {'/article': (context) => ArticleScreen()},
      title: 'Hareclip',
      home: HomeScreen(),
    ),
  );
}
