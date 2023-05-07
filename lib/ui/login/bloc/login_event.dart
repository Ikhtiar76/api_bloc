// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

abstract class LoginBlocEvent extends Equatable {
  const LoginBlocEvent();
}

// ignore: must_be_immutable
class LoggedIn extends LoginBlocEvent {
  final String username;
  final String password;
  const LoggedIn({
    required this.username,
    required this.password,
  });
  @override
  List<Object?> get props => [username, password];
}

class EyeButtonClickEvent extends LoginBlocEvent {
  @override
  List<Object?> get props => [];
}

class EyeButtonHideEvent extends LoginBlocEvent {
  @override
  List<Object?> get props => [];
}
