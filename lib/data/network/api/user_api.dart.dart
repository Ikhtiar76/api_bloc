import 'dart:convert';

import 'package:api_bloc/data/network/dio_exception.dart';
import 'package:dio/dio.dart';

import '../../../ui/login/model/models.dart';
import '../dio_client.dart';
import 'constant.dart';

class UserApi {
  final DioClient dioClient;

  UserApi({required this.dioClient});

  Future<Users> loginUser(String username, String password) async {
    try {
      final body = jsonEncode(<String, String>{
        "username": username,
        "password": password,
      });
      final Response response =
          await dioClient.post(Endpoints.userLogin, body: body);
      final data = Users.fromJson(response.data);
      return data;
    } on DioError catch (e) {
      DioExceptions.fromDioError(e).toString();
      rethrow;
    }
  }

  Future<Response> getUsersApi() async {
    try {
      final Response response = await dioClient.get(Endpoints.users);
      print(Endpoints.users);
      return response;
    } on DioError catch (e) {
      DioExceptions.fromDioError(e).toString();
      rethrow;
    }
  }

  Future<Response> updateUserApi(int id, String name, String job) async {
    try {
      final Response response = await dioClient.put(
        // ignore: prefer_interpolation_to_compose_strings
        Endpoints.users + '/$id',
        data: {
          'name': name,
          'job': job,
        },
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<void> deleteUserApi(int id) async {
    try {
      // ignore: prefer_interpolation_to_compose_strings
      await dioClient.delete(Endpoints.users + '/$id');
    } catch (e) {
      rethrow;
    }
  }
}
