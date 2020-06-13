// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'central_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CentralState on CentralStateBase, Store {
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

  final _$searchFieldAtom = Atom(name: 'CentralStateBase.searchField');

  @override
  String get searchField {
    _$searchFieldAtom.reportRead();
    return super.searchField;
  }

  @override
  set searchField(String value) {
    _$searchFieldAtom.reportWrite(value, super.searchField, () {
      super.searchField = value;
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
selectedCategory: ${selectedCategory},
searchField: ${searchField},
searchStatus: ${searchStatus},
enableSearch: ${enableSearch}
    ''';
  }
}
