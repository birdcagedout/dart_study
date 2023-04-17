import 'dart:math';

main() {

  // 리스트 객체를 instantiate하는 방법
  // (공식 문서 참조: https://dart.dev/tools/diagnostic-messages?utm_source=dartdev&utm_medium=redir&utm_id=diagcode&utm_content=default_list_constructor#default_list_constructor)

  // 1. list literal 사용하는 방법
  var l1 = [1, 2, 3];                   // OK
  var l2 = [];                          // OK
  var l3 = <int>[];                     // OK

  List l4 = [1, 2, 3];                  // OK
  List l5 = [];                         // OK
  List l6 = <int>[];                    // OK

  List<int> l7 = [1, 2, 3];             // OK
  List<int> l8 = [];                    // OK
  List<int> l9 = <int>[];               // OK

  // (주의) null-safety 채택 이후로는 default constructor를 사용할 수 없다.
  // List l3 = List();                  // The default ‘List’ constructor isn’t available when null safety is enabled.
  // List<int> l4 = List(3);            // The default ‘List’ constructor isn’t available when null safety is enabled.
  // List l3 = List<int>();             // The default ‘List’ constructor isn’t available when null safety is enabled.
  // List<int> l3 = List<int>();        // The default ‘List’ constructor isn’t available when null safety is enabled.

  // 2. (그 대신) named constuctor를 사용하는 방법
  List l10 = List.filled(3, 0);                        // OK: 크기, 초기값(고정)을 정할 수 있을 때
  List l11 = List.generate(3, (index) => index+1);     // OK: 크기, 초기값(동적)을 정할 수 있을 때




  // 리스트: 타입을 지정하지 않으면 dynamic
  List list0 = [10, true, 'hello'];


  // 리스트: 타입을 지정한 경우 ==> generic으로 선언
  List<int> list1 = [10, 20, 30];
  // list1[3] = 50;                         // 에러
  // print(list1);                          // [10, 20, 30]



  // 리스트: 추가
  List<int> list3 = [10, 20, 30];
  list3.add(40);
  // print(list3);                          // [10, 20, 30, 40]

  // 리스트: 제거
  list3.removeAt(list3.indexOf(20) + 1);
  // print(list3);                          // [10, 20, 40]

  // 리스트: 전부 삭제
  list3.clear();
  // print(list3);                          // []




  // 리스트: 크기와 초기값 지정하기
  var list2 = List<int>.filled(3, -1);
  // print(list2);                          // [-1, -1, -1]
  // list2.add(0);                          // 에러: Unsupported operation: Cannot add to a fixed-length list



  // 리스트: 처음 크기를 지정하되 + 확장 가능하도록 만들기(growable)
  var list4 = List<int>.generate(4, (index) => pow(2, index).toInt(), growable: true);
  // print(list4);                          // [1, 2, 4, 8]


  // 심심해서 해본 거: 5의 3제곱 vs. (1/5)의 -3제곱
  num a = pow(5, 3);
  num b = pow(0.2, -3);
  // print(a);                              // 125
  // print(b);                              // 124.99999999999999
  // print(a==b);                           // false



  // Set
  Set<int> set1 = {1, 3, 5};
  set1.add(10);
  set1.remove(1);
  // print(set1);                           // {3, 5, 10}

  set1.add(5);
  set1.add(3);
  // print(set1);                           // {3, 5, 10}



  // Map: 파이썬의 Dictionary
  Map<String, int> map1 = {
    'one': 0,
    'two': 3,
    'ten': 10
  };
  // print(map1);                           // {one: 0, two: 3, ten: 10}  ==>  String에 따옴표 없음

  map1['five'] = 5;
  // print(map1);                           // {one: 0, two: 3, ten: 10, five: 5}

  print(map1.keys);                         // (one, two, ten, five)
  print(map1.values);                       // (0, 3, 10, 5)
  print(map1.keys.runtimeType);             // _CompactIterable<String>

}