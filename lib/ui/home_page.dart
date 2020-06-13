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
import 'news_horizontal/news_horizontal.dart';
import 'news_vertical/news_vertical.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: white, body: SafeArea(child: _body()));
  }

  Widget _body() {
    return SingleChildScrollView(
      child: Observer(
        builder: (_) => Column(
          children: [
            Search(),
            centralState.searchField == ""
                ? Column(
                    children: [HorizontalView(), VerticalView()],
                  )
                : SearchView(),
          ],
        ),
      ),
    );
  }
}

class SearchView extends StatelessWidget {

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
            for (int i = 0; i < centralState.searchData.articles.length; i++)
              NewsCardVertical(
                title: centralState.searchData?.articles[i].title ?? "",
                author: centralState.searchData.articles[i].author,
                image: centralState.searchData?.articles[i].urlToImage ?? "",
                date: utils
                    ?.parseDateTime(centralState.searchData?.articles[i]?.publishedAt ?? ""),
                url: centralState.searchData?.articles[i]?.url ?? "",
                content: centralState.searchData?.articles[i]?.content ?? "",
              ),
          ],
        );
      } else {
        return ErrorScreen();
      }
    });
  }
}
