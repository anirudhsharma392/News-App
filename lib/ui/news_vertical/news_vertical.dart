import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/controller/central_state.dart';
import 'package:news_app/model/news_data.dart';
import 'package:news_app/repository/fetchNewsApi.dart';
import 'package:news_app/theme/style.dart';
import 'package:news_app/ui/news_vertical/news_card.dart';
import 'package:news_app/utils/utils.dart';

class VerticalView extends StatefulWidget {
  @override
  _VerticalViewState createState() => _VerticalViewState();
}

class _VerticalViewState extends State<VerticalView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(),
        centralState.verticalViewNewsData == null
            ? Container(
                height: cardHeight * 2.1,
                width: cardHeight,
                child: Center(child: CircularProgressIndicator()),
              )
            : Column(
                children: [
                  for (int i = 0;
                      i < centralState.verticalViewNewsData.articles.length;
                      i++)
                    NewsCardVertical(
                      title:
                          centralState.verticalViewNewsData.articles[i].title,
                      image: centralState
                          .verticalViewNewsData.articles[i].urlToImage,
                      date: utils.parseDateTime(centralState
                          .verticalViewNewsData.articles[i].publishedAt),
                      author:
                          centralState.verticalViewNewsData.articles[i].author,
                      url: centralState.verticalViewNewsData.articles[i].url,
                      content:
                          centralState.verticalViewNewsData.articles[i].content,
                    ),
                ],
              )
      ],
    );
  }
}

class Header extends StatefulWidget {
  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }

  _loadData() {
    FetchNewsApi()
      ..fetchHeadLines().then((value) {
        if (value == 0) {
        } else {
          centralState.verticalViewNewsData = NewsData.fromJson(value);
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.symmetric(
            horizontal: cardMargin * 4, vertical: cardMargin * 2),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Trending Topics",
              style: headingStyle,
            ),
            Text(
              "Source: ABC News",
              style: labelStyle,
            )
          ],
        ));
  }
}
