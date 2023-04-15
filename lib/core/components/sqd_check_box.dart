import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:to_do_list_squad/core/components/sqd_modal_bottom_sheet.dart';
import 'package:to_do_list_squad/core/utils/sqd_color.dart';
import 'package:to_do_list_squad/src/to_do_list/data/models/to_do_model.dart';
import 'package:to_do_list_squad/src/to_do_list/presentation/provider/to_do_state.dart';

class SQDCheckBox extends StatefulWidget {
  final ToDoModel toDo;

  const SQDCheckBox({
    super.key,
    required this.toDo,
  });

  @override
  State<SQDCheckBox> createState() => _SQDCheckBoxState();
}

class _SQDCheckBoxState extends State<SQDCheckBox> {
  final toDoState = GetIt.I.get<ToDoState>();
  double _objectSize = 0;

  @override
  void didChangeDependencies() {
    Future.delayed(const Duration(milliseconds: 150), () {
      setState(() {
        _objectSize = 60;
      });
    });

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Dismissible(
          key: Key(widget.toDo.id),
          background: Container(
            color: SQDColor.danger,
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 20),
                child: Icon(
                  Icons.delete,
                  color: SQDColor.white,
                ),
              ),
            ),
          ),
          secondaryBackground: Container(
            color: SQDColor.warning,
            child: const Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(right: 20),
                child: Icon(
                  Icons.edit,
                  color: SQDColor.white,
                ),
              ),
            ),
          ),
          confirmDismiss: (direction) {
            if (direction == DismissDirection.startToEnd) {
              return Future.value(true);
            } else {
              sQDShowModalBottomSheet(context, toDo: widget.toDo);
              return Future.value(false);
            }
          },
          onDismissed: (direction) {
            if (direction == DismissDirection.startToEnd) {
              toDoState.deleteToDo(toDo: widget.toDo);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text('ToDo ${widget.toDo.text} deleted'),
                backgroundColor: SQDColor.danger.withOpacity(.7),
              ));
            }
          },
          child: InkWell(
            onTap: () {
              setState(() {
                _objectSize = 0;
              });
              Future.delayed(const Duration(milliseconds: 400), () {
                toDoState.updateToDo(
                  toDo: widget.toDo,
                );
                _objectSize = 50;
              });
            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut,
              height: _objectSize,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    margin: const EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                      color: widget.toDo.isChecked
                          ? SQDColor.accent
                          : SQDColor.background,
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      border: Border.all(
                        color: widget.toDo.isChecked
                            ? SQDColor.accent
                            : SQDColor.borderCheckBox,
                        width: 1,
                      ),
                    ),
                    child: widget.toDo.isChecked
                        ? const Icon(
                            Icons.check,
                            color: SQDColor.white,
                            size: 15,
                          )
                        : null,
                  ),
                  const SizedBox(width: 2),
                  Text(
                    widget.toDo.text,
                    style: TextStyle(
                        color: widget.toDo.isChecked
                            ? SQDColor.secondaryText
                            : SQDColor.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        decoration: widget.toDo.isChecked
                            ? TextDecoration.lineThrough
                            : null),
                  ),
                ],
              ),
            ),
          ),
        ),
        Row(
          children: const [
            SizedBox(
              width: 35,
            ),
            Expanded(
              child: Divider(
                color: SQDColor.divider,
                height: 1,
              ),
            ),
          ],
        )
      ],
    );
  }
}
