import 'package:to_do_list_squad/src/to_do_list/domain/entities/to_do.dart';
import 'package:to_do_list_squad/src/to_do_list/domain/repositories/to_do_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ToDoRepositoryImpl implements ToDoRepository {
  final SharedPreferences sharedPreferences;

  ToDoRepositoryImpl(this.sharedPreferences);

  @override
  Future<void> addNewToDo(ToDo toDo) {
    // TODO: implement addNewToDo
    throw UnimplementedError();
  }

  @override
  Future<void> deleteToDo({required String id}) {
    // TODO: implement deleteToDo
    throw UnimplementedError();
  }

  @override
  Future<List<ToDo>> getAllListToDos() {
    // TODO: implement getAllListToDos
    throw UnimplementedError();
  }

  @override
  Future<List<ToDo>> getDoneListToDos() {
    // TODO: implement getDoneListToDos
    throw UnimplementedError();
  }

  @override
  Future<List<ToDo>> getPendingListToDos() {
    // TODO: implement getPendingListToDos
    throw UnimplementedError();
  }

  @override
  Future<void> updateToDo(ToDo toDo) {
    // TODO: implement updateToDo
    throw UnimplementedError();
  }
}
