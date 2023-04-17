// abstract class(추상클래스) ----------implements ---------> concrete class(구현클래스)
// - a class that can’t be instantiated.
// - useful for defining interfaces.(Dart에는 interface 예약어가 없다. 그냥 class로 써야한다.)
// - 상속받는 클래스가 (구현되지 않은) 특정 메소드 등을 오버라이드 하도록 강제하는 방법

// 일반 클래스에 추상 함수: 에러
// class User {
//   void some();           // 에러: 일반 클래스에 함수 body가 없는 메소드를 정의할 수 없다
// }                        //      'some' must have a method body because 'User' isn't abstract.


// 추상 클래스
abstract class User0 {
  void some();
}

// 추상 클래스 "상속"받아서 override해서 사용하는 것도 가능
class Customer extends User0 {
  @override
  void some() {}            // 상속받은 클래스는 반드시 추상함수를 override 해주어야 한다.
}



// 이제부터 핵심!
// java에서는 추상클래스=interface로 선언, interfae구현=implements로 사용하지만
// Dart에서는 interface 예약어는 없고, implements 예약어만 있다.
// 따라서 Dart에서는 class가 interface 기능까지 수행한다.

// 일반적인 클래스
class User1 {
  int no;
  String name;

  User1(this.no, this.name);
  String greet(String who) => "Hello $who, I am $name and my number is $no";
}

// 일반적인 클래스를 extends로 "상속"받아 쓸 수도 있다.
// ==> 멤버변수와 메소드를 모두 상속받으면 되므로 꼭 필요한 것 외에는 override할 필요 없다
class MyStudent extends User1 {
  MyStudent(super.no, super.name);
}

// 일반적인 클래스를 interface로 보고, implements로 구현할 수도 있다.
// ==> 이때 새로운 클래스는 모든 변수, 메소드(생성자 제외)를 모두 필수적으로 override해야 한다.
class MyClassmate implements User1 {
  // MyClassmate(super.no, super.name);     // 에러: super에 no, name 변수 없음  <-- 상속되지 않기 때문
  // MyClassmate(this.no, this.name);       // 에러: this에 no, name 변수 없음  <-- 상속되지 않기 때문

  int no;                                   // override 필수
  String name;                              // override 필수

  MyClassmate(this.no, this.name);                // User1의 생성자는 override 필요 없음
  // MyClassmate(this.no, this.name): super();    // 에러 없음(?)
  String greet(String who) => "Hello $who, I am $name and my number is $no";    // override 필수

  String checkThis() => this.runtimeType.toString();          // this의 type 확인
  String checkTheSuper() => super.runtimeType.toString();     // super의 type 확인
}


// interfae는 2개 이상을 implements 할 수도 있다.
class MyFriend implements User0, User1 {
  int no;
  String name;
  MyFriend(this.no, this.name);
  void some() {}
  String greet(String who) => "hello";
}





main() {
  var mate1 = MyClassmate(1, 'Kim');

  print(mate1 is MyClassmate);            // true
  print(mate1 is User1);                  // true

  print(mate1.checkThis());               // MyClassmate
  print(mate1.checkTheSuper());           // MyClassmate
}

