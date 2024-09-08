import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_masterclass/bloc/login/login_bloc.dart';
import 'package:flutter_bloc_masterclass/bloc/login/login_event.dart';
import 'package:flutter_bloc_masterclass/bloc/login/login_state.dart';
import 'package:flutter_bloc_masterclass/utils/enums.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late LoginBloc _loginBloc;
  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loginBloc = LoginBloc();
  }

  @override
  void dispose() {
    super.dispose();
    _loginBloc.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: BlocProvider(
        create: (_) => LoginBloc(),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlocBuilder<LoginBloc, LoginState>(
                  buildWhen: (current, previous) =>
                     false,
                  builder: (context, state) {
                    return TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      focusNode: emailFocusNode,
                      decoration: const InputDecoration(
                          hintText: 'Email', border: OutlineInputBorder()),
                      onChanged: (value) {
                        // context
                        //     .read<LoginBloc>()
                        //     .add(EmailChanged(email: value));
                       },
                      onFieldSubmitted: (value) {},
                    );
                  }),
              const SizedBox(
                height: 20,
              ),
              BlocBuilder<LoginBloc, LoginState>(
                  buildWhen: (current, previous) =>
                      false,
                  builder: (context, state) {
                    return TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.text,
                      focusNode: passwordFocusNode,
                      decoration: const InputDecoration(
                          hintText: 'Password', border: OutlineInputBorder()),
                      onChanged: (value) {

                       },
                      onFieldSubmitted: (value) {
                          // context
                          //     .read<LoginBloc>()
                          //     .add(PasswordChanged(password: value));
                      },
                    );
                  }),
              const SizedBox(
                height: 50,
              ),
              BlocListener<LoginBloc, LoginState>(
                listener: (context, state) {
                  if (state.loginStatus == LoginStatus.loading) {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(SnackBar(content: Text('submitting')));
                  }
                  if (state.loginStatus == LoginStatus.success) {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                          SnackBar(content: Text('Login successful')));
                  }

                  if (state.loginStatus == LoginStatus.error) {
                    ScaffoldMessenger.of(context)
                      ..hideCurrentSnackBar()
                      ..showSnackBar(
                          SnackBar(content: Text(state.message.toString())));
                  }
                },
                child: BlocBuilder<LoginBloc, LoginState>(
                    buildWhen: (current, previous) => false,
                    builder: (context, state) {
                      return ElevatedButton(
                          onPressed: () {
                            context.read<LoginBloc>().add(LoginApi(email: emailController.text, password: passwordController.text));
                          },
                          child: const Text('Login'));
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
