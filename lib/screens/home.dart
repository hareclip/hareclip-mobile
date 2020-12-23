import 'package:flutter/material.dart';
import 'package:hareclip/components/articleCard.dart';
import 'package:hareclip/models/article.dart';
import 'package:hareclip/services/api.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Article> _articles = [];

  @override
  void initState() {
    super.initState();

    // TODO: put in a loading screen?
    fetchArticles().then((articles) {
      setState(() {
        _articles = articles;
      });
    });
  }

  Future<void> _loadArticles() async {
    try {
      var articles = await fetchArticles();
      setState(() {
        _articles = articles;
      });
    } catch (err) {
      throw err;
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: RefreshIndicator(
        onRefresh: _loadArticles,
        child: ListView.builder(
          itemCount: _articles.length,
          itemBuilder: (context, index) {
            return ArticleCard(article: _articles[index]);
          },
        ),
      ),
    );
  }
}
