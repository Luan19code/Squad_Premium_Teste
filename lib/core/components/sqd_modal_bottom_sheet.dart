import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:to_do_list_squad/core/utils/sqd_color.dart';
import 'package:to_do_list_squad/src/to_do_list/data/models/to_do_model.dart';
import 'package:to_do_list_squad/src/to_do_list/presentation/provider/to_do_state.dart';
import 'package:uuid/uuid.dart';

class SQDModalBottomSheet extends StatefulWidget {
  final ToDoModel? toDo;

  const SQDModalBottomSheet({super.key, this.toDo});

  @override
  State<SQDModalBottomSheet> createState() => _SQDModalBottomSheetState();
}

class _SQDModalBottomSheetState extends State<SQDModalBottomSheet> {
  final TextEditingController _textEditingController = TextEditingController();
  final todoState = GetIt.I.get<ToDoState>();

  @override
  void initState() {
    if (widget.toDo != null) {
      _textEditingController.text = widget.toDo!.text;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          top: 16.0,
          left: 16.0,
          right: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: _textEditingController,
            decoration: const InputDecoration(
              labelText: 'type your to-do here',
            ),
          ),
          const SizedBox(height: 16.0),
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all<Color>(SQDColor.accent),
            ),
            onPressed: () {
              if (widget.toDo != null) {
                todoState.updateToDo(
                    toDo: widget.toDo!, text: _textEditingController.text);
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: const Text('ToDo edited successfully'),
                  backgroundColor: SQDColor.warning.withOpacity(0.7),
                ));
              } else {
                todoState.addToDo(
                    toDo: ToDoModel(
                        id: const Uuid().v4(),
                        isChecked: false,
                        text: _textEditingController.text));
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: const Text('ToDo added successfully'),
                  backgroundColor: SQDColor.accent.withOpacity(0.7),
                ));
              }
              Navigator.pop(context);
            },
            child: const Text('Save', style: TextStyle(color: SQDColor.white)),
          ),
          const SizedBox(height: 16.0),
        ],
      ),
    );
  }
}

void sQDShowModalBottomSheet(BuildContext context, {ToDoModel? toDo}) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return SQDModalBottomSheet(
        toDo: toDo,
      );
    },
  );
}
