import 'package:to_do_list_squad/src/to_do_list/domain/entities/to_do.dart';
import 'package:to_do_list_squad/src/to_do_list/domain/repositories/to_do_repository.dart';

class AddToDoUseCase {
  final ToDoRepository _toDoRepository;

  AddToDoUseCase(this._toDoRepository);

  Future<void> call(ToDo toDo) async {
    await _toDoRepository.addNewToDo(toDo);
  }
}
