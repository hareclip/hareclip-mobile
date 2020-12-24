import 'package:flutter/material.dart';

// HomeHeader is home screen header with search bar and profile
class HomeHeader extends StatelessWidget {
  final List<String> categories;
  final int selectedCategory;
  final Function setSelectedCategory;

  HomeHeader(
      {Key key,
      @required this.selectedCategory,
      @required this.categories,
      @required this.setSelectedCategory})
      : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      color: Theme.of(context).backgroundColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Icon(
                  Icons.person,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: TextField(
                      decoration: new InputDecoration(
                          contentPadding: const EdgeInsets.only(
                            left: 10,
                            top: 0,
                            right: 10,
                            bottom: 0,
                          ),
                          border: new OutlineInputBorder(
                            borderRadius: const BorderRadius.all(
                              const Radius.circular(10.0),
                            ),
                          ),
                          filled: true,
                          hintStyle: new TextStyle(color: Colors.grey[800]),
                          hintText: "Search",
                          fillColor: Colors.white),
                    ),
                  ),
                ),
                Icon(
                  Icons.person,
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ButtonBar(
              mainAxisSize: MainAxisSize.min,
              children: List.generate(
                categories.length,
                (index) => FlatButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18.0),
                    ),
                    color: selectedCategory == index
                        ? Theme.of(context).primaryColor
                        : Theme.of(context).backgroundColor,
                    child: Text(categories[index]),
                    onPressed: () {
                      setSelectedCategory(index);
                    }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
