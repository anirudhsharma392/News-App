// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'central_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CentralState on CentralStateBase, Store {
  final _$horizontalViewNewsDataAtom =
      Atom(name: 'CentralStateBase.horizontalViewNewsData');

  @override
  NewsData get horizontalViewNewsData {
    _$horizontalViewNewsDataAtom.reportRead();
    return super.horizontalViewNewsData;
  }

  @override
  set horizontalViewNewsData(NewsData value) {
    _$horizontalViewNewsDataAtom
        .reportWrite(value, super.horizontalViewNewsData, () {
      super.horizontalViewNewsData = value;
    });
  }

  final _$selectedCategoryAtom =
      Atom(name: 'CentralStateBase.selectedCategory');

  @override
  String get selectedCategory {
    _$selectedCategoryAtom.reportRead();
    return super.selectedCategory;
  }

  @override
  set selectedCategory(String value) {
    _$selectedCategoryAtom.reportWrite(value, super.selectedCategory, () {
      super.selectedCategory = value;
    });
  }

  final _$verticalViewNewsDataAtom =
      Atom(name: 'CentralStateBase.verticalViewNewsData');

  @override
  NewsData get verticalViewNewsData {
    _$verticalViewNewsDataAtom.reportRead();
    return super.verticalViewNewsData;
  }

  @override
  set verticalViewNewsData(NewsData value) {
    _$verticalViewNewsDataAtom.reportWrite(value, super.verticalViewNewsData,
        () {
      super.verticalViewNewsData = value;
    });
  }

  final _$selectedSourceAtom = Atom(name: 'CentralStateBase.selectedSource');

  @override
  String get selectedSource {
    _$selectedSourceAtom.reportRead();
    return super.selectedSource;
  }

  @override
  set selectedSource(String value) {
    _$selectedSourceAtom.reportWrite(value, super.selectedSource, () {
      super.selectedSource = value;
    });
  }

  final _$sortByAtom = Atom(name: 'CentralStateBase.sortBy');

  @override
  String get sortBy {
    _$sortByAtom.reportRead();
    return super.sortBy;
  }

  @override
  set sortBy(String value) {
    _$sortByAtom.reportWrite(value, super.sortBy, () {
      super.sortBy = value;
    });
  }

  final _$controllerAtom = Atom(name: 'CentralStateBase.controller');

  @override
  TextEditingController get controller {
    _$controllerAtom.reportRead();
    return super.controller;
  }

  @override
  set controller(TextEditingController value) {
    _$controllerAtom.reportWrite(value, super.controller, () {
      super.controller = value;
    });
  }

  final _$searchStatusAtom = Atom(name: 'CentralStateBase.searchStatus');

  @override
  String get searchStatus {
    _$searchStatusAtom.reportRead();
    return super.searchStatus;
  }

  @override
  set searchStatus(String value) {
    _$searchStatusAtom.reportWrite(value, super.searchStatus, () {
      super.searchStatus = value;
    });
  }

  final _$enableSearchAtom = Atom(name: 'CentralStateBase.enableSearch');

  @override
  bool get enableSearch {
    _$enableSearchAtom.reportRead();
    return super.enableSearch;
  }

  @override
  set enableSearch(bool value) {
    _$enableSearchAtom.reportWrite(value, super.enableSearch, () {
      super.enableSearch = value;
    });
  }

  @override
  String toString() {
    return '''
horizontalViewNewsData: ${horizontalViewNewsData},
selectedCategory: ${selectedCategory},
verticalViewNewsData: ${verticalViewNewsData},
selectedSource: ${selectedSource},
sortBy: ${sortBy},
controller: ${controller},
searchStatus: ${searchStatus},
enableSearch: ${enableSearch}
    ''';
  }
}
