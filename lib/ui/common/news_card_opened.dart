import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/theme/style.dart';
import 'package:news_app/ui/common/common_widgets.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsCardOpened extends StatelessWidget {
  ///main title
  final String title;

  ///Url of the image in string format
  final String image;

  ///date of the news in string format don't need to parse it
  final String date;

  ///Author's name
  final String author;

  ///Url for more information of the news
  final String url;

  ///simply contains contentin string format(not html) also will scroll if it's too big
  final String content;

  NewsCardOpened(
      {this.title = "",
      this.image,
      this.date = "",
      this.author = "",
      this.url,
      this.content = ""});

  _launchURL() async {
    if (await canLaunch(url)) {
      await launch(url, forceWebView: true);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            image != null
                ? Image.network(
                    image,
                    height: _size.height * 0.4,
                    fit: BoxFit.cover,
                  )
                : Image.network(
                    noDataImage,
                    height: _size.height * 0.4,
                    fit: BoxFit.cover,
                  ),
            Container(
              height: 30,
              decoration: BoxDecoration(
                  color: white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(cardRadius * 10),
                      topRight: Radius.circular(cardRadius * 10))),
            ),
            Positioned(
              top: 30,
              left: 20,
              child: GestureDetector(
                onTap: () => Navigator.of(context).pop(),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: white,
                ),
              ),
            )
          ],
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: cardMargin * 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title ?? "",
                      maxLines: 3,
                      style: headingStyle,
                    ),
                    SizedBox(
                      height: cardMargin * 4,
                    ),
                    Container(
                      height: _size.height * 0.3,
                      child: SingleChildScrollView(
                        child: Text(
                          content ?? "",
                          style: bodyStyle,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(height:18,width:180,alignment:Alignment.centerLeft,child: Text(author??"", style: TextStyle(fontSize: 14, color: red, fontWeight: FontWeight.w600),overflow: TextOverflow.ellipsis,)),
                        Container(height:18,child: Center(child: Text(date??"", style: TextStyle(fontSize: 14, color: red, fontWeight: FontWeight.w600),overflow: TextOverflow.ellipsis,))),
                      ],
                    )),
              ],
            ),
          ),
        ),
        GestureDetector(
            onTap: _launchURL,
            child: Container(
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(cardRadius * 10),
                      topRight: Radius.circular(cardRadius * 10),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      ),
                    ],
                    gradient: LinearGradient(colors: [red,darkBlue])),
                child: Center(
                    child: Text(
                  "Excited ! Wanna know More about it ?",
                  style: TextStyle(
                      fontSize: 16, color: white, fontWeight: FontWeight.w500),
                ))))
      ],
    );
  }
}
