
import 'package:hive/hive.dart';
part 'todo.g.dart';

@HiveType(typeId: 1)
class ToDO {
  @HiveField(0)
  String todo;

  @HiveField(1)
  bool isCompleted = false;

  ToDO({required this.todo});
}

