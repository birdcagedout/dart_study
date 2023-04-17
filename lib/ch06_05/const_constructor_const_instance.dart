// 1. const constructor
// - 함수 body를 가질 수 없다.
// - 모든 멤버 변수를 final로 선언해야 한다.
// - 따라서 생성자 파라미터로 모든 멤버변수를 초기화 해야 한다.

class MyClass1 {
  // int data1;                   // 에러: final로 선언해야 한다.
  final data1;

  // const MyClass();             // 에러: 모든 멤버변수를 파라미터로 초기화 해야 한다.
  const MyClass1(this.data1);
}


// 2. const instance
// - const constructor가 반드시 필요하다. ==> 멤버변수 모두 final, 함수 body 없고, 생성자 파라미터로 모든 멤버 초기화 필수
// - 생성시 초기화 값이 같은 const instance들은 모두 동일한 객체이다 ==> const 객체이지만 초기값이 다르거나, 초기값이 같더라도 모두 const 객체가 아니라면 동일 객체가 아니다.


class MyClass2 {
  final data1;
  MyClass2(this.data1);
}

class MyClass3 {
  final data1;
  const MyClass3(this.data1);
}


main() {

  // 1) const 객체 생성: const constructor 필요
  // var obj1 = const MyClass2(10);   // 에러: const constructor 없으면 const instance를 생성할 수 없다.
  var obj2 = const MyClass3(10);


  // 2) 동일한 초기값으로 생성한 일반 객체 ==> 서로 다른 객체
  var obj3 = MyClass3(10);
  var obj4 = MyClass3(10);
  print("동일한 초기값으로 생성한 일반 객체의 동일 여부: ${obj3 == obj4}");


  // 3) 동일한 초기값으로 생성한 const 객체 ==> 동일 한 객체
  var obj5 = const MyClass3(20);
  var obj6 = const MyClass3(20);
  print("동일한 초기값으로 생성한 const 객체의 동일 여부: ${obj5 == obj6}");


  // 4) 서로 다른 초기값으로 생성한 const 객체 ==> 서로 다른 객체
  var obj7 = const MyClass3(30);
  var obj8 = const MyClass3(40);
  print("서로 다른 초기값으로 생성한 const 객체의 동일 여부: ${obj7 == obj8}");


  // 5) 동일한 초기값으로 생성한 일반 객체와 const 객체 ==> 서로 다른 객체
  var obj9 = MyClass3(50);
  var obj10 = const MyClass3(50);
  print("동일한 초기값으로 생성한 일반 객체와 const 객체의 동일 여부: ${obj9 == obj10}");

  

}