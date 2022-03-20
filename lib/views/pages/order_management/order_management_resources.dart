import 'package:flutter_order_management/data/models/order_models/order_model.dart';

import 'bloc/order_management_bloc.dart';

mixin OrderManagementResources {
  OrderManagementBloc? orderManagementBloc;
  List<OrderModel> allOrders = [];
  bool isLoading=false;
}