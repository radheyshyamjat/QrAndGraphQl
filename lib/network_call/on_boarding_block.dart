import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_based/network_call/on_boarding_event.dart';
import 'package:qr_based/network_call/on_boarding_repository.dart';
import 'package:qr_based/network_call/on_boarding_state.dart';

class OnBoardingBlock extends Bloc<OnBoardingEvent, OnBoardingState> {
  final OnBoardingRepository repository = OnBoardingRepository();

  OnBoardingBlock(OnBoardingState initialState) : super(initialState);

  @override
  Stream<OnBoardingState> mapEventToState(OnBoardingEvent event) async* {
    if (event is LoginAdded) yield* _addLogin(event);
  }

  Stream<OnBoardingState> _addLogin(LoginAdded event) async* {
    yield LoadingState();
    try {
      yield LoginSuccess(await repository.login(event));
    } catch (e) {
      print(e.toString());
      yield LoadingFailure();
    }
  }
}
