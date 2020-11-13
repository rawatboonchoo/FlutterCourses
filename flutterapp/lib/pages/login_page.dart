import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
//import convert Decode Json
import 'dart:convert';
//import http
import 'package:http/http.dart' as http;
//flushbar show message
import 'package:flushbar/flushbar.dart';
//shared_preferences //ไว้สำหรับเก็บข้อมูลในเครื่องรูปแบบ Key Value
import 'package:shared_preferences/shared_preferences.dart';

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

      //เกบข้อมูลลงในเครื่อง SharedPreferences
      SharedPreferences prefs = await SharedPreferences.getInstance();
      //เราจะเกบข้อมูลทั้งก้อน
      //response.body มันเป็นข้อมูลสติง ในรูปแบบ json
      await prefs.setString('token', response.body);

      //get profile
      var profileUrl = 'https://api.codingthailand.com/api/profile';
      var responseProfile = await http.get(profileUrl,
          headers: {'Authorization': 'Bearer ${token['access_token']}'});
      Map<String, dynamic> profile = json.decode(responseProfile.body);
      //decode แปลง string to dart
      //encode แปลง dart to straing
      //       {
      //     "message": "success",
      //     "status_code": 200,
      //     "data": {
      //         "user": {
      //             "id": 2044,
      //             "name": "rawat boonchoo",
      //             "email": "rawat@gmail.com",
      //             "email_verified_at": null,
      //             "dob": "2019-09-18",
      //             "role": "member",
      //             "created_at": "2020-11-12 14:57:06",
      //             "updated_at": "2020-11-12 14:57:06"
      //         }
      //     }
      // }
      var user = profile['data']['user']; //{id:111, name: jonf...}
      //เกบข้อมูลลง SharedPreferences
      await prefs.setString('profile', json.encode(user));
      print('profile: $user');

      //pushNamedAndRemoveUntil กลับไปหน้า /homestack และลบหน้าที่เคยเปิดไว้
      Navigator.pushNamedAndRemoveUntil(
          context, '/homestack', (route) => false);

      //print(feedback['message']);
      // Flushbar(
      //   title: "Success",
      //   message: '${token['access_token']}',
      //   icon: Icon(
      //     Icons.info_outline,
      //     size: 28.0,
      //     color: Colors.pink[300],
      //   ),
      //   duration: Duration(seconds: 3),
      //   leftBarIndicatorColor: Colors.blue[300],
      // )..show(context);

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
                      Expanded(
                        child: ElevatedButton.icon(
                          label: Text('Log In'),
                          icon: Icon(Icons.login_rounded),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.purple,
                            //side: BorderSide(color: Colors.red, width: 5),
                            textStyle: TextStyle(
                              fontSize: 20,
                            ),
                            padding: EdgeInsets.all(12),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            // shape: const BeveledRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                          ),
                          onPressed: () {
                            if (_fbKey.currentState.saveAndValidate()) {
                              // print(_fbKey.currentState.value);
                              login(_fbKey.currentState.value);
                            }
                          },
                        ),
                      ),

                      // MaterialButton(
                      //   child: Text("Log In"),
                      //   onPressed: () {
                      //     if (_fbKey.currentState.saveAndValidate()) {
                      //       login(_fbKey.currentState.value);
                      //     }
                      //   },
                      // ),
                      // MaterialButton(
                      //   child: Text("Register"),
                      //   onPressed: () {
                      //     //_fbKey.currentState.reset();
                      //     Navigator.pushNamed(context, '/register');
                      //   },
                      // ),
                      Expanded(
                        child: FlatButton(
                          child: Text("สมัครสมาชิก",
                              style: TextStyle(
                                  decoration: TextDecoration.underline)),
                          textColor: Colors.white,
                          onPressed: () {
                            // _fbKey.currentState.reset();
                            Navigator.pushNamed(context, '/register');
                          },
                        ),
                      )
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
