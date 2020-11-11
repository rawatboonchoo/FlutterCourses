import 'package:flutter/material.dart';
import 'package:flutterapp/models/product_model.dart';
import 'package:flutterapp/widgets/menu.dart';

//import convert Decode Json
import 'dart:convert';
//import http
import 'package:http/http.dart' as http;

class ProductPage extends StatefulWidget {
  ProductPage({Key key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  //สร้างตัวแปรมารับข้อมูลมทราเป็น arra
  List<Data> data = [];

  //ดึงข้อมูลมาจาก Database ข้อมูลต้องเป็นรูปแบบ json
  Future<void> getData() async {
    var url = 'https://api.codingthailand.com/api/course';
    var response = await http.get(url);
    //print(response.body); //ดูข้อมูล
    //response เป็น String ต้องแปลงเป็น Dart เพื่อใช้งาน
    //Decode String to Json
    //print(json.decode(response.body));
    //นำข้อมูล json ไปใส่ใน model ที่สร้างไว้
    final Product product = Product.fromJson(json.decode(response.body));
    //print(product.data);
    setState(() {
      //อย่าลืม setStat()
      data = product.data;
    });
  }

  @override
  void initState() {
    super.initState();
    print('initState (product page)');
    //get data form database
    getData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    print('dispose (product page)');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //drawer menu
      drawer: Menu(), //Menu() ที่เราสร้าางไว้
      appBar: AppBar(
        title: Text('Product Page'),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            onTap: () {
              Navigator.pushNamed(context, 'productstack/detail');
            },
            leading: Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                  color: const Color(0xff7c94b6),
                  shape: BoxShape.circle, //รูปทรง กลม / เหลี่ยม
                  image: DecorationImage(
                    image: NetworkImage(data[index].picture),
                    fit: BoxFit.cover,
                  ),
                  border: Border.all(
                    color: Colors.white10,
                    width: 1,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 1), // changes position of shadow
                    ),
                  ]),
            ),
            title: Text('${data[index].title}'),
            subtitle: Text('${data[index].detail}'),
            trailing: Chip(
              label: Text(
                '${data[index].view}',
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
        itemCount: data.length, //จำนวน array
      ),
    );
  }
}
