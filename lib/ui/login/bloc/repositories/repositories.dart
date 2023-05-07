// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:api_bloc/data/network/api/user_api.dart.dart';
import 'package:api_bloc/data/network/dio_exception.dart';
import 'package:dio/dio.dart';

import '../../model/models.dart';

class UserRepositories {
  final UserApi userApi;
  UserRepositories(
    this.userApi,
  );

  Future<Users> addNewUserRequested(String username, String password) async {
    try {
      final response = await userApi.loginUser(username, password);
      final token = response.token;
      print("token>>>>>> $token");
      return response;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
