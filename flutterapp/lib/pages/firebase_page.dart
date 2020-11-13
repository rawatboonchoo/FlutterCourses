import 'package:flutter/material.dart';
//import convert Decode Json
import 'dart:convert';
//import http
import 'package:http/http.dart' as http;

class FirePage extends StatefulWidget {
  FirePage({Key key}) : super(key: key);

  @override
  _FirePageState createState() => _FirePageState();
}

class _FirePageState extends State<FirePage> {
  Map<String, dynamic> data;
  Future<dynamic> getData() async {
    var url = 'https://natha-e4e83.firebaseio.com/Develop.json';
    var response = await http.get(url);
    if (response.statusCode == 200) {
      data = json.decode(response.body);
      print(data);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: Text('data'),
    );
  }
}
