// mixin
// - mixin 예약어로 선언
// - class와 마찬가지로 변수, 함수를 가질 수 있으나, 생성자는 가질 수 없다.
// - 생성자가 없으므로 객체 생성은 불가
// - A라는 mixin의 코드를 재사용하려면 ==> class B with A {}와 같이 선언한다.
// - 한번에 하나밖에 상속받을 수 없는 제약을 우회하여 다중상속을 구현할 수 있다.

mixin MyMixin {
  int mixinData = 10;
  void mixinFunc() {}
}

class MySuper {
  int superData = 20;
  void superFunc() {}
}

class MyClass extends MySuper with MyMixin {
  void test() {
    // 상속받은 변수/함수
    superData++;
    superFunc();

    // mixin 변수/함수
    mixinData++;
    mixinFunc();
  }
}
