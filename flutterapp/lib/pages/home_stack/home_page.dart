
import 'package:flutter/material.dart';
import 'package:flutterapp/widgets/menu.dart';

//shared_preferences //ไว้สำหรับเก็บข้อมูลในเครื่องรูปแบบ Key Value
import 'package:shared_preferences/shared_preferences.dart';

class MyHomePage extends StatefulWidget {
  //StatefulWidget จะมี _MyHomePageState
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // int _counter = 0;
  // String title = "TOT Plubic Company";

  // void _incrementCounter() {
  //   setState(() {
  //     //ทุกครั้งที่มีการ กดจะไปเรียก Widget build
  //     _counter++;
  //   });
  // }

  //initState //จะเกิดขึ้น 1 ครั้งเมื่อมีการเรียกใช้งานจากหน้าจอ one-only
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //นิยมเอาไว้ดึงข้อมูลมาจากฐานข้อมูล
    print('initState (home page)');
  }

//dispose //จะเกิดขึ้น 1 ครั้งเมื่อโปรแกรมถูกปิดไป
  @override
  void dispose() {
    // TODO: implement dispose
    print('dispose (home page)');
    super.dispose();
  }
  //ออกจากระบบ
  Future<void> logout() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //Future ต้องมี await กำกับ
    await prefs.remove('token');
    await prefs.remove('profile');
    //กลับไปหน้าล็อกอิน Navigator.of เนื่องจากเราอยู่ในหน้า home_stack เพราะหน้า login อยู่ในหน้าแรก
    Navigator.of(context, rootNavigator: true)
        .pushNamedAndRemoveUntil('/login', (route) => false);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Scaffold จะประกอบไปด้วย appBar และ body
      //ปุ่มเมนู
      // drawer: เปิดจากด้านซ้าย
      //endDrawer: เปิดจากด้านขวา
      
      drawer: Menu() , //ควรที่จะแยกเพื่อมีการเรียกใช้หลายหน้า
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
              onPressed: (){
                logout();
              })
        ],
        //leading: //คือ icon ทางซ้ายบนของ Appbar
      ),
      body: GridView.count(
        primary: false,
        padding: const EdgeInsets.all(20),
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        crossAxisCount: 2, //จำนวน Column
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.person_add,
                  size: 80,
                  color: Colors.blue,
                  
                ),
                Text(
                  'เกี่ยวกับเรา',
                  style: TextStyle(fontSize: 16, color: Colors.pink),
                ),
                OutlineButton(
                  onPressed: () {
                    Navigator.pushNamed(
                        context, 'homestack/about'); //เรียกใช้หน้า abount
                  },
                  child: Text('เกี่ยวกับ'),
                )
              ],
            ),
            color: Colors.teal[100],
          ),
          GestureDetector(
            //GestureDetector เพื่อให้ Container สามารถกด ไดเ
            onTap: () {
              //onTap คือการใช้ มือกด ใน GestureDetector จะไม่มี onPressed
              Navigator.pushNamed(
                  context, 'homestack/about'); //เรียกใช้หน้า abount
            },
            child: Container(
              padding: const EdgeInsets.all(8),              
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.map_rounded, size: 80, color: Colors.amberAccent[900],
                  ),
                  Text('แผนที่')
                ],
              ),
              color: Colors.teal[200],
            ),
          ),
          OutlineButton(

            onPressed: (){},
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                 Icon(
                    Icons.map_rounded, size: 80, color: Colors.amberAccent[900],
                  ),
                  Text('แผนที่')
              ],
            ),
            ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Who scream'),
            color: Colors.teal[400],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Revolution is coming...'),
            color: Colors.teal[500],
          ),
          Container(
            padding: const EdgeInsets.all(8),
            child: const Text('Revolution, they...'),
            color: Colors.teal[600],
          ),
        ],
      ),

      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
