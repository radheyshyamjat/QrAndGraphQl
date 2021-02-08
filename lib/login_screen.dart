import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:qr_based/main.dart';
import 'package:qr_based/utils/size_config.dart';

import 'network_call/on_boarding_block.dart';
import 'network_call/on_boarding_state.dart';

class LoginScreen extends StatefulWidget {
  static String tag = 'login-page';

  @override
  LoginScreenState createState() => new LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  static double widthbl = SizeConfig.blockSizeWidth;
  static double heightbl = SizeConfig.blockSizeHeight;
  static double textSize = SizeConfig.textMultiplier;

  double height(double height) {
    double finalHeight = (height / 6.8) * heightbl;
    return finalHeight;
  }

  double width(double width) {
    double finalWidth = (width / 4.1) * widthbl;
    return finalWidth;
  }

  TextEditingController phoneTextController;
  final myController = TextEditingController();
  OnBoardingBlock _onBoardingBlock = OnBoardingBlock(LoadingState());
  bool loadingProgress = false;
  String mobileNoOtp;

  @override
  void initState() {
    super.initState();
    phoneTextController = TextEditingController();

    setState(() {
      phoneTextController.text = myController.text;
      mobileNoOtp = myController.text;
    });
  }

  @override
  void dispose() {
    myController.dispose();
    phoneTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
        child: Container(
          child: BlocListener<OnBoardingBlock, OnBoardingState>(
            cubit: _onBoardingBlock,
            listener: (context, state) {
              setState(() {
                if (state is LoadingState)
                  loadingProgress = true;
                else
                  loadingProgress = false;
              });
              if (state is LoginSuccess) {
                if (state.response.code == 200) {
                  // showAutoDetectOtpScreen();
                }
                print("state${state.response.toString()}");
              }
              if (state is LoadingFailure) {}
              print("State is:${state.toString()}");
              print("State is:${state}");
            },
            child: Scaffold(
              body: SafeArea(
                child: SingleChildScrollView(
                  child: Container(
                    margin: EdgeInsets.only(top: height(16)),
                    padding: EdgeInsets.only(
                        top: setHeight(20),
                        bottom: setHeight(20),
                        left: setWidth(48),
                        right: setWidth(48)),
                    decoration: BoxDecoration(
                        color: Colors.pinkAccent,
                        boxShadow: [
                          BoxShadow(color: Colors.grey[400], blurRadius: 6)
                        ],
                        borderRadius: BorderRadius.all(Radius.circular(38))),
                    child: Text(
                      "Create An Account",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        inAsyncCall: loadingProgress);
  }

  Widget _buildMobileScreen() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Text('Please enter the mobile no registered with mumsmile',
          textAlign: TextAlign.start,
          style: TextStyle(
              fontSize: setHeight(14),
              fontFamily: 'Roboto-Regular',
              fontWeight: FontWeight.w500,
              color: Colors.black38),
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (BuildContext context) => new MyApp()),
            );
          },
          child: Container(
            margin: EdgeInsets.only(top: height(16)),
            padding: EdgeInsets.only(
                top: setHeight(20),
                bottom: setHeight(20),
                left: setWidth(48),
                right: setWidth(48)),
            decoration: BoxDecoration(
                color: Colors.pinkAccent,
                boxShadow: [
                  BoxShadow(color: Colors.grey[400], blurRadius: 6)
                ],
                borderRadius: BorderRadius.all(Radius.circular(38))),
            child: Text(
              "Create An Account",
              style: TextStyle(
                  fontSize: height(14),
                  fontFamily: 'Roboto',
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ],
    );
  }
}
