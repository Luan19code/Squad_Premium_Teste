import 'dart:convert';

import 'package:to_do_list_squad/src/to_do_list/domain/entities/to_do.dart';

class ToDoModel extends ToDo {
  ToDoModel({
    required bool isChecked,
    required String text,
    required String id,
  }) : super(
          id: id,
          isChecked: isChecked,
          text: text,
        );

  ToDo copyWith({
    String? id,
    bool? isChecked,
    String? text,
  }) {
    return ToDo(
      id: id ?? this.id,
      isChecked: isChecked ?? this.isChecked,
      text: text ?? this.text,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'isChecked': isChecked,
      'text': text,
    };
  }

  factory ToDoModel.fromMap(Map<String, dynamic> map) {
    return ToDoModel(
      id: map['id'] as String,
      isChecked: map['isChecked'] as bool,
      text: map['text'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ToDoModel.fromJson(String source) =>
      ToDoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ToDo(id: $id, isChecked: $isChecked, text: $text)';

  @override
  bool operator ==(covariant ToDo other) {
    if (identical(this, other)) return true;

    return other.id == id && other.isChecked == isChecked && other.text == text;
  }

  @override
  int get hashCode => id.hashCode ^ isChecked.hashCode ^ text.hashCode;
}
