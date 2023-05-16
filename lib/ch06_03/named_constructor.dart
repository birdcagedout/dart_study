// 1. named constructor: 생성자에 이름을 붙여서 인스턴스를 생성할 수 있다.
// - 다른 언어의 생성자 오버로딩보다 생성자별 기능과 의미를 명확하게 할 수 있어서 더 편리하다.
class MyClass1 {
  MyClass1(int first, int second) {}
  MyClass1.first(int first) {}
  MyClass1.second(int second) {}
}




// 2. 하나의 생성자에서 다른 생성자 호출하기
// - 하나의 생성자(2번) body 안에서 다른 생성자(1번)를 호출하려면 ==> this()를 호출해야 한다. (생성자1번 함수 이름을 호출하면 안 된다.)
class MyClass2 {
  late int data1;
  late int data2;

  // 기본 생성자
  MyClass2(int data1, int data2) {
    print("MyClass2() 생성자 호출됨");
    this.data1 = data1;
    this.data2 = data2;
  }

  // named constructor
  MyClass2.first(int data1) {
    print("MyClass2.first() 생성자 호출됨");
    MyClass2(data1, 0);                          // 실패: (의도와는 달리) 다른 생성자를 호출하는 코드가 아니라, MyClass타입의 인스턴스를 생성하는 코드에 불과하다. ==> 그래서 this() 호출이 필요!!
  }
}



// 3. 하나의 생성자에서 다른 생성자 호출할 때의 유의할 점
// - 생성자 body에서 this()를 호출할 수 없다. ==> 반드시 "초기화 리스트" 부분에서만 this()를 호출할 수 있다.
// - 초기화 리스트에서 this()를 호출하면 ==>   1) 해당 생성자는 body를 만들 수 없다.
//                                           2) 초기화 목록에 this() 외에 다른 코드는 넣을 수 없다.
class MyClass3 {
  late int data1;
  late int data2;

  // 기본 생성자
  MyClass3(int data1, int data2) {
    print("MyClass3() 생성자 호출됨");
    this.data1 = data1;
    this.data2 = data2;
  }

  // named constructor
  MyClass3.first(int data1): this(data1, 0);                      // OK
  // MyClass3.first(int data1): super();                      // OK

  // MyClass3.second(int data2) {                                 // 에러: this()는 생성자의 body에 쓸 수 없다. ==> 초기화 리스트 부분에만 쓸 수 있다.
  //   this(0, data2);
  // }

  // MyClass3.second(int data2): this(0, data2) {}                // 에러: 초기화 리스트에 this()를 쓰면 함수 body를 만들 수 없다.

  // MyClass3.second(int data2): this(0, data2), this.data1 = 0;  // 에러: 초기화 리스트에 this() 외에 다른 코드는 쓸 수 없다.
}



// 4. this로 named constructor 호출 가능
class MyClass4 {
  late int data1;
  late int data2;

  // 기본 생성자
  MyClass4(int data1, int data2) {
    print("MyClass4() 생성자 호출됨");
    this.data1 = data1;
    this.data2 = data2;
  }

  // named constructor
  MyClass4.first(int data1, [int data2 = 0]) {
    print("MyClass4.first() 생성자 호출됨");
    this.data1 = data1;
    this.data2 = data2;
  }

  MyClass4.second(int data2): this.first(0, data2);               // this.first()로 named constructor 호출
}




main() {
  // 기본 생성자
  MyClass2 m1 = MyClass2(10, 20);
  print("data1: ${m1.data1}, data2: ${m1.data2}");                // data1: 10, data2: 20


  // named constructor 내에서 다른 생성자를 호출
  // MyClass2 m2 = MyClass2.first(100);                            // LateInitializationError: Field 'data1' has not been initialized.
  // print("data1: ${m2.data1}, data2: ${m2.data2}");


  // named constructor
  MyClass3 m3 = MyClass3.first(100);
  print("data1: ${m3.data1}, data2: ${m3.data2}");                // data1: 100, data2: 0


  // this로 named constructor 호출
  MyClass4 m4 = MyClass4.second(200);
  print("data1: ${m4.data1}, data2: ${m4.data2}");                // data1: 0, data2: 200

}