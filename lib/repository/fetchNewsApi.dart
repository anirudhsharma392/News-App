import 'dart:convert';

import 'package:http/http.dart' as http;

//returns data if fetched successfully
//returns 0 if caught some error
class FetchNewsApi {
  Future fetchNews({
    apiKey = "965c54eb236a47f2b73b2d5b1b102388",
    search,
  }) async {
    final String _url =
        "http://newsapi.org/v2/everything?q=$search&from=2020-06-12&to=2020-06-12&sortBy=popularity&apiKey=$apiKey";

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
    category = "business",
    country = "us",
  }) async {
    final String _url =
        "http://newsapi.org/v2/top-headlines?country=$country&category=$category&apiKey=$apiKey";

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
