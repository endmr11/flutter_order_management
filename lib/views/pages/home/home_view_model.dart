import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_order_management/data/sources/api/api_service.dart';
import 'package:flutter_order_management/data/sources/database/local_database_helper.dart';
import 'package:flutter_order_management/views/pages/home/home.dart';

import 'home_bloc/home_bloc.dart';
import 'home_resources.dart';
import 'shopping_cart_bloc/bloc/shopping_cart_bloc.dart';

abstract class HomeViewModel extends State<Home> with HomeResources {
  @override
  void initState() {
    homeBloc = HomeBloc(APIService());
    homeBloc?.add(HomeProcessStart());
    shoppingCartBloc = ShoppingCartBloc(APIService());
    shoppingCartBloc?.add(const ShoppingCartRefreshEvent());
    logSession();
    super.initState();
  }

  @override
  void dispose() {
    homeBloc?.close();
    shoppingCartBloc?.close();
    super.dispose();
  }

  void logSession() {
    log(LocaleDatabaseHelper.i.currentUserId.toString(), name: "USER ID: ");
    log(LocaleDatabaseHelper.i.currentUserType.toString(), name: "USER TYPE: ");
    log(LocaleDatabaseHelper.i.isLight.toString(), name: "IS LIGHT?: ");
    log(LocaleDatabaseHelper.i.isLoggedIn.toString(), name: "IS LOGGED IN?: ");
    log(LocaleDatabaseHelper.i.currentUserEmail.toString(), name: "USER MAIL: ");
    log(LocaleDatabaseHelper.i.currentUserName.toString(), name: "USER NAME: ");
    log(LocaleDatabaseHelper.i.currentUserSurname.toString(), name: "USER SURNAME: ");
    log(LocaleDatabaseHelper.i.currentUserToken.toString(), name: "USER TOKEN: ");
  }
}
