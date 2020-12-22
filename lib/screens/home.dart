import 'package:flutter/material.dart';
import 'package:hareclip/components/articleCard.dart';

class HomeScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return ArticleCard();
        },
      ),
    );
  }
}
