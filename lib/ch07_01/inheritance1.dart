// 1. 상속
// - extends 사용
// - subclass가 생성될 때 컴파일러에 의해 superclass의 default constuctor 호출되고, subclass의 default constructor 호출됨


// 부모 클래스
class SuperClass {
  int data1 = 10;

  // unnamed, no-argument constructor
  SuperClass() {
    print("SuperClass()");
  }

  void func() {
    print("SuperClass.func()");
  }
}

// 자식 클래스
class SubClass extends SuperClass {
}


main() {
  var obj = SubClass();       // SuperClass의 default constructor를 컴파일러가 자동 호출
  obj.func();
  print(obj.data1);
}