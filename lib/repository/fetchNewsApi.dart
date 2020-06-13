import 'dart:convert';

import 'package:http/http.dart' as http;

//returns data if fetched successfully
//returns 0 if caught some error
class FetchNewsApi {
  final String _country = "in";
  Future fetchNews(
      {apiKey = "965c54eb236a47f2b73b2d5b1b102388",
      search,
      sortBy,
      source}) async {
    String _url =
        "http://newsapi.org/v2/everything?q=$search&country=$_country";

    ///appends each filter acc to the availability

    if (sortBy != null) {
      _url += "&sortBy=$sortBy";
    }
    if (source != null) {
      _url += "&sources=$source";
    }

    if (apiKey == null) {
      throw Exception(["API cannot be accessed"]);
    } else {
      _url += "&apiKey=$apiKey";
    }
    //calling the http get function here
    try {
      var response = await http.get(_url);
      //if call was success
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        //if something went wrong
        return 0;
      }
    } catch (e) {
      print("Error : ${e.toString()}");

      return 0;
    }
  }

  Future fetchHeadLines({
    apiKey = "965c54eb236a47f2b73b2d5b1b102388",
    category,
    source,
  }) async {
    String _url = "http://newsapi.org/v2/top-headlines?country=$_country";

    ///appends each filter acc to the availability
    if (category != null) {
      _url += "&category=$category";
    }
    if (source != null) {
      _url += "&sources=$source";
    }
    if (apiKey == null) {
      throw Exception(["API cannot be accessed"]);
    } else {
      _url += "&apiKey=$apiKey";
    }
    //calling the http get function here
    try {
      var response = await http.get(_url);
      //if call was success
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        //if something went wrong
        return 0;
      }
    } catch (e) {
      print("Error : ${e.toString()}");

      return 0;
    }
  }
}
