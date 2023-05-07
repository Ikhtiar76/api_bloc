import 'package:api_bloc/data/model/models.dart';
import 'package:api_bloc/data/network/api/user_api.dart.dart';
import 'package:api_bloc/data/repository/repository.dart';
import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../data/network/dio_client.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  ProductBloc() : super(ProductInitialState()) {
    on<ProductLoadEvent>((event, emit) async {
      emit(ProductLoadingState());
      try {
        final UserRepository userRepository =
            UserRepository(UserApi(dioClient: DioClient(Dio())));

        final usersData = await userRepository.getUsersRequested();
        emit(ProductLoadedState(usersData));
      } catch (e) {
        emit(ProductLoadFailure(message: e.toString()));
      }
    });
  }
}
