class ErrorModel{
  String responseCode;
  String responseDesc;

  ErrorModel.fromJson(Map<String, dynamic> json) {
    responseCode = json['responseCode'];
    responseDesc = json['responseDesc'];
  }
}