import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'core/helpers/constants.dart';
import 'core/helpers/sharedpreference.dart';
import 'core/networking/api_constants.dart';

Future<void> Logout(BuildContext context) async {
  var headers = {
    'Accept': 'application/json',
    'Authorization': 'Bearer ${await SharedPrefHelper.getSecuredString(SharedPrefKeys.userToken)}'
  };
  var dio = Dio();
  var response = await dio.request(
    '${ApiConstants.apiBaseUrl+ApiConstants.logout}',
    options: Options(
      method: 'GET',
      headers: headers,
    ),
  );

  if (response.statusCode == 200) {
    print(json.encode(response.data));
  }
  else {
    print(response.statusMessage);
  }
}



