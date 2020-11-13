import 'package:flutter/material.dart';
import 'package:flutterapp/pages/firebase_page.dart';
// import 'package:flutterapp/pages/home_stack/about_page.dart';
// import 'package:flutterapp/pages/home_stack/home_page.dart';
import 'package:flutterapp/pages/home_stack/home_stack.dart';
import 'package:flutterapp/pages/login_page.dart';
import 'package:flutterapp/pages/product_stack/product_stack.dart';
import 'package:flutterapp/pages/register_page.dart';

//Container เทียบเท่ากับ div ของ Html
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primaryColor: Color(0xff78002e),
          //primarySwatch: Colors.deepOrange, //เปลี่ยนสีทั้ง app
          //primaryColor: Colors.deepOrange[800],//primaryColor สามารถใส่น้ำหนักสีได้ ทั้ง app | อยากใส่สีเอง เรียก class Color(oxffตามด้วยรหัสสี) | https://material.io/resources/color/#!/?view.left=0&view.right=0
          canvasColor: Colors.white, //สี blackground
          accentColor: Colors.deepPurple, // สีของ ปุม
          visualDensity: VisualDensity.adaptivePlatformDensity,

          //ข้อความ เปลี่ยนทั้ง app ที่มีการเรียกใช้ headline1
          textTheme: TextTheme(
              headline1: TextStyle(
                  fontSize: 30,
                  color: Colors.orange,
                  fontWeight: FontWeight.bold))),
      debugShowCheckedModeBanner: false, //เอา Debug ออก
      //home: MyHomePage(title: 'Flutter Mobile Framework'), เนื่องจากจะใช้ initialRount แทน
      initialRoute: '/', //การสร้างลิงค์สำหรับเปิดหน้า
      //groub rout
      routes: {
        '/' : (context) => LoginPage(), //หน้าแรก
        '/register' : (context) => RegisterPage(), //หน้าแรก
        //'/': (context) =>HomeStack(), //ไม่ใส่ title เพราะมีรูปภาพแล้ว | หน้าแรกจะใช้ '/'
        '/homestack': (context) => HomeStack(),
        '/productstack': (context) => ProductStack(),
        '/firebase': (context) => FirePage(),
      },
    );
  }
}
