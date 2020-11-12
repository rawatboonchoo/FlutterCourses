import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
//import convert Decode Json
import 'dart:convert';
//import http
import 'package:http/http.dart' as http;
//flushbar show message
import 'package:flushbar/flushbar.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  //form
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  //login
  Future<void> login(Map formValues) async {
    //ข้อมูลจะเป็น Map

    var url = 'https://api.codingthailand.com/api/login';
    var response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        //encode object dart to json
        body: json.encode({
          "email": formValues['email'],
          "password": formValues['password']
        }));
    //seccess status code 200
    if (response.statusCode == 200) {
      Map<String, dynamic> token = json.decode(response.body);
      //print(feedback['message']);
      Flushbar(
        title: "Success",
        message: '${token['access_token']}',
        icon: Icon(
          Icons.info_outline,
          size: 28.0,
          color: Colors.pink[300],
        ),
        duration: Duration(seconds: 3),
        leftBarIndicatorColor: Colors.blue[300],
      )..show(context);

      //กลับไปที่หน้า home_stack
      //ทำการหน่วงเวลาแล้วค่อยไปหน้าล็อกอิน
      // Future.delayed(Duration(minutes: 3), () {
      //   Navigator.pop(context);
      // });
    } else {
      Map<String, dynamic> err = json.decode(response.body);
      //print(err['errors']['email'][0]);
      Flushbar(
        title: "Failed",
        message: err['message'],
        icon: Icon(
          Icons.info_outline,
          size: 28.0,
          color: Colors.pink[300],
        ),
        duration: Duration(seconds: 3),
        leftBarIndicatorColor: Colors.blue[300],
      )..show(context);
    }
  }

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
                  //ฟอร์ม
                  FormBuilder(
                    key: _fbKey,
                    initialValue: {'email': '', 'password': ''},
                    autovalidateMode: AutovalidateMode
                        .always, // แสดง validate ทันทีเมื่อมีการคีย์
                    child: Column(
                      children: <Widget>[
                        FormBuilderTextField(
                          style: TextStyle(color: Colors.white),
                          attribute: "email",
                          maxLines: 1, //บรรทัดเดียว
                          keyboardType: TextInputType
                              .emailAddress, //การเลือกรูปแบบคีบอร์ด
                          decoration: InputDecoration(labelText: "Email"),
                          validators: [
                            FormBuilderValidators.required(
                                errorText: "Plaese email"),
                            FormBuilderValidators.email(
                                errorText: "Pattel mail not found"),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ), //คั้นระยะห่าง
                        FormBuilderTextField(
                          attribute: "password",
                          maxLines: 1, //บรรทัดเดียว
                          keyboardType: TextInputType
                              .visiblePassword, //การเลือกรูปแบบคีบอร์ด
                          obscureText: true, //ให้เห็นพาสเวิดเป็น ...
                          decoration: InputDecoration(labelText: "Password"),
                          validators: [
                            FormBuilderValidators.required(
                                errorText: "Plaese password.."),
                            FormBuilderValidators.minLength(3,
                                errorText: 'password number next tree'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Row(
                    children: <Widget>[
                      MaterialButton(
                        child: Text("Log In"),
                        onPressed: () {
                          if (_fbKey.currentState.saveAndValidate()) {
                            login(_fbKey.currentState.value);
                          }
                        },
                      ),
                      MaterialButton(
                        child: Text("Register"),
                        onPressed: () {
                          //_fbKey.currentState.reset();
                          Navigator.pushNamed(context, '/register');
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
