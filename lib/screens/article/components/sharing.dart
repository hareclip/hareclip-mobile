import 'package:flutter/cupertino.dart';
import 'package:hareclip/models/article.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

// SharingActionSheet displays sharing options for article
class SharingActionSheet extends StatelessWidget {
  final Article article;

  SharingActionSheet({
    Key key,
    @required this.article,
  }) : super(key: key);

  Widget build(BuildContext context) {
    int articleID = article.id;
    String title = article.title;
    String source = Uri.encodeQueryComponent(
      "https://www.umdhare.com/#/articles/$articleID",
    );

    return CupertinoActionSheet(
      actions: [
        CupertinoActionSheetAction(
          child: Text("Share to Facebook"),
          onPressed: () {
            launch(
              "https://www.facebook.com/sharer/sharer.php?u=$source",
            );
            Navigator.pop(context);
          },
        ),
        CupertinoActionSheetAction(
          child: Text("Share to Twitter"),
          onPressed: () {
            String text = title + ": " + source;
            launch(
              "https://twitter.com/intent/tweet?text=$text",
            );
            Navigator.pop(context);
          },
        ),
        CupertinoActionSheetAction(
          child: Text("Share to Reddit"),
          onPressed: () {
            launch(
              "https://www.reddit.com/submit?url=$source&title=$title",
            );
            Navigator.pop(context);
          },
        ),
        CupertinoActionSheetAction(
          child: Text("Share with..."),
          onPressed: () {
            Share.share(
              source,
              subject: title,
            );
            Navigator.pop(context);
          },
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text("Cancel"),
      ),
    );
  }
}
