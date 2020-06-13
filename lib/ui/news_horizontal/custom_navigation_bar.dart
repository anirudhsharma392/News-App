import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:news_app/controller/central_state.dart';
import 'package:news_app/model/news_data.dart';
import 'package:news_app/repository/fetchNewsApi.dart';
import 'package:news_app/theme/style.dart';

class CustomNavigationBar extends StatefulWidget {
  @override
  _CustomNavigationBarState createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getHorizontalViewData(centralState.selectedCategory);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          for (int i = 0; i < centralState.category.length; i++)
            _blocks(centralState.category[i])
        ],
      ),
    );
  }

  getHorizontalViewData(String value) {
    centralState.selectedCategory = value;
    centralState.horizontalViewNewsData = null;
    FetchNewsApi()
      ..fetchHeadLines(category: centralState.selectedCategory).then((value) {
        if (value != null) {
          centralState.horizontalViewNewsData = NewsData.fromJson(value);
        }
      });
  }

  Widget _blocks(value) {
    return GestureDetector(
        onTap: () => getHorizontalViewData(value),
        child: Observer(
          builder: (_) => Container(
            margin: EdgeInsets.symmetric(
                horizontal: cardMargin * 4, vertical: cardMargin),
            child: Text(
              value,
              style: value == centralState.selectedCategory
                  ? headingStyle
                  : labelStyle,
            ),
          ),
        ));
  }
}
