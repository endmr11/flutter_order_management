import 'package:flutter/material.dart';
import 'package:flutter_order_management/views/pages/order_management/bloc/order_management_bloc.dart';
import 'package:flutter_order_management/views/pages/order_management/order_management.dart';
import 'package:flutter_order_management/views/pages/order_management/order_management_resources.dart';

abstract class OrderManagementViewModel extends State<OrderManagement> with OrderManagementResources {
  @override
  void initState() {
    super.initState();
    orderManagementBloc = OrderManagementBloc();
    orderManagementBloc?.add(OrderManagementProcessStart());
  }

  @override
  void dispose() {
    super.dispose();
    orderManagementBloc?.close();
  }
}