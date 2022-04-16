import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_order_management/data/models/base_models/base_response_model.dart';
import 'package:flutter_order_management/data/models/product_models/product_model.dart';
import 'package:flutter_order_management/data/sources/api/api_service.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitialState()) {
    on(homeEventControl);
  }
  final apiService = APIService();
  Future<void> homeEventControl(HomeEvent event, Emitter<HomeState> emit) async {
    if (event is HomeProcessStart) {
      emit(HomeProcessLoading());
      BaseListResponse<ProductModel>? response = await apiService.getAllProducts();
      if (response != null) {
        emit(HomeProcessSuccesful(response.model!));
      } else {
        emit(HomeProcessError());
      }
    }
  }
}
