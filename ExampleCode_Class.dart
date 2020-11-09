//class
class Staff {
  String fullname;
  double salary;

  Staff({this.fullname, this.salary}) {}

  //สร้างฟัง์ชันชื่อ salaryWithVat return เงินเดือน + vat
  double salaryWithVat() {
    return salary + (salary * 0.07);
  }

  //getter
  double get salaryWithVat2 => salary + (salary * 0.07);

  void showData() {
    print('$fullname เงินเดือนสุทธิ: ${salaryWithVat()} บาท');
  }
}

void main() {
  var obj = Staff(fullname: 'John', salary: 10000);
  obj.showData();
  print(obj.salaryWithVat2);
  var obj2 = Staff(fullname: 'Mary', salary: 20000);
  obj2.showData();
}
