import 'dart:convert';
import 'dart:developer';

import 'package:flutter_order_management/core/env/env_config.dart';
import 'package:flutter_order_management/data/models/login_models/login_model.dart';
import 'package:flutter_order_management/data/models/login_models/login_request_model.dart';
import 'package:http/http.dart' as http;

class APIService {
  static Future<LoginResponseModel?> login(LoginRequestModel model) async {
    Map<String, String> requestHeaders = {
      'Content-Type': 'application/json',
    };
    var url = Uri.parse(EnvConfig.apiURL + EnvConfig.loginAPI);
    var response = await http.post(url, headers: requestHeaders, body: jsonEncode(model.toJson()));
    if (response.statusCode == 200) {
      log(loginResponseModelFromJson(response.body).status.toString(), name: "TRUE:");
      return loginResponseModelFromJson(response.body);
    }
  }
}