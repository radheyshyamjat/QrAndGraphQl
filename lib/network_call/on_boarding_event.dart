
abstract class OnBoardingEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class Equatable {
}

class LoginAdded extends OnBoardingEvent {
  final String mobile;

  LoginAdded(this.mobile);

  @override
  String toString() => "Login Info { " "mobile: $mobile," " }";

  Map toJson() => {'mobile': mobile};

  @override
  List<Object> get props => [int];
}

class VerifyOtpAdded extends OnBoardingEvent {
  final String mobile;
  final String otp;

  VerifyOtpAdded(this.mobile, this.otp);

  @override
  String toString() => "Mobile send OTP { mobile: $mobile,otp:$otp }";

  Map toJson() => {'mobile': mobile, 'otp': otp};

  @override
  List<Object> get props => [int];
}

class RequestAccessSendOtpEvent extends OnBoardingEvent {
  final String mobile;

  RequestAccessSendOtpEvent(this.mobile);

  @override
  String toString() => "RequestAccessSendOtpEvent { " "mobile: $mobile," " }";

  Map toJson() => {'mobile': mobile};

  @override
  List<Object> get props => [int];
}

class RequestAccessVerifyOtpEvent extends OnBoardingEvent {
  final String mobile;
  final String otp;

  RequestAccessVerifyOtpEvent(this.mobile, this.otp);

  @override
  String toString() => "RequestAccessVerifyOtpEvent "
      "Mobile send OTP { mobile: $mobile,otp:$otp }";

  Map toJson() => {'mobile': mobile, 'otp': otp};

  @override
  List<Object> get props => [int];
}

class GetCityListEvent extends OnBoardingEvent {

  @override
  List<Object> get props => [int];
}

class AddRequestAccessInfoEvent extends OnBoardingEvent {
  final String fullName;
  final String mobile;
  final String city;
  final String pincode;
  final String address;
  final int userType;
  AddRequestAccessInfoEvent(
      this.fullName,this.mobile,
      this.city,this.pincode,this.address,
      this.userType);


  @override
  String toString() => " { mobile: $mobile,fullName:$fullName"
      " $city $pincode $address #$userType }";

  Map toJson() => {
    'full_name': fullName,
    'mobile': mobile,
    'city': city,
    'pincode': pincode,
    'address': address,
    'user_type': userType,
  };

  @override
  List<Object> get props => [int];
}