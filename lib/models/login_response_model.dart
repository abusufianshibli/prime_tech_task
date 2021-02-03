
import 'dart:convert';
class LoginTokenResponse {
  LoginTokenResponse({
    this.successResonse,
    this.failedResponse,
  });

  SuccessResonse successResonse;
  dynamic failedResponse;

  factory LoginTokenResponse.fromJson(Map<String, dynamic> json) => LoginTokenResponse(
    successResonse: json["successResonse"] == null ? null : SuccessResonse.fromJson(json["successResonse"]),
    failedResponse: json["failedResponse"],
  );

  Map<String, dynamic> toJson() => {
    "successResonse": successResonse == null ? null : successResonse.toJson(),
    "failedResponse": failedResponse,
  };
}

class SuccessResonse {
  SuccessResonse({
    this.token,
    this.refreshToken,
    this.user,
  });

  String token;
  String refreshToken;
  User user;

  factory SuccessResonse.fromJson(Map<String, dynamic> json) => SuccessResonse(
    token: json["token"] == null ? null : json["token"],
    refreshToken: json["refreshToken"] == null ? null : json["refreshToken"],
    user: json["user"] == null ? null : User.fromJson(json["user"]),
  );

  Map<String, dynamic> toJson() => {
    "token": token == null ? null : token,
    "refreshToken": refreshToken == null ? null : refreshToken,
    "user": user == null ? null : user.toJson(),
  };
}

class User {
  User({
    this.userId,
    this.firstName,
    this.lastName,
    this.userName,
    this.role,
  });

  int userId;
  String firstName;
  String lastName;
  String userName;
  String role;

  factory User.fromJson(Map<String, dynamic> json) => User(
    userId: json["userID"] == null ? null : json["userID"],
    firstName: json["firstName"] == null ? null : json["firstName"],
    lastName: json["lastName"] == null ? null : json["lastName"],
    userName: json["userName"] == null ? null : json["userName"],
    role: json["role"] == null ? null : json["role"],
  );

  Map<String, dynamic> toJson() => {
    "userID": userId == null ? null : userId,
    "firstName": firstName == null ? null : firstName,
    "lastName": lastName == null ? null : lastName,
    "userName": userName == null ? null : userName,
    "role": role == null ? null : role,
  };
}
