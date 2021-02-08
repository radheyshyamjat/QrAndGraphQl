import 'dart:async';

import 'package:qr_based/network_call/LoginSuccessWrapper.dart';
import 'package:qr_based/network_call/on_boarding_client.dart';
import 'package:qr_based/network_call/on_boarding_event.dart';

class OnBoardingRepository {
  final OnBoardingClient client = OnBoardingClient();

  Future<NormalSuccessResponse> login(LoginAdded loginDto) async {
    return await client.login(loginDto);
  }
}
