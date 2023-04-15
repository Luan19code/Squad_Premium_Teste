// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'to_do_state.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ToDoState on _ToDoStateBase, Store {
  late final _$toDoListAtom =
      Atom(name: '_ToDoStateBase.toDoList', context: context);

  @override
  ObservableList<ToDoModel> get toDoList {
    _$toDoListAtom.reportRead();
    return super.toDoList;
  }

  @override
  set toDoList(ObservableList<ToDoModel> value) {
    _$toDoListAtom.reportWrite(value, super.toDoList, () {
      super.toDoList = value;
    });
  }

  late final _$isLoadedListAtom =
      Atom(name: '_ToDoStateBase.isLoadedList', context: context);

  @override
  bool get isLoadedList {
    _$isLoadedListAtom.reportRead();
    return super.isLoadedList;
  }

  @override
  set isLoadedList(bool value) {
    _$isLoadedListAtom.reportWrite(value, super.isLoadedList, () {
      super.isLoadedList = value;
    });
  }

  late final _$getToDoListAsyncAction =
      AsyncAction('_ToDoStateBase.getToDoList', context: context);

  @override
  Future<dynamic> getToDoList() {
    return _$getToDoListAsyncAction.run(() => super.getToDoList());
  }

  late final _$_ToDoStateBaseActionController =
      ActionController(name: '_ToDoStateBase', context: context);

  @override
  void addToDo({required ToDoModel toDo}) {
    final _$actionInfo = _$_ToDoStateBaseActionController.startAction(
        name: '_ToDoStateBase.addToDo');
    try {
      return super.addToDo(toDo: toDo);
    } finally {
      _$_ToDoStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void deleteToDo({required ToDoModel toDo}) {
    final _$actionInfo = _$_ToDoStateBaseActionController.startAction(
        name: '_ToDoStateBase.deleteToDo');
    try {
      return super.deleteToDo(toDo: toDo);
    } finally {
      _$_ToDoStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateToDo({required ToDoModel toDo, String? text}) {
    final _$actionInfo = _$_ToDoStateBaseActionController.startAction(
        name: '_ToDoStateBase.updateToDo');
    try {
      return super.updateToDo(toDo: toDo, text: text);
    } finally {
      _$_ToDoStateBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
toDoList: ${toDoList},
isLoadedList: ${isLoadedList}
    ''';
  }
}
