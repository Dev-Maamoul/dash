class Verifylogin {
  Verifylogin({required this.token, required this.refreshToken});
  late final String token;
  late final String refreshToken;

  Verifylogin.fromJson(Map<String, dynamic> json) {
    token = json['token'];
    refreshToken = json['refreshToken'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['token'] = token;
    _data['refreshToken'] = refreshToken;
    return _data;
  }
}
