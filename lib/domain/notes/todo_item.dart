import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../core/entity.dart';
import '../core/failures.dart';
import '../core/value_objects.dart';
import 'value_objects.dart';

part 'todo_item.freezed.dart';

@freezed
class TodoItem with _$TodoItem, IEntity {
  const factory TodoItem({
    required UniqueId id,
    required TodoName name,
    required bool done,
  }) = _TodoItem;

  factory TodoItem.empty() => TodoItem(
        id: UniqueId(),
        name: TodoName(''),
        done: false,
      );

  const TodoItem._(); // Added constructor

  Option<ValueFailure<dynamic>> get failureOption {
    return name.failureOrUnit.fold((f) => some(f), (_) => none());
  }
}
