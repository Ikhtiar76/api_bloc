// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitial extends LoginState {}

class LoginSuccessfulState extends LoginState {}

class LogInErrorState extends LoginState {
  final String errormessage;

  const LogInErrorState(this.errormessage);
}

class LogInLoadingState extends LoginState {}

// ignore: must_be_immutable
class HideState extends LoginState {
  Icon icon;
  bool obscureText;
  HideState({
    required this.icon,
    required this.obscureText,
  });
  @override
  List<Object> get props => [obscureText, icon];
}

// ignore: must_be_immutable
class UnhideState extends LoginState {
  Icon icon;
  bool obscureText;
  UnhideState({
    required this.icon,
    required this.obscureText,
  });
  @override
  List<Object> get props => [obscureText, icon];
}
