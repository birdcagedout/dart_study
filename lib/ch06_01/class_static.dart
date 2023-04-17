class MyClass {
  String data1 = 'hello';
  static String data2 = 'world';

  myFunc1() {}
  static myFunc2() {}
}


main() {
  MyClass obj = MyClass();


  // property 접근
  obj.data1 = 'world';
  // obj.data2 = 'world';     //  에러: static property는 인스턴스 이름으로 접근할 수 없다.


  // method 접근
  obj.myFunc1();
  // obj.myFunc2();           // 에러: staic 메소드는 인스턴스 이름으로 접근할 수 없다.
  MyClass.myFunc2();          //      클래스 이름으로 접근해야 한다.

}