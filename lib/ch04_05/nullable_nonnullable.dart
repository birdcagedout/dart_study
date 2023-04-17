

// int a1;          // 에러: 탑레벨에서 non-nullable 변수를 선언만 하고 초기화 안 함
late int b1;        // late 붙이면 에러 없음

class User {
  // int a2;        // 에러: 클래스에서 non-nullable 변수를 선언만 하고 초기화 안 함
}

main() {
  int a3;           // 로컬 변수는 괜찮음
  // print(a3);     // 그렇다고 바로 쓰면 에러: Error: Non-nullable variable 'a3' must be assigned before it can be used.


  dynamic a1 = 10;
}