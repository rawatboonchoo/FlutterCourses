// import 'package:flutter/material.dart';
// //import convert Decode Json
// import 'dart:convert';
// //import http
// import 'package:http/http.dart' as http;

// class FirePage extends StatefulWidget {
//   FirePage({Key key}) : super(key: key);

//   @override
//   _FirePageState createState() => _FirePageState();
// }

// class _FirePageState extends State<FirePage> {
//   Map<String, dynamic> data;
//   Future<dynamic> getData() async {
//     var url = 'https://natha-e4e83.firebaseio.com/Develop.json';
//     var response = await http.get(url);
//     if (response.statusCode == 200) {
//       data = json.decode(response.body);
//       //print(data);
//       return data;
//     }
//     else {
//       //print('error from backend status cide 400/500');
//       throw Exception('error from backend status cide 400/500');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     getData();
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('data'),
//       ),
//       body: FutureBuilder<dynamic>(
//           //การใช้งาน FutureBuilder เพื่อดึงขอมูล getData
//           future: getData(),
//           builder: (context, snapshot) {
//             if (snapshot.hasData) //snapshot.hasData มีข้อมูล
//             {
//               return ListView.separated(
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     title: Text(
//                         '${snapshot[index]['Site']}'), //snapshot.data['data'][index]['ch_title'] |snapshot คือข้อมูลทั้งหมด | data ข้มูลที่ return มา | ['data'] คือ Key data |
//                     subtitle:
//                         Text('${snapshot[index]['User']}'),
//                     trailing: Chip(
//                       label: Text(
//                         '${snapshot[index]['Pwd']}',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                       backgroundColor: Colors.pink,
//                     ),
//                   );
//                 }, //โชว์รายการ
//                 separatorBuilder: (context, index) =>
//                     //Divider(), //เส้นขีดขั้นจะใช้แสดงอะไร
//                     SizedBox(
//                   //ระยะห่างขั้นจะใช้แสดงอะไร
//                   height: 30,
//                 ),
//                 itemCount: snapshot.length, //จำนวน array
//               );
//             } else if (snapshot.hasError) {
//               return Center(
//                   child: Text('เกิดข้อผิดพลาดจาก Server ${snapshot.error}'));
//             }

//             return Center(child: CircularProgressIndicator());
//           }),
//     );
//   }
// }
