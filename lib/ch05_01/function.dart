
// 매개변수에 var를 사용하면 ==> 매개변수는 "dynamic" 타입
void some1(var a) {
}

// 매개변수의 var는 생략할 수도 있다(dynamic)
void some1_(a) {
}


// 리턴 타입을 생략하면 ==> 리턴 타입은 "dynamic" 타입 (void 아님 주의)
// 리턴 타입을 생략했는데(dynamic) 함수 내부에서 리턴하지 않은 경우 ==> null값 리턴
some2() {
  // return 10;       // OK
  // return null;     // OK
  // return true;     // OK
  // return 'hello';  // OK
}

// 리턴 타입이 없는 경우 ==> 반드시 void로 명시해주어야 함
void some3() {
}

main() {
  some1(10);
  some1(null);
  some1(true);
  some1('hello');

  print(some2());       // dynamic인 리턴값을 함수 내부에서 리턴하지 않은 경우 ==> null값 리턴

  // print(some3());   // 리턴값이 없으므로 에러
}

