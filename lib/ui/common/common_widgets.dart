
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
