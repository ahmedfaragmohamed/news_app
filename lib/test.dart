void main() async {
  Future.delayed(Duration(seconds: 1), () => print("future seconds 1"));

  Future.delayed(Duration(seconds: 3), () => print("future seconds 3"));
  print("hello");
  Future.delayed(Duration(seconds: 2), () => print("future seconds 2"));
  final test = await printTest();
  print(test);
  print("hey!");
}

Future<String> printTest() {
  final Future<String> value = Future.value("Hello function?!");
  return value;
}
