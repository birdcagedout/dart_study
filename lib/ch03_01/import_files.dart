// 1. 임포트 상대경로
// 2. _로 접근제한 만들기
// 3. import ~~ as 별칭


import 'outer/test1.dart' as T1;

main() {
  T1.no1 = 100;
  // _no2 = 200;          // 오류

  T1.sayHello1();
  // _sayHello2();        // 에러

  T1.User1 u1 = T1.User1();
  // _User2 u2 = User2(); // 에러

}

