import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_masterclass/bloc/counter/counter_bloc.dart';
import 'package:flutter_bloc_masterclass/bloc/image_picker/image_picker_bloc.dart';
import 'package:flutter_bloc_masterclass/bloc/multiple_state/multiple_state_bloc.dart';
import 'package:flutter_bloc_masterclass/bloc/post/post_bloc.dart';
import 'package:flutter_bloc_masterclass/bloc/todo/todo_bloc.dart';
import 'package:flutter_bloc_masterclass/ui/image_picker_screen.dart';
import 'package:flutter_bloc_masterclass/ui/multiple_state_screen.dart';
import 'package:flutter_bloc_masterclass/ui/post_screen.dart';
import 'package:flutter_bloc_masterclass/ui/todo_screen.dart';
import 'package:flutter_bloc_masterclass/utils/image_picker_utils.dart';

void main() {
  // runApp(BlocProvider(
  //   create: (_) => CounterBloc(),
  //   child: BlocProvider(
  //     create: (_) => MultipleStateBloc(),
  //     child: MaterialApp(
  //       title: 'flutter bloc masterclass',
  //       home: MultipleStateScreen(),
  //     ),
  //   ),
  // ));

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => CounterBloc()),
      BlocProvider(create: (_) => MultipleStateBloc()),
      BlocProvider(create: (_) =>ImagePickerBloc(ImagePickerUtils())),
      BlocProvider(create: (_) => ToDoBloc()),
      BlocProvider(create: (_) => PostBloc()),
    ],
    child: MaterialApp(
      title: 'flutter bloc masterclass',
      home: PostScreen(),
    ),
  ));
}

// class EquatableTestingState extends StatefulWidget {
//   const EquatableTestingState({super.key});
//
//   @override
//   State<EquatableTestingState> createState() => _EquatableTestingStateState();
// }
//
// class _EquatableTestingStateState extends State<EquatableTestingState> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Equatable Testing'),
//       ),
//       floatingActionButton: FloatingActionButton(onPressed: () {
//         Person p1 = Person(name: 'Jami', age: 27);
//         Person p2 = Person(name: 'Jami', age: 27);
//
//         print(p1 == p2);
//         print(p1 == p1);
//
//         print(p1.hashCode.toString());
//         print(p2.hashCode.toString());
//       }),
//     );
//   }
// }

// class Person extends Equatable {
//   final String name;
//   final int age;
//
//   Person({required this.name, required this.age});
//
//   @override
//   // TODO: implement props
//   List<Object?> get props => [name, age];
//
//   // @override
//   // bool operator ==(Object other) {
//   //   if (identical(this, other)) return true;
//   //
//   //   return other is Person &&
//   //       other.name == name &&
//   //       other.age == age;
//   // }
//   //
//   // @override
//   // int get hashCode => name.hashCode ^ age.hashCode;
// }
