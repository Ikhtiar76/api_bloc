// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:api_bloc/data/network/api/user_api.dart.dart';
import 'package:api_bloc/ui/login/bloc/repositories/repositories.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/network/dio_client.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginBlocEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoggedIn>((event, emit) async {
      emit(LogInLoadingState());
      try {
        final UserRepositories userRepositories =
            UserRepositories(UserApi(dioClient: DioClient(Dio())));

        // ignore: unused_local_variable
        final usersData = await userRepositories.addNewUserRequested(
            event.username, event.password);
        emit(LoginSuccessfulState());
      } catch (e) {
        emit(LogInErrorState(e.toString()));
      }
    });

    on<EyeButtonClickEvent>((event, emit) => emit(
        HideState(obscureText: false, icon: const Icon(Icons.visibility))));
    on<EyeButtonHideEvent>((event, emit) => emit(UnhideState(
        icon: const Icon(Icons.visibility_off), obscureText: true)));
  }
}
