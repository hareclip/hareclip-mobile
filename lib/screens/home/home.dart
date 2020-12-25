import 'package:flutter/material.dart';
import 'package:hareclip/components/articleCard.dart';
import 'package:hareclip/models/article.dart';
import 'package:hareclip/screens/home/components/header.dart';
import 'package:hareclip/services/api.dart';

// HomeScreen displays home with article listings
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final int _numFetch = 10;
  final List<String> _categories = [
    'All',
    'News',
    'Features',
    'Sports',
    'Entertainment',
    'Rabbithole',
  ];

  List<Article> _articles = [];
  List<Article> _filteredArticles = [];
  ScrollController _scrollController = new ScrollController();
  int _currentOffset = 0;
  int _selectedCategory = 0;
  bool _isLoading = false;
  bool _hasMore = true;

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // Reload articles on refresh
  Future<void> _reloadArticles() async {
    try {
      var articles = await fetchArticles(_numFetch, 0);
      _currentOffset = _numFetch;
      setState(() {
        _articles = articles;
        if (_selectedCategory != 0) {
          _filteredArticles = articles
              .where((article) =>
                  article.categoryLabel == _categories[_selectedCategory])
              .toList();
        }
      });
    } catch (err) {
      throw err;
    }
  }

  // Get more articles for infinite scroll
  _getMoreArticles() async {
    try {
      _isLoading = true;
      var articles = await fetchArticles(_numFetch, _currentOffset);
      _currentOffset += _numFetch;
      setState(() {
        _articles.addAll(articles);
        if (_selectedCategory != 0) {
          _filteredArticles.addAll(articles
              .where((article) =>
                  article.categoryLabel == _categories[_selectedCategory])
              .toList());
        }

        if (articles.isEmpty) {
          _hasMore = false;
        }

        _isLoading = false;
      });
    } catch (err) {
      throw err;
    }
  }

  // Set selected category and filter articles
  _setSelectedCategory(int category) {
    setState(() {
      _scrollController.animateTo(1,
          duration: Duration(milliseconds: 500), curve: Curves.ease);
      _selectedCategory = category;
      if (category != 0) {
        _filteredArticles = _articles
            .where((article) =>
                article.categoryLabel == _categories[_selectedCategory])
            .toList();
      }
    });
  }

  Widget build(BuildContext context) {
    List<Article> displayArticles =
        _selectedCategory == 0 ? _articles : _filteredArticles;

    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            HomeHeader(
              categories: _categories,
              selectedCategory: _selectedCategory,
              setSelectedCategory: _setSelectedCategory,
            ),
            Expanded(
              child: RefreshIndicator(
                onRefresh: _reloadArticles,
                child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  controller: _scrollController,
                  itemCount: _hasMore
                      ? displayArticles.length + 1
                      : displayArticles.length,
                  itemBuilder: (context, index) {
                    if (index >= displayArticles.length) {
                      // Render loading if not an article

                      // Fetch more articles if not doing so already
                      if (!_isLoading) {
                        _getMoreArticles();
                      }

                      return Center(
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else {
                      // Otherwise, render article card
                      return ArticleCard(article: displayArticles[index]);
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
