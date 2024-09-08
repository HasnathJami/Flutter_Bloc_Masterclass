import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object?> get props => [];
}

// class EmailChanged extends LoginEvent {
//   final String email;
//
//   const EmailChanged({required this.email});
//
//   @override
//   List<Object?> get props => [email];
// }
//
// class PasswordChanged extends LoginEvent {
//   const PasswordChanged({required this.password});
//
//   final String password;
//
//   @override
//   List<Object?> get props => [password];
// }

class LoginApi extends LoginEvent {
  final email;
  final password;

  const LoginApi({this.email, this.password});

  @override
  List<Object?> get props => [email,password];
}
