class StarMutation {
  AddStar addStar;
  bool isSuccess;
  String message;

  StarMutation({this.addStar,this.isSuccess,this.message});

  StarMutation.fromJson(Map<String, dynamic> json) {
    addStar = json['addStar'] != null ? new AddStar.fromJson(json['addStar']) : null;
    isSuccess = json['is_success'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.addStar != null) {
      data['addStar'] = this.addStar.toJson();
    }
    data['is_success'] = isSuccess;
    data['message'] = this.message;
    return data;
  }
}
class AddStar {
  String clientMutationId;

  AddStar({this.clientMutationId});

  AddStar.fromJson(Map<String, dynamic> json) {
    clientMutationId = json['clientMutationId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['clientMutationId'] = this.clientMutationId;
    return data;
  }
}
