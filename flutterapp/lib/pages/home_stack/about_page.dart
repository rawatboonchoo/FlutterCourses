
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
      body: SingleChildScrollView(
        //SingleChildScrollView เกียวกับหน้าจอเล็กใหญ่ไม่เท่ากัน
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/building.png'),
              SafeArea(
                child:Padding(
                  padding:EdgeInsets.all(10),
                  child: Column(
                    //crossAxisAlignment : ซ้ายไปขวา
                    //mainAxisAlignment: บนลงล่าง
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text('TOT PUBLIC COMPANY LIMITED.',style:TextStyle(fontSize:25,fontWeight:FontWeight.bold )),
                      Divider(),//เส้นคั้นสีเท่าๆ
                      Text('89, 2 ถ. แจ้งวัฒนะ แขวง ทุ่งสองห้อง เขต หลักสี่ กรุงเทพมหานคร 10210'),
                      Divider(),//เส้นคั้นสีเท่าๆ
                      SizedBox(height: 20,),//กล่องขั้น
                      Row(
                        children: [
                          Column(
                            children: [
                              // Text('data'),
                              // SizedBox(height: 20,),
                              Icon(Icons.wb_sunny,color: Colors.orange,size: 50,),
                            ],
                          ),
                          SizedBox(width: 30),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(children: [Text('81*'),]), 
                               Row(children: [Text('สวัสดีวันอังคาร'),]),
                            ],
                          )
                        ],
                      ),
                      Divider(),
                      Wrap(
                        spacing: 8, //ระยะห่าง
                        children: List.generate(7, (index) => 
                          //List.generate 
                          Chip(
                            label: Text('${index + 1} บุคลากร', style: TextStyle(color: Colors.white),),
                            avatar: Icon(Icons.person_outline,color:Colors.white,),
                            backgroundColor: Colors.deepOrangeAccent,
                            ),
                        ),
                      ),
                      Divider(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleAvatar(backgroundImage:AssetImage('assets/images/me.png'),radius: 30,),
                          CircleAvatar(backgroundImage:AssetImage('assets/images/me.png'),radius: 30,),
                          CircleAvatar(backgroundImage:AssetImage('assets/images/me.png'),radius: 30,),
                          SizedBox(
                            
                            child: Column(                              
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Icon(Icons.cake),
                                Icon(Icons.lock_clock),
                                Icon(Icons.cake),
                              ],
                            ),
                          )
                        ],
                      ),

                    ],
                  ),
                )),
            ],            
          ),
      ),
    );
  }
}
