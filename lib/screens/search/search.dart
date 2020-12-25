import 'package:flutter/material.dart';
import 'package:hareclip/components/articleCard.dart';
import 'package:hareclip/models/article.dart';
import 'package:hareclip/screens/search/components/header.dart';
import 'package:hareclip/services/api.dart';

// SearchScreen displays home with article listings
class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Article> _articles = [];
  ScrollController _scrollController = new ScrollController();
  int _currentOffset = 0;
  bool _isLoading = false;
  bool _hasMore = true;
  String _searchTerm = "";

  @override
  void initState() {
    super.initState();
  }

  // Reload articles on refresh
  Future<void> _reloadArticles() async {
    try {
      var articles = await fetchSearchArticles(_searchTerm, 0);
      _currentOffset = articles.length;
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
      _isLoading = true;
      var articles = await fetchSearchArticles(_searchTerm, _currentOffset);
      _currentOffset += articles.length;
      setState(() {
        _articles.addAll(articles);

        if (articles.isEmpty) {
          _hasMore = false;
        }

        _isLoading = false;
      });
    } catch (err) {
      throw err;
    }
  }

  // Handles search input
  _onSearchInput(String searchTerm) async {
    setState(() {
      _searchTerm = searchTerm;
    });
    await _reloadArticles();
  }

  Widget build(BuildContext context) {
    List<Article> displayArticles = _articles;

    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SearchHeader(
              onSearchInput: _onSearchInput,
            ),
            Expanded(
              child: _searchTerm == ""
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.search),
                          Text("Search for something...")
                        ],
                      ),
                    )
                  : RefreshIndicator(
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
