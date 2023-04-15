import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:to_do_list_squad/core/components/sqd_check_box.dart';
import 'package:to_do_list_squad/src/to_do_list/presentation/provider/to_do_state.dart';

class AllPage extends StatefulWidget {
  const AllPage({super.key});

  @override
  State<AllPage> createState() => _AllPageState();
}

class _AllPageState extends State<AllPage> {
  final todoState = GetIt.I.get<ToDoState>();
  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (todoState.isLoadedList) {
        return Center(
          child: CircularProgressIndicator(
            color: Theme.of(context).primaryColor,
          ),
        );
      }
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ...todoState.toDoList
                .map(
                  (e) => SQDCheckBox(toDo: e),
                )
                .toList(),
          ],
        ),
      );
    });
  }
}
