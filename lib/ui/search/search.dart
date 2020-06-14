import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:news_app/controller/central_state.dart';
import 'package:news_app/model/news_data.dart';
import 'package:news_app/repository/fetchNewsApi.dart';
import 'package:news_app/theme/style.dart';
import 'package:news_app/ui/common/common_widgets.dart';
import 'package:news_app/ui/news_vertical/news_card.dart';
import 'package:news_app/utils/utils.dart';

///Textfield controller
TextEditingController controller = new TextEditingController();

///search widget present at the topmost part
class Search extends StatelessWidget {
  ///calls the search action on change of text
  void _searchAction(textFieldValue) {
    centralState.searchStatus = "loading";
    centralState.searchField=textFieldValue;
    FetchNewsApi()
      ..fetchNews(search: textFieldValue, sortBy: centralState.sortBy)
          .then((value) {
        if (value == 0) {
          centralState.searchStatus = "failure";
        } else {
          centralState.searchData = NewsData.fromJson(value);
          centralState.searchStatus = "success";
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 3,
            blurRadius: 6,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            width: 18,
          ),
          Icon(
            Icons.search,
            color: label,
            size: 21,
          ),
          SizedBox(
            width: 10,
          ),
          Flexible(
            child: TextField(
              maxLines: 1,
              minLines: 1,
              controller: controller,

              onSubmitted: _searchAction,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 2),
                  hintText: "Search Anything",
                  hintStyle: TextStyle(color: label, fontSize: 14),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.white),
            ),
          ),
          (centralState.searchField == "" || centralState.searchField== null)
              ? Container()
              : InkWell(
                  onTap: () {
                    centralState.searchField="";
                    controller.clear();
                  },
                  child: Icon(
                    Icons.clear,
                    color: label,
                    size: 21,
                  ),
                ),
          SizedBox(
            width: 20,
          ),
        ],
      ),
    );
  }
}

///View of the search widget
///only visible if search field is not empty
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
            Header(),
            for (int i = 0; i < centralState.searchData.articles.length; i++)
              NewsCardVertical(
                title: centralState.searchData?.articles[i].title ?? "",
                author: centralState.searchData.articles[i].author,
                image: centralState.searchData?.articles[i].urlToImage ?? "",
                date: utils?.parseDateTime(
                    centralState.searchData?.articles[i]?.publishedAt ?? ""),
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

///Header of search view widget
///Can be used to sort the list
class Header extends StatelessWidget {
  final Function refresh;
  Header({this.refresh});

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.centerLeft,
        margin: EdgeInsets.only(
            bottom: cardMargin * 2,
            left: cardMargin * 4,
            right: cardMargin * 4),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Search Results",
              style: headingStyle,
            ),
            Observer(
              builder: (_) {
                return GestureDetector(
                  onTap: () => _settingModalBottomSheet(context),
                  child: Text(
                    centralState.sortBy == null
                        ? "Sort news by"
                        : "Sort By : ${centralState.sortBy}",
                    style: subHeadingStyle,
                  ),
                );
              },
            )
          ],
        ));
  }

  ///modal sheet (not scrollable)
  void _settingModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(cardRadius),
          ),
        ),
        builder: (BuildContext bc) {
          return Container(
            child: Wrap(
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
                      "Sort the news with different parameters",
                      style: labelStyle,
                    ),
                  ),
                ),
                (centralState.sortByList != null)
                    ? Column(
                        children: centralState.sortByList
                            .map<Widget>((element) => ListTile(
                                  title: Text(
                                    element,
                                    style: bodyStyle,
                                  ),
                                  onTap: () {
                                    if (element == "None") {
                                      centralState.sortBy = null;
                                    } else {
                                      centralState.sortBy = element;
                                    }

                                    Search()
                                      .._searchAction(centralState.searchField);
                                    Navigator.of(context).pop();
                                  },
                                ))
                            .toList())
                    : ErrorScreenComponent()
              ],
            ),
          );
        });
  }
}
