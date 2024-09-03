import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_masterclass/bloc/counter/counter_bloc.dart';
import 'package:flutter_bloc_masterclass/ui/counter_screen.dart';

void main() {
  runApp(BlocProvider(
    create: (_) => CounterBloc(),
    child: const MaterialApp(
      title: 'flutter bloc masterclass',
      home: CounterScreen(),
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
