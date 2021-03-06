import 'package:flutter/material.dart';
import 'package:flutterapp/pages/firebase_page.dart';
// import 'package:flutterapp/pages/home_stack/about_page.dart';
// import 'package:flutterapp/pages/home_stack/home_page.dart';
import 'package:flutterapp/pages/home_stack/home_stack.dart';
import 'package:flutterapp/pages/login_page.dart';
import 'package:flutterapp/pages/product_stack/product_stack.dart';
import 'package:flutterapp/pages/register_page.dart';
import 'package:flutterapp/redux/app_reducer.dart';

//shared_preferences //ไว้สำหรับเก็บข้อมูลในเครื่องรูปแบบ Key Value
import 'package:shared_preferences/shared_preferences.dart';

//redux
import 'package:redux/redux.dart';
import 'package:flutter_redux/flutter_redux.dart';

String token;

//Container เทียบเท่ากับ div ของ Html
void main() async {
  //check ว่า login หรือยัง
  //ต้องกำหนดเสมอเมื่อต้องการเช็คข้อูลในหน้าแรก
  WidgetsFlutterBinding.ensureInitialized();
  //เกบข้อมูลลงในเครื่อง SharedPreferences
  //เมื่อมี await ต้องมี async ใน function เสมอ
  SharedPreferences prefs = await SharedPreferences.getInstance();
  token = prefs.getString('token');
  //print(token);

//Reducer
  final myStore = Store<AppState>(appReducer, initialState: AppState.inital());

  runApp(MyApp(store: myStore));
}

class MyApp extends StatelessWidget {
  final Store<AppState> store;
  MyApp({this.store}); //this.store = myStore
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //StoreProvider เป็นตัวส่งข้อมูลไปยังหน้าอื่น ๆ
    //StoreConneter เป็นตัวรับข้อมูลไปยังหน้าอื่น ๆ ไปครอบตรงที่เราต้องการแสดงข้อมูล
    return StoreProvider(
        store: store,
        child: MaterialApp(
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
            // '/': (context) =>  LoginPage(), //หน้าแรก
            '/': (context) =>
                token == null ? LoginPage() : HomeStack(), //check login
            '/register': (context) => RegisterPage(), //หน้าสมัครสมาชิก
            //'/': (context) =>HomeStack(), //ไม่ใส่ title เพราะมีรูปภาพแล้ว | หน้าแรกจะใช้ '/'
            '/homestack': (context) => HomeStack(),
            '/productstack': (context) => ProductStack(),
            //'/': (context) => FirePage(), //ทดสอบ
            '/login': (context) => LoginPage(),
          },
        ));
  }
}
