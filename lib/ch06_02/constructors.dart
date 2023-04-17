// 생성자1. 가본형
class User1 {
  late String name;
  late int age;

  // 생성자(기본형)
  User1(String name, int age) {
    this.name = name;
    this.age = age;
  }

  void sayHello() {
    print("name: ${this.name}, age: ${this.age}");
  }
}


// 생성자2. 축약형
class User2 {
  late String name;
  late int age;

  // 생성자(축약형)
  User2(this.name, this.age);

  void sayHello() {
    print("name: ${this.name}, age: ${this.age}");
  }
}


// 생성자3. 축약형 + optional positional parameter
class User3 {
  late String name;
  late int age;
  String? address;

  // 생성자(축약형 + optional positional parameter)
  User3(this.name, this.age, [this.address]);

  void sayHello() {
    print("name: ${this.name}, age: ${this.age}, address: ${this.address}");
  }
}


// 생성자4. 축약형 + optional named parameters
class User4 {
  late String name;
  late int age;
  String? address;

  // 생성자(축약형 + optional named parameter) ==> (주의) "parameter이름:" 부분은 쓰지 않는다.
  // User4(this.name, this.age, {address: this.address});         // 애러: 파라미터 이름 부분은 쓰지 않는다
  User4(this.name, this.age, {this.address});

  void sayHello() {
    print("name: ${this.name}, age: ${this.age}, address: ${this.address}");
  }
}


// 생성자5. 초기화 목록(initializer list)
class User5 {
  late String name;
  late int age;

  // 생성자(초기화 목록)
  User5(String name, int age): this.name = name, this.age = age {
  }

  void sayHello() {
    print("name: ${this.name}, age: ${this.age}");
  }
}




main() {
  User1 u1 = User1('Kim', 45);                          // 기본형

  User2 u2 = User2('Lee', 24);                          // 축약형

  User3 u31 = User3('Park', 37, "Yeosu");               // 축약형 + optional positional parameter
  User3 u32 = User3('Choi', 55);

  User4 u41 = User4('Jung', 31, address: "Daejun");     // 축약형 + optional named parameter
  User4 u42 = User4('Moon', 66);

  User5 u5 = User5('Han', 99);                          // 초기화 리스트

  u1.sayHello();                // name: Kim, age: 45
  u2.sayHello();                // name: Lee, age: 24
  u31.sayHello();               // name: Park, age: 37, address: Yeosu
  u32.sayHello();               // name: Choi, age: 55, address: null
  u41.sayHello();               // name: Jung, age: 31, address: Daejun
  u42.sayHello();               // name: Moon, age: 66, address: null
  u5.sayHello();                // name: Han, age: 99
}