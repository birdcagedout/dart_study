// 여러가지 파라미터가 섞여있는 경우

// p.103 positional + named
void some1(int data1, {String? data2, bool? data3}) {
}

// p.105 positional + optional positional
void some2(int data1, [String data2 = 'hello', bool data3 = false]) {
}


main() {

  // positional + named인 경우의 호출
  some1(10);                                      // 필수인 positional만
  some1(10, data2: 'hello', data3: true);         // 셋 다 모두
  some1(10, data3: true, data2: 'hello');         // 셋 다 모두 (named는 순서 무관)
  some1(data2: 'hello', 10, data3: true);         // *** (주의) 이렇게 써도 OK ***


  // positional + optional positional인 경우의 호출
  


}