import 'package:to_do_list_squad/src/to_do_list/data/models/to_do_model.dart';

abstract class ToDoRepository {
  Future<List<ToDoModel>> getListToDos();

  Future<void> setListToDos(List<ToDoModel> listToDos);
}
