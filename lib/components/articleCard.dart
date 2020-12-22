import 'package:flutter/material.dart';
import 'package:hareclip/models/articleArguments.dart';

class ArticleCard extends StatelessWidget {
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          top: 20,
          right: 20,
          bottom: 20,
        ),
        child: Row(
          children: <Widget>[
            Text('I am a card'),
            ElevatedButton(
              child: Text('Open route'),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/article',
                  arguments: ArticleArguments('contentsURL', 'headerURL'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
