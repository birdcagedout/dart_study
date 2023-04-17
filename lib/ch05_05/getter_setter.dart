String _name = 'hello';


// getter
String get name {
  return _name.toUpperCase();
}


// setter
void set name(value) {
  _name = value;
}


main() {
  name = 'world';             // setter
  print('name: $name');       // getter
}