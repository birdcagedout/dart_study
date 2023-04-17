main() {


  // var: 선언과 동시에 초기화 ==> 타입유추로 type결정 ==> type 못 바꿈
  var no1 = 1;
  // no1 = 'str';     // no1은 int
  // no1 = false;     // no1은 int


  // var: 선언만 ==> 타입추론 불가능 ==> dynamic ==> 모든 type 사용 가능
  var no2;
  no2 = 10;
  no2 = 'Str';
  no2 = true;


  // dynamic: 모든 타입 가능
  dynamic d1 = 10;
  d1 = true;
  d1 = "str";

}