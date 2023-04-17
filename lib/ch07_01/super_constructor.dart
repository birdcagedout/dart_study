// 4-1. 부모클래스의 생성자 호출1: 암시적 기본생성자가 호출되는 경우
// - 자식클래스의 인스턴스를 생성할 때 ==> 반드시 부모클래스의 생성자를 호출해주어야 한다.
// - 자식클래스의 생성자에서 명시적으로 호출하지 않은 경우 ==> 컴파일러가 부모클래스의 default constructor를 암시적으로 호춣하도록 추가한다.

class SuperClass1 {
  SuperClass1() {
    print("SuperClass1() called");
  }
}

class SubClass1 extends SuperClass1 {
  SubClass1() {}              // 명시적으로 super() 호출하지 않은 경우
  // SubClass1(): super();    // 컴파일러가 대신해서 default constructor를 추가해준다.
}


// 4-2. 부모클래스의 생성자 호출2: 명시적으로 부모클래스의 생성자를 호출해주어야 하는 경우
// 부모클래스에 아무런 constructor가 없으면 ==> 컴파일러가 default constructor를 추가해준다.
// 만약 부모클래스에 constructor를 정의해주었다면 ==> 컴파일러가 따로 default constructor를 추가해주지 않는다!!
// (앞서 본 것처럼) 자식클래스의 생성자에서 super 생성자를 호출해주지 않으면, 컴파일러에 의해 부모클래스의 default constructor가 암시적으로 호출되는데,
// 문제는 부모클래스에 default constructor가 없다는 거다.(다른 생성자를 정의해주면 default constructor는 추가되지 않는다)
// ==> 따라서 이때는 자식클래스의 생성자에서 "명시적으로" 부모클래스의 생성자를 호출해주어야 한다.(명시적으로 호출하지 않으면 에러)

class SuperClass2 {
  SuperClass2(int data) {}
  SuperClass2.first() {}
}

class SubClass2 extends SuperClass2 {
  // SubClass2() {}                       // 에러: Superclass에 없는 default constructor 암시적 호출 시도 ==> 명시적으로 부모클래스의 생성자를 호출해야 한다.

  SubClass2(): super(10);                 // OK  ==> 함수 body 없음에 유의
  SubClass2.first(): super.first();       // OK  ==> 함수 body 없음에 유의
}



main() {

  // 4-1. 컴파일러의 super() 자동 추가
  var obj1 = SubClass1();

  // 4-2. 부모클래스의 생성자 명시적 호출
  var obj2 = SubClass2();
  var obj3 = SubClass2.first();
}