import 'dart:convert';

import 'package:to_do_list_squad/core/utils/shared_preferences_manager.dart';
import 'package:to_do_list_squad/src/to_do_list/data/models/to_do_model.dart';
import 'package:to_do_list_squad/src/to_do_list/domain/repositories/to_do_repository.dart';

class ToDoRepositoryImpl implements ToDoRepository {
  @override
  Future<List<ToDoModel>> getListToDos() async {
    final result = await SharedPreferencesManager().get("to_do_list");
    if (result != null && result.isNotEmpty) {
      return jsonDecode(result)
          .map<ToDoModel>((e) => ToDoModel.fromMap(e))
          .toList();
    }
    return [];
  }

  @override
  Future<void> setListToDos(List<ToDoModel> listToDos) async {
    await SharedPreferencesManager().save(
        "to_do_list", listToDos.map((e) => e.toJson()).toList().toString());
  }
}
