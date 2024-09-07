import 'package:equatable/equatable.dart';

class ToDoStates extends Equatable {
  final List<String> todosList;

  const ToDoStates({this.todosList = const []});

  ToDoStates copyWith({List<String>? todosList}) {
    return ToDoStates(todosList: todosList ?? this.todosList);
  }

  @override
  List<Object?> get props => [todosList];
}
