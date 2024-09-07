import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_masterclass/bloc/todo/todo_events.dart';
import 'package:flutter_bloc_masterclass/bloc/todo/todo_states.dart';

class ToDoBloc extends Bloc<ToDoEvent, ToDoStates> {
  
  final List<String> todosList = [];
  ToDoBloc():super(const ToDoStates()) {
    on<AddTodoEvent>(_addToDoEvent);
    on<RemoveTodoEvent>(_removeToDoEvent);
  }

  void _addToDoEvent(AddTodoEvent event, Emitter<ToDoStates> emit) {
    todosList.add(event.task);
    emit(state.copyWith(todosList:List.from(todosList)));

  }

  void _removeToDoEvent(RemoveTodoEvent event, Emitter<ToDoStates> emit) {
    todosList.remove(event.task);
    emit(state.copyWith(todosList:List.from(todosList)));
  }
}