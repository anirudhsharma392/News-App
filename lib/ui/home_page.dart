import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:news_app/controller/central_state.dart';
import 'package:news_app/theme/style.dart';
import 'package:news_app/ui/common/on_exit.dart';
import 'package:news_app/ui/search/search.dart';
import 'news_horizontal/news_horizontal.dart';
import 'news_vertical/news_vertical.dart';

class HomePage extends StatelessWidget {
  //checks if text field is empty or not if not then makes it empty
  Future exit(context) {
    if (centralState.controller.text == "" ||
        centralState.controller.text == null) {
      OnExit()
        ..askConfirmation(
            context: context,
            action: () =>
                SystemChannels.platform.invokeMethod('SystemNavigator.pop'),
            cancel: () {},
            label: "You want to exit.");
    } else {
      centralState.controller.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white, body: SafeArea(child: _body(context)));
  }

  Widget _body(context) {
    return WillPopScope(
      onWillPop: () => exit(context),
      child: SingleChildScrollView(
        child: Observer(
          builder: (_) => Column(
            children: [
              Search(),
              (centralState.controller.text == "" ||
                      centralState.controller.text == null)
                  ? Column(
                      children: [HorizontalView(), VerticalView()],
                    )
                  : SearchView(),
            ],
          ),
        ),
      ),
    );
  }
}
