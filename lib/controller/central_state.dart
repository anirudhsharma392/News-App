import 'package:mobx/mobx.dart';
import 'package:news_app/model/news_data.dart';

part 'central_state.g.dart';

class CentralState = CentralStateBase with _$CentralState;

abstract class CentralStateBase with Store {
  ///Horizontal news fields
  ///News data of particular category
  @observable
  NewsData horizontalViewNewsData;

  ///list of available categories
  final List category = [
    "Business",
    "Sports",
    "Entertainment",
    "Fashion",
    "Industry"
  ];
  //holds the value of selected category
  @observable
  String selectedCategory = "Business";

  ///Vertical news fields
  @observable
  NewsData verticalViewNewsData;


  ///searching news variables

  @observable
  String searchField = "";
  @observable
  String searchStatus = "loading";
  NewsData searchData;
  @observable
  bool enableSearch;
}

CentralState centralState = new CentralState();

///RUN TO REFRESH
///if you update state management variable
//Command:
//flutter packages pub run build_runner build
