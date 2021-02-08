import 'package:flutter/widgets.dart';

class GQLResponse {
  bool success = false;
  String message = "An issue occurred.";
}

class Input {
  InputStar inputStar;

  Input({this.inputStar});

  Input.fromJson(Map<String, dynamic> json) {
    inputStar = json['input'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['input'] = this.inputStar;
    return data;
  }
}

class InputStar {
  String starrableId;
  String clientMutationId;

  InputStar({this.starrableId,this.clientMutationId});

  InputStar.fromJson(Map<String, dynamic> json) {
    starrableId = json['starrableId'];
    clientMutationId = json['clientMutationId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['starrableId'] = this.starrableId;
    data['clientMutationId'] = this.clientMutationId;
    return data;
  }
}