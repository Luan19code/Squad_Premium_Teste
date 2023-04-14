import 'package:flutter/material.dart';
import 'package:to_do_list_squad/core/components/sqd_check_box.dart';

class AllPage extends StatefulWidget {
  const AllPage({super.key});

  @override
  State<AllPage> createState() => _AllPageState();
}

class _AllPageState extends State<AllPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SQDCheckBox(
            isChecked: false,
            onChanged: (p0) {},
            text: "Create home side menu with profile"),
      ],
    );
  }
}
