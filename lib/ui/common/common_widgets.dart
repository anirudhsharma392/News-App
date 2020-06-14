
import 'package:flutter/material.dart';
import 'package:news_app/theme/style.dart';

class ErrorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 130,
            color: label,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Something went wrong",
            style: TextStyle(
                color: label, fontSize: 30, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 200,
          ),
        ],
      ),
    );
  }
}


class Footer extends StatelessWidget {
  final String author;
  final String date;
  Footer({this.date,this.author});
  @override
  Widget build(BuildContext context) {
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(height:18,width:100,alignment:Alignment.centerLeft,child: Text(author??"", style: labelStyle,overflow: TextOverflow.ellipsis,)),
        Container(height:18,child: Center(child: Text(date??"", style: labelStyle,overflow: TextOverflow.ellipsis,))),
      ],
    );
  }
}


class ErrorScreenComponent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.error_outline,
            size: 100,
            color: label,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Something went wrong",
            style: TextStyle(
                color: label,
                fontSize: 20,
                fontWeight: FontWeight.w600),
          ),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}


