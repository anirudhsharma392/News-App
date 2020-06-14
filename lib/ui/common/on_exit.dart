import 'package:flutter/material.dart';
import 'package:news_app/theme/style.dart';

class OnExit{

 Future askConfirmation({context, Function action, Function cancel,String label}) {
   const double _cardMargin=10;
    return showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(cardRadius))),
            contentPadding:  const EdgeInsets.only(
                bottom:_cardMargin*2,
                left: _cardMargin,
                right: _cardMargin,
                top: _cardMargin*2),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Are you sure !",
                  style: headingStyle,
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  label,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey),textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: _cardMargin*3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    InkWell(
                      splashColor: red,
                      onTap: () async {
                        Navigator.of(context).pop();
                        cancel();
                      },
                      child: Container(
                        height: 35,
                        width: 110,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 1.0), //(x,y)
                              blurRadius: 6.0,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          "Cancel",
                          style: TextStyle(
                              color: white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: _cardMargin*2,
                    ),
                    InkWell(
                      splashColor: Colors.red,
                      onTap: () async {
                        Navigator.of(context).pop();
                        action();
                      },
                      child: Container(
                        height: 35,
                        width: 110,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: red,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0.0, 1.0), //(x,y)
                              blurRadius: 6.0,
                            ),
                          ],
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          "Yes",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}