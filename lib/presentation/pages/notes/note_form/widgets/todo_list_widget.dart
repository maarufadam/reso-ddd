import 'dart:ui';

import 'package:another_flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:kt_dart/kt.dart';
import 'package:provider/provider.dart';

import '../../../../../application/notes/note_form/note_form_bloc.dart';
import '../../../../../domain/notes/value_objects.dart';
import '../misc/build_context_x.dart';
import '../misc/todo_item_presentation_classes.dart';

class TodoList extends HookWidget {
  const TodoList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<NoteFormBloc, NoteFormState>(
          // After the Initialized event
          listenWhen: (p, c) => p.isEditing != c.isEditing,
          listener: (context, state) {
            context.formTodos = state.note.todos.value.fold(
              (_) => mutableListOf<TodoItemPrimitive>(),
              (todoItemList) => todoItemList
                  .map((_) => TodoItemPrimitive.fromDomain(_))
                  .toMutableList(),
            );
          },
        ),
        BlocListener<NoteFormBloc, NoteFormState>(
          // An example of when we cannot rely on the failure - it happens only when the list contains more than the max limit of items
          // Unlike with EmailAddress, we definitely don't want to make our user remove the additional todos manually.
          // We want to prevent even adding them.
          listenWhen: (p, c) =>
              // The only situation where the previous state held an empty todo list and the current state holds a full one is when we're starting
              // to edit a note. In that case, we don't want to show the Flushbar.
              p.note.todos.length != 0 &&
              p.note.todos.isFull != c.note.todos.isFull,
          listener: (context, state) {
            if (state.note.todos.isFull) {
              FlushbarHelper.createAction(
                message: 'Want longer lists? Activate premium 🤩',
                button: TextButton(
                  onPressed: () {
                    //TOOD Show Bought! 🤑
                  },
                  child: const Text(
                    'BUY NOW',
                    style: TextStyle(color: Colors.yellow),
                  ),
                ),
                duration: const Duration(seconds: 5),
              ).show(context);
            }
          },
        ),
      ],
      child: Consumer<FormTodos>(
        builder: (context, formTodos, child) {
          return ImplicitlyAnimatedReorderableList<TodoItemPrimitive>(
            items: context.formTodos.asList(),
            shrinkWrap: true,
            updateDuration: const Duration(milliseconds: 50),
            removeDuration: const Duration(milliseconds: 250),
            areItemsTheSame: (oldItem, newItem) => oldItem.id == newItem.id,
            onReorderFinished: (item, from, to, newItems) {
              context.formTodos = newItems.toImmutableList();
              context
                  .read<NoteFormBloc>()
                  .add(NoteFormEvent.todosChanged(context.formTodos));
            },
            itemBuilder: (context, itemAnimation, item, index) {
              return Reorderable(
                key: ValueKey(item.id),
                builder: (context, dragAnimation, inDrag) {
                  final elevation = lerpDouble(0, 8, dragAnimation.value);
                  return ScaleTransition(
                    scale: Tween<double>(begin: 1, end: 0.95)
                        .animate(dragAnimation),
                    child: TodoTile(
                      // We have to pass in the index and not a complete TodoItemPrimitive to always get the most fresh value held in FormTodos
                      index: index,
                      elevation: elevation,
                    ),
                  );
                },
              );
            },
            updateItemBuilder: (context, itemAnimation, item) {
              return Reorderable(
                key: ValueKey(item.id),
                builder: (context, dragAnimation, inDrag) {
                  return StaticTodoTile(
                    todo: item,
                  );
                },
              );
            },
            removeItemBuilder: (context, itemAnimation, item) {
              return Reorderable(
                key: ValueKey(item.id),
                builder: (context, dragAnimation, inDrag) {
                  return FadeTransition(
                    opacity: itemAnimation,
                    child: StaticTodoTile(
                      todo: item,
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class StaticTodoTile extends StatelessWidget {
  final TodoItemPrimitive todo;
  final double elevation;

  const StaticTodoTile({
    Key? key,
    required this.todo,
    double? elevation,
  })  : elevation = elevation ?? 0,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: const SlidableDrawerActionPane(),
      actionExtentRatio: 0.15,
      secondaryActions: const <Widget>[
        IconSlideAction(
          caption: 'Delete',
          icon: Icons.delete,
          color: Colors.red,
        ),
      ],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        child: Material(
          elevation: elevation,
          animationDuration: const Duration(milliseconds: 100),
          borderRadius: BorderRadius.circular(8),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8)),
            child: ListTile(
              leading: Checkbox(
                value: todo.done,
                onChanged: (_) {},
              ),
              trailing: const Handle(
                child: Icon(
                  Icons.list,
                ),
              ),
              title: TextFormField(
                initialValue: todo.name,
                enabled: false,
                decoration: const InputDecoration(
                  hintText: 'Todo',
                  counterText: '',
                  border: InputBorder.none,
                ),
                maxLength: TodoName.maxLength,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class TodoTile extends HookWidget {
  final int index;
  final double elevation;

  const TodoTile({
    Key? key,
    required this.index,
    double? elevation,
  })  : elevation = elevation ?? 0,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    final todo =
        context.formTodos.getOrElse(index, (_) => TodoItemPrimitive.empty());
    final textEditingController = useTextEditingController(text: todo.name);

    return Slidable(
      actionPane: const SlidableDrawerActionPane(),
      actionExtentRatio: 0.15,
      secondaryActions: <Widget>[
        IconSlideAction(
          caption: 'Delete',
          icon: Icons.delete,
          color: Colors.red,
          onTap: () {
            context.formTodos = context.formTodos.minusElement(todo);
            context
                .read<NoteFormBloc>()
                .add(NoteFormEvent.todosChanged(context.formTodos));
          },
        ),
      ],
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        child: Material(
          elevation: elevation,
          animationDuration: const Duration(milliseconds: 100),
          borderRadius: BorderRadius.circular(8),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8)),
            child: ListTile(
              leading: Checkbox(
                value: todo.done,
                onChanged: (value) {
                  context.formTodos = context.formTodos.map((listTodo) =>
                      listTodo == todo
                          ? todo.copyWith(done: value!)
                          : listTodo);
                  context
                      .read<NoteFormBloc>()
                      .add(NoteFormEvent.todosChanged(context.formTodos));
                },
              ),
              trailing: const Handle(
                child: Icon(
                  Icons.list,
                ),
              ),
              title: TextFormField(
                controller: textEditingController,
                decoration: const InputDecoration(
                  hintText: 'Todo',
                  counterText: '',
                  border: InputBorder.none,
                ),
                maxLength: TodoName.maxLength,
                maxLengthEnforcement: MaxLengthEnforcement.enforced,
                onChanged: (value) {
                  context.formTodos = context.formTodos.map((listTodo) =>
                      listTodo == todo ? todo.copyWith(name: value) : listTodo);
                  context
                      .read<NoteFormBloc>()
                      .add(NoteFormEvent.todosChanged(context.formTodos));
                },
                validator: (_) {
                  return context
                      .watch<NoteFormBloc>()
                      .state
                      .note
                      .todos
                      .value
                      .fold(
                        // Failure stemming from the TodoList length should NOT be displayed by the individual TextFormFields
                        (f) => null,
                        (todoList) => todoList[index].name.value.fold(
                              (f) => f.maybeMap(
                                empty: (f) => 'Cannot be empty',
                                exceedingLength: (_) => 'Too long',
                                multiline: (_) => 'Has to be in a single line',
                                orElse: () => null,
                              ),
                              (_) => null,
                            ),
                      );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
