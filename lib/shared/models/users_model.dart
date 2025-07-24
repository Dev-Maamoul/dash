class UserModel {
  UserModel({
    required this.id,
    required this.authId,
    required this.fullName,
    required this.mobile,
    this.email,
    required this.gender,
    required this.verify,
    required this.verifyPhone,
    required this.verifyEmail,
    required this.accountStatus,
    required this.createdAt,
    required this.updatedAt,
  });
  String? id;
  String? authId;
  String? fullName;
  String? mobile;
  String? email;
  String? gender;
  bool? verify;
  bool? verifyPhone;
  bool? verifyEmail;
  String? accountStatus;
  String? createdAt;
  String? updatedAt;

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    authId = json['auth_id'];
    fullName = json['full_name'];
    mobile = json['mobile'];
    email = null;
    gender = json['gender'];
    verify = json['verify'];
    verifyPhone = json['verify_phone'];
    verifyEmail = json['verify_email'];
    accountStatus = json['account_status'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['auth_id'] = authId;
    _data['full_name'] = fullName;
    _data['mobile'] = mobile;
    _data['email'] = email;
    _data['gender'] = gender;
    _data['verify'] = verify;
    _data['verify_phone'] = verifyPhone;
    _data['verify_email'] = verifyEmail;
    _data['account_status'] = accountStatus;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}
