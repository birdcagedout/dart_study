// ***** 함수 타입 *****
// - Dart에서 함수는 1급 객체이므로,
// 1) 함수를 변수에 할당할 수도 있고,
// 2) 다른 함수의 파라미터로 주어 호출할 수도 있고,
// 3) 함수의 리턴값이 될 수도 있고
// 4) 비교 연산자의 비연산자가 될 수도 있다.    ==> 이 부분은 언어에 따라 1급 객체의 요건에 포함될 수도 있고, 안 될 수도 있고, 권장하지 않을 수도 있다.

// 함수를 변수에 할당할 때는 Function 클래스의 인스턴스 변수로 선언
// 변수에 할당된 함수를 호출할 때는 변수이름() 형태로 호출


// 1. 변수할당
// 2. 호출
void some1() {
  print("some1() 호출됨");
}


// 3. 함수의 파라미터로 들어올 "함수의 시그니처"를 특정 형태로 제한
void some2(int f(int a)) {
  print("some2($f) 호출됨");
  f(30);
  
}

int quad(int num) {
  print("quad($num) 호출됨");
  return num * 4;
}


main() {

  // 1. 함수를 넣을 변수 선언: Function 클래스의 인스턴스 변수로 선언
  // Function class: The supertype of all function types.
  Function some1Func = some1;
  // Function someFunc = some();    // 주의: some()로 쓰면 호출하고 그 리턴값을 받는다는 의미이므로 전혀 다른 의미가 된다

  // 2. 변수에 들어있는 함수를 호출
  some1Func();                      // some1() 호출됨

  // 3-1. 함수의 파라미터로 다른 함수를 넣어 호출: 기존 함수
  some2(quad);

  // 3-2. 함수의 파라미터로 다른 함수를 넣어 호출: 익명 함수
  some2((int a) {
    return a + 10;
  });

  // 3-3. 함수의 파라미터로 다른 함수를 넣어 호출: 익명 함수
  some2((int a) => a + 100);







}