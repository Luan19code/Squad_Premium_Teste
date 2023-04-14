import 'package:to_do_list_squad/src/to_do_list/domain/entities/to_do.dart';

abstract class ToDoRepository {
  Future<void> addNewToDo(ToDo toDo);

  Future<void> deleteToDo({
    required String id,
  });

  Future<void> updateToDo(ToDo toDo);

  Future<List<ToDo>> getAllListToDos();

  Future<List<ToDo>> getPendingListToDos();

  Future<List<ToDo>> getDoneListToDos();
}
