import 'package:api_bloc/data/network/api/user_api.dart.dart';
import 'package:dio/dio.dart';
import '../model/models.dart';
import '../network/dio_exception.dart';

class UserRepository {
  final UserApi userApi;

  UserRepository(this.userApi);

  Future<List<ProductModel>> getUsersRequested() async {
    try {
      final response = await userApi.getUsersApi();
      final data = response.data;
      final List<dynamic> dataList = data is List ? data : [data];
      final users = dataList
          .cast<Map<String, dynamic>>()
          .map((e) => ProductModel.fromJson(e))
          .toList();
      return users;
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }

  Future<void> deleteNewUserRequested(int id) async {
    try {
      await userApi.deleteUserApi(id);
    } on DioError catch (e) {
      final errorMessage = DioExceptions.fromDioError(e).toString();
      throw errorMessage;
    }
  }
}
