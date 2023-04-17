// type


main() {

  // 타입의 사용 + String template
  int no = 10;
  String name = 'kkang';
  String myFun() {
    return 'kim';
  }
  // print("$name, ${10 + 20}, ${myFun()}");   // kkang, 30, kim



  // int, double간 typecast 안된다
  int i1 = 10;
  double d1 = 10.0;

  // double d2 = i1;   // 에러: Error: A value of type 'int' can't be assigned to a variable of type 'double'.
  // int i2 = d1;      // 에러: Error: A value of type 'double' can't be assigned to a variable of type 'int'.

  double d2 = i1.toDouble();
  int i2 = d1.toInt();
  // print("d2: $d2, i2: $i2");    // d2: 10.0, i2: 10



  // String -> int, double
  String s1 = '10';
  String s2 = '100.0';

  int i3 = int.parse(s1);
  double d3 = double.parse(s2);
  print("i3: $i3, d3: $d3");      // i3: 10, d3: 100.0


  // 쉼표 있는 숫자 문자열 ==> 숫자형 변환 될까? X
  s1 = '10,000';
  s2 = '10.5';
  // int i4 = int.parse(s1);         // 에러: FormatException: Invalid radix-10 number (at character 1) 10,000
  // int i5 = int.parse(s2);         // 에러: FormatException: Invalid radix-10 number (at character 1)

  // double d4 = double.parse(s1);    // FormatException: Invalid double 10,000
  double d5 = double.parse(s2);
  print("d5: $d5");


  // 쉼표 있는 문자열에서 쉼표 모두 제거(주의: 리턴값으로 받아야한다. 원본은 안 바뀐다.)
  s2 = s1.replaceAll(',', '');
  print("s1: $s1, s2: $s2");

}