// ***** 함수의 parameters *****

// <I. 호출시 "필수" 여부에 따라>
// - required parameters ==> 호출시 필수인 파라미터 (전통적인 방식의 파라미터)
// - optional parameters ==> 호출시 생략할 수도 있는 파라미터
// ==> 순서: Optional parameters can only be declared after any required parameters.


// <II. 호출시 "이름" 여부에 따라>
// - positional parameters ==> 호출시 순서로 구별되는 파라미터 (전통적인 방식의 파라미터)
// - named parameters ==> 호출시 이름으로 구별되는 파라미터


// <III. 결과적으로 총 4가지 + 1가지(default parameter)>

// 1. (required) positional parameters: positional parameter 자체가 홏출 시 필수이기 때문에 required는 보통 생략한다.
//    - 전통적인 함수 정의 + 함수 호출 (호출시 이름을 붙이지 않고 값만 넣는다)
//    - 정의시: func(int a, String b, bool c)
//    - 호출시: func(10, "ABC", true)
//    - 개수, 순서, 타입이 모두 일치해야 OK
void func_req_pos(int a, String b, bool c) {
  print("[required positional] a: $a  \t b: $b\t c: $c");
}


// 2. required named parameters
//    - named parameter는 반드시 {} 내부에 있어야 하며, {} 내부의 파라미터는 호출시 생략가능하다. 하지만 required를 붙이면 호출시 생략 불가(필수)
//    - 정의시: func( {required int a, required int b} )
//    - 호출시: func(a: 10, b: 20)
//    - 이름, 타입이 일치해야 OK (순서는 상관 없음)
//    - named parameter는 optional이지만, required를 붙이면 필수가 된다
void func_req_name({required int a, required int b}) {
  print("[required named     ] a: $a\t b: $b");
}


// 3. optional positional parameters
//    - positional parameter는 원래 required지만, [] 내부에 두면 호출시 생략할 수 있다. 이때 [] 내부의 파라미터를 optional positional parameter라고 한다.
//    - 정의시: func(int a, String b, [bool c])
//    - 호출시: func(10, "ABC", true)
//            func(10, "ABC")
//    - 호출시 optional positional parameter는 생략가능하다
void func_opt_pos(int a, String b, [bool? c]) {
  if (c != null) {
    print("[optional positional] a: $a\t b: $b\t c: $c");
  } else {
    print("[optional positional] a: $a\t b: $b");
  }
}


// 4. (optional) named parameters: named parameter 자체가 optional이기 때문에 optional은 굳이 붙이지 않는 경우가 많다
//    - 모든 named parameter는 반드시 {} 내부에 있어야 하며, {} 내부의 파라미터를 (optional) named parameter라고 한다.
//      일부 또는 전부에 대해 호출시 생략가능하며, 생략 가능하기 때문에 nullable로 선언해야 하지만(원칙) default값이 있는 경우에는 nullable로 선언하지 않아도 된다(예외).
//    - 정의시: func( {int? a, int? b} )
//    - 호출시: func(a: 10, b: 20)
//            func(a: 10)
//            func(b: 20)
//            func()
//    - 이름, 타입이 일치해야 OK (순서는 상관 없음)
//    - named parameter는 원칙적으로 optional이지만, required를 붙이면 필수(required named parameter)가 된다
//    - 1개의 함수 정의에서 {} 부분은 1번만 가능하고, positional parameter와 섞여 있는 경우 {}는 순서상 "마지막" 부분에 위치해야 한다.
void func_opt_name({int? a, int? b, int c = 0}) {
  print("[optional named     ] a: $a\t b: $b c: $c");
}


some() => null;



main() {
  // 1. required positional parameters: 순서, 타입, 개수 일치 필수
  func_req_pos(10, "XYZ", false);
  // func_req_pos(10, "AB");          // 생략 불가

  // 2. required named parameters
  func_req_name(a: 100, b: 200);
  // func_req_name(10, 20);           // 이름 필수
  // func_req_name(a: 10);            // 생략 불가

  // 3. optional positional parameters
  func_opt_pos(100, "STU", true);     // 세번째는 써도 되고
  func_opt_pos(100, "DENT");          //        안 써도 됨

  // 4. (optional) named parameters
  func_opt_name(a: 1000, b: 2000, c: 3000);   // 반드시 "이름: 값" 형태로 호출해야 하고,
  func_opt_name(a: 1000, b: 2000);            // 일부만 호출해도 되고
  func_opt_name(b: 5000);
  func_opt_name();                            // 모두 생략해도 됨

  print(some());
}