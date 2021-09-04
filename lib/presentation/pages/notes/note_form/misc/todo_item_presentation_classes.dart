import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/kt.dart';
import '../../../../../domain/core/value_objects.dart';
import '../../../../../domain/notes/todo_item.dart';
import '../../../../../domain/notes/value_objects.dart';

part 'todo_item_presentation_classes.freezed.dart';

class FormTodos extends ValueNotifier<KtList<TodoItemPrimitive>> {
  FormTodos() : super(emptyList<TodoItemPrimitive>());
}

@freezed
class TodoItemPrimitive with _$TodoItemPrimitive {
  const factory TodoItemPrimitive({
    required UniqueId id,
    required String name,
    required bool done,
  }) = _TodoItemPrimitive;

  const TodoItemPrimitive._(); // Added Constructor

  factory TodoItemPrimitive.empty() => TodoItemPrimitive(
        id: UniqueId(),
        name: '',
        done: false,
      );

  factory TodoItemPrimitive.fromDomain(TodoItem todoItemValue) =>
      TodoItemPrimitive(
        id: todoItemValue.id,
        name: todoItemValue.name.getOrCrash(),
        done: todoItemValue.done,
      );

  TodoItem toDomain() {
    return TodoItem(
      id: id,
      name: TodoName(name),
      done: done,
    );
  }
}
