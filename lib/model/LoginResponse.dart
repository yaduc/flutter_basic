class Success {
  final String token;

  Success({this.token});

  factory Success.fromJson(Map<String, dynamic> json) {
    return Success(
      token: json['token'],
    );
  }
}

class Error {
  final String error;

  Error({this.error});

  factory Error.fromJson(Map<String, dynamic> json) {
    return Error(
      error: json['error'],
    );
  }
}

class LoginResponse{
  Success success;
  Error error;
  LoginResponse({this.success, this.error});
}