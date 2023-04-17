// const 연습

// const String c1;                 // 값을 초기화 안 해주면 에러
const String c1 = 'hello';

class User {
  // const String c2;               // 값을 초기화 안 해주면 에러
  // const String c2 = 'hello';     // 값을 초기화 해줘도 에러 ==> class 내에서 const는 static만 가능
  static const String c2 = 'hello';

  void func() {
    // const String c3;             // 값을 초기화 안 해주면 에러
    const String c3 = 'hello';
  }
}



// final 연습

// final String f1;
// f1 = 'hello';                    // 탑레벨에서는 final도 이렇게 선언 후 초기화 할 수 없다.
final String f1 = 'hello';

class User2 {

  final int f2;                     // 선언만 해놓으면 에러: 생성자에서 초기화 해줘야 함
  User2(this.f2);

  void func() {
    final int f3;                   // final이 로컬 변수인 경우 선언만 있어도 에러 안 생김

  }
}

