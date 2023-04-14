import 'package:to_do_list_squad/src/to_do_list/domain/entities/to_do.dart';
import 'package:to_do_list_squad/src/to_do_list/domain/repositories/to_do_repository.dart';

class GetDoneListToDoUseCase {
  final ToDoRepository _repository;

  GetDoneListToDoUseCase(this._repository);

  Future<List<ToDo>> call() async {
    return await _repository.getDoneListToDos();
  }
}
