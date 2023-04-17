// ********** Null-aware Operators: Null-Safety를 보장하기 위해 사용하는 연산자들 ***************
// Null-aware operators: ??   ??=   ?.   ...?


// 1. null assertion operator (!) : Typescript에서는 "Non-null 단언 연산자"라고 부름(일리 있음)
// - 변수 값이 null 아님을 100% 확신할 수 있을 때 변수를 non-nullable로 취급하고자 할 때 사용
// - 변수 끝, 함수 호출 끝에 사용
// - 만약 변수 값이 null인데 사용한 경우 "런타임 에러" 발생
// (예) int b = a!;


// 2. conditional property access operator (?.) : 조건적 속성접근 연산자
// - 변수 값이 null인지 확신할 수 없는 경우(null인 가능성도 처리해야 하는 경우) 변수의 프로퍼티/메소드에 접근할 때 사용
// - 변수 값이 null인 경우 ==> 바로 null을 리턴
// - 변수 값이 null이 아닌 경우 ==> 프로퍼티/메소드에 접근
// - (주의) 리턴 받는 변수는 null일 수도 있으므로 반드시 nullable로 선언해야 한다.
// (예) User? user2;
//     user2.name = user1?.name


// 2-1. conditional subscription access operator (?[]) : 조건적 첨자접근 연산자
// - ?.와 동일하되, nullable list에서 indexing 할 때 사용함


// 3. null-coalescing operators (??) : 널 병합 연산자 (C#, Swift 등 다른 언어에도 있음)
// - 어느 조건식이 null일 때와 null이 아닐 때 각각 다르게 처리하고 싶은 경우 사용
// - "좌측값 ?? 우측값"이라는 전체 식은 좌측값이 null이라면 "우측값"으로 evaluation되고,
// -                         좌측값이 null이 아니라면 "좌측값"으로 evaluation된다.
// - "좌측값"이 null 평가 기준
// (예) bool isWoman = user1.isWoman ?? false;


// 4. null-coalescing assignment operator (??=) : 널 병합 할당 연산자
// - 변수가 null일 때와 아닐 때 각각 다른 값을 할당하기 위해 사용하는 연산자
// - "변수1 ??= 변수2" 형태로 사용하는데, 변수2가 null이면 변수1에 변화가 없고(값 할당하지 않고)
// -                               변수2가 null이 아니면 변수1에 변수2 값을 할당한다.
// - "우측값"이 null 평가 기준
// (예) int? b ??= a;    // a가 null이면 b값에 변화가 없으므로 null이 되고, a가 null이 아니라면 b에 a의 값이 할당된다.

int? getLength(String? str) {
  if (str == null) {
    return null;
  } else {
    return str.length;
  }
}


main() {

  // 1. 널 단언 연산자
  int len1 = getLength("some string")!;
  int? len2 = getLength(null);
  print("len1: $len1, len2: $len2");    // 11 null


  // 2. 조건적 속성접근 연산자
  int? no1 = 10;
  bool? result1 = no1.isEven;     // null 아님이 명백한 경우라서 ?.을 사용하지 않더라도 에러가 안 날 수도 있지만 항상 이렇지는 않다
  // print(result1);  // true

  no1 = null;
  bool? result2 = no1?.isEven;    // null인데도 ?.을 사용하지 않으면: Error: Property 'isEven' cannot be accessed on 'int?' because it is potentially null.
  // print(result);    // null



  // 2-1. 조건적 첨자접근 연산자: list
  List<int>? list = [10, 20, 30];
  // print(list[0]);       // 10

  list = null;
  // print(list?[0]);      // null




  // 3. 널 병합 연산자
  bool? is1;
  bool is2 = false;

  bool isResult1 = is1 ?? false;
  bool isResult2 = is2 ?? true;     // (주의!!) 좌측값의 "null" 여부를 확인하지, false 여부를 확인하는 것이 아니다!!

  // print(isResult1);     // false
  // print(isResult2);     // false


  // 4. 널 병합 할당 연산자
  int? data3;
  data3 ??= 10;

  data3 ??= null;       // 우측값이 null이므로 data3의 값에는 변화가 없다.
  // print(data3);      // 10


  String? data4 = 'hello';
  String? result4 = data4 ?? "world";   // data4가 null일 때만 result4에 "world"가 할당된다.
  // print(result4);                    // hello

  data4 = null;
  result4 = data4 ?? "world";
  // print(result4);                    // world

}