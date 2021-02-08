import 'package:qr_based/network_call/on_boarding_event.dart';

import 'LoginSuccessWrapper.dart';

abstract class OnBoardingState extends Equatable {

  @override
  List<Object> get props => [];
}

class LoadingProgress extends OnBoardingState {}

class LoadingState extends OnBoardingState {}

class LoginSuccess extends OnBoardingState {
  final NormalSuccessResponse response;
  LoginSuccess([this.response]);

  @override
  List<Object> get props => [response];

  @override
  String toString() => 'LoginLoadSuccess { Login: $response }';
}

class LoadingFailure extends OnBoardingState {}
