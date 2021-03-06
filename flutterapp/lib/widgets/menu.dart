import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutterapp/redux/app_reducer.dart';

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
          StoreConnector<AppState, Map<String, dynamic>>(
            //poperty ของ StoreConnector
            distinct: true, //ถ้าเป็นค่าเดิมไม่ต้องรีเด้นเดอร์
            converter: (store) => store.state.profileState.profile,
            builder: (context, profile) {
              return UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/me.png'),
                ),
                accountEmail: Text('${profile['email']}'),
                accountName: Text('${profile['name']} '),
              );
            },
          ), //อยากเปลี่ยนข้อมูลให้เรียก action

          //เรียงจากบนลงล่าง
          // UserAccountsDrawerHeader(
          //     currentAccountPicture: CircleAvatar(
          //       backgroundImage: AssetImage('assets/images/me.png'),
          //     ),
          //     accountName: Text('rawat boonchoo'),
          //     accountEmail: Text('boonchoo.rawat@gmail.com')
          //     ),
          //ListTile 1 อันเท่ากับ 1 แถว จะเป็นลูกของ ListView
          ListTile(
            leading: Icon(Icons.home), //วซ้าย
            title: Text('Home'),
            trailing: Icon(Icons.arrow_right), //ขาว
            //ModalRoute check rount จาก home_stack.dart
            selected: ModalRoute.of(context).settings.name == 'homestack/home'
                ? true
                : false, //แจ้งว่าเราเลือกเมนูอะไรอยู่
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
            title: Text('Product'),
            trailing: Icon(Icons.arrow_right), //ขาว
            selected:
                ModalRoute.of(context).settings.name == 'productstack/product'
                    ? true
                    : false,
            onTap: () {
              //ไว้สำหรับใส่ action
              //product stack
              //ไว้สำหรับใส่ action
              //pushName คือการทับกันไม่ควรใช้กับพวกเมนู
              //pushNamedAndRemoveUntil ถ้ามีหน้าอะไรทับกันอยู่ จะลบทุกอย่าง และจะเป็นหน้าแรกแน่ๆ
              //rootNavigator: true เนื่องจากหน้า manu อยู่คนละ Forder กับ product_page
              Navigator.of(context, rootNavigator: true)
                  .pushNamedAndRemoveUntil('/productstack', (route) => false);
            },
          )
        ],
      ),
    );
  }
}
