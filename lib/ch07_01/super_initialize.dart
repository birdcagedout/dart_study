// 5. 부모클래스의 멤버 초기화
// 자식클래스 생성시 초기값을 부모클래스 멤버 초기화에 사용하는 경우

class SuperClass {
  String? name;
  int? age;

  SuperClass(this.name, this.age);
}


// 자식클래스 생성시 받은 초기값을 부모클래스의 생성자로 보내서 부모 멤버 초기화
class SubClass1 extends SuperClass {
  // SubClass(String name, int age): super();             // 에러: 부모클래스에는 default constructor가 없다. ==> 생성자 signature에 맞게 명시적으로 호출해야 한다.
  SubClass1(String name, int age): super(name, age) {}    // OK
}


// 자식클래스 생성시 받은 초기값을 부모클래스의 생성자로 보내서 부모 멤버 초기화 ==> 축약형
class SubClass2 extends SuperClass {
  SubClass2(super.name, super.age);
}



main() {
  var obj1 = SubClass1('Kim', 45);
  var obj2 = SubClass2('Kang', 55);

  print("obj1.name: ${obj1.name}, obj1.age: ${obj1.age} ");
  print("obj2.name: ${obj2.name}, obj2.age: ${obj2.age}");
}