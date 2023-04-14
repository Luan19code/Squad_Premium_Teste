import 'package:flutter/material.dart';
import 'package:to_do_list_squad/core/utils/sqd_color.dart';

class SQDCheckBox extends StatefulWidget {
  final String text;
  final bool isChecked;
  final Function(bool) onChanged;

  const SQDCheckBox({
    super.key,
    required this.text,
    required this.isChecked,
    required this.onChanged,
  });

  @override
  State<SQDCheckBox> createState() => _SQDCheckBoxState();
}

class _SQDCheckBoxState extends State<SQDCheckBox> {
  bool _isChecked = false;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.isChecked;
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          _isChecked = !_isChecked;
          widget.onChanged(_isChecked);
        });
      },
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 20,
              height: 20,
              margin: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                color: _isChecked ? SQDColor.accent : SQDColor.background,
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                border: Border.all(
                  color: _isChecked ? SQDColor.accent : SQDColor.borderCheckBox,
                  width: 1,
                ),
              ),
              child: _isChecked
                  ? const Icon(
                      Icons.check,
                      color: SQDColor.white,
                      size: 15,
                    )
                  : null,
            ),
            const SizedBox(width: 2),
            Text(
              widget.text,
              style: TextStyle(
                  color: _isChecked ? SQDColor.secondaryText : SQDColor.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  decoration: _isChecked ? TextDecoration.lineThrough : null),
            ),
          ],
        ),
      ),
    );
  }
}
