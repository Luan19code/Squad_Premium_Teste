import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:to_do_list_squad/src/to_do_list/data/models/to_do_model.dart';
import 'package:to_do_list_squad/src/to_do_list/domain/usecases/get_list_to_do.dart';
import 'package:to_do_list_squad/src/to_do_list/domain/usecases/set_list_to_do.dart';
part 'to_do_state.g.dart';

class ToDoState = _ToDoStateBase with _$ToDoState;

abstract class _ToDoStateBase with Store {
  @observable
  ObservableList<ToDoModel> toDoList = ObservableList.of([]);

  @action
  void addToDo({required ToDoModel toDo}) {
    toDoList.add(toDo);
    setToDoList();
  }

  @action
  void deleteToDo({required ToDoModel toDo}) {
    if (toDoList.contains(toDo)) {
      toDoList.remove(toDo);
      setToDoList();
    }
  }

  @observable
  bool isLoadedList = true;

  @action
  void updateToDo({required ToDoModel toDo, String? text}) {
    final newToDo = toDo.copyWith(
        text: text ?? toDo.text,
        isChecked: text == null ? !toDo.isChecked : toDo.isChecked);
    if (toDoList.contains(toDo)) {
      toDoList.replaceRange(
          toDoList.indexOf(toDo), toDoList.indexOf(toDo) + 1, [newToDo]);
      setToDoList();
    }
  }

  void setToDoList() async {
    try {
      await GetIt.I.get<SetListToDoUseCase>()(toDoList);
    } catch (e, s) {
      print(e);
      print(s);
    }
  }

  @action
  Future getToDoList() async {
    try {
      final result = await GetIt.I.get<GetListToDoUseCase>()();
      if (result.isEmpty) {
        result.addAll([
          ToDoModel(id: "1", text: 'Create app splash screen', isChecked: true),
          ToDoModel(id: "2", text: 'Create social login', isChecked: true),
          ToDoModel(id: "3", text: 'Create home screen', isChecked: true),
          ToDoModel(id: "4", text: 'Add home API connection', isChecked: true),
          ToDoModel(
              id: "5",
              text: 'Create home side menu with profile',
              isChecked: false),
          ToDoModel(id: "6", text: 'create profile screen', isChecked: false),
        ]);
      }

      toDoList = result.asObservable();
    } catch (e, s) {
      print(e);
      print(s);
    }
    isLoadedList = false;
  }
}
