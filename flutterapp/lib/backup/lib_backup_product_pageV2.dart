// import 'package:flutter/material.dart';
// import 'package:fluttertot/models/product_model.dart';
// import 'package:fluttertot/widgets/menu.dart';
// import 'package:http/http.dart' as http;
// import 'dart:convert';

// class ProductPage extends StatefulWidget {
//   ProductPage({Key key}) : super(key: key);

//   @override
//   _ProductPageState createState() => _ProductPageState();
// }

// class _ProductPageState extends State<ProductPage> {
//   Future<Product> futureProduct;

//   Future<Product> getData() async {
//     var url = 'https://api.codingthailand.com/api/course';
//     var response = await http.get(url);
//     // print(json.decode(response.body));
//     if (response.statusCode == 200) {
//       // นำ json ไปใส่ที่โมเดล Product
//       final Product product = Product.fromJson(json.decode(response.body));
//       return product;
//     } else {
//       throw Exception('Failed to load product');
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     futureProduct = getData();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: Menu(),
//       appBar: AppBar(title: Text('สินค้า')),
//       body: FutureBuilder<Product>(
//         future: futureProduct,
//         builder: (context, snapshot) {
//           if (snapshot.hasData) {
//             return ListView.separated(
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     onTap: () {
//                       Navigator.pushNamed(context, 'productstack/detail',
//                           arguments: {
//                             'id': snapshot.data.data[index].id,
//                             'title': snapshot.data.data[index].title
//                           });
//                     },
//                     leading: Container(
//                       width: 80,
//                       height: 80,
//                       decoration: BoxDecoration(
//                           shape: BoxShape.rectangle,
//                           image: DecorationImage(
//                               image: NetworkImage(
//                                   snapshot.data.data[index].picture),
//                               fit: BoxFit.cover)),
//                     ),
//                     title: Text('${snapshot.data.data[index].title}'),
//                     subtitle: Text('${snapshot.data.data[index].detail}'),
//                     trailing: Chip(
//                         label: Text('${snapshot.data.data[index].view}'),
//                         backgroundColor: Colors.red[400]),
//                   );
//                 },
//                 separatorBuilder: (context, index) => Divider(),
//                 itemCount: snapshot.data.data.length);
//           } else if (snapshot.hasError) {
//             return Center(
//                 child: Text('เกิดข้อผิดพลาดจาก Server ${snapshot.error}'));
//           }

//           return Center(child: CircularProgressIndicator());
//         },
//       ),
//     );
//   }
// }
