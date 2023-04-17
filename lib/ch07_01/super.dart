// 3. super: 상속이 이루어진 후, 자식클래스에서 명시적으로 부모클래스의 변수나 메소드를 접근하려는 경우 사용
// (주의) subclass 내부에서만 super를 사용할 수 있고,
//       subclass 외부에서 인스턴스이름.super <-- 이렇게는 사용할 수 없다.

class SuperClass {
  int data1 = 10;

  SuperClass() {
    print("SuperClass() called");
  }

  void func() {
    print("SuperClass.func() called");
  }
}

class SubClass extends SuperClass {
  int data1 =  20;

  void func() {
    super.func();
    print("SubClass.func() called");
    print("SubClass.data1: $data1, SuperClass.data1: ${super.data1}");
  }
}


main() {
  var obj = SubClass();
  obj.func();                   // SubClass.data1: 20, SuperClass.data1: 10
  // obj.super.func()           // 에러: 이렇게 사용할 수 없다.
}