import 'package:to_do_list_squad/src/to_do_list/domain/repositories/to_do_repository.dart';

class DeleteToDoUseCase {
  final ToDoRepository repository;

  DeleteToDoUseCase(this.repository);

  Future<void> call(String id) async {
    await repository.deleteToDo(id: id);
  }
}
