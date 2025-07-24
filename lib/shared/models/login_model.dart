class LoginModel {
  LoginModel({required this.mobile});
  late final String mobile;

  LoginModel.fromJson(Map<String, dynamic> json) {
    mobile = json['mobile'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['mobile'] = mobile;
    return data;
  }
}
