int plus(int no) {
  return no + 10;
}

int mul(int no) {
  return no * 10;
}

// (주의) 아래의 경우 ==> 리턴 타입이 함수 & 파라미터도 함수인 경우
Function testFunc(Function argFunc) {
  print("[testFunc 호출됨] argFunc: ${argFunc(10)}");
  return mul;
}


main() {
  var result = testFunc(plus);
  print("result: ${result(30)}");
}

