// 2. 오버라이딩
// - 별도로 @override 쓸 필요는 없다. ==> 원래 optional인데다 SuperClass에 접근할 수 없는 경우의 메소드에만 쓰라고 권장됨(https://api.dart.dev/be/137507/dart-core/override-constant.html)


// 부모 클래스
class SuperClass {
  int data1 = 10;

  SuperClass() {
    print("SuperClass() called");
  }

  void func() {
    print("SuperClass.func() called");
  }
}

// 자식 클래스
class SubClass extends SuperClass {
  int data1 =  20;

  // 생성자가 명시적으로 없으면 ==> 컴파일러가 아래 코드를 자동으로 삽입한 것과 같다
  // SubClass(): super();

  void func() {
    print("SubClass.func() called");
  }
}


main() {
  var obj = SubClass();         // SuperClass() called
  obj.func();                   // SubClass.func() called
  print(obj.data1);             // 20
}