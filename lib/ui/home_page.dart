import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:news_app/controller/central_state.dart';
import 'package:news_app/model/news_data.dart';
import 'package:news_app/repository/fetchNewsApi.dart';
import 'package:news_app/theme/style.dart';
import 'package:news_app/ui/news_vertical/news_card.dart';
import 'package:news_app/ui/search.dart';
import 'package:news_app/utils/utils.dart';

import 'common/common_widgets.dart';
import 'news_horizontal/custom_navigation_bar.dart';
import 'news_horizontal/news_card.dart';

Utils _utils = new Utils();

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _status;
  NewsData _newsData;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadData();
  }

  //function loads up the data when initiating the application
  _loadData() {
    if (mounted)
      setState(() {
        _status = "loading";
      });
    FetchNewsApi()
      ..fetchHeadLines().then((value) {
        if (value == 0) {
          if (mounted)
            setState(() {
              _status = "failure";
            });
        } else {
          if (mounted) _newsData = NewsData.fromJson(value);
          setState(() {
            _status = "success";
          });
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: white, body: SafeArea(child: _body()));
  }

  Widget _body() {
    if (_status == "loading") {
      return Center(child: CircularProgressIndicator());
    } else if (_status == "success") {
      return SingleChildScrollView(
        child: Observer(
          builder: (_) => Column(
            children: [
              Search(),
              centralState.searchField == ""
                  ? Column(
                      children: [
                        HorizontalView(centralState.horizontalViewNewsData),
                        VerticalView(_newsData)
                      ],
                    )
                  : SearchView(centralState.searchData),
            ],
          ),
        ),
      );
    } else {
      return ErrorScreen();
    }
  }
}

class SearchView extends StatelessWidget {
  final NewsData newsData;
  SearchView(this.newsData);
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (centralState.searchStatus == "loading") {
        return Container(
            margin: EdgeInsets.only(top: 100, bottom: 20),
            child: Center(child: CircularProgressIndicator()));
      } else if (centralState.searchStatus == "success") {
        return Column(
          children: [
            Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(
                    left: cardMargin * 4,
                    top: cardMargin * 3,
                    bottom: cardMargin * 3),
                child: Text(
                  "Related Topics",
                  style: headingStyle,
                )),
            for (int i = 0; i < newsData.articles.length; i++)
              NewsCardVertical(
                title: newsData?.articles[i].title ?? "",
                image: newsData?.articles[i].urlToImage ?? "",
                date: _utils
                    ?.parseDateTime(newsData?.articles[i]?.publishedAt ?? ""),
                url: newsData?.articles[i]?.url ?? "",
                content: newsData?.articles[i]?.content ?? "",
              ),
          ],
        );
      } else {
        return ErrorScreen();
      }
    });
  }
}

class HorizontalView extends StatelessWidget {
  final NewsData newsData;
  HorizontalView(this.newsData);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomNavigationBar(),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: newsData == null
              ? Container(
                  height: cardHeight,
                  child: CircularProgressIndicator(),
                )
              : Row(
                  children: [
                    for (int i = 0; i < newsData.articles.length; i++)
                      NewsCardHorizontal(
                        title: newsData.articles[i].title,
                        image: newsData.articles[i].urlToImage,
                        date: _utils
                            .parseDateTime(newsData.articles[i].publishedAt),
                        url: newsData.articles[i].url,
                        content: newsData.articles[i].content,
                      ),
                  ],
                ),
        ),
      ],
    );
  }
}

class VerticalView extends StatelessWidget {
  final NewsData newsData;
  VerticalView(this.newsData);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            alignment: Alignment.centerLeft,
            margin:
                EdgeInsets.only(left: cardMargin * 4, bottom: cardMargin * 2),
            child: Text(
              "Trending Topics",
              style: headingStyle,
            )),
        for (int i = 0; i < newsData.articles.length; i++)
          NewsCardVertical(
            title: newsData.articles[i].title,
            image: newsData.articles[i].urlToImage,
            date: _utils.parseDateTime(newsData.articles[i].publishedAt),
            url: newsData.articles[i].url,
            content: newsData.articles[i].content,
          ),
      ],
    );
  }
}
