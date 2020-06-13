import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:news_app/controller/central_state.dart';
import 'package:news_app/theme/style.dart';

class CustomNavigationBar extends StatelessWidget {
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

  Widget _blocks(value) {
    return GestureDetector(
        onTap: () {

          centralState.selectedCategory = value;
          centralState.horizontalViewNewsData=null;

          },
        child: Observer(
          builder: (_) => Container(
            margin: EdgeInsets.symmetric(horizontal: cardMargin*4,vertical: cardMargin),
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
