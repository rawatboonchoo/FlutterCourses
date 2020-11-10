import 'package:flutter/material.dart';

//statefuW
class AboutPage extends StatefulWidget {
  AboutPage({Key key, this.message}) : super(key: key);
  final String message;

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  String message = "เกี่ยวกับ";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About'),
      ),
      body: Text(message),
    );
  }
}
