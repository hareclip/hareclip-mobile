import 'package:flutter/material.dart';
import 'package:hareclip/components/articleCard.dart';
import 'package:hareclip/models/article.dart';
import 'package:hareclip/services/api.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final int _numFetch = 10;
  List<Article> _articles = [];
  ScrollController _scrollController = new ScrollController();
  int _currentOffset = 0;
  bool _loading = false;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        _getMoreArticles();
      }
    });

    // TODO: put in a loading screen?
    fetchArticles(_numFetch, 0).then((articles) {
      setState(() {
        _articles = articles;
      });
    });
    _currentOffset += _numFetch;
  }

  // Load initial articles on refresh
  Future<void> _loadInitialArticles() async {
    try {
      var articles = await fetchArticles(_numFetch, 0);
      _currentOffset = _numFetch;
      setState(() {
        _articles = articles;
      });
    } catch (err) {
      throw err;
    }
  }

  // Get more articles for infinite scroll
  _getMoreArticles() async {
    try {
      var articles = await fetchArticles(_numFetch, _currentOffset);
      _currentOffset += _numFetch;
      setState(() {
        _articles.addAll(articles);
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
        onRefresh: _loadInitialArticles,
        child: ListView.builder(
          controller: _scrollController,
          itemCount: _articles.length + 1,
          itemBuilder: (context, index) {
            if (index < _articles.length) {
              return ArticleCard(article: _articles[index]);
            } else {
              // TODO: condition when no more left to load?
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}
