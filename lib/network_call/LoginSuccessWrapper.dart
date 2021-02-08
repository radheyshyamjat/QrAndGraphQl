class NormalSuccessResponse {
  String message;
  int code;

  NormalSuccessResponse({this.message, this.code});

  NormalSuccessResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'] ?? '';
    code = json['code'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['code'] = this.code;
    return data;
  }
}


class LoginSuccessWrapper {
  UserInfo data;
  String message;
  int code;

  LoginSuccessWrapper({this.data, this.message, this.code});

  LoginSuccessWrapper.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new UserInfo.fromJson(json['data']) : null;
    message = json['message'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    data['message'] = this.message;
    data['code'] = this.code;
    return data;
  }
}

class UserInfo {
  User user;
  String token;

  UserInfo({this.user, this.token});

  UserInfo.fromJson(Map<String, dynamic> json) {
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class User {
  int id;
  String firstName;
  String lastName;
  String picUrl;
  int userType;
  ContentObject contentObject;
  SmileyAndGiggles smileyAndGiggles;
  bool callBackStatus;
  List<Hospital> hospital;

  User(
      {this.id,
        this.firstName,
        this.lastName,
        this.picUrl,
        this.contentObject,
        this.smileyAndGiggles,
        this.callBackStatus,
        this.hospital});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    picUrl = json['pic_url'];
    userType = json['user_type'];
    contentObject = json['content_object'] != null
        ? new ContentObject.fromJson(json['content_object'])
        : null;
    smileyAndGiggles = json['smiley_and_giggles'] != null
        ? new SmileyAndGiggles.fromJson(json['smiley_and_giggles'])
        : null;
    callBackStatus = json['call_back_status'];
    if (json['hospital'] != null) {
      hospital = new List<Hospital>();
      json['hospital'].forEach((v) {
        hospital.add(new Hospital.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['pic_url'] = this.picUrl;
    data['user_type'] = this.userType;
    if (this.contentObject != null) {
      data['content_object'] = this.contentObject.toJson();
    }
    if (this.smileyAndGiggles != null) {
      data['smiley_and_giggles'] = this.smileyAndGiggles.toJson();
    }
    data['call_back_status'] = this.callBackStatus;
    if (this.hospital != null) {
      data['hospital'] = this.hospital.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ContentObject {
  int id;
  Package package;
  bool isActive;
  String createdAt;
  String updatedAt;
  String description;
  String qualification;
  String number1;
  String number2;
  String number3;
  String opdAt;
  String humanQualities;
  String hobbiesAndInterest;
  String medicalNumber;
  int fees;

  ContentObject(
      {this.id,
        this.package,
        this.isActive,
        this.createdAt,
        this.updatedAt,
        this.description,
        this.qualification,
        this.number1,
        this.number2,
        this.number3,
        this.opdAt,
        this.humanQualities,
        this.hobbiesAndInterest,
        this.medicalNumber,
        this.fees});

  ContentObject.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    package = json['package'] != null ? new Package.fromJson(json['package']) : null;
    isActive = json['is_active'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    description = json['description'];
    qualification = json['qualification'];
    number1 = json['number_1'];
    number2 = json['number_2'];
    number3 = json['number_3'];
    opdAt = json['opd_at'];
    humanQualities = json['human_qualities'];
    hobbiesAndInterest = json['hobbies_and_interest'];
    medicalNumber = json['medical_number'];
    fees = json['fees'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.package != null) {
      data['package'] = this.package.toJson();
    }
    data['is_active'] = this.isActive;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['description'] = this.description;
    data['qualification'] = this.qualification;
    data['number_1'] = this.number1;
    data['number_2'] = this.number2;
    data['number_3'] = this.number3;
    data['opd_at'] = this.opdAt;
    data['human_qualities'] = this.humanQualities;
    data['hobbies_and_interest'] = this.hobbiesAndInterest;
    data['medical_number'] = this.medicalNumber;
    data['fees'] = this.fees;
    return data;
  }
}

class SmileyAndGiggles {
  int smileyAndGiggleId;
  int smiley;
  int smileyExchange;
  int giggle;
  int giggleExchange;

  SmileyAndGiggles(
      {this.smileyAndGiggleId,
        this.smiley,
        this.smileyExchange,
        this.giggle,
        this.giggleExchange});

  SmileyAndGiggles.fromJson(Map<String, dynamic> json) {
    smileyAndGiggleId = json['smiley_and_giggle_id'];
    smiley = json['smiley'];
    smileyExchange = json['smiley_exchange'];
    giggle = json['giggle'];
    giggleExchange = json['giggle_exchange'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['smiley_and_giggle_id'] = this.smileyAndGiggleId;
    data['smiley'] = this.smiley;
    data['smiley_exchange'] = this.smileyExchange;
    data['giggle'] = this.giggle;
    data['giggle_exchange'] = this.giggleExchange;
    return data;
  }
}

class Hospital {
  int id;
  String hospitalName;
  String inviteCode;

  Hospital({this.id, this.hospitalName});

  Hospital.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    hospitalName = json['hospital__name'];
    inviteCode = json['invite_code__invite_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['hospital__name'] = this.hospitalName;
    data['invite_code__invite_code'] = this.inviteCode;
    return data;
  }
}

class Package {
  String createdAt;
  String name;
  int cost;
  String facilities;
  int duration;

  Package(
      {this.createdAt, this.name, this.cost, this.facilities, this.duration});

  Package.fromJson(Map<String, dynamic> json) {
    createdAt = json['created_at'];
    name = json['name'];
    cost = json['cost'];
    facilities = json['facilities'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['created_at'] = this.createdAt;
    data['name'] = this.name;
    data['cost'] = this.cost;
    data['facilities'] = this.facilities;
    data['duration'] = this.duration;
    return data;
  }
}