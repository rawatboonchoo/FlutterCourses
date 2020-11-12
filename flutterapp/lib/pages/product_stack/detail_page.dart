import 'package:flutter/material.dart';
//import convert Decode Json
import 'dart:convert';
//import http
import 'package:http/http.dart' as http;

class DetailPage extends StatefulWidget {
  DetailPage({Key key}) : super(key: key);

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  Map<String, dynamic> product; //สร้างตัวแปร Map เพื่อรับข้อมูล
  //ใช้ Dynamic รับข้อมูล จาก Database api
  Map<String, dynamic> detail;

  Future<dynamic> getData(int id) async {
    var url = 'https://api.codingthailand.com/api/course/$id';
    var response = await http.get(url);
    //print(response.body); //ดูข้อมูล
    //response เป็น String ต้องแปลงเป็น Dart เพื่อใช้งาน
    //Decode String to Json
    //print(json.decode(response.body));
    //นำข้อมูล json ไปใส่ในตัวแปร detail ที่สร้างไว้
    if (response.statusCode == 200) {
      //check response.statusCode == 200
      detail = json.decode(response.body);

      //ตัวอย่างข้อมูล
      //   {
      // "status": "success",
      // "status_code": 200,
      // "data": [
      //     {
      //         "ch_id": 60,
      //         "course_id": 1,
      //         "ch_title": "ตอนที่ 1 ทำความรู้จักกับ HTML",
      //         "ch_dateadd": "2014-12-09",
      //         "ch_timetotal": "7:44",
      //         "ch_view": 14637,
      //         "ch_url": "bEWqFE8rqKA"
      //     },
      // print(detail['data']);
      // print(detail['status']);
      // print(detail['status_code']);
      //print('load data scuucessed');
      return detail;
    } else {
      //print('error from backend status cide 400/500');
      throw Exception('error from backend status cide 400/500');
    }
  }

  @override
  Widget build(BuildContext context) {
    product = ModalRoute.of(context)
        .settings
        .arguments; //ModalRoute.of(context).settings.arguments;
    //getData(product['id']);
    return Scaffold(
      appBar: AppBar(
        title: Text('${product['title']}'),
      ),
      body: FutureBuilder<dynamic>(
          //การใช้งาน FutureBuilder เพื่อดึงขอมูล getData
          future: getData(product['id']),
          builder: (context, snapshot) {
            if (snapshot.hasData) //snapshot.hasData มีข้อมูล
            {
              return ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                        '${snapshot.data['data'][index]['ch_title']}'), //snapshot.data['data'][index]['ch_title'] |snapshot คือข้อมูลทั้งหมด | data ข้มูลที่ return มา | ['data'] คือ Key data |
                    subtitle:
                        Text('${snapshot.data['data'][index]['ch_dateadd']}'),
                    trailing: Chip(
                      label: Text(
                        '${snapshot.data['data'][index]['ch_view']}',
                        style: TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.pink,
                    ),
                  );
                }, //โชว์รายการ
                separatorBuilder: (context, index) =>
                    //Divider(), //เส้นขีดขั้นจะใช้แสดงอะไร
                    SizedBox(
                  //ระยะห่างขั้นจะใช้แสดงอะไร
                  height: 30,
                ),
                itemCount: snapshot.data['data'].length, //จำนวน array
              );
            } else if (snapshot.hasError) {
              return Center(
                  child: Text('เกิดข้อผิดพลาดจาก Server ${snapshot.error}'));
            }

            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}
