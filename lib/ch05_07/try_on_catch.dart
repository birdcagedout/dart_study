// 런타임 에러 처리구문: try ~ on 익셉션종류 [catch(e)]


import 'dart:async';
import 'dart:io';

some1() {
  throw FormatException('에러 발생');
}

some2() {
  throw TimeoutException('에러 발생');
}


main() {

  // 1. Exception 종류별 처리
  try {
    print("[try] some1() 호출 직전");
    some1();
    print("[try] some1() 호출 직후");

    print("[try] some2() 호출 직전");
    some2();
    print("[try] some2() 호출 직후");
  } on FormatException {
    print("[on] FormatException 발생함");
  } on TimeoutException {
    print("[on] TimeoutException 발생함");
  } on Exception {
    print("[on] Exception 발생함");
  }
  print("---------------------------------(1번 끝)");


  // 2. Exception 종류별 처리 + catch로 잡아내기
  try {
    print("[try] some1() 호출 직전");
    some1();
    print("[try] some1() 호출 직후");

    print("[try] some2() 호출 직전");
    some2();
    print("[try] some2() 호출 직후");
  } on FormatException catch(fe) {
    print("[on] FormatException 발생함: $fe");
  } on TimeoutException catch(te) {
    print("[on] TimeoutException 발생함 $te");
  } on Exception {
    print("[on] Exception 발생함");
  }
  print("---------------------------------(2번 끝)");




  // 3. 해당되는 Exception이 없다면 ==> Exception에서 모두 잡아낸다
  try {
    print("[try] some1() 호출 직전");
    some1();
    print("[try] some1() 호출 직후");
  } on Exception catch(e) {
    print("[on] Exception 발생함: $e");
  }
  print("---------------------------------(3번 끝)");



  // 4. Exception의 순서는 상관 있을까? ==> 상관 있다 (가장 상위 Exception은 가장 마지막에 넣어야 한다)
  try {
    print("[try] some1() 호출 직전");
    some1();
    print("[try] some1() 호출 직후");

    print("[try] some2() 호출 직전");
    some2();
    print("[try] some2() 호출 직후");
  } on Exception catch(e) {
    print("[on] Exception 발생함 $e");
  } on FormatException catch(fe) {
    print("[on] FormatException 발생함: $fe");
  } on TimeoutException catch(te) {
    print("[on] TimeoutException 발생함 $te");
  }
  print("---------------------------------(4번 끝)");




  // 5. 가장 단순하게 처리: try ~ catch
  try {
    print("[try] some1() 호출 직전");
    some1();
    print("[try] some1() 호출 직후");

    print("[try] some2() 호출 직전");
    some2();
    print("[try] some2() 호출 직후");
  } catch(e) {
    print("[catch] Exception 발생함: $e");
  }


}