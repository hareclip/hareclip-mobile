import 'package:flutter/material.dart';

// HomeHeader is home screen header
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
                Text("Hareclip"),
                IconButton(
                  icon: Icon(Icons.book_outlined),
                  onPressed: () {
                    Navigator.pushNamed(context, '/saved');
                  },
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            physics: BouncingScrollPhysics(),
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
