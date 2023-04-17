// 익명함수(anonymous function): 함수를 정의할 때 이름을 생략한 경우(=lambda function)
// 1. 함수가 들어갈 자리에 직접 정의하는 경우
// 2. 함수를 정의한 후 즉각 변수에 함수를 할당하는 경우
// 리턴 타입 명시 안 하면 dynamic


// 예1: 익명함수 ==> 함수에 이름이 없으므로 다른 곳에서 이 함수를 호출할 수는 없다
func_anonym1(arg) {
}

// 예2: 익명함수 ==> 함수에 이름은 없으나 정의를 변수에 대입하였으므로 앞으로 변수를 통해 함수를 호출할 수 있다.
Function func_anonym2 = (arg) {
  return 10;
};


