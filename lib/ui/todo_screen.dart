import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_masterclass/bloc/todo/todo_bloc.dart';
import 'package:flutter_bloc_masterclass/bloc/todo/todo_events.dart';
import 'package:flutter_bloc_masterclass/bloc/todo/todo_states.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      body: BlocBuilder<ToDoBloc, ToDoStates>(builder: (context, state) {
        if (state.todosList.isEmpty) {
          return const Center(
            child: Text('No task found'),
          );
        } else if (state.todosList.isNotEmpty) {
          return ListView.builder(
              itemCount: state.todosList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.todosList[index]),
                  trailing: IconButton(
                      onPressed: () {
                        context
                            .read<ToDoBloc>()
                            .add(RemoveTodoEvent(task: state.todosList[index]));
                      },
                      icon: const Icon(Icons.delete)),
                );
              });
        } else {
          return const SizedBox();
        }
      }),
      floatingActionButton: FloatingActionButton(onPressed: () {
        for (int i = 0; i < 5; i++) {
          context
              .read<ToDoBloc>()
              .add(AddTodoEvent(task: 'Task: ' + (i + 1).toString()));
        }
      }),
    );
  }
}
