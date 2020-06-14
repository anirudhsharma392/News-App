import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:news_app/controller/central_state.dart';
import 'package:news_app/model/news_data.dart';
import 'package:news_app/repository/fetchNewsApi.dart';
import 'package:news_app/theme/style.dart';
import 'package:news_app/ui/news_vertical/news_card.dart';
import 'package:news_app/ui/search/search.dart';
import 'package:news_app/utils/utils.dart';

import 'common/common_widgets.dart';
import 'news_horizontal/custom_navigation_bar.dart';
import 'news_horizontal/news_card.dart';
import 'news_horizontal/news_horizontal.dart';
import 'news_vertical/news_vertical.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        body: SafeArea(child: _body()));
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
