import 'package:to_do_list_squad/src/to_do_list/domain/entities/to_do.dart';
import 'package:to_do_list_squad/src/to_do_list/domain/repositories/to_do_repository.dart';

class GetAllListToDoUseCase {
  final ToDoRepository repository;

  GetAllListToDoUseCase(this.repository);

  Future<List<ToDo>> call() async {
    return await repository.getAllListToDos();
  }
}
