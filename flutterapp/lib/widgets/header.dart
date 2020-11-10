import 'package:flutter/material.dart'; // พิม importM

//พิม statelessW
class Header extends StatelessWidget {
  const Header({Key key, this.message}) : super(key: key);
  final String message;

  @override
  Widget build(BuildContext context) {
    return Text(message, style: TextStyle(color: Colors.blue[400]));
    
  }
}
