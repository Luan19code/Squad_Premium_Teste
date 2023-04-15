// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ToDoModel {
  final bool isChecked;
  final String text;
  final String id;

  ToDoModel({required this.isChecked, required this.text, required this.id});


  

  ToDoModel copyWith({
    bool? isChecked,
    String? text,
    String? id,
  }) {
    return ToDoModel(
      isChecked: isChecked ?? this.isChecked,
      text: text ?? this.text,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'isChecked': isChecked,
      'text': text,
      'id': id,
    };
  }

  factory ToDoModel.fromMap(Map<String, dynamic> map) {
    return ToDoModel(
      isChecked: map['isChecked'] as bool,
      text: map['text'] as String,
      id: map['id'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ToDoModel.fromJson(String source) =>
      ToDoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ToDoModel(isChecked: $isChecked, text: $text, id: $id)';

  @override
  bool operator ==(covariant ToDoModel other) {
    if (identical(this, other)) return true;

    return other.isChecked == isChecked && other.text == text && other.id == id;
  }

  @override
  int get hashCode => isChecked.hashCode ^ text.hashCode ^ id.hashCode;
}
