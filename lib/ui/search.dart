import 'package:flutter/material.dart';
import 'package:news_app/controller/central_state.dart';
import 'package:news_app/model/news_data.dart';
import 'package:news_app/repository/fetchNewsApi.dart';
import 'package:news_app/theme/style.dart';

class Search extends StatelessWidget {
  TextEditingController _controller = new TextEditingController();
  ///calls the search action on change of text
  void _searchAction(textFieldValue) {
    centralState.searchField = textFieldValue;
    centralState.searchStatus = "loading";

    FetchNewsApi()
      ..fetchNews(search: textFieldValue).then((value) {
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
              controller: _controller,
              onChanged: _searchAction,
              decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 3),
                  hintText: "Search Anything",
                  hintStyle: TextStyle(color: label, fontSize: 13.8),
                  border: InputBorder.none,
                  filled: true,
                  fillColor: Colors.white),
            ),
          ),
          centralState.searchField==""?Container():InkWell(
            onTap: (){
              centralState.searchField="";
              _controller.clear();

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
