import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:qr_based/Dashboard.dart';
import 'package:qr_based/graphql/mutation.dart';
import 'package:qr_based/graphql/queries.dart';
import 'package:qr_based/models/inputstar.dart';
import 'package:qr_based/models/repository.dart';
import 'package:qr_based/utils/size_config.dart';
import 'package:qrscan/qrscan.dart' as scanner;

import 'login_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qr Based',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title:"Qr"),
    );
  }
}
