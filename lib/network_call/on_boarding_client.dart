import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:qr_based/network_call/LoginSuccessWrapper.dart';
import 'package:qr_based/network_call/on_boarding_event.dart';
import 'package:qr_based/utils/AppException.dart';

class OnBoardingClient {
  final http.Client httpClient = http.Client();

  Future<NormalSuccessResponse> login(LoginAdded loginDto) async {
    Map<String, String> header = {
      HttpHeaders.contentTypeHeader: "application/json"
    };
    var response;
    try {
      response = await httpClient.put(
        "API_OTP_LOGIN",
        headers: header,
        body: json.encode(loginDto),
      );
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    }
    print("Response:${response.body.toString()}");
    return NormalSuccessResponse.fromJson(json.decode(response.body));
  }

  dynamic _returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 201:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 202:
        var responseJson = json.decode(response.body.toString());
        print(responseJson);
        return responseJson;
      case 400:
        throw BadRequestException(response.body.toString());

      case 403:
        throw UnauthorisedException(response.body.toString());

      default:
        throw FetchDataException(
            'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
    }
  }
}
