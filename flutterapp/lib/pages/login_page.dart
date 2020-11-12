import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //form
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //หน้า login ไม่เอา appbar
      body: Container(
        //ไล่เฉดสี
        decoration: BoxDecoration(
            gradient: LinearGradient(
                //ไล่เฉดสี 2 สีจากเข้มไปหาอ่อน
                colors: [Colors.deepPurple[800], Colors.lightBlue[50]],
                //จากบน
                begin: Alignment.topRight,
                //ลงล่าง
                end: Alignment.bottomLeft)),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(40),
              child: Column(
                children: [
                  //ออกแบบฟร์อม
                  FlutterLogo(
                    size: 90,
                  ),
                  FormBuilder(
                    key: _fbKey,
                    initialValue: {'email': ''},
                    child: Column(
                      children: <Widget>[
                        FormBuilderTextField(
                          attribute: "email",
                          decoration: InputDecoration(labelText: "Email"),
                          validators: [
                            FormBuilderValidators.required(
                                errorText: "Plaese email"),
                            FormBuilderValidators.email(
                                errorText: "Pattel mail not found"),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      MaterialButton(
                        child: Text("Submit"),
                        onPressed: () {
                          if (_fbKey.currentState.saveAndValidate()) {
                            print(_fbKey.currentState.value);
                          }
                        },
                      ),
                      MaterialButton(
                        child: Text("Reset"),
                        onPressed: () {
                          _fbKey.currentState.reset();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
