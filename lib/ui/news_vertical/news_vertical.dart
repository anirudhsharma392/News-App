import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:news_app/controller/central_state.dart';
import 'package:news_app/model/news_data.dart';
import 'package:news_app/model/sources.dart';
import 'package:news_app/repository/fetchNewsApi.dart';
import 'package:news_app/theme/style.dart';
import 'package:news_app/ui/common/common_widgets.dart';
import 'package:news_app/ui/news_vertical/news_card.dart';
import 'package:news_app/utils/utils.dart';

class VerticalView extends StatefulWidget {
  @override
  _VerticalViewState createState() => _VerticalViewState();
}

class _VerticalViewState extends State<VerticalView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _fetchAllSources();
  }

  //stores value in the state at the beginning
  _fetchAllSources() {
    FetchNewsApi()
      ..fetchSources().then((value) {
        if (value != null && value != 0) {
          centralState.source = Sources.fromJson(value);
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Header(),
        Observer(
          builder: (_) {
            return centralState.verticalViewNewsData == null
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
                          title: centralState
                              .verticalViewNewsData.articles[i].title,
                          image: centralState
                              .verticalViewNewsData.articles[i].urlToImage,
                          date: utils.parseDateTime(centralState
                              .verticalViewNewsData.articles[i].publishedAt),
                          author: centralState
                              .verticalViewNewsData.articles[i].author,
                          url:
                              centralState.verticalViewNewsData.articles[i].url,
                          content: centralState
                              .verticalViewNewsData.articles[i].content,
                        ),
                    ],
                  );
          },
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

  //loads up the headline data of the vertical view
  _loadData() {
    centralState.verticalViewNewsData = null;
    FetchNewsApi()
      ..fetchHeadLines(source: centralState.selectedSourceId).then((value) {
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Trending Topics",
              style: headingStyle,
            ),
            Observer(
              builder: (_) {
                return GestureDetector(
                  onTap: () => _settingModalBottomSheet(context),
                  child: Text(
                    centralState.selectedSource == null
                        ? "Select Source"
                        : "Source: ${centralState.selectedSource}",
                    style: subHeadingStyle,
                  ),
                );
              },
            )
          ],
        ));
  }

  _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        isDismissible: true,
        backgroundColor: Colors.transparent,
        builder: (_) {
          return DraggableScrollableSheet(builder:
              (BuildContext context, ScrollController scrollController) {
            return Container(
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(cardRadius),
                      topRight: Radius.circular(cardRadius))),
              height: MediaQuery.of(context).size.height * 0.6,
              child: SingleChildScrollView(
                controller: scrollController,
                child: new Wrap(
                  children: <Widget>[
                    Center(
                      child: Container(
                        margin: EdgeInsets.all(cardMargin * 2),
                        height: 8,
                        width: 60,
                        decoration: BoxDecoration(
                            color: Colors.black12,
                            borderRadius: BorderRadius.circular(20)),
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: EdgeInsets.all(cardMargin * 2),
                        child: Text(
                          "Select news from different sources",
                          style: labelStyle,
                        ),
                      ),
                    ),
                    (centralState.source != null)
                        ? Column(children: [
                            ListTile(
                              title: Text(
                                "None",
                                style: bodyStyle,
                              ),
                              onTap: () {
                                centralState.selectedSourceId = null;
                                centralState.selectedSource = null;
                                _loadData();
                                Navigator.of(context).pop();
                              },
                            ),
                            ...centralState.source.sources
                                .map<Widget>((element) => ListTile(
                                      title: Text(
                                        element.name,
                                        style: bodyStyle,
                                      ),
                                      onTap: () {
                                        centralState.selectedSourceId =
                                            element.id;
                                        centralState.selectedSource =
                                            element.name;
                                        _loadData();
                                        Navigator.of(context).pop();
                                      },
                                    ))
                                .toList()
                          ])
                        : ErrorScreenComponent()
                  ],
                ),
              ),
            );
          });
        });
  }
}
