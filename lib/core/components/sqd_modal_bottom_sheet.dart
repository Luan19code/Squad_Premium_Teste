import 'package:flutter/material.dart';
import 'package:to_do_list_squad/core/utils/sqd_color.dart';

class SQDModalBottomSheet extends StatelessWidget {
  final TextEditingController _textEditingController = TextEditingController();

  SQDModalBottomSheet({super.key});

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

void sQDShowModalBottomSheet(BuildContext context) {
  showModalBottomSheet(
    isScrollControlled: true,
    context: context,
    builder: (BuildContext context) {
      return SQDModalBottomSheet();
    },
  );
}
