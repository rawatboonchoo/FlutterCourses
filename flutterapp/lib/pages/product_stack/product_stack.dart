import 'package:flutter/material.dart';
import 'package:flutterapp/pages/product_stack/detail_page.dart';
import 'package:flutterapp/pages/product_stack/product_page.dart';

class ProductStack extends StatelessWidget {
  const ProductStack({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //การจัดกลุ่มของ rount
    //root rount
    return Navigator(
      initialRoute: 'productstack/product',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case 'productstack/product':
            // Assume CollectPersonalInfoPage collects personal info and then
            // navigates to 'signup/choose_credentials'.
            builder = (BuildContext _) => ProductPage();
            break;
          case 'productstack/detail':
            builder = (BuildContext _) => DetailPage();
            break;
          default:
            throw Exception('Invalid route: ${settings.name}');
        }
        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}
