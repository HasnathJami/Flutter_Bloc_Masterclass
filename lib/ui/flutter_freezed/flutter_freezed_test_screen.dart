import 'package:flutter/material.dart';
import 'package:flutter_bloc_masterclass/ui/flutter_freezed/user_model.dart';

class FlutterFreezedTestScreen extends StatelessWidget {
  const FlutterFreezedTestScreen({super.key});

  @override
  Widget build(BuildContext context) {

    // print("Jishan");
    UserModel u = UserModel(name: 'jami');
    print(u.name);
   // u.fromJson()

    Map<String, dynamic> data = {
      'name': null
    };
    // u = UserModel.fromJson(data);
    // print(u.name);

    return const Placeholder();
  }
}



