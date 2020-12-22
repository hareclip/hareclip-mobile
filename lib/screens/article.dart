import 'package:flutter/material.dart';
import 'package:hareclip/models/articleArguments.dart';

class ArticleScreen extends StatelessWidget {

  Widget build(BuildContext context) {
    final ArticleArguments args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: Text('Article'),
      ),
      body: Row(
        children: <Widget>[
          Text(args.contentsFileName),
          Text(args.headerImageFileName),
        ],
      ),
    );
  }
}
