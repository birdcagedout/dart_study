// 널 세이프티(Null Safety): 널 포인터 예외(Null Pointer Exception) 발생을 컴파일러 수준에서 미리 점검하여 런타임 시의 동작안정성을 보장하는 것
// ==> 플러터 2.0부터(Dart 2.12.0부터) 지원하기 시작
// ==> 만약 Dart 2.12.0 이상을 사용하여 개발한다면 널 세이프티를 지원하지 않는 패키지는 이용할 수 없다

// Null: OOP에서 객체(변수)가 선언은 되었으나, 변수에 값이 할당되지 않았거나 또는 객체가 메모리 할당이 되지 않은 경우
// NPE: 객체 변수가 선언만 되어있고 값이 할당되지 않았는데 ==> 객체를 참조할 때 런타임 에러(Null Pointer Exception) 발생
// 예를 들어,
// User user1;
// ...
// if (user1.name == "Kim") {}   <== 이때 런타임에러(NPE) 발생
//
// 따라서 보통의 언어에서는 null인지 먼저 체크
// if (user1 != null) {
//   user1.name = "kim"
// }

// 이러한 런타임 에러의 발생을 방지하기 위해 컴파일러 타임에 이미 NPE 발생을 감지하여 처리하는 것이 Null-safety이며
// 이러한 Null-safety를 위해서는 변수나 객체의 type에 관한 최소한의 정보를 컴파일러에게 주어야 한다.
// ==> 그렇게 하도록 Dart언어 자체가 설계되어 있다.


int a = 10;
int? b;
// b = 10;


void main() {

  b = a;              // super타입 변수에 sub타입 할당 가능(암시정 casting)
  // a = b;           // sub타입 변수에 super타입 할당 불가(명시적 casting 필요: a = b as int)

  var a1 = 10;
  var a2 = null;
  var a3;
  // var? a4 = null;

  print(a1.runtimeType);
  print(a2.runtimeType.toString());
  print(a3.runtimeType.toString());
}
