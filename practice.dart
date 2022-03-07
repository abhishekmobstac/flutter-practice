import 'dart:io';

void main() {
  print("Enter your name");
  String? name = stdin.readLineSync();
  print("Enter your age");
  int age = 10;
  print("Hello $name, you are $age years old");
}
