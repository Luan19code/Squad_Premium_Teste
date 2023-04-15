import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:to_do_list_squad/core/components/sqd_check_box.dart';
import 'package:to_do_list_squad/src/to_do_list/presentation/provider/to_do_state.dart';

class PendingPage extends StatefulWidget {
  const PendingPage({super.key});

  @override
  State<PendingPage> createState() => _PendingPageState();
}

class _PendingPageState extends State<PendingPage> {
  final todoState = GetIt.I.get<ToDoState>();
  @override
  Widget build(BuildContext context) {
    if (todoState.isLoadedList) {
      return Center(
        child: CircularProgressIndicator(
          color: Theme.of(context).primaryColor,
        ),
      );
    }
    return Observer(builder: (_) {
      return SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            ...todoState.toDoList
                .map(
                  (e) => !e.isChecked ? SQDCheckBox(toDo: e) : const SizedBox(),
                )
                .toList(),
          ],
        ),
      );
    });
  }
}
