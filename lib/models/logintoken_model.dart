class LoginTokenModel {
  String? token;

  LoginTokenModel({this.token});
 
  LoginTokenModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }
}