import 'dart:io';

void main() {
  taskPerformed();
}

void taskPerformed() async {
  task1();
  print(task2());
  // String task2Data = await task2();
// task3(task2Data);
}

void task1() {
  String result = 'Task 1 data';
  print('task 1 completed');
}

Future<String> task2() async {
  Duration threeSeconds = Duration(seconds: 3);
  String? result;
  await Future.delayed(threeSeconds, () {
    result = 'Task 2 data';
    print('task 2 completed');
  });
  return result!;
}

void task3(String task2Data) {
  String result = 'Task 3 data';
  print('task 3 completed $task2Data');
}
