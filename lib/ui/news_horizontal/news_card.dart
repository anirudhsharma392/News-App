import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:news_app/theme/style.dart';
import 'package:news_app/ui/news_horizontal/news_card_closed.dart';
import 'package:news_app/ui/news_vertical/news_card_opened.dart';


///square card available for the trending news

class NewsCardHorizontal extends StatelessWidget {


  ///main title
  final String title;

  ///Url of the image in string format
  final String image;

  ///date of the news in string format don't need to parse it
  final String date;

  ///Author's name
  final String author;

  ///Url for more information of the news
  final String url;

  ///simply contains contentin string format(not html) also will scroll if it's too big
  final String content;

  NewsCardHorizontal(
      {this.title = "",
        this.image,
        this.date = "",
        this.author = "",
        this.url,
        this.content = ""});
  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(0)),
      ),

      transitionType: ContainerTransitionType.fade,
      transitionDuration: const Duration(milliseconds: 500),

      openBuilder: (context, action) {
        return NewsCardOpened(title: title,image: image,date:date,url:url,content: content,);
      },
      closedBuilder: (context, action) {
        return NewsCardClosed(title: title,image: image,date:date,);
      },
    );
  }
}
