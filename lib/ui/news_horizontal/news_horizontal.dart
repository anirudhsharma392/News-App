import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:news_app/controller/central_state.dart';
import 'package:news_app/theme/style.dart';
import 'package:news_app/ui/news_horizontal/news_card.dart';
import 'package:news_app/utils/utils.dart';

import 'custom_navigation_bar.dart';

class HorizontalView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomNavigationBar(),
        Observer(
            builder: (_) => SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: centralState.horizontalViewNewsData == null
                      ? Container(
                          height: cardHeight * 2.1,
                          width: cardHeight,
                          child: Center(child: CircularProgressIndicator()),
                        )
                      : centralState.horizontalViewNewsData.articles.length == 0
                          ? Center(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.error_outline,
                                    size: 100,
                                    color: label,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text(
                                    "Something went wrong",
                                    style: TextStyle(
                                        color: label,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                ],
                              ),
                            )
                          : Row(
                              children: [
                                for (int i = 0;
                                    i <
                                        centralState.horizontalViewNewsData
                                            .articles.length;
                                    i++)
                                  NewsCardHorizontal(
                                    author: centralState.horizontalViewNewsData
                                        .articles[i].author,
                                    title: centralState.horizontalViewNewsData
                                        .articles[i].title,
                                    image: centralState.horizontalViewNewsData
                                        .articles[i].urlToImage,
                                    date: utils.parseDateTime(centralState
                                        .horizontalViewNewsData
                                        .articles[i]
                                        .publishedAt),
                                    url: centralState
                                        .horizontalViewNewsData.articles[i].url,
                                    content: centralState.horizontalViewNewsData
                                        .articles[i].content,
                                  ),
                              ],
                            ),
                ))
      ],
    );
  }
}
