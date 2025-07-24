class ResponseData {
  ResponseData({
    required this.statusCode,
    required this.message,
    this.dataSours,
  });
  late final int statusCode;
  late final String message;
  dynamic dataSours;

  ResponseData.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    message = json['message'];
    dataSours = json['data'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['message'] = message;
    data['data'] = dataSours;
    return data;
  }
}
