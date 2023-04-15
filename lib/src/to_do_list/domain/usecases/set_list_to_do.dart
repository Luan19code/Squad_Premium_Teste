import 'package:get_it/get_it.dart';
import 'package:to_do_list_squad/src/to_do_list/data/models/to_do_model.dart';
import 'package:to_do_list_squad/src/to_do_list/domain/repositories/to_do_repository.dart';

class SetListToDoUseCase {
  Future<void> call(List<ToDoModel> listToDos) async {
    return await GetIt.I.get<ToDoRepository>().setListToDos(listToDos);
  }
}
