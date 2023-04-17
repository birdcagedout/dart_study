// 1. 정수 나누기: ~/

// 2. is : 타입 체크(true/false): true이면 type promotion에 의해 해당 타입으로 자동 casting 됨
// 3. as : 명시적 형변화(casting)

// type promotion
// - Dart 언어의 특징으로, type check를 거친 변수에 대해서는 자동으로 type을 변환해주는 기능
// - Nullable에 null체크(null 아님)를 거치면 non-nullable처럼 다룰 수 있고,
// - supertype에 subtype체크(is subtype)를 거치면 subtype처럼 다룰 수 있다.
// - local 변수에 대해서만 적용가능
// 간단한 설명: https://www.youtube.com/watch?v=2Cl0C-9dK48
// 공식 문서: https://dart.dev/tools/non-promotion-reasons



class User {
  void some() {
    print("User.some() 호출됨");
  }
}


main() {

  // 1. 정수 나누기
  print("8 / 5 : ${8/5}");
  print("8 ~/ 5: ${8~/5}");
  print("8 나누기 5: 몫=${8 ~/ 5}, 나머지=${8 - (8 ~/ 5) * 5}");


  Object obj = User();
  // print(obj.runtimeType);       // User

  // bool b = obj is User;         // 아래 코드에 앞서 is를 사용했다고 해서 무조건 obj가 User로 casting 되는 것은 아니다.
  // obj.some();                   // Error: The method 'some' isn't defined for the class 'Object'.


  // 2. is 얀신자: true이면 type promotion에 의해 해당 type으로 자동 casting 됨
  if (obj is User) {
    print("obj는 User임");
    obj.some();
  } else {
    print("obj는 User 아님");
    (obj as User).some();         // 3. 명시적 casting(super -> sub)
  }

  obj.some();                     // *** type promotion의 범위는 type check한 블록에만 한정되지 않는다. ***
}