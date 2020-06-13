import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/theme/style.dart';
import 'package:animations/animations.dart';
import 'package:news_app/ui/common/common_widgets.dart';

class NewsCardClosed extends StatelessWidget {
  ///main title
  final String title;

  ///Url of the image in string format
  final String image;

  ///date of the news in string format don't need to parse it
  final String date;

  ///Author's name
  final String author;

  NewsCardClosed(
      {this.title = "", this.image, this.date = "", this.author = ""});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(cardMargin),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(cardRadius),
          ),
          elevation: cardElevation,
          child: Container(
            height: cardHeight,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                image != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(cardRadius),
                            bottomLeft: Radius.circular(cardRadius)),
                        child: Image.network(
                          image,
                          width: cardHeight,
                          fit: BoxFit.cover,
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(cardRadius),
                            bottomLeft: Radius.circular(cardRadius)),
                        child: Image.network(
                          noDataImage,
                          width: cardHeight,
                          fit: BoxFit.cover,
                        ),
                      ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.all(cardMargin * 2),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(title ?? "",
                              overflow: TextOverflow.fade, style: bodyStyle),
                        ),
                        SizedBox(
                          height: cardMargin,
                        ),
                        Footer(
                          author: author,
                          date: date,
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
