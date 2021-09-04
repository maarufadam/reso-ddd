import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kt_dart/kt.dart';
import '../../../../../application/notes/note_form/note_form_bloc.dart';
import '../misc/todo_item_presentation_classes.dart';
import '../misc/build_context_x.dart';

class AddTodoTile extends StatelessWidget {
  const AddTodoTile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteFormBloc, NoteFormState>(
      // An example of when we cannot rely on the failure - it happens only when the list contains more than the max limit of items
      // Unlike with EmailAddress, we definitely don't want to make our user remove the additional todos manually.
      // We want to prevent even adding them.
      buildWhen: (p, c) => p.note.todos.isFull != c.note.todos.isFull,
      builder: (context, state) {
        return ListTile(
          enabled: !state.note.todos.isFull,
          title: const Text(
            'Add a todo',
          ),
          leading: const Padding(
            padding: EdgeInsets.all(12.0),
            child: Icon(Icons.add),
          ),
          onTap: () {
            context.formTodos =
                context.formTodos.plusElement(TodoItemPrimitive.empty());
            context
                .read<NoteFormBloc>()
                .add(NoteFormEvent.todosChanged(context.formTodos));
          },
        );
      },
    );
  }
}
