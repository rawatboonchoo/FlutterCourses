// - Object เป็น instance ของ Class
// - Array ใน Dart จะเรียกว่า List
//     List<int>
//     List<dynamic> //ถ้าไม่รู้ตัวแปร

//link crate code
//https://dartpad.dev/

void main() {
  print("------ตัวแปรในภาษา Dart---------");
  //ตัวแปรในภาษา Dart
  String  _man         =     "Rawat boonchoo";
  int     _age         =      30;
  double  _salary      =      15000.55;
  var     _fullname; //null //var สามารถรับค่าได้หมด แล้วแต่ค่าตัวแปรที่ได้
  _fullname   =   "Jone";
  print(_man);
  print(_age);
  print(_salary);
  print("ชื่อ : "+_fullname);
  
  print("------แปลง String into a number---------");
  //แปลง String into a number
  // STring -> int
  var one = int.parse('1');
  print(one);
  
  print("------การเชื่อม String---------");
  //String 
  // เชื่อมข้อความ ให้ใช้ $variable
  // เชื่อม function ใช้ ${name.toLowerCase()}
  var salary = 10000;
  var name   = 'TOT Public Company';
  var s1     = 'Single $salary work well for \n' + 'a' + 'string literals.';
  var s2     = "It's even ${name.toLowerCase()} to...";
  print(s1);
  print(s2);
  print('สวัสดีคุณ $_man อายุ $_age ปี เงินเดือน ${_salary + 100} บาท');
  
  print("------Booleans---------");
  //ฺBooleans
  var isShow = true;
  bool isActive = false;
  //if else แบบสั้น
  var message = isShow ? 'Hello true' : 'Hello false';
  print(message);
  
  
  print("------Lists จะเมือนกับ array ในภาษาอื่นๆ---------");
  //Lists จะเมือนกับ array ในภาษาอื่นๆ
  //กรณีไม่รู้ตัวแปรให้ประกาศเป็น var
  List<int> age     = [10, 20 ,30];
  var       age2    = [40, 50, 60]; //กรณีไม่รู้ตัวแปร
  List<String>  user   = ['man' ,'ann' ,'green'];
  var           user2  = ['man' ,'ann' ,'10']; //กรณีไม่รู้ตัวแปร
  for (var u in user){
    print(u);
  }
  //lengt list
  print(user.length);
  //index
  print('*---*');
  print(age[0]);
  print('*---*');
  
  //spead oprator หรือการ concat array || ผสาน array หรือ รวม array
  var listA = [...age, ...age2, 70];
  for (var u in listA){
    print(u);
  }
  
  
  print("------Maps การเก็บข้อมูลในรูปแบบ Key,value---------");
  //Maps การเก็บข้อมูลในรูปแบบ Key,value
  //รูปแบบที่ 1
  var gifts = {
      //key     :   value
      'name'    :   'rawat boonchoo',
      'age'     :   '35'
  };
  
  print(gifts); //json string
  print(gifts['name']);
  print('สวัสดีคุณ ${gifts['name']} อายุของคุณคือ  ${gifts['age']}');
  
  //หรือ ประกาศตัวแปรก่อนแล้วค่อยแอด key : value ลงไปที่หลัง
  //รูปแบบที่ 2
  var gifts1 = Map();
      gifts1['name']  = 'Kamonwan boonchoo';
      gifts1['age']   = 28;
  print(gifts1); //json string
  print('สวัสดีคุณ ${gifts1['name']} อายุของคุณคือ  ${gifts1['age']}'); 
  
  //หรือ ประกาศแลลเต็มรูปแบบ
  //dynamic คือ Value ที่มีหลายรูปแปป ทั้ง String int
  Map<String, dynamic> _user = {
    'name'    :   'Natha Boonchoo',
    'age'     :    6
  };
  
  print('สวัสดีคุณ ${_user['name']} อายุของคุณคือ  ${_user['age']}');
  
  var _image = {
    'tags' : ['google','facebook'],
    'url'  : 'www.google.com'
  };
  
  print('${_image['tags'].toString()}');
  
  
  print("------if operator check null : ?? ---------");
  
 
 print("------function Names parameter---------");
 //function
  var result = sum(10, 50);
  var result2 = sum2(num1:50, num2:80); //function Names parameter
  print(result2);
  print(result);
  
  showMessage();
  
  showMessage2(msg:'Dart', isShow:true, age:null); //function Names parameter
  
  
}
//end main

//function return
int sum(int a, int b){
    //function return
    return a + b;
}

//function show
void showMessage(){
  print('Hello');
}

//function Names parameter
void showMessage2({String msg, bool isShow, int age}){
  print('Hello $msg $isShow ${age ?? 0 }'); //if operator check null : ??
}

//function Names parameter จะใช้บ่อยมากใน Fultter
int sum2({int num1, int num2}){
    
  return num1 + num2 ;
}


