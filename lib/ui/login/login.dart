import 'package:api_bloc/ui/home.dart';
import 'package:api_bloc/ui/homescreen.dart';
import 'package:api_bloc/widgets/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/login_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    // ignore: no_leading_underscores_for_local_identifiers
    bool _obsecureText = true;
    Icon icon = const Icon(Icons.visibility_off);
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: Scaffold(
        body: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            // ignore: avoid_print
            print(state);
            if (state is LogInLoadingState) {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                content: Text('Please wait'),
                backgroundColor: Colors.red,
              ));
            } else if (state is LoginSuccessfulState) {
              // Navigate to the next screen on successful login
              const HomeScreen();
            } else if (state is LogInErrorState) {
              // Show an error message if login fails
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: Text(state.errormessage),
                backgroundColor: Colors.red,
              ));
            } else if (state is HideState) {
              _obsecureText = state.obscureText;
              icon = state.icon;
            } else if (state is UnhideState) {
              _obsecureText = state.obscureText;
              icon = state.icon;
            }
          },
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width - 50,
                  child: ListView(
                    physics: const BouncingScrollPhysics(
                      parent: AlwaysScrollableScrollPhysics(),
                    ),
                    children: [
                      const Text('Welcome',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: Colors.black)),
                      const Text('"Glad to see you"',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 25,
                              color: Colors.grey)),
                      const SizedBox(
                        height: 100,
                      ),
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            hintText: 'Email',
                            prefixIcon: const Icon(
                              Icons.email,
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12))),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextField(
                        obscureText: _obsecureText,
                        controller: passwordController,
                        decoration: InputDecoration(
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black)),
                            hintText: 'Password',
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.black,
                            ),
                            suffixIcon: InkWell(
                                onTap: () {
                                  if (_obsecureText) {
                                    BlocProvider.of<LoginBloc>(context)
                                        .add(EyeButtonClickEvent());
                                  } else {
                                    BlocProvider.of<LoginBloc>(context)
                                        .add(EyeButtonHideEvent());
                                  }
                                },
                                child: icon),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(12))),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      myButton(
                          onPressed: () {
                            BlocProvider.of<LoginBloc>(context).add(LoggedIn(
                                username: emailController.text,
                                password: passwordController.text));

                            Future.delayed(const Duration(seconds: 1), () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) {
                                  return const Home();
                                },
                              ));
                            });
                          },
                          color: Colors.black,
                          textColor: Colors.white,
                          title: 'Login')
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

// Wrap the LoginScreen with BlocProvider and provide the LoginBloc instance

