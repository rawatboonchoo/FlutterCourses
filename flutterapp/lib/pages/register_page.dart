import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
//import convert Decode Json
import 'dart:convert';
//import http
import 'package:http/http.dart' as http;
//flushbar show message
import 'package:flushbar/flushbar.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //form
  final GlobalKey<FormBuilderState> _fbKey = GlobalKey<FormBuilderState>();

  Future<void> register(Map formValues) async {
    //ข้อมูลจะเป็น Map
    //formValues['name']
    //print(formValues);

    // {
    //     "message": "ไม่สามารถลงทะเบียนได้ ข้อมูลไม่ถูกต้อง.",
    //     "errors": {
    //         "email": [
    //             "มีผู้ใช้งานอีเมล์นี้ในระบบแล้ว กรุณาลองใหม่"
    //         ]
    //     },
    //     "status_code": 422
    // }
    // ['errors']['email'][0] //มีผู้ใช้งานอีเมล์นี้ในระบบแล้ว กรุณาลองใหม่
    var url = 'https://api.codingthailand.com/api/register';
    var response = await http.post(url,
        headers: {'Content-Type': 'application/json'},
        //encode object dart to json
        body: json.encode({
          "name": formValues['name'],
          "email": formValues['email'],
          "password": formValues['password']
        }));
    //seccess status code 201
    if (response.statusCode == 201) {
      Map<String, dynamic> feedback = json.decode(response.body);
      //print(feedback['message']);
      Flushbar(
        title: "Success",
        message: feedback['message'],
        icon: Icon(
          Icons.info_outline,
          size: 28.0,
          color: Colors.pink[300],
        ),
        duration: Duration(seconds: 3),
        leftBarIndicatorColor: Colors.blue[300],
      )..show(context);

      //กลับไปที่หน้า login
      //ทำการหน่วงเวลาแล้วค่อยไปหน้าล็อกอิน
      Future.delayed(Duration(minutes: 3), () {
        Navigator.pop(context);
      });
    } else {
      Map<String, dynamic> err = json.decode(response.body);
      //print(err['errors']['email'][0]);
      Flushbar(
        title: "Failed",
        message: err['errors']['email'][0],
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
                colors: [Colors.white, Colors.pink],
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
                  Text(
                    'ลงทะเบียน',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                  //ฟอร์ม
                  FormBuilder(
                    key: _fbKey,
                    initialValue: {'name': '', 'email': '', 'password': ''},
                    autovalidateMode: AutovalidateMode
                        .always, // แสดง validate ทันทีเมื่อมีการคีย์
                    child: Column(
                      children: <Widget>[
                        FormBuilderTextField(
                          style: TextStyle(color: Colors.white),
                          attribute: "name",
                          maxLines: 1, //บรรทัดเดียว
                          keyboardType:
                              TextInputType.text, //การเลือกรูปแบบคีบอร์ด
                          decoration: InputDecoration(labelText: "Fullname"),
                          validators: [
                            FormBuilderValidators.required(
                                errorText: "Please key fullname"),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ), //คั้นระยะห่าง
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
                          style: TextStyle(color: Colors.white),
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
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      MaterialButton(
                        padding: EdgeInsets.all(10),
                        color: Colors.blue,
                        minWidth: 100,
                        height: 30,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Text(
                          "ย้อนกลับ",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () {
                          //print(_fbKey.currentState.value);
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(
                        width: 50,
                      ),
                      MaterialButton(
                        padding: EdgeInsets.all(10),
                        color: Colors.deepPurple,
                        minWidth: 100,
                        height: 30,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                        child: Text(
                          "ลงทะเบียน",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () {
                          //print(_fbKey.currentState.value);
                          //Navigator.pop(context);
                          if (_fbKey.currentState.saveAndValidate()) {
                            //print(_fbKey.currentState.value);
                            register(_fbKey.currentState.value);
                          }
                        },
                      ),
                      // MaterialButton(
                      //   child: Text("Register"),
                      //   onPressed: () {
                      //     //_fbKey.currentState.reset();
                      //   },
                      // ),
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
