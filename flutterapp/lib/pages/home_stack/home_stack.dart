import 'package:flutter/material.dart';
import 'package:flutterapp/pages/home_stack/about_page.dart';
import 'package:flutterapp/pages/home_stack/home_page.dart';
import 'package:flutterapp/pages/home_stack/map_page.dart';

//การทำ group stack link
class HomeStack extends StatefulWidget {
  HomeStack({Key key}) : super(key: key);

  @override
  _HomeStackState createState() => _HomeStackState();
}

class _HomeStackState extends State<HomeStack> {
  @override
  Widget build(BuildContext context) {
    //การจัดกลุ่มของ rount
    //root rount
    return Navigator(
      initialRoute: 'homestack/home',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case 'homestack/home':
            // Assume CollectPersonalInfoPage collects personal info and then
            // navigates to 'signup/choose_credentials'.
            builder = (BuildContext _) => MyHomePage();
            break;
          case 'homestack/about':
            builder = (BuildContext _) => AboutPage();
            break;
          case 'homestack/map':
            builder = (BuildContext _) => MapPage();
            break;
          default:
            throw Exception('Invalid route: ${settings.name}');
        }
        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}
