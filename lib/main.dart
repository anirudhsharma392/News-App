import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/theme/theme.dart';
import 'package:news_app/ui/home_page.dart';

void main() {
  ///restricted to only portrait view
  ///tested only on smartphone with portrait view available only
  ///landscape view is not yet optimised for the app
  WidgetsFlutterBinding.ensureInitialized();
  //locks the rotation
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //removes the debugging banner,while in testing phase
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: themeData,

      home: HomePage(),
    );
  }


}
