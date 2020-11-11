import 'package:flutter/material.dart';

class Menu extends StatefulWidget {
  Menu({Key key}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        //ตกแต่งใน child ตัวนี้ ListView จะมี children สำเร็จรููป
        children: [
          //เรียงจากบนลงล่าง
          UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/me.png'),
              ),
              accountName: Text('rawat boonchoo'),
              accountEmail: Text('boonchoo.rawat@gmail.com')),
          //ListTile 1 อันเท่ากับ 1 แถว จะเป็นลูกของ ListView
          ListTile(
            leading: Icon(Icons.home), //วซ้าย
            title: Text('Home'),
            trailing: Icon(Icons.arrow_right), //ขาว
            //ModalRoute check rount จาก home_stack.dart
            selected: ModalRoute.of(context).settings.name == 'homestack/home' ? true : false, //แจ้งว่าเราเลือกเมนูอะไรอยู่
            onTap: () {
              //ไว้สำหรับใส่ action
              //home stack
              //pushName คือการทับกันไม่ควรใช้กับพวกเมนู
              //pushNamedAndRemoveUntil ถ้ามีหน้าอะไรทับกันอยู่ จะลบทุกอย่าง และจะเป็นหน้าแรกแน่ๆ
              //rootNavigator: true เนื่องจากหน้า manu อยู่คนละ Forder กับ home_page
              Navigator.of(context, rootNavigator: true)
                  .pushNamedAndRemoveUntil('/homestack', (route) => false);
            },
          ),
          ListTile(
            leading: Icon(Icons.star_border), //วซ้าย
            title: Text('สิ้นค้า'),
            trailing: Icon(Icons.arrow_right), //ขาว
            onTap: () {
              //ไว้สำหรับใส่ action
              //product stack
            },
          )
        ],
      ),
    );
  }
}
