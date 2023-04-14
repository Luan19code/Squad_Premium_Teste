import 'package:to_do_list_squad/src/to_do_list/domain/entities/to_do.dart';
import 'package:to_do_list_squad/src/to_do_list/domain/repositories/to_do_repository.dart';

class UpdateToDoUseCase {
  final ToDoRepository _repository;

  UpdateToDoUseCase(this._repository);

  Future<void> call(ToDo toDo) async {
    await _repository.updateToDo(toDo);
  }
}
