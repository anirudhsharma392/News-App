import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:news_app/model/news_data.dart';
import 'package:news_app/model/sources.dart';

part 'central_state.g.dart';

//data controller class
//This is a single class due to very small project
class CentralState = CentralStateBase with _$CentralState;

abstract class CentralStateBase with Store {
  /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// ///
  /// Horizontal news fields
  /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// ///
  @observable
  NewsData horizontalViewNewsData;
  //list of available categories
  final List category = [
    "General",
    "Business",
    "Sports",
    "Entertainment",
    "Health",
    "Science",
    "Technology"
  ];
  //holds the value of selected category
  @observable
  String selectedCategory = "General";

  /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// ///
  /// Vertical news fields
  /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// ///
  @observable
  NewsData verticalViewNewsData;
  Sources source;
  @observable
  String selectedSource;
  String selectedSourceId;

  /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// ///
  /// For Searching Functionality only
  /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// /// ///

  List<String> sortByList = ["None", "Relevancy", "Popularity", "PublishedAt"];
  @observable
  String sortBy;
  @observable
  String searchField="";
  @observable
  String searchStatus = "loading";
  NewsData searchData;
  @observable
  bool enableSearch;
}

CentralState centralState = new CentralState();

///RUN TO REFRESH
//if you update state management variable
//Command:
//flutter packages pub run build_runner build
