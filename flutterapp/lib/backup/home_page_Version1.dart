//importM
import 'package:flutter/material.dart';
import 'package:flutterapp/widgets/header.dart';

class MyHomePage extends StatefulWidget {
  //StatefulWidget จะมี _MyHomePageState
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  String title = "TOT Plubic Company";

  void _incrementCounter() {
    setState(() {
      //ทุกครั้งที่มีการ กดจะไปเรียก Widget build
      _counter++;
    });
  }

  //initState //จะเกิดขึ้น 1 ครั้งเมื่อมีการเรียกใช้งานจากหน้าจอ one-only
  @override
  void initState() {
    
    super.initState();
    //นิยมเอาไว้ดึงข้อมูลมาจากฐานข้อมูล
    print('initState (home page)');
  }

//dispose //จะเกิดขึ้น 1 ครั้งเมื่อโปรแกรมถูกปิดไป
  @override
  void dispose() {
    
    print('dispose (home page)');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Scaffold จะประกอบไปด้วย appBar และ body
      appBar: AppBar(
        //title ของ app bar
        //title: Text(widget.title),
        //ใส่รูปภาพแทน text
        title: Image.asset(
          'assets/images/logo_tot.png',
          height: 20,
        ),
        centerTitle: true, //ปรับรูปกึ่งกลาง
        //icon on Appbar
        actions: [
          //คือ icon ทางขวาบนของ Appbar
          IconButton(
              icon: Icon(Icons.person_add, color: Colors.white, size: 30),
              onPressed: null),
          IconButton(
              icon: Icon(Icons.exit_to_app, color: Colors.white, size: 30),
              onPressed: null)
        ],
        //leading: //คือ icon ทางซ้ายบนของ Appbar
      ),
      body: Center(
        child: Column(
          //column บน ลงล่าง
          mainAxisAlignment: MainAxisAlignment.center,
          //MainAxisAlignment ของ Column คือแนวตั้ง
          children: <Widget>[
            //row ขวาไปซ้าย
            Row(
              //MainAxisAlignment ของ Row คือแนวนอน
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Text('Hello'), Text('Flutter')],
            ),
            //text
            Text(
              '$title .LTD',
              //การเรียกใช้ textTheme จากหน้า main
              style: Theme.of(context).textTheme.headline1,
            ),
            //Button version 1.22+
            ElevatedButton(
              onPressed: () {
                setState(() {
                  //method Widget จะถูก Re bulid อีกครั้ง
                  title = 'TOT.CO.TH';
                });
              },
              child: Text('กดเลย'),
            ),

            //Button version 1.22+
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                    context, 'homestack/about'); //เรียกใช้หน้า abount
              },
              child: Text('เกี่ยวกับ'),
            ),

            //เรียก Widget class Header ที่เราเขียนเอง
            //const นำหน้ามันจะ Build แค่ครั้งเดียวในกณีที่ข้อมูลไม่มีการเปลี่ยนแปลง
            const Header(message: 'Hello TOT 2021'), // widgets ที่เราเขียนไว้

            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
