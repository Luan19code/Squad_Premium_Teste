import 'package:get_it/get_it.dart';
import 'package:to_do_list_squad/src/to_do_list/data/models/to_do_model.dart';
import 'package:to_do_list_squad/src/to_do_list/domain/repositories/to_do_repository.dart';

class GetListToDoUseCase {
  Future<List<ToDoModel>> call() async {
    return await GetIt.I.get<ToDoRepository>().getListToDos();
  }
}
